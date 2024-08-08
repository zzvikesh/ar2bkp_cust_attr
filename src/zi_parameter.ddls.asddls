@EndUserText.label: 'parameter'
define root abstract entity zi_parameter
  //  with parameters
  //    parameter_name : parameter_type
{
  //@UI.defaultValue : #( 'ELEMENT_OF_REFERENCED_ENTITY: Customer')
  //@UI.defaultValue    : #( 'CustomerShippingPoint: Customer')
  //@UI.defaultValue : #( 'ZM_R_CustomerShipPointTP: Customer')
  @Consumption.hidden: true
  @UI.hidden          : true
  customer            : kunnr;
  @UI.hidden          : true
  SalesOrganization   : vkorg;
  @UI.hidden          : true
  DistributionChannel : vtweg;
  @UI.hidden          : true
  Division            : spart;
  ShippingPoint       : vstel;

}
