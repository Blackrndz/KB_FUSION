/* ****************************************************************************
 * $Revision: 79377 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-09-21 18:00:34 +0700 (Wed, 21 Sep 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Taxes%20-%20Withholding%20Threshold%20Controls.sql $:
 * $Id: Manage Taxes - Withholding Threshold Controls.sql 79377 2022-09-21 11:00:34Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
--RSC_PREREQUISITE_OBJECTS=ZX_THREHLDS_SCHDL_CNTRLS_F
 

SELECT HEAD.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,HEAD.PARTY_NAME RES_CONFIGURATION_OWNER
,HEAD.TAX RES_TAX
,HEAD.TAX_FULL_NAME RES_TAX_NAME
,(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'ZX_BUCKET_LEVEL'
	AND lookup_code   = HEAD.WHT_BUCKET_LEVEL_FLAG
	) RES_THRESHOLD_BUCKETS_LEVEL
,(SELECT CLASSIFICATION_TYPE_NAME FROM ZX_FC_TYPES_VL 
	WHERE CLASSIFICATION_TYPE_CODE = Detail.CLASSIFICATION_TYPE_CODE) RES_CLASSIFICATION_TYPE
,(SELECT CLASSIFICATION_NAME  FROM ZX_FC_CODES_VL 
	WHERE CLASSIFICATION_CODE = Detail.CLASSIFICATION_CODE) RES_CLASSIFICATION_CODE
,(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'ZX_THRSHLD_SCHEDULE_GRP_LVL'
	AND lookup_code   = Detail.THRSHLD_SCHEDULE_GRP_LVL_FLAG
	) RES_THRESHOLD_BASIS
,(SELECT CALENDAR_NAME||' '||DESCRIPTION
	FROM AP_OTHER_PERIOD_TYPES
	WHERE CALENDAR_NAME = Detail.CALENDAR_NAME
	) RES_WITHHOLDING_TAX_CALENDAR
,(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'ZX_THRESHOLD_TYPE'
	AND lookup_code   = Detail.THRESHOLD_TYPE_CODE
	) RES_THRESHOLD_TYPE
,DECODE(Detail.THRESHOLD_TYPE_CODE,'TAXABLE_AMOUNT',Detail.MIN_TAXABLE_THRSHLD,'TAX_AMOUNT',Detail.MIN_TAX_THRSHLD,
	'TAX_RATE',Detail.MIN_RATE_THRSHLD) RES_MINIMUM_VALUE
,DECODE(Detail.THRESHOLD_TYPE_CODE,'TAXABLE_AMOUNT',Detail.MAX_TAXABLE_THRSHLD,'TAX_AMOUNT',Detail.MAX_TAX_THRSHLD,
	'TAX_RATE',Detail.MAX_RATE_THRSHLD) RES_MAXIMUM_VALUE
,DECODE(Detail.THRESHOLD_TYPE_CODE,'TAXABLE_AMOUNT',
	(SELECT MEANING
		FROM FND_LOOKUPS
		WHERE LOOKUP_TYPE = 'ZX_THRESHOLD_TAXABLE_BASIS'
		AND LOOKUP_CODE = Detail.TXBL_BSIS_THRSHLD_HNDLNG_FLAG)
	,NULL
	) RES_THRESHOLD_TAXABLE_BASIS
,TO_CHAR(Detail.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,DECODE(Extract(YEAR FROM Detail.EFFECTIVE_END_DATE),'4712',NULL,TO_CHAR(Detail.EFFECTIVE_END_DATE,'DD-Mon-YYYY'))
	RES_EFFECTIVE_END_DATE
,Detail.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,Detail.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,Detail.CREATED_BY RSC_CREATED_BY
,Detail.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,(CASE 
	WHEN HEAD.PARTY_TYPE_CODE = 'OU' THEN	
		HEAD.BU_ID
	ELSE
		NULL
	END) RSC_BUSINESS_UNIT_ID
,(CASE 
	WHEN HEAD.PARTY_TYPE_CODE = 'FIRST_PARTY' THEN	
		HEAD.LEGAL_ENTITY_ID
	ELSE
		NULL
	END) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT TaxTLEO.TAX_REGIME_CODE
	,TaxTLEO.WHT_BUCKET_LEVEL_FLAG
	,ZFPOMV.PARTY_NAME
	,ZFPOMV.PARTY_TYPE_CODE
	,ZFPOMV.BU_ID
	,ZFPOMV.LEGAL_ENTITY_ID
	,TaxTLEO.TAX
	,TaxTLEO.TAX_FULL_NAME
	FROM ZX_TAXES_VL TaxTLEO
	,ZX_FIRST_PARTY_ORGS_MOAC_V ZFPOMV
	,ZX_REGIMES_VL RegimeTLEO
	WHERE ZFPOMV.PARTY_TAX_PROFILE_ID                = TaxTLEO.CONTENT_OWNER_ID
	AND RegimeTLEO.TAX_REGIME_CODE                   = TaxTLEO.TAX_REGIME_CODE
	AND NVL(RegimeTLEO.REGIME_TYPE_FLAG,'I')         <> 'I'
	) HEAD
,(SELECT TaxThresholdScheduleControlEO.CREATED_BY
	,TaxThresholdScheduleControlEO.CREATION_DATE
	,TaxThresholdScheduleControlEO.EFFECTIVE_END_DATE
	,TaxThresholdScheduleControlEO.EFFECTIVE_START_DATE
	,TaxThresholdScheduleControlEO.LAST_UPDATE_DATE
	,TaxThresholdScheduleControlEO.LAST_UPDATED_BY
	,TaxThresholdScheduleControlEO.MAX_RATE_THRSHLD
	,TaxThresholdScheduleControlEO.MAX_TAX_THRSHLD
	,TaxThresholdScheduleControlEO.MAX_TAXABLE_THRSHLD
	,TaxThresholdScheduleControlEO.MIN_RATE_THRSHLD
	,TaxThresholdScheduleControlEO.MIN_TAX_THRSHLD
	,TaxThresholdScheduleControlEO.MIN_TAXABLE_THRSHLD
	,TaxThresholdScheduleControlEO.TAX
	,TaxThresholdScheduleControlEO.TAX_JURISDICTION_CODE
	,TaxThresholdScheduleControlEO.TAX_REGIME_CODE
	,TaxThresholdScheduleControlEO.TAX_THREHLDS_SCHDL_CNTRL_CODE
	,TaxThresholdScheduleControlEO.THRSHLD_SCHEDULE_GRP_LVL_FLAG
	,TaxThresholdScheduleControlEO.THRESHOLD_TYPE_CODE
    ,TaxThresholdScheduleControlEO.CALENDAR_NAME
	,TaxThresholdScheduleControlEO.TXBL_BSIS_THRSHLD_HNDLNG_FLAG
	,TaxThresholdScheduleControlEO.CLASSIFICATION_CODE
	,TaxThresholdScheduleControlEO.CLASSIFICATION_TYPE_CODE
	FROM ZX_THREHLDS_SCHDL_CNTRLS_F TaxThresholdScheduleControlEO
	WHERE TaxThresholdScheduleControlEO.Tax_Threhlds_Schdl_Cntrl_Code = 'T'
	) Detail
WHERE Head.TAX_REGIME_CODE = Detail.TAX_REGIME_CODE
AND Head.TAX               = Detail.TAX
AND Detail.TAX_JURISDICTION_CODE IS NULL
ORDER BY Head.TAX_REGIME_CODE
,Head.TAX