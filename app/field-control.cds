using { TravelService } from '../srv/travel-service';

annotate TravelService.Travel {
    BookingFee @Common : { FieldControl : TravelStatus.fieldControl };
    BeginDate @Common : { FieldControl : TravelStatus.fieldControl };
    EndDate @Common : { FieldControl : TravelStatus.fieldControl };
    to_Agency @Common : { FieldControl : TravelStatus.fieldControl };
    to_Customer @Common : { FieldControl : TravelStatus.fieldControl };
} actions {
    rejectTravel @(
        Core.OperationAvailable: { $edmJson: { $Ne: [{ $Path: 'in/TravelStatus_code' }, 'X'] } },
        Common: {
            SideEffects : {
                $Type : 'Common.SideEffectsType',
                TargetProperties : [
                    'in/TravelStatus_code',
                ],
                TargetEntities : [
                    '/TravelService.EntityContainer/Travel'
                ],
            },
        }
    );
    acceptTravel @(
        Core.OperationAvailable: { $edmJson: { $Ne: [{ $Path: 'in/TravelStatus_code' }, 'A'] } },
        Common: {
            SideEffects : {
                $Type : 'Common.SideEffectsType',
                TargetProperties : [
                    'in/TravelStatus_code',
                ],
                TargetEntities : [
                    '/TravelService.EntityContainer/Travel'
                ],
            },
        }
    );
} ;

annotate TravelService.Travel with @Common : { SideEffects  : {
    $Type : 'Common.SideEffectsType',
    SourceProperties: [GoGreen, BookingFee],
    SourceEntities : [
        to_Booking
    ],
    TargetProperties : [
        'TotalPrice',
        'GreenFee',
        'TreesPlanted'
    ],
}, };


annotate TravelService.Booking with {
    BookingDate @Core.Computed;
    ConnectionID @Common : { FieldControl : to_Travel.TravelStatus.fieldControl, };
    FlightDate @Common : { FieldControl : to_Travel.TravelStatus.fieldControl, };
    FlightPrice @Common : { FieldControl : to_Travel.TravelStatus.fieldControl, };
    BookingStatus @Common : { FieldControl : to_Travel.TravelStatus.fieldControl, };
    to_Carrier @Common : { FieldControl : to_Travel.TravelStatus.fieldControl, };
    to_Customer @Common : { FieldControl : to_Travel.TravelStatus.fieldControl, };
};
   
 