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
*& Report ZAADT_TEST_OP13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCORR_TEST_OP13.
* CASE 1
  DATA:
        it_bkpf TYPE STANDARD TABLE OF bkpf.
* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*  SELECT * FROM BKPF INTO CORRESPONDING FIELDS OF TABLE IT_BKPF
*     WHERE BUDAT = '20171123'
*        AND GJAHR = '2017'
*        AND BUKRS = '9999'
*        AND AWTYP = 'BKPF'
*        AND BSTAT = SPACE
*        AND BLART = 'TR'
*            %_HINTS
*    DB2    '&SUBSTITUTE VALUES&'
*    ORACLE '&SUBSTITUTE VALUES&'....
  SELECT * FROM BKPF INTO CORRESPONDING FIELDS OF TABLE IT_BKPF
     WHERE BUDAT = '20171123'
        AND GJAHR = '2017'
        AND BUKRS = '9999'
        AND AWTYP = 'BKPF'
        AND BSTAT = SPACE
        AND BLART = 'TR'
            .
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

*DATA:
*      entry TYPE sci_test_dbtab_i.
*select single * from sci_test_dbtab_i  "finding
*where key1 = 'A' or key1 = 'B'
*%_hints hdb '&REPARSE&'
*              adabas '&REPARSE&'
*              db2 '&REPARSE&'
*              as400 '&REPARSE&'
*              db6 '&REPARSE&'
*              sybase '&REPARSE&'
*              oracle '&REPARSE&'
*              mssqlnt '&REPARSE&'
*              into @entry.
