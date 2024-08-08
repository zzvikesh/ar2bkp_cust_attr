@EndUserText.label: 'Projection of ZM_R_CustomerShipPointTP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
-- Header Info (List and Object Page)
@UI.headerInfo: { typeName: 'Customer',
                  typeNamePlural: 'Customers',
                  imageUrl: 'ImageURL',
                  title:{ value: 'ShippingPoint', type: #STANDARD },
                  description: { value: 'ShippingPointName', type: #STANDARD }
                  }
@ObjectModel:{ semanticKey: ['Customer',
                             'SalesOrganization',
                             'DistributionChannel',
                             'Division',
                             'ShippingPoint' ] }
define view entity ZM_C_CustomerShipPointM
  as projection on ZM_R_CustomerShipPointTP
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
            id              : 'idShippingAttributes',
            label           : 'Shipping Attributes',
            type            : #FIELDGROUP_REFERENCE,
            targetQualifier : 'tqShippingAttributes',
            position        : 20
          },
          {
            id              : 'idOtherAttributes',
            label           : 'Other Attributes',
            type            : #FIELDGROUP_REFERENCE,
            targetQualifier : 'tqOtherAttributes',
            position        : 30
          },
          {
            id              : 'idAdministrativeFields',
            label           : 'Administrative Fields',
            type            : #FIELDGROUP_REFERENCE,
            targetQualifier : 'tqAdministrativeFields',
            position        : 40
           }]

          @UI:{ lineItem: [{ position: 10 }],
          identification: [{ type: #FOR_ACTION, dataAction: 'setDefaults', label: 'Set Defaults' }] }
  key     Customer,

          @UI:{ lineItem: [{ position: 20 }],
                fieldGroup: [{ qualifier: 'tqOPHKeyAttributes', position: 20 }]  }
  key     SalesOrganization,

          @UI:{ lineItem: [{ position: 30 }],
                fieldGroup: [{ qualifier: 'tqOPHKeyAttributes', position: 30 }]  }
  key     DistributionChannel,

          @UI:{ lineItem: [{ position: 40 }],
                fieldGroup: [{ qualifier: 'tqOPHKeyAttributes', position: 40 }]  }
  key     Division,

          @UI:{ lineItem: [{ position: 50 }],
                fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 10 }]

                  }
          @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_ShippingPointVH', element: 'ShippingPoint' }, useForValidation: true }]
  key     ShippingPoint,

          _ShippingPoint._Text.ShippingPointName : localized,

          @UI:{ fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 20 }] }
          @Consumption.valueHelpDefinition:
          [{ entity: { name : 'ZM_I_DomainVH' , element: 'low' } ,
             additionalBinding: [{ element: 'domain_name', localConstant: 'ZMCUST_INFO_STS1', usage: #FILTER }],
             distinctValues: true,
             useForValidation: true }]
          PickCustomerConsolidatation,

          @UI:{ fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 30 }] }
          @Consumption.valueHelpDefinition:
          [{ entity: { name : 'ZM_I_DomainVH' , element: 'low' } ,
             additionalBinding: [{ element: 'domain_name', localConstant: 'ZMCUST_INFO_STS1', usage: #FILTER }],
             distinctValues: true,
             useForValidation: true }]
          PickConsolidatationByPO,

          @UI:{ fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 40 }] }
          @Consumption.valueHelpDefinition:
          [{ entity: { name : 'ZM_I_DomainVH' , element: 'low' } ,
             additionalBinding: [{ element: 'domain_name', localConstant: 'ZMCUST_INFO_STS1', usage: #FILTER }],
             distinctValues: true,
             useForValidation: true }]
          PickConsolidateByAttentionLine,

          @UI:{ fieldGroup: [{ qualifier: 'tqShippingAttributes', position: 50 }] }
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

          @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 10 }] }
          CreatedBy,
          @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 20 }] }
          CreatedAt,
          @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 30 }] }
          LocalLastChangedBy,
          @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 40 }] }
          LocalLastChangedAt, //Local ETag field --> OData ETag

          /* Hidden from UI */

          @UI.hidden: true
          ImageURL,
          @UI.hidden: true
          LastChangedAt, //Total ETag

          /* Associations */

          _ShippingPoint,

          /* Compositions */

          _CustomerAIMS : redirected to parent ZM_C_CustomerAIMSM
}
