select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=401 and START_DT > (sysdate-4/24);
select START_DT from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=401 and START_DT > (sysdate-4/24);
select END_DT from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=401 and START_DT > (sysdate-4/24);