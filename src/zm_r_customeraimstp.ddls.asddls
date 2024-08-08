@AccessControl: {
    authorizationCheck: #NOT_REQUIRED
    //,privilegedAssociations: ['_CreatedByUserContactCard', '_LastChangedByUserContactCard']
}

@EndUserText.label: 'Customer Master AIMS'
define root view entity ZM_R_CustomerAIMSTP
  as select from ZM_R_CustomerAIMS
  composition [0..*] of ZM_R_CustomerShipPointTP as _CustomerShipPoint
  //Customer Contact
  association [0..1] to ZM_I_CustomerContactCard as _CustomerContactCard          on $projection.Customer = _CustomerContactCard.Customer
//  association [1..1] to I_UserContactCard        as _CreatedByUserContactCard     on $projection.CreatedBy = _CreatedByUserContactCard.ContactCardID
//  association [0..1] to I_UserContactCard        as _LastChangedByUserContactCard on $projection.LocalLastChangedBy = _LastChangedByUserContactCard.ContactCardID
{
      /* Header Data */
  key Customer,
  key SalesOrganization,
  key DistributionChannel,
  key Division,

      'sap-icon://customer'                    as ImageURL,

      //TBD: Delivery Plant (may be through association)
      @EndUserText:{ label: 'Delivering Plant' }
      cast( 'DM01' as werks_d preserving type) as DeliveringPlant,


      /* Global Attributes */

      BarcodeIndicator,
      DistributionCenterID,

      /* Global Shipping Attributes */

      PickCustomerConsolidatation,
      PickConsolidatationByPO,
      PickConsolidateByAttentionLine,
      BarCodedPalletContentSheet,

      /* Other Attributes */

      ShipViaCode,
      FrozenShipViaCode,

      /* Admin Fields */

      CreatedBy,
      CreatedAt,
      LastChangedAt,      //Total ETag
      LocalLastChangedBy,
      LocalLastChangedAt, //Local ETag field --> OData ETag

      /* Associations */

      _Customer,
      _SalesOrganization,
      _DistributionChannel,
      _Division,
      _CustomerContactCard,
      //_CreatedByUserContactCard,
      //_LastChangedByUserContactCard,

      /* Compositions */
      
      _CustomerShipPoint // Make association public

}
