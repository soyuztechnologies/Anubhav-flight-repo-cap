using TravelService as service from '../../srv/travel-service';

annotate service.Travel with @(
    UI.SelectionFields : [
        to_Agency_AgencyID,
        to_Customer_CustomerID,
        TravelStatus_code
    ],
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : TravelID,
            Label : 'Travel Id',
        },
        {
            $Type : 'UI.DataField',
            Value : TravelStatus_code,
            Criticality : TravelStatus.criticality,
            Label : 'Travel Status'
        },
        {
            $Type : 'UI.DataField',
            Value : BeginDate,
            Label : 'Begin Date'
        },
        {
            $Type : 'UI.DataField',
            Value : EndDate,
            Label : 'End Date'
        },
        {
            $Type : 'UI.DataField',
            Value : to_Agency_AgencyID,
            Label : 'Agency Id'
        },
        {
            $Type : 'UI.DataField',
            Value : to_Customer_CustomerID,
            Label : 'Customer Id'
        },{
            $Type : 'UI.DataField',
            Value : TotalPrice,
            Label : 'Total Price'
        },{
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>AcceptTravel}',
            Action : 'TravelService.acceptTravel',
        },{
            $Type : 'UI.DataFieldForAction',
            Label: '{i18n>RejectTravel}',
            Action : 'TravelService.rejectTravel',
        },

    ]
);
annotate service.Travel with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : TravelID,
        },
        TypeName : '{i18n>Travel}',
        TypeNamePlural : '{i18n>Travels}',
        Description : {
            $Type : 'UI.DataField',
            Value : Description,
        },
        ImageUrl : 'https://yt3.googleusercontent.com/zCgSuKDRBWCoEFP52F5WNm-8q6FYKiiIlgpdqjdQaZekQc-PDcyFhi-cO8bkvtvOvH6qPBSg=s900-c-k-c0x00ffffff-no-rj',
    }
);
