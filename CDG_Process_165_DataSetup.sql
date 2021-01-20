delete from CDG_PROPERTY_LOG@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=(select bill_yr_mo from major_run@CDG001T_QICT.CORP.LITEL.COM 
where major_id=(select max(major_id) from major_run@CDG001T_QICT.CORP.LITEL.COM));
delete from ADDRESS_MISMATCH_LOG@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=(select bill_yr_mo from major_run@CDG001T_QICT.CORP.LITEL.COM 
where major_id=(select max(major_id) from major_run@CDG001T_QICT.CORP.LITEL.COM));
delete from centurylink_on_xref_sub@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=(select bill_yr_mo from major_run@CDG001T_QICT.CORP.LITEL.COM 
where major_id=(select max(major_id) from major_run@CDG001T_QICT.CORP.LITEL.COM)) and rownum < 2;
update major_run@CDG001T_QICT.CORP.LITEL.COM set BILL_YR_MO=202007 where major_id=(select max(major_id) from major_run@CDG001T_QICT.CORP.LITEL.COM);
commit;
Insert into CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM
   (PROCESS_SEQ, PROCESS_ID, PROCESS_PERIOD, START_DT, END_DT, 
    STATUS_ID, CREATED_BY, UPDATED_BY)
 Values
   ((select max(process_seq+1) from cdg_process_log@CDG001T_QICT.CORP.LITEL.COM), 165, 2019723, sysdate, null, 
    1000, 'AA75654', 'AA75654');
commit;
