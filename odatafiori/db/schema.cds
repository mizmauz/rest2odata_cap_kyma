using {cuid} from '@sap/cds/common';
using {MeterReadingService as MeterReadingService} from '../srv/external/MeterReadingService';

namespace heureso.mngr.db;

@cds.autoexpose
entity MeterReading as projection on MeterReadingService.MeterReading;

entity MeterReadingDevice{
   key id        : Int64;
   meternumber   : String(100);
   description   : String(250);
   obis_code     : String(10);
   installDateTime : DateTime;
   meterreading  : Association to one MeterReading;
 
 //  meterreading  : Association to MeterReadingService.MeterReading on address.ID = address_ID;
 // address_ID : Integer;  //> foreign key
}

