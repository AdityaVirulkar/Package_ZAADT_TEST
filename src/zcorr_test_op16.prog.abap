
*&---------------------------------------------------------------------*
*& Report ZAADT_TEST_OP16
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCORR_TEST_OP16.

* Normal case

DATA:
      lit_bseg TYPE STANDARD TABLE OF bseg.
*CASE NO. 2
SELECT
  MWSKZ
  BUZEI
  FROM
  BSEG
INTO
  TABLE
  LIT_BSEG
WHERE
   BELNR = '0123456776'
AND
  BUZID = 'T'.....

* With FOR ALL ENTRIES

DATA:
      it_bkpf TYPE STANDARD TABLE OF bkpf,
      it_bseg TYPE STANDARD TABLE OF bseg.
  SELECT bukrs
         belnr
         gjahr
         blart
         bldat
         waers
    FROM bkpf
    INTO TABLE it_bkpf
   WHERE bukrs EQ '2222'
     AND belnr EQ '0123456776'
     AND gjahr EQ '2017'
     AND blart IN ('DG', 'DR', 'KG', 'KR', 'RE', 'RV').

  CHECK NOT it_bkpf IS INITIAL.

  SELECT bukrs
         belnr
         gjahr
         buzei
         bschl
         buzid
         shkzg
         wrbtr
         hkont
         kunnr
         lifnr
         kostl
         projk
         pswsl
         sgtxt
    FROM bseg
    INTO CORRESPONDING FIELDS OF TABLE it_bseg
     FOR ALL ENTRIES IN it_bkpf
   WHERE belnr EQ it_bkpf-belnr
     AND gjahr EQ it_bkpf-gjahr
     AND bukrs EQ '9999'.

* With OPEN CURSOR
 data: l_cursor type cursor.
*case no 1
* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
* open
* cursor
* l_cursor
* for
* select * from
* doktl.....
 open
 cursor
 l_cursor
 for
 select * from
 doktl
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

* With INNER JOIN
DATA:
      lit_bset TYPE STANDARD TABLE OF bset.
SELECT A~SHKZG A~KTOSL A~H3STE A~HWSTE B~STAZF FROM BSET AS A
  INNER JOIN T007B AS B ON A~KTOSL = B~KTOSL
  INTO TABLE LIT_BSET WHERE A~BUKRS = '9999' AND A~BELNR = '0123456776'
  AND A~GJAHR = '2017' AND A~BUZEI = '222' AND A~MWSKZ = '21'
  AND B~STAZF = ABAP_FALSE.
