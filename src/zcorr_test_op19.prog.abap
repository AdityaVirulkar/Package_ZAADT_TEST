*****************************************************************
* DATE :20180208
* TR :S7HK900945
* CHANGE ID : HANA-001
* AUTHOR :DEV001
* DESCRIPTION: HANA CORRECTIONS
* TEAM : HANA MIGRATION
*****************************************************************
*&---------------------------------------------------------------------*
*& Report ZAADT_OPCODE19
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcorr_test_op19.

*PARAMETERS gp_mandt    LIKE cnvpack-mandt OBLIGATORY MODIF ID clt.
*SELECT-OPTIONS gp_old  FOR cnvpack-packid OBLIGATORY DEFAULT '00001'.
*DATA: gd_packid     LIKE cnvpack-packid,
*      gd_save_pack  LIKE cnvpack-packid,      "Sicherung f. Protokoll
*      gd_transcount(4) TYPE n.

DATA: IT_MARA TYPE STANDARD TABLE OF MARA,
      LW_MARA TYPE MARA.

* HANA CORRECTIONS - BEGIN OF MODIFICATION - <HANA-001>
*SELECT * FROM mara INTO TABLE it_mara UP TO 10 ROWS.
SELECT * FROM mara INTO TABLE it_mara UP TO 10 ROWS
ORDER BY PRIMARY KEY.
* HANA CORRECTIONS - END OF MODIFICATION - <HANA-001>

LOOP AT it_mara INTO lw_mara.
* case 1
  AT
    FIRST...
  ENDAT...
  AT
    NEW
    matnr...
  ENDAT...
  AT
     END OF
    matnr...
  ENDAT..
  AT
    LAST...
  ENDAT...

ENDLOOP.

* Naresh - Mondelez defects
*  SELECT * FROM cnvdomst CLIENT SPECIFIED
*      WHERE   mandt   = gp_mandt
*          AND packid IN gp_old.
**
*    ON CHANGE OF cnvdomst-packid.      "Wechsel der Paket-Nr.
*      IF gd_save_pack  NE  space.
**/        PERFORM message(cnv_00001_i_state_forms)
*        PERFORM append_message USING gc_theme_dominfo gc_task_entry
*            'I' 'CNV' '032' gd_transcount 'CNVDOMST' gd_save_pack
*                  space '2' '3'.
*      ENDIF.
*      CLEAR gd_transcount.
*    ENDON.
**
*    gd_save_pack     = cnvdomst-packid."sichern
*    cnvdomst-mandt   = sy-mandt.
*    cnvdomst-spras   = sy-langu.       "Anmeldesprache
*    cnvdomst-packid  = gp_new.
*    INSERT cnvdomst.
*    IF syst-subrc IS INITIAL.
*      ADD 1 TO gd_transcount.
**     Doppelte werden bei Texten ignoriert
*    ENDIF.
*  ENDSELECT.

* Scenarion 2
*LOOP.
*  SELECT * FROM mara INTO TABLE @DATA(it_mara) UP TO 10 ROWS.
*    AT FIRST.
*  ENDAT.
*  AT NEW matnr.
*  ENDAT.
*  AT END OF matnr.
*  ENDAT.
*  AT LAST.
*  ENDAT.
