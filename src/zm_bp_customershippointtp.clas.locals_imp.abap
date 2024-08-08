CLASS lhc_customershippingpoint DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS pickconsolidatebycustomerpo FOR VALIDATE ON SAVE
      IMPORTING keys FOR customershippingpoint~pickconsolidatebycustomerpo.
    METHODS setdefaults FOR MODIFY
      IMPORTING keys FOR ACTION customershippingpoint~setdefaults RESULT result.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR customershippingpoint RESULT result.

ENDCLASS.

CLASS lhc_customershippingpoint IMPLEMENTATION.

  METHOD pickconsolidatebycustomerpo.

    READ ENTITIES OF zm_r_customeraimstp IN LOCAL MODE
        ENTITY customershippingpoint
        FIELDS ( pickcustomerconsolidatation
                 pickconsolidatationbypo )
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_customershippingpoint).

    LOOP AT lt_customershippingpoint INTO DATA(ls_customershippingpoint).

      IF ls_customershippingpoint-pickcustomerconsolidatation EQ '0' AND
         ls_customershippingpoint-pickconsolidatationbypo EQ '1'.

        APPEND VALUE #( %tky = ls_customershippingpoint-%tky ) TO failed-customer.

        APPEND VALUE #( %tky = ls_customershippingpoint-%tky
                        %msg = new_message(
                                 id       = 'ZOTC_MSG'
                                 number   = 002
                                 severity = if_abap_behv_message=>severity-error
                                 v1       = 'Pick Consolidation by PO'
                                 v2       = 'Pick Customer Consolidation' )
                        "Fields to Tag
                        %element-pickcustomerconsolidatation = if_abap_behv=>mk-on
                        %element-pickconsolidatationbypo     = if_abap_behv=>mk-on ) TO reported-customershippingpoint.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD setdefaults.

    READ ENTITIES OF zm_r_customeraimstp IN LOCAL MODE
        ENTITY customershippingpoint
        BY \_customeraims
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_customeraims).

    LOOP AT lt_customeraims INTO DATA(ls_customeraims).

      " Modify in local mode: BO-related updates that are not relevant for authorization checks
      MODIFY ENTITIES OF zm_r_customeraimstp IN LOCAL MODE
      ENTITY customershippingpoint
      UPDATE FIELDS ( pickcustomerconsolidatation
                      pickconsolidatationbypo
                      pickconsolidatebyattentionline
                      barcodedpalletcontentsheet
                      shipviacode
                      frozenshipviacode )
      WITH VALUE #( FOR key IN keys
                    ( %tky                           = key-%tky
                      pickcustomerconsolidatation    = ls_customeraims-pickcustomerconsolidatation
                      pickconsolidatationbypo        = ls_customeraims-pickconsolidatationbypo
                      pickconsolidatebyattentionline = ls_customeraims-pickconsolidatebyattentionline
                      barcodedpalletcontentsheet     = ls_customeraims-barcodedpalletcontentsheet
                      shipviacode                    = ls_customeraims-shipviacode
                      frozenshipviacode              = ls_customeraims-frozenshipviacode ) ).

      " Read changed data for action result
      READ ENTITIES OF zm_r_customeraimstp IN LOCAL MODE
      ENTITY customershippingpoint
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(lt_customershippingpoint).

      result = VALUE #( FOR ls_customershippingpoint IN lt_customershippingpoint
                        ( %tky   = ls_customershippingpoint-%tky
                          %param = ls_customershippingpoint ) ).

    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
