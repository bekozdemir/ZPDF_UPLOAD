CLASS lhc_Invoice DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR Invoice RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Invoice RESULT result.

    METHODS is_create_allowed
      RETURNING VALUE(create_allowed) TYPE abap_bool.

ENDCLASS.

CLASS lhc_Invoice IMPLEMENTATION.

*  METHOD get_instance_authorizations.
*  ENDMETHOD.

  METHOD get_global_authorizations.

    IF requested_authorizations-%update = if_abap_behv=>mk-on OR
        requested_authorizations-%action-Edit = if_abap_behv=>mk-on OR
        requested_authorizations-%action-Prepare = if_abap_behv=>mk-on OR
         requested_authorizations-%create = if_abap_behv=>mk-on OR
          requested_authorizations-%delete = if_abap_behv=>mk-on.
      IF is_create_allowed( ) = abap_true.
        result-%create = if_abap_behv=>auth-allowed.
        result-%delete = if_abap_behv=>auth-allowed.
        result-%update = if_abap_behv=>auth-allowed.
        result-%action-edit = if_abap_behv=>auth-allowed.
        result-%action-Prepare = if_abap_behv=>auth-allowed.
      ENDIF.
    ENDIF.

  ENDMETHOD.

  METHOD is_create_allowed.
    create_allowed = abap_true.
  ENDMETHOD.

ENDCLASS.
