namespace heureso.db;

entity MeterReading {
    key id : Int64;
    meternumber : String(30);
    reading_date : Date;
    reading_time: Time;
    readingsource: String(10);
    readingreason: String(10);
    unitofreading: String(3);
    readingamount: Double;
    readingamount_estimated: Double;
    calc_consumption: Double;
    calc_days: Int32;
    weight: Double;
    readingstatus: String(10);
    errorcode: String(10);
}
