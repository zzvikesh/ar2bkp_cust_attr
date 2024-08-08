@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Master Data for AIMS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZM_R_CustomerAIMS
  as select from ztotc_customer
  -- Value / Check Tables
  association [1..1] to I_Customer            as _Customer                      on $projection.Customer = _Customer.Customer
  association [1..1] to I_SalesOrganization   as _SalesOrganization             on $projection.SalesOrganization = _SalesOrganization.SalesOrganization
  association [1..1] to I_DistributionChannel as _DistributionChannel           on $projection.DistributionChannel = _DistributionChannel.DistributionChannel
  association [1..1] to I_Division            as _Division                      on $projection.Division = _Division.Division
  -- Domain Values
//  association [1..1] to ZM_I_AIMSFlagVH       as _PickCustomerConsolidatationVH on $projection.PickCustomerConsolidatation = _PickCustomerConsolidatationVH.Code
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

      @EndUserText.label: 'Barcode Indicator'
      zmbarcode_ind         as BarcodeIndicator,
      @EndUserText.label: 'Distribution Center ID'
      zmdc_id               as DistributionCenterID,

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

      /* Admin Data */

      @EndUserText.label : 'Created By'
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,

      @EndUserText.label : 'Created At'
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,

      @EndUserText.label : 'Local Last Changed By'
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      //Local ETag field --> OData ETag
      @EndUserText.label : 'Local Last Changed At'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //Total ETag
      @EndUserText.label : 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      /* Associations */

      _Customer,
      _SalesOrganization,
      _DistributionChannel,
      _Division //,
      //_PickCustomerConsolidatationVH
}
