CLASS zcl_im_mdg_cust_attr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mdg_se_bp_bulk_replrq_in .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_IM_MDG_CUST_ATTR IMPLEMENTATION.


  METHOD if_mdg_se_bp_bulk_replrq_in~inbound_processing.

*
  DATA(lv_customer) = in-business_partner-customer-internal_id.
       DATA:ls_customer TYPE ztotc_customer.

*out-customer-company_data-company
    LOOP AT out-customer-sales_data-sales ASSIGNING FIELD-SYMBOL(<ls_sales_area>).

      DATA(lv_sales_org) = <ls_sales_area>-data_key-vkorg.
      DATA(lv_vtweg) = <ls_sales_area>-data_key-vtweg.
      DATA(lv_spart) = <ls_sales_area>-data_key-spart.

    ENDLOOP.


      ls_customer-kunnr = lv_customer.
      ls_customer-vkorg = lv_sales_org.
      ls_customer-vtweg = lv_vtweg.
      ls_customer-spart = lv_spart.
      MODIFY ztotc_customer FROM ls_customer.

  ENDMETHOD.


  METHOD if_mdg_se_bp_bulk_replrq_in~outbound_processing.
  ENDMETHOD.
ENDCLASS.
