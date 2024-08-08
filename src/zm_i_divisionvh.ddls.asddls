@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Division (AIMS) Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZM_I_DivisionVH 
  as select distinct from ZM_R_CustomerAIMS
{
      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.element: ['DivisionName']
  key Division,

      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      //@UI.lineItem: [{ position: 20 }]
      _Division._Text[ 1:Language = $session.system_language  ].DivisionName
}
