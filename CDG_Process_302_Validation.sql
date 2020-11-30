select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=302 and START_DT > (sysdate-4/24);
