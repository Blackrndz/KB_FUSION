/* ****************************************************************************
 * $Revision: 78757 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-06-15 11:30:49 +0700 (Wed, 15 Jun 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Receivables%20System%20Options%20-%20Cash%20Processing.sql $:
 * $Id: Manage Receivables System Options - Cash Processing.sql 78757 2022-06-15 04:30:49Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- FIELD_TO_APPLY_FUNCTION=RES_REALIZED_GAINS_ACCOUNT/GET_CODE_COMBINATION
-- FIELD_TO_APPLY_FUNCTION=RES_REALIZED_LOSSES_ACCOUNT/GET_CODE_COMBINATION
-- FIELD_TO_APPLY_FUNCTION=RES_CROSS_CURRENCY_ROUNDING_AC/GET_CODE_COMBINATION

select QRSLT.NAME1 RES_BUSINESS_UNIT ,
QRSLT.VIEW_ATTR_3 RES_AUTOCASH_RULE_SET,
QRSLT.LOCKBOX_MATCHING_OPTION1 RES_MATCH_RECEIPTS_BY_1,
QRSLT.LOCKBOX_MATCHING_OPTION2 RES_MATCH_RECEIPTS_BY_2,
QRSLT.LOCKBOX_MATCHING_OPTION3 RES_MATCH_RECEIPTS_BY_3, 
QRSLT.LOCKBOX_MATCHING_OPTION4 RES_MATCH_RECEIPTS_BY_4,
QRSLT.AUTO_MATCH_RULE_SET RES_AUTOMATCH_RULE_SET,
DECODE(QRSLT.AUTOAPPLY_FLAG,'Y','Yes','No') RES_USE_AUTOAPPLY  ,
QRSLT.AUTOMATCH_RERUN_DAYS RES_DAYS_TO_AUTOAPPLY_A_RECEIP,
DECODE(QRSLT.SITE_REQUIRED_FLAG,'Y','Yes','No') RES_REQUIRE_BILLING_LOCATION_F,
DECODE(QRSLT.PAY_UNRELATED_INVOICES_FLAG,'Y','Yes','No') RES_ALLOW_PAYMENT_OF_UNRELATED,
DECODE(QRSLT.UNMTCH_CLAIM_CREATION_FLAG,'Y','Yes','No') RES_ENABLE_CHANNEL_REVENUE_MAN,
QRSLT.MIN_WRTOFF_AMOUNT RES_FROM_WRITE_OFF_LIMIT_PER_R,
QRSLT.MAX_WRTOFF_AMOUNT RES_TO_WRITE_OFF_LIMIT_PER_REC,
QRSLT.MIN_REFUND_AMOUNT RES_MINIMUM_REFUND_AMOUNT,
QRSLT.DEFAULT_CB_DUE_DATE_L RES_CHARGEBACK_DUE_DATE,
DECODE(QRSLT.ALLOW_PAYMENT_DELETION_FLAG,'Y','Yes','No') RES_ALLOW_PAYMENT_DELETION,
QRSLT.APP_EXCEP_RULE_SET RES_APPLICATION_EXCEPTION_RULE,
QRSLT.EXCEPTION_RULE_WOFF_ACTIVITY RES_EXCEPTION_RULE_WRITE_OFF_A,
QRSLT.VIEW_ATTR_2 RES_EXCEPTION_RULE_REFUND_PAYM,
QRSLT.CODE_COMBINATION_ID_GAIN RES_REALIZED_GAINS_ACCOUNT ,
QRSLT.CODE_COMBINATION_ID_LOSS RES_REALIZED_LOSSES_ACCOUNT ,
(SELECT USER_CONVERSION_TYPE 
	FROM GL_DAILY_CONVERSION_TYPES
	WHERE CONVERSION_TYPE = QRSLT.CROSS_CURRENCY_RATE_TYPE
	) RES_CROSS_CURRENCY_RATE_TYPE,
QRSLT.CODE_COMBINATION_ID_ROUND RES_CROSS_CURRENCY_ROUNDING_AC,
QRSLT.CONFIRM_THRESHOLD_AMT RES_RECEIPT_CONFIRMATION_THRES,
QRSLT.AUTO_REC_INVOICES_PER_COMMIT RES_INVOICES_PER_COMMIT,
QRSLT.AUTO_REC_RECEIPTS_PER_COMMIT RES_RECEIPTS_PER_COMMIT,
DECODE(QRSLT.BILLS_RECEIVABLE_ENABLED_FLAG,'Y','Yes','No') RES_ENABLE_BILLS_RECEIVABLE,
DECODE(QRSLT.BILLS_RECEIVABLE_ENABLED_FLAG,'Y',QRSLT.VIEW_ATTR_14,null) RES_BILLS_RECEIVABLE_TRANSACTI,
DECODE(QRSLT.BILLS_RECEIVABLE_ENABLED_FLAG,'Y',QRSLT.VIEW_ATTR_14_1,null) RES_BILLS_RECEIVABLE_TRANSAC_0,
DECODE(QRSLT.BR_REMIT_WITHOUT_RECOURSE_FLAG,'Y','Yes','No') RES_ALLOW_FACTORING_OF_BILLS_R
,QRSLT.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,QRSLT.CREATED_BY  RSC_CREATED_BY
,QRSLT.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,QRSLT.ORG_ID RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

from 
(SELECT  
  decode(ARSYSTEMPARAMETERSALL.DEFAULT_CB_DUE_DATE,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('DEFAULT_CB_DUE_DATE',ARSYSTEMPARAMETERSALL.DEFAULT_CB_DUE_DATE))) DEFAULT_CB_DUE_DATE_L,    
  ArSystemParametersAll.CODE_COMBINATION_ID_GAIN,
  ArSystemParametersAll.CODE_COMBINATION_ID_LOSS,
  ArSystemParametersAll.SITE_REQUIRED_FLAG,
  ArSystemParametersAll.AUTO_REC_INVOICES_PER_COMMIT,
  ArSystemParametersAll.AUTO_REC_RECEIPTS_PER_COMMIT,
  ArSystemParametersAll.UNMTCH_CLAIM_CREATION_FLAG,
  ArSystemParametersAll.PAY_UNRELATED_INVOICES_FLAG,
  ArSystemParametersAll.ORG_ID,
  ArSystemParametersAll.RULE_SET_ID,
  ArSystemParametersAll.TAX_USE_ACCOUNT_EXC_RATE_FLAG,
  ArSystemParametersAll.TAX_USE_SYSTEM_EXC_RATE_FLAG,
  ArSystemParametersAll.TAX_HIER_SITE_EXC_RATE,
  ArSystemParametersAll.TAX_HIER_CUST_EXC_RATE,
  ArSystemParametersAll.TAX_HIER_PROD_EXC_RATE,
  ArSystemParametersAll.TAX_HIER_ACCOUNT_EXC_RATE,
  ArSystemParametersAll.TAX_HIER_SYSTEM_EXC_RATE,
  ArSystemParametersAll.TAX_ENFORCE_ACCOUNT_FLAG,
  ArSystemParametersAll.TAX_DATABASE_VIEW_SET,
  ArSystemParametersAll.INCLUSIVE_TAX_USED,
  ArSystemParametersAll.CODE_COMBINATION_ID_ROUND,
  ArSystemParametersAll.TRX_HEADER_LEVEL_ROUNDING,
  ArSystemParametersAll.TRX_HEADER_ROUND_CCID,
  ArSystemParametersAll.SALES_TAX_GEOCODE,
  ArSystemParametersAll.BILLS_RECEIVABLE_ENABLED_FLAG,
  ArSystemParametersAll.TA_INSTALLED_FLAG,
  ArSystemParametersAll.REV_TRANSFER_CLEAR_CCID,
  ArSystemParametersAll.SALES_CREDIT_PCT_LIMIT,
  ArSystemParametersAll.MAX_WRTOFF_AMOUNT,
  ArSystemParametersAll.IREC_CC_RECEIPT_METHOD_ID,
  ArSystemParametersAll.SHOW_BILLING_NUMBER_FLAG,
  ArSystemParametersAll.CROSS_CURRENCY_RATE_TYPE,
  ARSYSTEMPARAMETERSALL.DOCUMENT_SEQ_GEN_LEVEL,
  decode(ARSYSTEMPARAMETERSALL.DOCUMENT_SEQ_GEN_LEVEL,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('DOC_SEQ_GEN_LEVEL',ARSYSTEMPARAMETERSALL.DOCUMENT_SEQ_GEN_LEVEL))) DOC_SEQ_GEN_LEVEL,    
  ArSystemParametersAll.CALC_TAX_ON_CREDIT_MEMO_FLAG,
  ArSystemParametersAll.IREC_BA_RECEIPT_METHOD_ID,
  ArSystemParametersAll.PAYMENT_THRESHOLD,
  ArSystemParametersAll.STANDARD_REFUND,
  ArSystemParametersAll.CREDIT_CLASSIFICATION1,
  ArSystemParametersAll.CREDIT_CLASSIFICATION3,
  ArSystemParametersAll.CREDIT_CLASSIFICATION2,
  ArSystemParametersAll.MATCHED_CLAIM_CREATION_FLAG,
  ArSystemParametersAll.MATCHED_CLAIM_EXCL_CM_FLAG,
  ArSystemParametersAll.MIN_WRTOFF_AMOUNT,
  ArSystemParametersAll.MIN_REFUND_AMOUNT,
  ArSystemParametersAll.ALLOW_LATE_CHARGES,
  ARSYSTEMPARAMETERSALL.POST_BILLING_ITEM_INCLUSION,
  decode(ARSYSTEMPARAMETERSALL.POST_BILLING_ITEM_INCLUSION,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('AR_POST_BILLING_ITEM_INCLUSION',ARSYSTEMPARAMETERSALL.POST_BILLING_ITEM_INCLUSION))) AR_POST_BILLING_ITEM_INCLUSION,    
  ARSYSTEMPARAMETERSALL.LATE_CHARGE_BILLING_CALC_MODE,
  decode(ARSYSTEMPARAMETERSALL.LATE_CHARGE_BILLING_CALC_MODE,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('AR_CALCULATION_RUNNING_MODE',ARSYSTEMPARAMETERSALL.LATE_CHARGE_BILLING_CALC_MODE))) AR_CALCULATION_RUNNING_MODE,    
  ArSystemParametersAll.OBJECT_VERSION_NUMBER,
  ArSystemParametersAll.LATE_CHARGE_DM_TYPE_SEQ_ID,
  ArSystemParametersAll.LATE_CHARGE_INV_TYPE_SEQ_ID,
  ArSystemParametersAll.LATE_CHARGE_BAT_SOURCE_SEQ_ID,
  ArSystemParametersAll.CONFIRM_THRESHOLD_AMT,
  ArSystemParametersAll.PAYMENT_APPLICATION_RULE,
  ArSystemParametersAll.AUTOAPPLY_FLAG,
  ArSystemParametersAll.AUTOMATCH_RULE_ID,
  ARSYSTEMPARAMETERSALL.EXCEPTION_RULE_ID,
  decode(ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION1,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('ARLPLB_MATCHING_OPTION',ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION1))) LOCKBOX_MATCHING_OPTION1,    
  decode(ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION2,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('ARLPLB_MATCHING_OPTION',ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION2))) LOCKBOX_MATCHING_OPTION2,    
  decode(ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION3,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('ARLPLB_MATCHING_OPTION',ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION3))) LOCKBOX_MATCHING_OPTION3,    
  decode(ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION4,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('ARLPLB_MATCHING_OPTION',ARSYSTEMPARAMETERSALL.LOCKBOX_MATCHING_OPTION4))) LOCKBOX_MATCHING_OPTION4,     
  ArSystemParametersAll.FINCHRG_RECEIVABLES_TRX_ID,
  ARSYSTEMPARAMETERSALL.PENALTY_REC_TRX_ID,
  ARSYSTEMPARAMETERSALL.LAST_UPDATE_DATE,
  ARSYSTEMPARAMETERSALL.LAST_UPDATED_BY, 
  ARSYSTEMPARAMETERSALL.CREATED_BY  ,
  ARSYSTEMPARAMETERSALL.CREATION_DATE  ,
  ARSYSTEMPARAMETERSALL.AUTOMATCH_RERUN_DAYS,
  GlLedgers.CHART_OF_ACCOUNTS_ID,
  GlLedgers.LEDGER_ID,
  (SELECT NAME
  FROM FUSION.AR_AUTOMATCH_RULES
  WHERE AUTOMATCH_RULE_ID=ArSystemParametersAll.AUTOMATCH_RULE_ID
  ) AS AUTO_MATCH_RULE_SET,
  GlLedgers.CURRENCY_CODE,
  GlLedgers.NAME,
  BusinessUnitPEO.BU_NAME AS NAME1,
  BusinessUnitPEO.BU_ID,
  ArSystemParametersAll.EXCEPTION_ADJ_REC_TRX_ID,
  ArSystemParametersAll.EXCEPTION_WRTOFF_REC_TRX_ID,
  (SELECT NAME
  FROM FUSION.AR_RECEIVABLES_TRX_ALL
  WHERE RECEIVABLES_TRX_ID=ArSystemParametersAll.EXCEPTION_ADJ_REC_TRX_ID
  and ORG_ID              =ARSYSTEMPARAMETERSALL.ORG_ID
  ) AS EXCEPTION_RULE_ADJ_ACTIVITY,
  (SELECT NAME
  FROM FUSION.AR_RECEIVABLES_TRX_ALL
  WHERE RECEIVABLES_TRX_ID=ArSystemParametersAll.EXCEPTION_WRTOFF_REC_TRX_ID
  AND ORG_ID              =ArSystemParametersAll.ORG_ID
  ) AS EXCEPTION_RULE_WOFF_ACTIVITY,
  (SELECT NAME
  FROM FUSION.AR_APP_EXCEPTION_RULES
  WHERE EXCEPTION_RULE_ID=ArSystemParametersAll.EXCEPTION_RULE_ID
  ) AS APP_EXCEP_RULE_SET,
  ArSystemParametersAll.ITEM_VALIDATION_ORG_ID,
  GlLedgers.OBJECT_VERSION_NUMBER AS OBJECT_VERSION_NUMBER1,
  (SELECT organization_name
  FROM FUSION.inv_organization_definitions_v
  where ORGANIZATION_ID = ARSYSTEMPARAMETERSALL.ITEM_VALIDATION_ORG_ID
  ) AS VIEW_ATTR_1,
  ArSystemParametersAll.EXCEPTION_ADJ_REASON_CODE,
decode(ARSYSTEMPARAMETERSALL.EXCEPTION_ADJ_REASON_CODE,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('ADJUST_REASON',ARSYSTEMPARAMETERSALL.EXCEPTION_ADJ_REASON_CODE))) ADJUST_REASON,     
  ArSystemParametersAll.EXCEPTION_PMT_METHOD_CODE,
  (SELECT payment_method_name
  FROM FUSION.IBY_PAYMENT_METHODS_VL
  where PAYMENT_METHOD_CODE = ARSYSTEMPARAMETERSALL.EXCEPTION_PMT_METHOD_CODE
  ) AS VIEW_ATTR_2,
  (SELECT hierarchy_name
  FROM FUSION.ar_autocash_hierarchies
  where AUTOCASH_HIERARCHY_ID = ARSYSTEMPARAMETERSALL.AUTOCASH_HIERARCHY_ID
  ) AS VIEW_ATTR_3,
  (SELECT rule_set_name
  FROM FUSION.ar_app_rule_sets
  where RULE_SET_ID = ARSYSTEMPARAMETERSALL.RULE_SET_ID
  ) AS VIEW_ATTR_4,
  (SELECT name
  FROM FUSION.ra_cust_trx_types_all
  where CUST_TRX_TYPE_SEQ_ID = ARSYSTEMPARAMETERSALL.LATE_CHARGE_INV_TYPE_SEQ_ID
  ) AS VIEW_ATTR_5,
  (SELECT name
  FROM FUSION.ra_cust_trx_types_all
  where CUST_TRX_TYPE_SEQ_ID = ARSYSTEMPARAMETERSALL.LATE_CHARGE_DM_TYPE_SEQ_ID
  ) AS VIEW_ATTR_6,
  (SELECT name
  FROM FUSION.ra_batch_sources_all
  where BATCH_SOURCE_SEQ_ID = ARSYSTEMPARAMETERSALL.LATE_CHARGE_BAT_SOURCE_SEQ_ID
  ) AS VIEW_ATTR_7,
  (SELECT name
  FROM FUSION.ar_receipt_methods
  where RECEIPT_METHOD_ID = ARSYSTEMPARAMETERSALL.IREC_BA_RECEIPT_METHOD_ID
  ) as VIEW_ATTR_8,
  (select CB.bank_account_name
  from FUSION.AR_RECEIPT_METHODS ARM,
  FUSION.AR_RECEIPT_METHOD_ACCOUNTS_ALL ARMA,
  FUSION.CE_BANK_ACCOUNTS CB
  where ARM.RECEIPT_METHOD_ID = ARSYSTEMPARAMETERSALL.IREC_BA_RECEIPT_METHOD_ID
  and ARM.RECEIPT_METHOD_ID = ARMA.RECEIPT_METHOD_ID
  and ARMA.BANK_ACCOUNT_ID = CB.BANK_ACCOUNT_ID
  ) AS VIEW_ATTR_8_1,
  (SELECT name
  FROM FUSION.ar_receipt_methods
  where RECEIPT_METHOD_ID = ARSYSTEMPARAMETERSALL.IREC_CC_RECEIPT_METHOD_ID
  ) AS VIEW_ATTR_9,
    (select CB.bank_account_name
  from FUSION.AR_RECEIPT_METHODS ARM,
  FUSION.AR_RECEIPT_METHOD_ACCOUNTS_ALL ARMA,
  FUSION.CE_BANK_ACCOUNTS CB
  where ARM.RECEIPT_METHOD_ID = ARSYSTEMPARAMETERSALL.IREC_CC_RECEIPT_METHOD_ID
  and ARM.RECEIPT_METHOD_ID = ARMA.RECEIPT_METHOD_ID
  and ARMA.BANK_ACCOUNT_ID = CB.BANK_ACCOUNT_ID
  ) AS VIEW_ATTR_9_1,
  ArSystemParametersAll.SERVICED_BY_ANY_BU_FLAG,
  ArSystemParametersAll.BA_REMIT_BANK_ACCT_USE_ID,
  ArSystemParametersAll.CC_REMIT_BANK_ACCT_USE_ID,
  (SELECT DISTINCT bank_account_name
  from FUSION.CE_BANK_ACCT_USES_ALL BAU,
    FUSION.ce_internal_bank_accts_v iba
  WHERE bau.bank_acct_use_id = ArSystemParametersAll.ba_remit_bank_acct_use_id
  and BAU.BANK_ACCOUNT_ID    = IBA.BANK_ACCOUNT_ID
  ) AS VIEW_ATTR_10,
  (SELECT DISTINCT bank_account_name
  from FUSION.CE_BANK_ACCT_USES_ALL BAU,
    FUSION.ce_internal_bank_accts_v iba
  WHERE bau.bank_acct_use_id = ArSystemParametersAll.cc_remit_bank_acct_use_id
  and BAU.BANK_ACCOUNT_ID    = IBA.BANK_ACCOUNT_ID
  ) AS VIEW_ATTR_11,
  (SELECT bu_name
  from FUSION.CE_BANK_ACCT_USES_ALL BAU,
    FUSION.fun_all_business_units_v fbu
  WHERE bau.bank_acct_use_id = ArSystemParametersAll.ba_remit_bank_acct_use_id
  and BAU.ORG_ID             = FBU.BU_ID
  ) AS VIEW_ATTR_12,
  (SELECT bu_name
  from FUSION.CE_BANK_ACCT_USES_ALL BAU,
    FUSION.fun_all_business_units_v fbu
  WHERE bau.bank_acct_use_id = ArSystemParametersAll.cc_remit_bank_acct_use_id
  and BAU.ORG_ID             = FBU.BU_ID
  ) AS VIEW_ATTR_13,
  ArSystemParametersAll.BR_DEFAULT_BATCHSOURCE_SEQ_ID,
  ArSystemParametersAll.BR_REMIT_WITHOUT_RECOURSE_FLAG,
  (SELECT name
  FROM FUSION.ra_batch_sources_all
  where BATCH_SOURCE_SEQ_ID = ARSYSTEMPARAMETERSALL.BR_DEFAULT_BATCHSOURCE_SEQ_ID
  ) AS VIEW_ATTR_14,
   (SELECT SetIdSetPEO.set_name
  from FUSION.RA_BATCH_SOURCES_ALL
  ,Fusion.FND_SETID_SETS_VL SetIdSetPEO
  where BATCH_SOURCE_SEQ_ID = ARSYSTEMPARAMETERSALL.BR_DEFAULT_BATCHSOURCE_SEQ_ID
  and RA_BATCH_SOURCES_ALL.SET_ID = SETIDSETPEO.SET_ID
  ) as VIEW_ATTR_14_1, 
  (SELECT gdc.USER_CONVERSION_TYPE
  FROM FUSION.GL_DAILY_CONVERSION_TYPES gdc
  WHERE gdc.CONVERSION_TYPE=ArSystemParametersAll.CROSS_CURRENCY_RATE_TYPE
  ) AS RATE_TYPE,
  ArSystemParametersAll.EMAIL_BODY,
  ArSystemParametersAll.EMAIL_SUBJECT,
  ArSystemParametersAll.FROM_EMAIL_ADDRESS,
  ArSystemParametersAll.FROM_EMAIL_NAME,
  ARSYSTEMPARAMETERSALL.INCLUDE_TRXNUM_SUBJECT_CODE,
  decode(ARSYSTEMPARAMETERSALL.INCLUDE_TRXNUM_SUBJECT_CODE,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('AR_EMAIL_ADDTNL_ATTRS',ARSYSTEMPARAMETERSALL.INCLUDE_TRXNUM_SUBJECT_CODE))) AR_EMAIL_ADDTNL_ATTRS_2,     
  ARSYSTEMPARAMETERSALL.INCLUDE_BU_SUBJECT_CODE,
  decode(ARSYSTEMPARAMETERSALL.INCLUDE_BU_SUBJECT_CODE,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('AR_EMAIL_ADDTNL_ATTRS',ARSYSTEMPARAMETERSALL.INCLUDE_BU_SUBJECT_CODE))) AR_EMAIL_ADDTNL_ATTRS,     
  ArSystemParametersAll.REPLY_TO_EMAIL_ADDRESS,
  ARSYSTEMPARAMETERSALL.ALLOW_PAYMENT_DELETION_FLAG,
  ARSYSTEMPARAMETERSALL.ACCT_DATES_OUT_OF_ORDER /* ,
  fnd_territories.territory_short_name */
FROM FUSION.AR_SYSTEM_PARAMETERS_ALL ArSystemParametersAll,
  FUSION.GL_LEDGERS GlLedgers,
  FUSION.FUN_ALL_BUSINESS_UNITS_V BUSINESSUNITPEO/* ,
  FUSION.fnd_territories_vl fnd_territories*/
where ((ARSYSTEMPARAMETERSALL.SET_OF_BOOKS_ID = GLLEDGERS.LEDGER_ID))
and BUSINESSUNITPEO.BU_ID                  = ARSYSTEMPARAMETERSALL.ORG_ID 
--and ArSystemParametersAll.DEFAULT_COUNTRY = fnd_territories.territory_code
) QRSLT
order by RES_BUSINESS_UNIT