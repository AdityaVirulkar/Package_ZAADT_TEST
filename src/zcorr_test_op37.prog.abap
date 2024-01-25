*****************************************************************
* DATE :20180208
* TR :S7HK900945
* CHANGE ID : HANA-001
* AUTHOR :DEV001
* DESCRIPTION: HANA CORRECTIONS
* TEAM : HANA MIGRATION
*****************************************************************
*****************************************************************
* DATE :20180206
* TR :S7HK900945
* CHANGE ID : HANA-001
* AUTHOR :DEV001
* DESCRIPTION: HANA CORRECTIONS
* TEAM : HANA MIGRATION
*****************************************************************
*&---------------------------------------------------------------------*
*& Report ZAADT_TEST_OP37
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcorr_test_op37.

DATA: t100_wa TYPE t100,
      t100_it TYPE TABLE OF t100.

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*SELECT
*SINGLE *
*FROM t100
*INTO t100_wa
*BYPASSING BUFFER
*    WHERE sprsl = 'D'
*    AND arbgb = '00'
*    AND msgnr = '999'......
*
*
*TYPES: BEGIN OF ty_mara,
*         matnr TYPE mara-matnr,
*         mtart TYPE mara-mtart,
*       END OF ty_mara.
SELECT
SINGLE *
FROM t100
INTO t100_wa
    WHERE sprsl = 'D'
    AND arbgb = '00'
    AND msgnr = '999'......
TYPES: BEGIN OF ty_mara,
         matnr TYPE mara-matnr,
         mtart TYPE mara-mtart,
       END OF ty_mara.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>
DATA: it_mara TYPE TABLE OF ty_mara,
      wa_mara TYPE          ty_mara.


* CASE 1
START-OF-SELECTION.
* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*  SELECT
*  matnr
*  mtart
*  FROM mara
*  INTO TABLE it_mara
*  BYPASSING BUFFER....
  SELECT
  matnr
  mtart
  FROM mara
  INTO TABLE it_mara
  ....
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

  LOOP AT it_mara INTO wa_mara.
*    WRITE:/ wa_mara-matnr, wa_mara-mtart.
  ENDLOOP.
