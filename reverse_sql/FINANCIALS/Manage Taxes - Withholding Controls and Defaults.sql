/* ****************************************************************************
 * $Revision: 79293 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-09-07 14:26:05 +0700 (Wed, 07 Sep 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Taxes%20-%20Withholding%20Controls%20and%20Defaults.sql $:
 * $Id: Manage Taxes - Withholding Controls and Defaults.sql 79293 2022-09-07 07:26:05Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT TaxTLEO.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,ZFPOMV.PARTY_NAME RES_CONFIGURATION_OWNER
,TaxTLEO.TAX RES_TAX
,TaxTLEO.TAX_FULL_NAME RES_TAX_NAME
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ZX_INCLUSIVE_TAX'
	AND LOOKUP_CODE   = TaxTLEO.DEF_INCLUSIVE_TAX_FLAG
	) RES_TAX_INCLUSION_METHOD
,DECODE(TaxTLEO.ALLOW_TAX_OVERRIDE_FLAG,'Y','Yes','No') RES_ALLOW_OVERRIDE_OF_CALCULAT
,DECODE(TaxTLEO.ALLOW_MANUAL_ENTRY_FLAG,'Y','Yes','No') RES_ALLOW_ENTRY_OF_MANUAL_TAX_
,DECODE(TaxTLEO.REGN_NUM_SAME_AS_LE_FLAG,'Y','Yes','No') RES_USE_LEGAL_REGISTRATION_NUM
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE='ZX_WHT_CALC_POINT'
	AND LOOKUP_CODE  = TaxTLEO.Wht_Calc_Point_Flag
	) RES_CALCULATION_POINT
,DECODE(TaxTLEO.TAX_AUTH_INV_CREATION_POINT,'INVOICE','Invoice','PAYMENT','Payment')  RES_TAX_INVOICE_CREATION_POINT
,DECODE(TaxTLEO.ALLOW_ZERO_AMT_WHT_INV_FLAG,'Y','Yes','No') RES_CREATE_ZERO_AMOUNT_TAX_AUT
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE='ZX_RATE_SCHEDULE_GRP_LVL'
	AND LOOKUP_CODE  =
    (SELECT DISTINCT THRSHLD_SCHEDULE_GRP_LVL_FLAG
		FROM ZX_THREHLDS_SCHDL_CNTRLS_F sch
		WHERE sch.tax            =TaxTLEO.tax
		AND sch.tax_regime_code  =TaxTLEO.tax_regime_code
		AND sch.content_owner_id = TaxTLEO.content_owner_id
		AND sch.THRSHLD_SCHEDULE_GRP_LVL_FLAG in ('P','D')
		AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
		AND THRESHOLD_TYPE_CODE IS NULL
		)
	) RES_SCHEDULE_BASIS
,(SELECT CALENDAR_NAME||' '|| DESCRIPTION
	FROM AP_OTHER_PERIOD_TYPES
	WHERE CALENDAR_NAME =
	(SELECT DISTINCT calendar_name
		FROM ZX_THREHLDS_SCHDL_CNTRLS_F sch
		WHERE sch.tax            =TaxTLEO.tax
		AND sch.tax_regime_code  =TaxTLEO.tax_regime_code
		AND sch.content_owner_id = TaxTLEO.content_owner_id
		AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
		AND THRESHOLD_TYPE_CODE IS NULL)
	) RES_WITHHOLDING_TAX_CALENDAR
,DECODE(
	(SELECT DISTINCT schedule_application_flag 
		FROM ZX_THREHLDS_SCHDL_CNTRLS_F sch 
		WHERE sch.tax=TaxTLEO.tax
		AND sch.tax_regime_code      =TaxTLEO.tax_regime_code
		AND sch.content_owner_id     = TaxTLEO.content_owner_id
		AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
		AND THRESHOLD_TYPE_CODE IS NULL) 
	,'S','Yes','No') RES_APPLY_SINGLE_RATE_ON_TOTAL
,DECODE(TaxTLEO.ALLOW_EXCEPTIONS_FLAG,'Y','Yes','No') RES_ALLOW_TAX_EXCEPTIONS
,DECODE(TaxTLEO.ALLOW_EXEMPTIONS_FLAG,'Y','Yes','No') RES_ALLOW_TAX_EXEMPTIONS
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE='ZX_VALIDATION_LEVEL'
	AND LOOKUP_CODE  = TaxTLEO.VALIDATION_LEVEL
	) RES_VALIDATION_LEVEL
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE='ZX_UNIQUENESS_VALIDATION_LVL'
	AND LOOKUP_CODE  = TaxTLEO.UNIQUENESS_VALIDATION_LEVEL
	) RES_DUPLICATE_VALIDATION_LEVEL
,TaxTLEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,TaxTLEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,TaxTLEO.CREATED_BY RSC_CREATED_BY
,TaxTLEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,(CASE 
	WHEN ZFPOMV.PARTY_TYPE_CODE = 'OU' THEN	
		ZFPOMV.BU_ID
	ELSE
		NULL
	END) RSC_BUSINESS_UNIT_ID
,(CASE 
	WHEN ZFPOMV.PARTY_TYPE_CODE = 'FIRST_PARTY' THEN	
		ZFPOMV.LEGAL_ENTITY_ID
	ELSE
		NULL
	END) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_TAXES_VL TaxTLEO
,ZX_FIRST_PARTY_ORGS_MOAC_V ZFPOMV
,ZX_REGIMES_VL RegimeTLEO
WHERE ZFPOMV.PARTY_TAX_PROFILE_ID                = TaxTLEO.CONTENT_OWNER_ID
AND RegimeTLEO.TAX_REGIME_CODE                   = TaxTLEO.TAX_REGIME_CODE
AND NVL(RegimeTLEO.REGIME_TYPE_FLAG,'I') <> 'I'