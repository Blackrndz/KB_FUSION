/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT QRSLT.DET_FACTOR_TEMPL_CODE RES_TAX_DETERMINING_FACTOR_SET
,QRSLT.DET_FACTOR_TEMPL_NAME RES_TAX_DETERMINING_FACTOR_S_0
,QRSLT.TEMPLATE_USAGE_CODE_DESC RES_SET_USAGE
,QRSLT.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,QRSLT.LEDGER RES_LEDGER
,QRSLT.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,QRSLT.CREATED_BY RSC_CREATED_BY
,QRSLT.CREATION_DATE RSC_CREATION_DATE
,QRSLT.LEDGER_ID RSC_LEDGER_ID
,QRSLT.CHART_OF_ACCOUNTS_ID RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT
	ZxDetFactorTemplVl.DET_FACTOR_TEMPL_ID
	,ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE
	,ZxDetFactorTemplVl.DET_FACTOR_TEMPL_NAME
	,ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE
	,DFUsageLookup.MEANING TEMPLATE_USAGE_CODE_DESC
	,ZxDetFactorTemplVl.LEDGER_ID
	,ZxDetFactorTemplVl.TAX_REGIME_CODE
	,ZxDetFactorTemplVl.OBJECT_VERSION_NUMBER
	,ZxDetFactorTemplVl.LAST_UPDATED_BY 
	,ZxDetFactorTemplVl.LAST_UPDATE_DATE 
	,ZxDetFactorTemplVl.CREATED_BY
	,ZxDetFactorTemplVl.CREATION_DATE
	,CASE
			WHEN ZxDetFactorTemplVl.LEDGER_ID IS NOT NULL
			THEN
				(SELECT GlLedgers.NAME
				FROM GL_LEDGERS GlLedgers
				WHERE ZxDetFactorTemplVl.LEDGER_ID = GlLedgers.LEDGER_ID
				)
			ELSE NULL
		END AS LEDGER
	,DECODE(ZxDetFactorTemplVl.RECORD_TYPE_CODE,(SELECT DISTINCT ZxDetFactorTemplVl.RECORD_TYPE_CODE
		FROM ZX_CONDITION_GROUPS_VL ConditionGroup
		WHERE ConditionGroup.DET_FACTOR_TEMPL_CODE  = ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE
		AND ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE IN('WHT_TAX_RULES','TAX_RULES','ENF_FROM_ACCT','ENF_FROM_STCC')
		),'N',(SELECT DISTINCT ZxDetFactorTemplVl.RECORD_TYPE_CODE
		FROM ZX_EVNT_CLS_MAPPINGS EvntMappings
		WHERE EvntMappings.DET_FACTOR_TEMPL_CODE    = ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE
		AND ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE IN('WHT_TAX_REGIME_DETERMINATION','TAX_REGIME_DETERMINATION')
		),'N',(SELECT DISTINCT ZxDetFactorTemplVl.RECORD_TYPE_CODE
		FROM ZX_EVNT_CLS_OPTIONS EvntOptions
		WHERE EvntOptions.DET_FACTOR_TEMPL_CODE     = ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE
		AND ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE IN('WHT_TAX_REGIME_DETERMINATION','TAX_REGIME_DETERMINATION')
		),'N','USER_DEFINED','D','N') AS DELETE_SWITCHER
	,DECODE(ZxDetFactorTemplVl.RECORD_TYPE_CODE,(SELECT DISTINCT ZxDetFactorTemplVl.RECORD_TYPE_CODE
		FROM ZX_CONDITION_GROUPS_VL ConditionGroup
		WHERE ConditionGroup.DET_FACTOR_TEMPL_CODE  = ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE
		AND ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE IN('WHT_TAX_RULES','TAX_RULES','TAX_BOX_RULES','ENF_FROM_ACCT',
			'ENF_FROM_STCC')
		),'N',(SELECT DISTINCT ZxDetFactorTemplVl.RECORD_TYPE_CODE
		FROM ZX_EVNT_CLS_MAPPINGS EvntMappings
		WHERE EvntMappings.DET_FACTOR_TEMPL_CODE    = ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE
		AND ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE IN('WHT_TAX_REGIME_DETERMINATION','TAX_REGIME_DETERMINATION')
		),'N',(SELECT DISTINCT ZxDetFactorTemplVl.RECORD_TYPE_CODE
		FROM ZX_EVNT_CLS_OPTIONS EvntOptions
		WHERE EvntOptions.DET_FACTOR_TEMPL_CODE     = ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE
		AND ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE IN('WHT_TAX_REGIME_DETERMINATION','TAX_REGIME_DETERMINATION')
		),'N','USER_DEFINED','U','N') AS UPDATE_SWITCHER
	,(SELECT NVL(ZxRegimesVl.REGIME_TYPE_FLAG,'I')
		FROM ZX_REGIMES_VL ZxRegimesVl
		WHERE ZxRegimesVl.TAX_REGIME_CODE = ZxDetFactorTemplVl.TAX_REGIME_CODE
		) AS REGIME_TYPE_FLAG
	,DECODE(SUBSTR(ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE,1,3),'WHT','W','I') USAGE_TYPE_FLAG
	,ZxDetFactorTemplVl.CHART_OF_ACCOUNTS_ID
	FROM ZX_DET_FACTOR_TEMPL_VL ZxDetFactorTemplVl
	,FND_LOOKUPS DFUsageLookup
	WHERE DFUsageLookup.lookup_type = 'ZX_TEMPLATE_USAGE'
	AND DFUsageLookup.lookup_code   = ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE
	AND DECODE(SUBSTR(ZxDetFactorTemplVl.TEMPLATE_USAGE_CODE,1,3),'WHT','W','I') = 'I'
	) QRSLT
ORDER BY DET_FACTOR_TEMPL_CODE