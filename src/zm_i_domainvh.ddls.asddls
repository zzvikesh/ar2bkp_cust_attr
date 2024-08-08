@EndUserText.label: 'Reusable Value Help for Domain'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.query.implementedBy: 'ABAP:ZCL_GET_DOMAIN_FIX_VALUES'
define custom entity ZM_I_DomainVH
{
      @EndUserText.label     : 'Domain Name'
      @UI.hidden  : true
  key domain_name : sxco_ad_object_name;
      @UI.hidden  : true
  key pos         : abap.numc( 4 );
      @EndUserText.label     : 'Value'      
      //@ObjectModel.text.element: ['description']
      low         : abap.char( 10 );
      @EndUserText.label     : 'upper_limit'
      high        : abap.char(10);
      @EndUserText.label     : 'Description'
      @Semantics.text: true
      description : abap.char(60);
}
