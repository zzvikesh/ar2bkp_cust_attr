@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'User Contact Card'
@ObjectModel.representativeKey: 'ContactCardID'
define view entity ZI_UserContactCard
  as select from usr21 as _User
  association [0..1] to adrp as _Person                   on  _Person.persnumber = $projection.Person
                                                          and _Person.persnumber <> ''
                                                          and _Person.nation     =  ''

//  association [0..1] to adcp as _OrgData                  on  _OrgData.addrnumber = $projection.AddressID
//                                                          and _OrgData.persnumber = $projection.Person

//  association [0..1] to adr2 as _DefaultPhoneNumber       on  _DefaultPhoneNumber.addrnumber = $projection.AddressID
//                                                          and _DefaultPhoneNumber.persnumber = $projection.Person
//                                                          and _DefaultPhoneNumber.r3_user    = '1'

//  association [0..1] to adr3 as _DefaultFaxNumber         on  _DefaultFaxNumber.addrnumber = $projection.AddressID
//                                                          and _DefaultFaxNumber.persnumber = $projection.Person
//                                                          and flgdefault                   = 'X'
//
//  association [0..1] to adr2 as _DefaultMobilePhoneNumber on  _DefaultMobilePhoneNumber.addrnumber = $projection.AddressID
//                                                          and _DefaultMobilePhoneNumber.persnumber = $projection.Person
//                                                          and _DefaultMobilePhoneNumber.r3_user    = '3'
//
//  association [0..1] to adr6 as _DefaultEmailAddress      on  _DefaultEmailAddress.addrnumber = $projection.AddressID
//                                                          and _DefaultEmailAddress.persnumber = $projection.Person
//                                                          and _DefaultEmailAddress.flgdefault = 'X'
{
//date_from   ad_date_fr  dats(8)  Valid-from date - in current Release only 00010101 possible 
      @ObjectModel.text.element : ['UserDescription']
      @Semantics.contact.type: #PERSON
  key _User.bname                                                                                 as ContactCardID,
      _User.persnumber                                                                            as Person,
//      _User.bpperson                                                                              as BusinessPartnerUUID,

      @Semantics.name.givenName: true
      _Person.name_first                                                                          as FirstName,

      @Semantics.name.familyName: true
      _Person.name_last                                                                           as LastName,

      @Semantics.name.fullName: true
      cast(coalesce( _Person.name_text , _User.techdesc ) as ad_namtext preserving type )         as FullName

//      @Semantics.text: true
//      @Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.7 }
//      cast( _User.techdesc as vdm_userdescription preserving type )                               as UserDescription,
//
//      _User.addrnumber                                                                            as AddressID,
//
//      @Semantics.telephone.type:  [ #WORK ]
//      cast(_DefaultPhoneNumber.telnr_long as contactcardphonenumber preserving type )             as PhoneNumber,
//
//      @Semantics.telephone.type:  [ #CELL ]
//      cast(_DefaultMobilePhoneNumber.telnr_long as contactcardmobilephonenumber preserving type ) as MobilePhoneNumber,
//
////      @Semantics.telephone.type:  [ #FAX ]
////      cast(_DefaultFaxNumber.faxnr_long as contactcardfaxnumber preserving type )                 as FaxNumber,
//
//      @Semantics.eMail.type:  [#WORK]
//      @Semantics.eMail.address: true
//      cast(_DefaultEmailAddress.smtp_addr as contactcardemailaddress preserving type )            as EmailAddress

//      @Semantics.organization.name: true
//      _OrgData.department                                                                         as Department,
//
//      @Semantics.organization.role: true
//      _OrgData.function                                                                           as FunctionalTitleName,
//
//      @UI.hidden:true
//      'Creator'                                                                                   as ContactCardRole,
//      @UI.hidden:true
//      'User'                                                                                      as ContactCardType,
//
//      @UI.hidden:true
//      'User'                                                                                      as ContactCardNavLinkSemanticObj,
//      @UI.hidden:true
//      concat('User=', _User.bname)                                                                as ContactCardNavLinkQueryPart
}
