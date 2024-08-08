FUNCTION ZCVIC_BUPA_EVENT_DSAVE_ENH_NEW.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------

*  data objekt type cuobn.
*  data : lcl_fsbp_bo_cvi type ref to fsbp_bo_cvi.
*  "data : ls_bp_cust_vend type cvis_bp_cust_vend.
*  data : lv_cust type  kunnr.
*  data: lv_sales_area type CVIS_SALES_AREA,
*        lv_acct_grp type ktokd.
**  data : lv_business_partner type bu_partner.
*
*  lv_cust = cvi_bdt_adapter=>get_current_customer( ).
*  lv_sales_area = cvi_bdt_adapter=>get_current_sales_area( ).
*
*  lv_acct_grp = cvi_bp_services=>get_customer_account_group( lv_cust ).
*
*
*  if lv_cust is not initial and lv_sales_area is not initial and lv_acct_grp = 'Z002'.
*
*    DATA:ls_customer TYPE ztotc_customer.
*
*      ls_customer-kunnr = lv_cust.
*      ls_customer-vkorg = lv_sales_area-SALES_ORG.
*      ls_customer-vtweg = lv_sales_area-DIST_CHANNEL.
*      ls_customer-spart = lv_sales_area-division.
*      MODIFY ztotc_customer FROM ls_customer.
**     MODIFY ztotc_customer
**      FROM VALUE #( kunnr = lv_cust
**                    vkorg = lv_sales_area-SALES_ORG
**                    vtweg = lv_sales_area-DIST_CHANNEL
**                    spart = lv_sales_area-division ).
*    ENDIF.
*
**lv_business_partner = cvi_bdt_adapter=>get_current_bp( ).
**
**if lv_business_partner is not initial.
**  lcl_fsbp_bo_cvi ?= fsbp_business_factory=>get_instance( cvi_bdt_adapter=>get_current_bp( ) ).
**
**  lv_cust = lcl_fsbp_bo_cvi->customer->get_customer( ).
*
**  objekt = lv_cust.





ENDFUNCTION.
