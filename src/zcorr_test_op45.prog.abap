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

*&---------------------------------------------------------------------*
*& Report ZAADT_TEST_OP45
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCORR_TEST_OP45.
perform:
  MOVE,
  APPEND,
  UPDATE.
*&---------------------------------------------------------------------*
*& Form MOVE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM move .
*  case 1
 data: L_ITAB_1 type table of SCI_HANA_TEST1.

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*  select
*    * from
*    SCI_HANA_TEST1
*    into table L_ITAB_1...   "#EC CI_NOWHERE
  select
    * from
    SCI_HANA_TEST1
    into table L_ITAB_1   "#EC CI_NOWHERE
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

  read table L_ITAB_1 with key PGMID = 'XXX' binary search transporting no fields.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form APPEND
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM append .
*  case 2.
 data: L_ITAB_2 type table of SCI_HANA_TEST1.

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*  select
*    * from
*    SCI_HANA_TEST1
*    into table L_ITAB_2.  "#EC CI_NOWHERE
  select
    * from
    SCI_HANA_TEST1
    into table L_ITAB_2  "#EC CI_NOWHERE
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

  read table
   L_ITAB_2
   with key PGMID = 'XXX'
   binary search transporting no fields.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form UPDATE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM update .
*  case 3
 data: L_ITAB_3 type table of SCI_HANA_TEST1.

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*  select
*    * from
*    SCI_HANA_TEST1
*    into table L_ITAB_3.   "#EC CI_NOWHERE
  select
    * from
    SCI_HANA_TEST1
    into table L_ITAB_3   "#EC CI_NOWHERE
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

  read table
  L_ITAB_3
  with key PGMID = 'XXX'
  binary search transporting no fields....
ENDFORM.
