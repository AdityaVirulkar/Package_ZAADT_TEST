*&---------------------------------------------------------------------*
*& Report ZAADT_TEST_OP41
*&---------------------------------------------------------------------*
*& Please do not perform CORRECTIONS on this report
*&---------------------------------------------------------------------*
*& Initial check for For All Entries
*&---------------------------------------------------------------------*
REPORT zcorr_test_op41.


*&---------------------------------------------------------------------*
*& Scenario 1
*&---------------------------------------------------------------------*
DATA: it_mara TYPE STANDARD TABLE OF mara,
      wa_mara TYPE mara,
      it_makt TYPE STANDARD TABLE OF makt,
      wa_makt TYPE makt.

SELECT * FROM mara
  INTO TABLE it_mara UP TO 100 ROWS.

*IF sy-subrc = 0.
  SELECT * FROM makt
    INTO wa_makt "it_makt
    FOR ALL ENTRIES IN it_mara
    WHERE matnr = it_mara-matnr.
  ENDSELECT.
*ENDIF.

***&---------------------------------------------------------------------*
***& Scenario FAE using Range
***&---------------------------------------------------------------------*
*RANGES: r_matnr FOR mara-matnr,
*        rt_matnr FOR mara-matnr.
*
*IF it_mara IS NOT INITIAL .
*  LOOP AT it_mara INTO wa_mara.
*    r_mara-sign = 'I' .
*    r_mara-option ='EQ' .
*    r_mara-low  = wa_mara-matnr .
*    r_mara-high = wa_mara-matnr.
*    APPEND r_mara TO rt_mara.
*  ENDLOOP.
*ENDIF.
*  SELECT * FROM makt
*    INTO TABLE it_makt
*    FOR ALL ENTRIES IN rt_mara
*    WHERE matnr = rt_mara-matnr-low.
*
**&---------------------------------------------------------------------*
**& Scenario 2
**&---------------------------------------------------------------------*
*DATA: it_mara2      TYPE STANDARD TABLE OF mara,
*      wa_mara2      TYPE mara,
*      it_makt2      TYPE STANDARD TABLE OF makt,
*      wa_makt2      TYPE makt,
*      it_temp_mara2 TYPE STANDARD TABLE OF mara.
*
*SELECT * FROM mara
*  INTO TABLE it_mara2 UP TO 100 ROWS.
*
*it_temp_mara2[] = it_mara2[].
*
*IF it_temp_mara2 IS NOT INITIAL.
*  SELECT * FROM makt
*    INTO TABLE it_makt2
*    FOR ALL ENTRIES IN it_temp_mara2
*    WHERE matnr = it_temp_mara2-matnr.
*ENDIF.
*
*IF it_temp_mara2 IS NOT INITIAL.
*  SELECT * FROM makt
*    INTO TABLE it_makt2
*    FOR ALL ENTRIES IN it_mara2
*    WHERE matnr = it_mara2-matnr.
*ENDIF.
**
**&---------------------------------------------------------------------*
**& Scenario 3
**&---------------------------------------------------------------------*
*
*SELECT * FROM mara
*  INTO TABLE it_mara UP TO 100 ROWS.
*
*IF sy-subrc = 0.
*  SELECT * FROM makt
*    INTO TABLE it_makt
*    FOR ALL ENTRIES IN it_mara
*    WHERE matnr = it_mara-matnr.
*ENDIF.
*
**&---------------------------------------------------------------------*
**& Scenario 4
**&---------------------------------------------------------------------*
*
*SELECT * FROM mara
*  INTO TABLE it_mara UP TO 100 ROWS.
*
*CHECK it_mara IS NOT INITIAL.
*
*SELECT * FROM makt
*  INTO TABLE it_makt
*  FOR ALL ENTRIES IN it_mara
*  WHERE matnr = it_mara-matnr.
*
**&---------------------------------------------------------------------*
**& Scenario 5 & 6
**&---------------------------------------------------------------------*
*
*DATA sciresthd TYPE scit_resh.
*DATA scirestps TYPE scit_rest.
*DATA tab       TYPE scit_resh.
*DATA tab2      TYPE scit_resh.
*FIELD-SYMBOLS <fs> TYPE scit_resh.
*DATA programmname TYPE program.
*DATA:
*  BEGIN OF COMMON PART comm1,
*    comm1 TYPE scit_resh,
*  END OF COMMON PART comm1.
*
*CLEAR: scirestps, sciresthd.
*SELECT * FROM scirest_hd INTO
*       TABLE sciresthd
*            WHERE inspecid   = '000'
*              AND inspecvers = '001'
*              AND ciuser     = ' '
*         ORDER BY PRIMARY KEY.
*
*tab   = sciresthd.
*comm1 = tab.
*MOVE comm1 TO tab2.
*ASSIGN tab2 TO <fs>.
*PERFORM local_form USING tab.
*PERFORM external_form1 IN PROGRAM rs_ci_test_for_all_entr_hana_2 USING 1 tab.
*
*FORM local_form USING p_tab TYPE scit_resh.
*  CHECK sciresthd IS NOT INITIAL.
*  SELECT * FROM scirest_ps INTO
*           CORRESPONDING FIELDS OF
*           TABLE scirestps
*           FOR ALL ENTRIES IN p_tab
*                WHERE inspecid   = '000'
*                  AND inspecvers = '001'
*                  AND ciuser     = ''
*                  AND objtype    = p_tab-objtype
*                  AND objname    = p_tab-objname.
*ENDFORM.
*IF sy-subrc = 0.
*
*ENDIF.
