CLASS zcl_hidden_calc_custaims DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hidden_calc_custaims IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~calculate.

* Check the field for your condition and return either abap_true or abap_false for the
* virtual field.

    DATA lt_original_data TYPE STANDARD TABLE OF zm_c_customershippointm WITH DEFAULT KEY.
    lt_original_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_original_data>).
      "<fs_original_data>-hiddenflag = abap_true.
      "COND ABAP_BOOLEAN( WHEN <FS_ORIGINAL_DATA>-FieldToCheck > 1000 THEN ABAP_TRUE ELSE ABAP_FALSE ).
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    "Extract the field you want the field visibility to depend on

    IF iv_entity EQ 'ZM_C_CustomerShipPointM'.
      LOOP AT it_requested_calc_elements ASSIGNING FIELD-SYMBOL(<fs_calc_element>).
*        CASE <fs_calc_element>.
*          WHEN 'testField'.
*            APPEND 'FieldToCheck' TO et_requested_orig_elements.
*            ...
*        ENDCASE.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
