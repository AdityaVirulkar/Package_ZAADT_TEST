class ZCL_CORR_MATERIAL definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF TY_MARA,
    matnr TYPE mara-matnr,
    ersda TYPE mara-ersda,
    mtart TYPE mara-mtart,
    matkl TYPE mara-matkl,
    meins TYPE mara-meins,
    END OF ty_mara .
  types:
    gt_mara TYPE TABLE OF ty_mara .

  data LANGUAGE type SPRAS .
  class-data MAT_TYPE type MTART .
  data GIT_MARA type MARA .

  events NO_MAT .

  methods GET_MAT_DETAILS
    importing
      !I_MATNR type MARA-MATNR
    exporting
      !E_MARA type MARA .
  methods GET_MAT_FOR_TYPE
    importing
      !I_MTART type MARA-MTART
    exporting
      !E_MARA type ZNIKS_MARA .
  methods GET_MAT_FOR_DATE
    importing
      !I_DATE type MARA-ERSDA
    exporting
      !E_MARA type GT_MARA .
  methods NO_MAT_HANDLER
    for event NO_MAT of ZCL_NIKS_MATERIAL .
  methods CONSTRUCTOR
    importing
      !I_SPRAS type MAKT-SPRAS .
  methods GET_MAT_DESCRIPTION
    importing
      !I_MATNR type MARA-MATNR
    exporting
      !E_MAKT type MAKT .
  class-methods CLASS_CONSTRUCTOR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CORR_MATERIAL IMPLEMENTATION.


  method CLASS_CONSTRUCTOR.
    mat_type = 'FERT'.
  endmethod.


  method CONSTRUCTOR.
    language = i_spras.
  endmethod.


  method GET_MAT_DESCRIPTION.

    select * from makt
      INTO e_makt
      WHERE matnr = i_matnr
      AND spras = language.
ENDSELECT.
  endmethod.


  method GET_MAT_DETAILS.

   IF i_matnr IS INITIAL.
     RAISE EVENT no_mat.

   ELSE.
     select SINGLE * FROM mara
      INTO e_mara
      WHERE matnr = i_matnr.
   ENDIF.

  endmethod.


 method GET_MAT_FOR_DATE.
*****************************************************************
* DATE :20180208
* TR :S7HK900945
* CHANGE ID : HANA-001
* AUTHOR :DEV001
* DESCRIPTION: HANA CORRECTIONS
* TEAM : HANA MIGRATION
*****************************************************************

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*      SELECT
*        MATNR
*        ERSDA
*        MTART
*        MATKL
*        MEINS
*        FROM
*        MARA
*        INTO TABLE
*        e_MARA
*        ......
      SELECT
        MATNR
        ERSDA
        MTART
        MATKL
        MEINS
        FROM
        MARA
        INTO TABLE
        e_MARA

ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>
  endmethod.


  method GET_MAT_FOR_TYPE.
*****************************************************************
* DATE :20180208
* TR :S7HK900945
* CHANGE ID : HANA-001
* AUTHOR :DEV001
* DESCRIPTION: HANA CORRECTIONS
* TEAM : HANA MIGRATION
*****************************************************************
*****************************************************************
* DATE :20180208
* TR :S7HK900945
* CHANGE ID : HANA-001
* AUTHOR :DEV001
* DESCRIPTION: HANA CORRECTIONS
* TEAM : HANA MIGRATION
*****************************************************************

    DATA: it_mara TYPE TABLE OF mara,
          wa_mara TYPE mara.
    select * from mara
      INTO TABLE e_mara
      UP TO 50 ROWS
      WHERE mtart = i_mtart.

      READ TABLE e_mara INTO wa_mara INDEX 3.
  endmethod.


  method NO_MAT_HANDLER.
    cl_demo_output=>write_text('no material entered').
  endmethod.
ENDCLASS.
