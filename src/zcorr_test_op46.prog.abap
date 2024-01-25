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
*****************************************************************
* DATE :20180206
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
*& Report ZAADT_TEST_OP46
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCORR_TEST_OP46.
TABLES: bsis.

DATA: it_bsis LIKE STANDARD TABLE OF bsis WITH HEADER LINE,
      wa_it_bsis LIKE bsis.
* CASE 1
SELECT * FROM bsis UP TO 1000 ROWS
  INTO CORRESPONDING FIELDS OF TABLE it_bsis...

*&---------------------------------------------------------------------*
*&  Scenario 1
*&---------------------------------------------------------------------*

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
SORT IT_BSIS BY  ZUONR XREF3 .
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>
DELETE
ADJACENT
DUPLICATES
FROM it_bsis
COMPARING zuonr xref3.

*&---------------------------------------------------------------------*
*&  Scenario 2
*&---------------------------------------------------------------------*

DATA : IT_MARA TYPE TABLE OF MARA.
DATA : WA_MARA TYPE MARA.

SELECT * FROM MARA INTO TABLE IT_MARA UP TO 50 ROWS WHERE MTART = 'FERT'.

  SORT it_mara By MATNR MTART.
  DELETE ADJACENT DUPLICATES FROM IT_MARA COMPARING MATNR MTART.

*&---------------------------------------------------------------------*
*&  Scenario 3
*&---------------------------------------------------------------------*

DATA : IT_MARA2 TYPE SORTED TABLE OF MARA with NON-UNIQUE KEY MATNR MTART.
DATA : WA_MARA2 TYPE MARA.

SELECT * FROM MARA INTO TABLE IT_MARA2 UP TO 50 ROWS WHERE MTART = 'FERT'.

  DELETE ADJACENT DUPLICATES FROM IT_MARA2 COMPARING MATNR MTART.
