@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AIMS Customer Shipping Point'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZM_R_CustomerShipPoint
  as select from ztotc_custshpt
  -- Value / Check Tables
  association [1..1] to I_Customer            as _Customer            on $projection.Customer = _Customer.Customer
  association [1..1] to I_SalesOrganization   as _SalesOrganization   on $projection.SalesOrganization = _SalesOrganization.SalesOrganization
  association [1..1] to I_DistributionChannel as _DistributionChannel on $projection.DistributionChannel = _DistributionChannel.DistributionChannel
  association [1..1] to I_Division            as _Division            on $projection.Division = _Division.Division
  association [1..1] to I_ShippingPoint       as _ShippingPoint       on $projection.ShippingPoint = _ShippingPoint.ShippingPoint
{
      @EndUserText.label : 'Customer'
      @ObjectModel.foreignKey.association:'_Customer'
  key kunnr                 as Customer,

      @EndUserText.label : 'Sales Organization'
      @ObjectModel.foreignKey.association:'_SalesOrganization'
  key vkorg                 as SalesOrganization,

      @EndUserText.label : 'Distribution Channel'
      @ObjectModel.foreignKey.association:'_DistributionChannel'
  key vtweg                 as DistributionChannel,

      @EndUserText.label : 'Division'
      @ObjectModel.foreignKey.association:'_Division'
  key spart                 as Division,

      @EndUserText.label : 'Shipping Point'
      @ObjectModel.foreignKey.association:'_ShippingPoint'
  key vstel                 as ShippingPoint,

      @EndUserText.label : 'Pick Customer Consolidation'
      zmcust_info_sts1      as PickCustomerConsolidatation,
      @EndUserText.label : 'Pick Consolidate by Customer PO'
      zmcust_info_sts2      as PickConsolidatationByPO,
      @EndUserText.label : 'Pick Consolidate by Attention Line'
      zmcust_info_sts3      as PickConsolidateByAttentionLine,
      @EndUserText.label : 'Bar Coded Pallet Content Sheet'
      zmcust_info_sts7      as BarCodedPalletContentSheet,

      @EndUserText.label : 'Ship-via Code'
      zmshipvia             as ShipViaCode,
      @EndUserText.label: 'Frozen Ship-Via Code'
      zmfrozshipvia         as FrozenShipViaCode,

      /* Admin Data - Presistent Change Log */

      @EndUserText.label : 'Created By'
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,

      @EndUserText.label : 'Created At'
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,

      @EndUserText.label : 'Last Changed By'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      /* Admin Data - Local Instance for ETag */

      @EndUserText.label : 'Local Last Changed By'
      @Semantics.user.localInstanceLastChangedBy: true           //Local Changes Logged By
      local_last_changed_by as LocalLastChangedBy,

      @EndUserText.label : 'Local Last Changed At'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true //Local Changes Logged At
      local_last_changed_at as LocalLastChangedAt,

      /* Associations */

      _Customer,
      _SalesOrganization,
      _DistributionChannel,
      _Division,
      _ShippingPoint
}
