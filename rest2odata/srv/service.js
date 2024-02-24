module.exports = cds.service.impl(async function () {
    /*** SERVICE ENTITIES ***/
    const {
        MeterReading
    } = this.entities;

    const meterReadingService = await cds.connect.to('MeterReadingAPI');
    var firstRead = true;

    /*** SERVICE HANDLERS ***/
    this.before('READ', MeterReading, async (req) => {
        try {
            if (firstRead) {
                const resp = await meterReadingService.get('/meterreading');
                const meterreadings = resp; //.content;
                const str = JSON.stringify(meterreadings);
                console.log("Ausgabe");
                console.log(resp);
                const entries = [];
                meterreadings.forEach(meterreading => {
                    entries.push({
                        id: meterreading.id,
                        meternumber: meterreading.meternumber,
                        reading_date: meterreading.reading_date,
                        reading_time: meterreading.reading_time,
                        readingsource: meterreading.readingsource,
                        readingreason: meterreading.readingreason,
                        unitofreading: meterreading.unitofreading,
                        readingamount: meterreading.readingamount,
                        readingamount_estimated: meterreading.readingamount_estimated,
                        calc_consumption: meterreading.calc_consumption,
                        calc_days: meterreading.calc_days,
                        weight: meterreading.weight,
                        readingstatus: meterreading.readingstatus,
                        errorcode: meterreading.errorcode
                    });
                });
                await cds.tx(req).run(INSERT.into(MeterReading).entries(entries));
                firstRead = false;
            }
            return req;
        } catch (err) {
            req.error(500, err.message);
        }
    });
});
