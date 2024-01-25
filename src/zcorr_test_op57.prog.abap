*&---------------------------------------------------------------------*
*& Report ZAADT_OPCODE57
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCORR_TEST_OP57.

PARAMETERS: p_matnr TYPE matnr,
            p_vbeln TYPE vbeln.

* case 1
SELECT SINGLE * FROM mara INTO @DATA(it_mara)...

SELECT
SINGLE
matnr
FROM
mara
INTO
@DATA(it_mara1).

SELECT *
UP TO
 10 rows
 FROM mara
INTO TABLE
@DATA(mara2).

SELECT
SINGLE *
FROM vbap
INTO @DATA(it_vbap)
WHERE vbeln = @p_vbeln.

*-----------------------------------------------------------------------*
* Nagetive Testing
*-----------------------------------------------------------------------*
  SELECT SINGLE * FROM mara INTO @DATA(it_mara2) WHERE matnr = @p_matnr.

  SELECT SINGLE * FROM vbap INTO @DATA(it_vbap2)
    WHERE vbeln = @p_vbeln
    AND posnr = '0010'.

 SELECT * UP TO 10 rows FROM mara INTO TABLE @DATA(mara3)
   ORDER BY PRIMARY KEY.
