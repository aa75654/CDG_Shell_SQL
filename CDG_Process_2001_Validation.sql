select count(1) from CDG_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where process_id=2001 and START_DT > (sysdate-4/24);
select count(1) from
( SELECT MIN(pu.property_unit_id) property_unit_id
     FROM CCDW_JRNL_DETL_FEEDER_SUB@CDG001T_QICT.CORP.LITEL.COM ccdw,PROPERTY_UNIT_TN@CDG001T_QICT.CORP.LITEL.COM pu,
          PROPERTY_UNIT@CDG001T_QICT.CORP.LITEL.COM p, btn_ccdw_cust_xref@CDG001T_QICT.CORP.LITEL.COM btn, static_reference_def@CDG001T_QICT.CORP.LITEL.COM stat
    WHERE ccdw.cust_acct_dim_id = btn.cust_acct_dim_id
      AND pu.acct_id = btn.acct_id
      AND pu.acct_seq_no= btn.acct_seq_no
      AND ccdw.GL_CUST_TYPE_CD = 'R' -- (validated that R is the code to use)
      AND pu.property_unit_id = p.property_unit_id
      AND ccdw.cpim_src_sys_cd = stat.domain_meaning(+)
      AND stat.domain = 'CCDW_CPIM_SRC_SYS_CD'
      AND ((pu.end_dt IS NULL) OR (pu.end_dt >= TO_DATE(202004,'YYYYMM'))) --Added by Manika on 14-May-2020 for PAYPS-6025
    GROUP BY pu.btn, pu.btn_cust_cd, pu.btn_sfx, pu.acct_mkt_un_id, ccdw.cust_acct_dim_id, pu.acct_id,
          pu.acct_seq_no, stat.domain_value,btn.ban,btn.CUST_ACCT_LINK_ID) dual;
select count(1) from REVENUE_ORDER_DETAIL@CDG001T_QICT.CORP.LITEL.COM  where revord_id in 
(select revord_id from REVENUE_ORDER@CDG001T_QICT.CORP.LITEL.COM  where bill_yr_mo=202004);
select count(1) from REVENUE_ORDER@CDG001T_QICT.CORP.LITEL.COM  where bill_yr_mo=202004;
select count(1) from REVENUE_AMT_VW@CDG001T_QICT.CORP.LITEL.COM;
select count(1) from INVOICE_PROCESS_LOG@CDG001T_QICT.CORP.LITEL.COM where invoice_no in (select invoice_no from revenue_order_detail@CDG001T_QICT.CORP.LITEL.COM where revord_id in
(select revord_id from revenue_order@CDG001T_QICT.CORP.LITEL.COM where bill_yr_mo='202004'));
