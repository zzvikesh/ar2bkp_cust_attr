@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Contact Card'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZM_I_CustomerContactCard
  as select from I_Customer
{

      //https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/e290553ccb50478fa98abc5306129aea.html

      //@Semantics.contact.type: #PERSON
      //@Semantics.name.jobTitle: true

  key Customer as Customer,

      @EndUserText:{ label: 'Customer Name' }
      @Semantics.name.fullName: true
      CustomerName,

      @EndUserText:{ label: 'Customer Full Name' }
      @Semantics.name.additionalName: true
      CustomerFullName,

      @EndUserText:{ label: 'Country' }
      @Semantics.address.country: true
      Country,

      @EndUserText:{ label: 'City' }
      @Semantics.address.city: true
      CityName,

      @Semantics.address.zipCode: true
      PostalCode,

      @Semantics.address.street: true
      StreetName,

      @Semantics.address.region: true
      Region,

      @Semantics.telephone.type: [ #CELL,#WORK ]
      TelephoneNumber1,

      @Semantics.telephone.type: [ #CELL,#WORK ]
      TelephoneNumber2,

      //@Semantics.contact.photo: true
      //'sap-icon://person-placeholder' as CustomerImageURL,

      //      @Semantics.address.city: true
      //      CityCode,

      /* Unsure */
      //@Semantics.address.label: true
      //@Semantics.address.type: [#WORK]
      //@Semantics.address.number: true

      AddressID,
      OrganizationBPName1,
      OrganizationBPName2,
      SortField,
      FaxNumber,
      BR_SUFRAMACode,
      Supplier,
      CreatedByUser,
      CustomerAccountGroup,
      CustomerClassification,
      TradingPartner,

      /* Associations */
      _AddressDefaultRepresentation,
      _ContactPerson,
      _CorrespondingSupplier,
      _CreatedByUser,
      _CustomerAccountGroupText,
      _CustomerAddr,
      _CustomerAddrSalesAreaTax,
      _CustomerClassification,
      _CustomerClassificationText,
      _CustomerCompany,
      _CustomerHierarchyNode,
      _CustomerSalesArea,
      _CustomerSalesAreaTax,
      _CustomerToBusinessPartner,
      _GlobalCompany,
      _StandardAddress
}
