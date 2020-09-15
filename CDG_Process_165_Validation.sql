select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=165 and START_DT > (sysdate-4/24);
select count(1) from centurylink_on_xref_sub@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from ADDRESS_MISMATCH_LOG@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;
select count(1) from CDG_PROPERTY_LOG@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo=201906;