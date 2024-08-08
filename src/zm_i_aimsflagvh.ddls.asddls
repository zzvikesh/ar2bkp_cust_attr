@EndUserText.label: 'Flag values for AIMS'
-- DCL
@AccessControl.authorizationCheck: #NOT_REQUIRED
-- Data Model
@VDM.viewType: #BASIC
@ObjectModel.dataCategory: #VALUE_HELP
-- Performance
@ObjectModel.usageType:{
    serviceQuality: #A,
    dataClass: #CUSTOMIZING,
    sizeCategory: #S
}
-- Drop Down
@ObjectModel.resultSet.sizeCategory: #XS
--- Analytical
@Analytics : {
    dataCategory: #DIMENSION
}
-- Foreign Key Associations
@ObjectModel.representativeKey: 'Code'
define view entity ZM_I_AIMSFlagVH
  as select from dd07l
    association [0..*] to ZM_I_AIMSFlagVHText as _Text on $projection.Code = _Text.Code
{
      @ObjectModel.text.association: '_Text'
  key cast( domvalue_l as zmcust_info_sts1 ) as Code, //Data Element
            _Text
}
where
      dd07l.domname  = 'ZMCUST_INFO_STS1' //Input: <DomainName>
  and dd07l.as4local = 'A'
