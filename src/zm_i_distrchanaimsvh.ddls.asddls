@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Distribution Channel (AIMS) Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZM_I_DistrChanAIMSVH
  as select distinct from ZM_R_CustomerAIMS
{
      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.element: ['DistributionChannelName']
  key DistributionChannel,

      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      //@UI.lineItem: [{ position: 20 }]
      _DistributionChannel._Text[ 1:Language = $session.system_language  ].DistributionChannelName
}
