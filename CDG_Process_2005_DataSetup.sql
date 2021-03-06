delete from revenue_order_detail@CDG001T_QICT.CORP.LITEL.COM where REVORD_ID in
(select REVORD_ID from revenue_order@CDG001T_QICT.CORP.LITEL.COM 
where BILL_YR_MO=(select BILL_YR_MO from major_run@CDG001T_QICT.CORP.LITEL.COM where major_id=(select max(major_id) from major_run@CDG001T_QICT.CORP.LITEL.COM)));
delete from revenue_order@CDG001T_QICT.CORP.LITEL.COM 
where BILL_YR_MO=(select BILL_YR_MO from major_run@CDG001T_QICT.CORP.LITEL.COM where major_id=(select max(major_id) from major_run@CDG001T_QICT.CORP.LITEL.COM));
commit;
Insert into CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM   (PROCESS_SEQ, PROCESS_ID, PROCESS_PERIOD, START_DT, END_DT,     STATUS_ID, CREATED_BY, UPDATED_BY) Values   ((select max(process_seq+1) from cdg_process_log@CDG001T_QICT.CORP.LITEL.COM), 2005, 2019723, sysdate, null,     1000, 'AA75654', 'AA75654');
commit;
