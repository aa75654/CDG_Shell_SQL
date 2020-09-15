select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=8000 and STATUS_ID='1003' and START_DT > (sysdate-4/24);
select count(1) from LDAP_INACTIVE_USERS@CDG001T_QICT.CORP.LITEL.COM where action<>'DELETED';
select count(1) from LDAP_INACTIVE_USERS@CDG001T_QICT.CORP.LITEL.COM where action='DELETED';
