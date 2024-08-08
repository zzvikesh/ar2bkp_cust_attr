@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer (AIMS) Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
@ObjectModel.semanticKey: ['Customer','CustomerName']
define view entity ZM_I_CustomerAIMSVH 
  as select distinct from ZM_R_CustomerAIMS
{

      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      @UI.lineItem: [{ position: 10 }]
  key Customer,

      @UI.lineItem: [{ position: 20 }]
      _Customer.CustomerName,

      @UI.hidden: true
      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      _Customer.OrganizationBPName1,

      @UI.hidden: true
      @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
      _Customer.OrganizationBPName2,

//      @UI.lineItem: [{ position: 30 }]
//      _Customer.CustomerClassification,

//      @UI.lineItem: [{ position: 40 }]
//      _Customer.Supplier,

      @UI.lineItem: [{ position: 30 }]
      _Customer.Country,

      @UI.lineItem: [{ position: 40 }]
      _Customer.CityCode,

      @UI.lineItem: [{ position: 60 }]
      _Customer.CityName,

      @UI.lineItem: [{ position: 70 }]
      _Customer.PostalCode,

      @UI.lineItem: [{ position: 80 }]
      _Customer.StreetName,

      @UI.lineItem: [{ position: 90 }]
      _Customer.Region,

      @UI.lineItem: [{ position: 100 }]
      _Customer._CustomerToBusinessPartner._BusinessPartner.BusinessPartner

}
