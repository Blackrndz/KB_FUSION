/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT ZxStatusVl.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,ZFPOMV.PARTY_NAME RES_CONFIGURATION_OWNER
,ZxStatusVl.TAX RES_TAX
,ZxStatusVl.TAX_STATUS_CODE RES_TAX_STATUS_CODE
,ZxStatusVl.TAX_STATUS_NAME RES_TAX_STATUS_NAME
,ZxReportingTypesVl.REPORTING_TYPE_CODE RES_TAX_REPORTING_TYPE_CODE
,(SELECT meaning
	FROM fnd_lookup_values_tl
	WHERE lookup_type = 'ZX_REPORTING_DATA'
	AND lookup_code   = ZxReportingTypesVl.REPORTING_TYPE_DATATYPE_CODE
	AND LANGUAGE = USERENV('LANG')
	) RES_DATA_TYPE
,ZxReportCode.REPORTING_CODE_CHAR_VALUE RES_TAX_REPORTING_CODE
,ZxReportingCodesVl.REPORTING_CODE_NAME RES_DESCRIPTION
,TO_CHAR(ZxReportCode.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(ZxReportCode.EFFECTIVE_TO,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE
,ZxReportCode.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ZxReportCode.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ZxReportCode.CREATED_BY RSC_CREATED_BY
,ZxReportCode.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,(CASE
	WHEN ZFPOMV.PARTY_TYPE_CODE = 'OU' THEN
		ZFPOMV.BU_ID
	END) RSC_BUSINESS_UNIT_ID
,(CASE
	WHEN ZFPOMV.PARTY_TYPE_CODE = 'FIRST_PARTY' THEN
		ZFPOMV.LEGAL_ENTITY_ID
	END) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_STATUS_VL ZxStatusVl
,ZX_TAXES_VL Tax
,ZX_FIRST_PARTY_ORGS_MOAC_V ZFPOMV
,ZX_REGIMES_VL RegimeTLEO
,zx_subscription_details sd
,ZX_REPORT_CODES_ASSOC ZxReportCode
,ZX_REPORTING_CODES_VL ZxReportingCodesVl
,ZX_REPORTING_TYPES_VL ZxReportingTypesVl
WHERE Tax.TAX_REGIME_CODE       = ZxStatusVl.TAX_REGIME_CODE
AND Tax.TAX                     = ZxStatusVl.TAX
AND ZFPOMV.PARTY_TAX_PROFILE_ID = ZxStatusVl.CONTENT_OWNER_ID
AND RegimeTLEO.TAX_REGIME_CODE  = ZxStatusVl.TAX_REGIME_CODE
AND ZxStatusVl.tax_regime_code  = sd.tax_regime_code
AND Tax.content_owner_id        = sd.parent_first_pty_org_id
AND sd.first_pty_org_id         = ZxStatusVl.CONTENT_OWNER_ID
AND(sd.view_options_code                IN('VFC','VFR')
OR NOT EXISTS
	(SELECT 1
	FROM zx_taxes_b b
	WHERE b.tax_regime_code = ZxStatusVl.tax_regime_code
	AND b.tax               = ZxStatusVl.tax
	AND b.content_owner_id  = ZxStatusVl.CONTENT_OWNER_ID
	))
AND(ZxStatusVl.TAX_STATUS_ID       = ZxReportCode.ENTITY_ID
AND ZxReportCode.ENTITY_CODE       = 'ZX_STATUS'
AND ZxReportCode.REPORTING_TYPE_ID = ZxReportingTypesVl.REPORTING_TYPE_ID
AND ZxReportCode.REPORTING_CODE_ID = ZxReportingCodesVl.REPORTING_CODE_ID(+))
AND NVL(RegimeTLEO.REGIME_TYPE_FLAG,'I') = 'I'
ORDER BY RES_TAX_STATUS_CODE
,RES_TAX_REGIME_CODE
,RES_TAX
,RES_CONFIGURATION_OWNER
,RES_TAX_REPORTING_TYPE_CODE