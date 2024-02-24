using heureso.db as db from '../db/schema';

namespace heureso.srv;

@path: 'MeterReading'
service MeterReadingService {
entity MeterReading as projection on db.MeterReading;
}
