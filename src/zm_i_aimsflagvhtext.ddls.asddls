//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Flag value for AIMS (Text)'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
//define view entity ZM_I_AIMSFlagVHText 
//as select from dd07t
//{
//    key domname as Domname,
//    key ddlanguage as Ddlanguage,
//    key as4local as As4local,
//    key valpos as Valpos,
//    key as4vers as As4vers,
//    ddtext as Ddtext,
//    domval_ld as DomvalLd,
//    domval_hd as DomvalHd,
//    domvalue_l as DomvalueL
//}
@EndUserText.label: 'Flag value for AIMS (Text)'
-- DCL
@AccessControl.authorizationCheck: #NOT_REQUIRED
-- Data Model
@VDM.viewType: #BASIC
@ObjectModel.dataCategory: #TEXT
-- Performance
@ObjectModel.usageType:{
    serviceQuality: #A,
    dataClass: #CUSTOMIZING,
    sizeCategory: #S
}
-- Foreign Key Associations
@ObjectModel.representativeKey: 'Code'
define view entity ZM_I_AIMSFlagVHText
  as select from dd07t 
  association [0..*] to ZM_I_AIMSFlagVH  as _Code     on $projection.Code = _Code.Code
  association [0..1] to I_Language       as _Language on $projection.Language = _Language.Language
{
  key cast( domvalue_l as zmcust_info_sts1 ) as Code, //Data Element
      @Semantics.language: true
      @ObjectModel.foreignKey.association: '_Language'
  key ddlanguage                              as Language,
      @Semantics.text: true
      ddtext                                  as Description,
      _Code,
      _Language
}
where
      domname  = 'ZMCUST_INFO_STS1' //Domain
  and as4local = 'A'
