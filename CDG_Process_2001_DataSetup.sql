delete from REVENUE_ORDER_DETAIL@CDG001T_QICT.CORP.LITEL.COM where revord_id in 
(select revord_id from REVENUE_ORDER@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202004);
delete from REVENUE_ORDER@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202004;
update major_run@CDG001T_QICT.CORP.LITEL.COM set BILL_YR_MO=202004 where major_id=(select max(major_id) from major_run@CDG001T_QICT.CORP.LITEL.COM);
commit;
Insert into CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM   (PROCESS_SEQ, PROCESS_ID, PROCESS_PERIOD, START_DT, END_DT,     STATUS_ID, CREATED_BY, UPDATED_BY) Values   ((select max(process_seq+1) from cdg_process_log@CDG001T_QICT.CORP.LITEL.COM), 2001, 202004, sysdate, null,     1000, 'AA75654', 'AA75654');
commit;