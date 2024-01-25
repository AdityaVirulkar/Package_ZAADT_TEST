*****************************************************************
* DATE :20180208
* TR :S7HK900944
* CHANGE ID : HANA-001
* AUTHOR :DEV001
* DESCRIPTION: HANA CORRECTIONS
* TEAM : HANA MIGRATION
*****************************************************************

FUNCTION ZCORR_TESTFM_OP38.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(MATNR) TYPE  MARA-MATNR
*"  TABLES
*"      ZMARA STRUCTURE  MARA
*"----------------------------------------------------------------------

  DATA: wa_mara TYPE mara,
        lv_aenam TYPE aenam.

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*  SELECT
*  SINGLE matnr
*  FROM mara
*  INTO @DATA(it_mara)
*    ......
  SELECT
   matnr
  FROM mara
  INTO @DATA(it_mara)
ORDER BY PRIMARY KEY.
EXIT.
ENDSELECT.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

  SELECT SINGLE * FROM mara INTO wa_mara WHERE aenam = lv_aenam.

  SELECT * FROM mara INTO wa_mara UP TO 50 ROWS WHERE mtart = 'FERT'.
  ENDSELECT.

  CALL FUNCTION 'WS_UPLOAD'
*   EXPORTING
*     CODEPAGE                      = ' '
*     FILENAME                      = ' '
*     FILETYPE                      = 'ASC'
*     HEADLEN                       = ' '
*     LINE_EXIT                     = ' '
*     TRUNCLEN                      = ' '
*     USER_FORM                     = ' '
*     USER_PROG                     = ' '
*     DAT_D_FORMAT                  = ' '
*   IMPORTING
*     FILELENGTH                    =
    TABLES
      data_tab                      =  zmara
*   EXCEPTIONS
*     CONVERSION_ERROR              = 1
*     FILE_OPEN_ERROR               = 2
*     FILE_READ_ERROR               = 3
*     INVALID_TYPE                  = 4
*     NO_BATCH                      = 5
*     UNKNOWN_ERROR                 = 6
*     INVALID_TABLE_WIDTH           = 7
*     GUI_REFUSE_FILETRANSFER       = 8
*     CUSTOMER_ERROR                = 9
*     NO_AUTHORITY                  = 10
*     OTHERS                        = 11
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFUNCTION.
