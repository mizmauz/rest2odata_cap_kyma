using heureso.mngr.db as db from '../db/schema';

@path: 'event'
service EventService {
entity MeterReadingDevice as projection on db.MeterReadingDevice;


annotate MeterReadingDevice with 
{
ID @(
Common: 
{
Label: 'ID',
Text : {
    $value                : meterreading.meternumber,
    ![@UI.TextArrangement]: #TextOnly,
    }
},
UI    : {Hidden: true}
);
meternumber   @(Common: {Label: 'Name'});
description   @(Common: {Label: 'Description'});
obis_code   @(Common: {Label: 'obis_code'});
installDateTime @(Common: {Label: 'Installation Date'});
meterreading  @(Common: {
Label                   : 'MeterNumber',
Text                    : {
$value                : meterreading.meternumber,
![@UI.TextArrangement]: #TextOnly,
},
ValueList               : {
$Type         : 'Common.ValueListType',
CollectionPath: 'MeterReading',
Parameters    : [
{
    $Type            : 'Common.ValueListParameterInOut',
    LocalDataProperty: meterreading_id,
    ValueListProperty: 'id',
},
{
    $Type            : 'Common.ValueListParameterDisplayOnly',
    ValueListProperty: 'meternumber',
},
{
    $Type            : 'Common.ValueListParameterDisplayOnly',
    ValueListProperty: 'reading_date',
},
{
    $Type            : 'Common.ValueListParameterDisplayOnly',
    ValueListProperty: 'readingamount',
}
]
},
ValueListWithFixedValues: false
});
};

annotate MeterReadingDevice @(Capabilities: {
SearchRestrictions: {
$Type     : 'Capabilities.SearchRestrictionsType',
Searchable: true
},
Insertable        : true,
Deletable         : true,
Updatable         : true
});

annotate MeterReadingDevice @(UI: 
{
UpdateHidden       : false,
DeleteHidden       : false,
CreateHidden       : false,
Identification     : [{Value: meternumber}],
HeaderInfo         : {
$Type         : 'UI.HeaderInfoType',
TypeName      : 'MeterReadingEvent',
TypeNamePlural: 'MeterReadingEvents',
Title         : {
$Type: 'UI.DataField',
Value: meternumber
},
Description   : {
$Type: 'UI.DataField',
Value: description
}
},
LineItem           : [
{
$Type: 'UI.DataField',
Value: meternumber
},
{
$Type: 'UI.DataField',
Value: description
},
{
$Type: 'UI.DataField',
Value: installDateTime
},
{
$Type: 'UI.DataField',
Value: meterreading_id
}
],
SelectionFields    : [
meternumber,
installDateTime,
obis_code,
meterreading_id
],
FieldGroup #General: {
$Type: 'UI.FieldGroupType',
Data : [
{
$Type: 'UI.DataField',
Value: meterreading.reading_date
},
{
$Type: 'UI.DataField',
Value: meterreading.reading_time
},
{
$Type: 'UI.DataField',
Value: meterreading.readingreason
},
{
$Type: 'UI.DataField',
Value: meterreading.readingsource
},
{
$Type: 'UI.DataField',
Value: meterreading.readingamount
}
]
},
Facets             : [{
$Type : 'UI.ReferenceFacet',
ID    : 'General',
Label : 'General',
Target: '@UI.FieldGroup#General'
}]
});

annotate db.MeterReading with {
id       @(
Common: 
{
    Label: 'ID',
    Text : {
    $value                : meternumber,
    ![@UI.TextArrangement]: #TextOnly,
}
},
UI    : {Hidden: true}
);
meternumber @(Common: {Label: 'MeterNumber'});
reading_date  @(Common: {Label: 'ReadingDate'});
readingreason @(Common: {Label: 'ReadingReason'});
readingstatus @(Common: {Label: 'ReadingStatus'});
readingamount  @(Common: {Label: 'ReadingAmount'});
};
}
