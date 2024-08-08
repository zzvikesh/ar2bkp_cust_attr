class ZCL_IM_SCE_GLOB_UPDATE definition
  public
  final
  create public .

public section.

  interfaces IF_EX_PARTNER_UPDATE .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_SCE_GLOB_UPDATE IMPLEMENTATION.


  method IF_EX_PARTNER_UPDATE~CHANGE_BEFORE_OUTBOUND.

*  data: lt_but000_old type table of BUT000,
*        lt_but000_new type table of but000.
*
*  data : lv_cust type  kunnr.
*  data: lv_sales_area type CVIS_SALES_AREA,
*        lv_acct_grp type ktokd,
*        lv_flag type boolean,
*       lcl_bp_cust type ref to CVI_BP_CUSTOMER.
**  data : lv_business_partner type bu_partner.
*
*  data:
*    lcl_mo_root type ref to if_xo_memory_object.

* dependent object don't have to know if they are new or not (parent object defines)
*  check customizing->is_dependent_bo_type( ) = false.

* request delegated to root table
* root table must have existing entry, then object instance already exists
*  lcl_mo_root = get_root_table( ).
*  lv_flag = lcl_mo_root->is_object_new( ).
*
*  if lv_flag is not initial.
*
*  CALL FUNCTION 'BUPA_GENERAL_CALLBACK'
*    TABLES
*      et_but000_old   = lt_but000_old
*      et_but000_new = lt_but000_new
*    EXCEPTIONS
*      OTHERS          = 0.
*
*  if lt_but000_old is initial and lt_but000_new is not initial.
*  data(ls_but000) = lt_but000_new[ 1 ].
*
*   lcl_bp_cust = cvi_bp_customer=>get_instance( i_partner = ls_but000-PARTNER ).
*  lv_cust = lcl_bp_cust->get_customer( ).
**  lv_cust = cvi_bdt_adapter=>get_current_customer( ).
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
*    endif.

  endmethod.


  method IF_EX_PARTNER_UPDATE~CHANGE_BEFORE_UPDATE.
  endmethod.
ENDCLASS.
