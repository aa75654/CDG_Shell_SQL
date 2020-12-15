select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=302 and START_DT > (sysdate-4/24);
select count(1) from revenue_order_detail@CDG001T_QICT.CORP.LITEL.COM where revord_id in 
(select revord_id from revenue_order@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202008);
select count(1) from revenue_order@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202008;
select count(1) from invoice@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202008;
select count(1) from invoice_detail@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202008;
select count(1) from invoice_process_log@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202008;
select count(1) from prod_aux_log@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=202008;
select count(1) from invoice_detail@CDG001T_QICT.CORP.LITEL.COM where property_id='NC114' and BILL_YRMO=202008 and INVOICE_NO in
(select INVOICE_NO from invoice@CDG001T_QICT.CORP.LITEL.COM  where major_id=(select max(major_id) from invoice@CDG001T_QICT.CORP.LITEL.COM));






