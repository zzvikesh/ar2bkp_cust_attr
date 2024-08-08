CLASS lhc_zm_r_customeraimstp DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS pickconsolidatebycustomerpo FOR VALIDATE ON SAVE
      IMPORTING keys FOR customer~pickconsolidatebycustomerpo.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR customer RESULT result.

ENDCLASS.

CLASS lhc_zm_r_customeraimstp IMPLEMENTATION.

  METHOD pickconsolidatebycustomerpo.

    READ ENTITIES OF zm_r_customeraimstp IN LOCAL MODE
        ENTITY customer
        FIELDS ( pickcustomerconsolidatation
                 pickconsolidatationbypo )
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_customeraims).

    LOOP AT lt_customeraims INTO DATA(ls_customeraims).

      IF ls_customeraims-pickcustomerconsolidatation EQ '0' AND
         ls_customeraims-pickconsolidatationbypo EQ '1'.

        APPEND VALUE #( %tky = ls_customeraims-%tky ) TO failed-customer.

        APPEND VALUE #( %tky = ls_customeraims-%tky
                        %msg = new_message(
                                 id       = 'ZOTC_MSG'
                                 number   = 002
                                 severity = if_abap_behv_message=>severity-error
                                 v1       = 'Pick Consolidation by PO'
                                 v2       = 'Pick Customer Consolidation' )
                        "Fields to Tag
                        %element-pickcustomerconsolidatation = if_abap_behv=>mk-on
                        %element-pickconsolidatationbypo     = if_abap_behv=>mk-on ) TO reported-customer.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.



ENDCLASS.
