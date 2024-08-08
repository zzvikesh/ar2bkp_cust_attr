@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Organization (AIMS) Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZM_I_SalesOrgAIMSVH
  as select distinct from ZM_R_CustomerAIMS
{
      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      @UI.lineItem: [{ position: 10 }]
  key SalesOrganization,

      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      @UI.lineItem: [{ position: 20 }]
      _SalesOrganization._Text[ 1:Language = $session.system_language  ].SalesOrganizationName,

      @UI.lineItem: [{ position: 30 }]
      _SalesOrganization.CompanyCode
}
