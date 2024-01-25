*****************************************************************
* DATE :20180207
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
*& Report ZAADT_OPCODE18
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcorr_test_op18.

DATA : wa_mara TYPE mara,
       it_mara TYPE STANDARD TABLE OF mara,
       it_mara1 TYPE STANDARD TABLE OF mara,
       it_mara2 TYPE STANDARD TABLE OF mara,
       it_mara3 TYPE STANDARD TABLE OF mara.

*CASE 1
* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*SELECT *
*FROM mara
*INTO
*TABLE it_mara
*UP
*TO
*10 ROWS..........
SELECT *
FROM mara
INTO
TABLE it_mara
UP
TO
10 ROWS
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>
DELETE it_mara
INDEX 4..........

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*SELECT *
*FROM mara
*INTO TABLE it_mara1
*UP TO 10 ROWS.
SELECT *
FROM mara
INTO TABLE it_mara1
UP TO 10 ROWS
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>
MODIFY it_mara1
FROM wa_mara INDEX 5.


* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*SELECT *
*FROM mara
*INTO TABLE it_mara2
*UP TO 10 ROWS.
SELECT *
FROM mara
INTO TABLE it_mara2
UP TO 10 ROWS
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>
READ TABLE
it_mara2
INTO wa_mara INDEX 6.
