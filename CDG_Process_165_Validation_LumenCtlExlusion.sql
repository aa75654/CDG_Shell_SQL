select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=165 and status_id not in (1004,1002) and START_DT > (sysdate-4/24);
select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=2004 and status_id not in (1004,1002) and START_DT > (sysdate-4/24);
select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=2005 and and status_id not in (1004,1002) START_DT > (sysdate-4/24);
select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=2008 and status_id not in (1004,1002) and START_DT > (sysdate-4/24);
select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=2009 and START_DT > (sysdate-4/24);
select count(1) from centurylink_on_xref_sub@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from ADDRESS_MISMATCH_LOG@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from CDG_PROPERTY_LOG@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from revenue_order@CDG001T_QICT.CORP.LITEL.COM where CREATED_DT > (sysdate-1)  and bill_yr_mo=201906;
select count(1) from revenue_order_Detail@CDG001T_QICT.CORP.LITEL.COM where revord_id in
(select revord_id from revenue_order@CDG001T_QICT.CORP.LITEL.COM where CREATED_DT > (sysdate-1)  and bill_yr_mo=201906);
select count(1) from revenue_order@CDG001T_QICT.CORP.LITEL.COM where CREATED_DT > (sysdate-1)  and bill_yr_mo=201906 and legacy_comp  in  ('PPP');--to PPP records not loaded
select count(1) from revenue_order_Detail@CDG001T_QICT.CORP.LITEL.COM where revord_id in
(select revord_id from revenue_order@CDG001T_QICT.CORP.LITEL.COM where CREATED_DT > (sysdate-1)  and bill_yr_mo=201906 and legacy_comp  in  ('PPP'));--to PPP records not loaded
select count(1) from acct_prod_ppp@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from acct_prod_ppp@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from centurylink_on_xref_sub@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from centurylink_on_xref_sub_stage@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
				




