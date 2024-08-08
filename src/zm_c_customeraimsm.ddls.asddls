@EndUserText.label: 'Projection of ZM_R_CustomerAIMSTP'

@AccessControl: {
    authorizationCheck: #NOT_REQUIRED
    //,privilegedAssociations: ['_CreatedByUserContactCard', '_LastChangedByUserContactCard']
}

-- Header Info (List and Object Page)
@UI.headerInfo: { typeName: 'Customer',
                  typeNamePlural: 'Customers',
                  imageUrl: 'ImageURL',
                  title:{ value: 'Customer', type: #STANDARD },
                  description: { value: '_CustomerContactCard.CustomerName', type: #STANDARD }
                  }
@ObjectModel:{ semanticKey: ['Customer',
                             'SalesOrganization',
                             'DistributionChannel',
                             'Division'] }
@Search.searchable: true
define root view entity ZM_C_CustomerAIMSM
  provider contract transactional_query
  as projection on ZM_R_CustomerAIMSTP
{

      /* Object Page Annotations */

      @UI.facet: [
      // Object Page Header
      {
        id              : 'idOPHKeyAttribues',
        purpose         : #HEADER,
        type            : #FIELDGROUP_REFERENCE,
        //label           : 'Key Attributes',
        targetQualifier : 'tqOPHKeyAttributes',
        position        : 10
      },
      {
        id              : 'idOPHAddtionalAttribues',
        purpose         : #HEADER,
        type            : #FIELDGROUP_REFERENCE,
        //label           : 'Additional Attributes',
        targetQualifier : 'tqOPHAddtionalAttribues',
        position        : 20
      },
      {
        id              : 'idCustomerContact',
        purpose         : #HEADER,
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqCustomerContact',
        position        : 30
      },

      // Object Page Tabs
      {
        id              : 'idCustomerInformation',
        label           : 'Customer Information',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqCustomerInformation',
        position        : 10
      },
      {
        id              : 'idGlobalAttributes',
        label           : 'Global Attributes',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqGlobalAttributes',
        position        : 20
      },
      {
        id              : 'idShippingAttributes',
        label           : 'Shipping Attributes',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqShippingAttributes',
        position        : 30
      },
      {
        id              : 'idOtherAttributes',
        label           : 'Other Attributes',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqOtherAttributes',
        position        : 40
      },
      {
      id: 'CustomerShippingPoint',
      purpose: #STANDARD,
      type: #LINEITEM_REFERENCE,
      label: 'Customer Shipping Point',
      position: 50,
      targetElement: '_CustomerShipPoint'
      },
      {
        id              : 'idAdministrativeFields',
        label           : 'Administrative Fields',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqAdministrativeFields',
        position        : 60
      }]

      @UI:{ lineItem: [{ position: 10 }],
            selectionField: [{ position: 10 }],
            fieldGroup: [{ qualifier: 'tqOPHAddtionalAttribues', position: 20, type: #AS_CONTACT, value: '_CustomerContactCard', label: 'Customer Contact' }] }
      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7, ranking: #HIGH }
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_Customer_VH', element: 'Customer' } }]
  key Customer,

      @UI:{ lineItem: [{ position: 20 }],
            selectionField: [{ position: 20 }],
            fieldGroup: [{ qualifier: 'tqOPHKeyAttributes', position: 20 }]}
      //!! Unreleased !!
      //@Consumption.valueHelpDefinition: [{ entity:{ name: 'I_SalesOrganizationValueHelp', element: 'SalesOrganization' } }]
  key SalesOrganization,

      @UI:{ lineItem: [{ position: 30 }],
            selectionField: [{ position: 30 }],
            fieldGroup: [{ qualifier: 'tqOPHKeyAttributes', position: 30 }] }
      //!! Unreleased !!
      //@Consumption.valueHelpDefinition: [{ entity:{ name: 'I_DistributionChannelValueHelp', element: 'DistributionChannel' } }]
  key DistributionChannel,

      @UI:{ lineItem: [{ position: 40 }],
            selectionField: [{ position: 40 }],
            fieldGroup: [{ qualifier: 'tqOPHKeyAttributes', position: 40 }] }
      @ObjectModel.foreignKey.association: '_Division'
  key Division,

      @UI:{ lineItem: [{ position: 50 }],
            selectionField: [{ position: 50 }],
            fieldGroup: [{ qualifier: 'tqOPHAddtionalAttribues', position: 10 }]
            }
      DeliveringPlant,

      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 10 }] }
      _CustomerContactCard.CustomerName,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 20 }] }
      _CustomerContactCard.CustomerFullName,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 30 }] }
      _CustomerContactCard.Country,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 40 }] }
      _CustomerContactCard.CityName,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 50 }] }
      _CustomerContactCard.PostalCode,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 60 }] }
      _CustomerContactCard.StreetName,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 70 }] }
      _CustomerContactCard.Region,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 80 }] }
      _CustomerContactCard.TelephoneNumber1,
      @UI:{ fieldGroup: [{ qualifier: 'tqCustomerInformation', position: 90 }] }
      _CustomerContactCard.TelephoneNumber2,

      @UI:{ lineItem: [{ position: 60 }],
            fieldGroup: [{ qualifier: 'tqGlobalAttributes', position: 10 }] }
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZM_I_BarcodeIndVH', element: 'BarcodeIndicator' }, useForValidation: true }]
      BarcodeIndicator,

      @UI:{ lineItem: [{ position: 70 }],
            fieldGroup: [{ qualifier: 'tqGlobalAttributes', position: 20 }] }
      DistributionCenterID,

      @UI:{ lineItem: [{ position: 80 }],
            fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 10 }] }
      @Consumption.valueHelpDefinition:
      [{ entity: { name : 'ZM_I_DomainVH' , element: 'low' } ,
         additionalBinding: [{ element: 'domain_name', localConstant: 'ZMCUST_INFO_STS1', usage: #FILTER }],
         distinctValues: true,
         useForValidation: true }]
      PickCustomerConsolidatation,

      @UI:{ lineItem: [{ position: 90 }],
            fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 20 }] }
      @Consumption.valueHelpDefinition:
      [{ entity: { name : 'ZM_I_DomainVH' , element: 'low' } ,
         additionalBinding: [{ element: 'domain_name', localConstant: 'ZMCUST_INFO_STS1', usage: #FILTER }],
         distinctValues: true,
         useForValidation: true }]
      PickConsolidatationByPO,

      @UI:{ lineItem: [{ position: 100 }],
            fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 30 }] }
      @Consumption.valueHelpDefinition:
      [{ entity: { name : 'ZM_I_DomainVH' , element: 'low' } ,
         additionalBinding: [{ element: 'domain_name', localConstant: 'ZMCUST_INFO_STS1', usage: #FILTER }],
         distinctValues: true,
         useForValidation: true }]
      PickConsolidateByAttentionLine,

      @UI:{ lineItem: [{ position: 110 }],
            fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 40 }] }
      @Consumption.valueHelpDefinition:
      [{ entity: { name : 'ZM_I_DomainVH' , element: 'low' } ,
         additionalBinding: [{ element: 'domain_name', localConstant: 'ZMCUST_INFO_STS1', usage: #FILTER }],
         distinctValues: true,
         useForValidation: true }]
      BarCodedPalletContentSheet,

      @UI:{ fieldGroup: [{ qualifier: 'tqOtherAttributes', position: 10 }] }
      ShipViaCode,
      @UI:{ fieldGroup: [{ qualifier: 'tqOtherAttributes', position: 20 }] }
      FrozenShipViaCode,

      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 10 }] } //type: #AS_CONTACT, value: '_CreatedByUserContactCard', label: 'Created By'
      CreatedBy,
      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 20 }] }
      CreatedAt,
      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 30 }] } //type: #AS_CONTACT, value: '_LastChangedByUserContactCard', label: 'Changed By'
      LocalLastChangedBy,
      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 40 }] }
      LocalLastChangedAt, //Local ETag field --> OData ETag

      /* Hidden from UI */
      @UI.hidden: true
      ImageURL,
      @UI.hidden: true
      LastChangedAt,      //Total ETag

      /* Associations */

      _Customer,
      _SalesOrganization,
      _DistributionChannel,
      _Division,
      _CustomerContactCard,
      //_CreatedByUserContactCard,
      //_LastChangedByUserContactCard,

      /* Compositions */
      _CustomerShipPoint : redirected to composition child ZM_C_CustomerShipPointM

}
