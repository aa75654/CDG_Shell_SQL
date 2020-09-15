delete from ENTUSER.ENT_CYCLE@QICT_TO_ENT001S.CORP.LITEL.COM where FILE_NAME in (select FILE_NAME from ENTUSER.ENT_CYCLE@QICT_TO_ENT001S.CORP.LITEL.COM) and CURRRENT_CYCLE > 1390;
delete from ENTUSER.ENT_CYCLE@QICT_TO_ENT001S.CORP.LITEL.COM where CURRRENT_CYCLE > 1390;
update ENTUSER.ENT_FILE_OUTPUT_STATUS@QICT_TO_ENT001S.CORP.LITEL.COM set status='READY_TO_AGGREGATE_HIST' where status = 'READY_TO_AGGREGATE';
update ENTUSER.ENT_FILE_OUTPUT_STATUS@QICT_TO_ENT001S.CORP.LITEL.COM set status ='READY_TO_ARCHIVE_HIST' where status like 'READY_TO_ARCHIVE';
commit;
select 'File is ready to be processed' as FILE_STATUS from dual;
select concat(concat('[{
                "Duration": "N/A",
                "Env": "Test1",
                "MAL": "CDMTBatch",
                "TestTool": "Other - Selenium",
                "TestType": "Sanity",
                "Scenario": "File processing is ready",
                "Status": "pass",
                "TimeStamp": "' ,
to_timestamp(sysdate) ),'",
                "Build_Number": "N/A",
                "ErrorDetails": "N/A",
                "Job_Name": "ENTRPRS_TST_CDMTBatch_SANITY_Test1"
}]') as jason from dual;