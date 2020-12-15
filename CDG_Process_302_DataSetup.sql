update revenue_order_detail set invoice_no=null where revord_id in (select revord_id from revenue_order where bill_yr_mo=202008);
commit;
Insert into CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM   (PROCESS_SEQ, PROCESS_ID, PROCESS_PERIOD, START_DT, END_DT,     STATUS_ID, CREATED_BY, UPDATED_BY) 
Values   ((select max(process_seq+1) from cdg_process_log@CDG001T_QICT.CORP.LITEL.COM), 302, 2019723, sysdate, null,     1000, 'AA75654', 'AA75654');
commit;
