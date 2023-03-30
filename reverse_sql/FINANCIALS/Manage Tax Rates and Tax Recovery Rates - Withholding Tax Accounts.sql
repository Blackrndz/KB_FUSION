/* ****************************************************************************
* $Revision: 54489 $:
* $Author: Nasrullah.dusenmahamad $:
* $Date: 2016-11-04 17:28:51 +0700 (Tue, 19 Apr 2016) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Tax%20Rates%20and%20Tax%20Recovery%20Rates%20-%20Manage%20Tax%20Recovery%20Rate.sql $:
* $Id: Manage Tax Rates and Tax Recovery Rates - Transaction Tax Accounts.sql 54489 2016-04-19 10:28:51Z dhara.pithadiya $:
* ****************************************************************************
* Description:
* ************************************************************************** */

-- FIELD_TO_APPLY_FUNCTION=RES_TAX_LIABILITY_ACCOUNT/GET_CODE_COMBINATION

SELECT HEAD.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,HEAD.PARTY_NAME RES_CONFIGURATION_OWNER
,HEAD.TAX RES_TAX
,HEAD.tax_status_code RES_TAX_STATUS_CODE
,HEAD.tax_jurisdiction_code RES_TAX_JURISDICTION_CODE
,HEAD.tax_rate_code RES_TAX_RATE_CODE
,HEAD.PERCENTAGE_RATE RES_RATE_PERCENTAGE
,TO_CHAR(HEAD.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT name
	FROM gl_ledgers
	WHERE ledger_id = QRSLT.ledger_id
	) RES_LEDGER
,(SELECT BU_NAME
	FROM FUN_ALL_BUSINESS_UNITS_V
	WHERE BU_ID = QRSLT.INTERNAL_ORGANIZATION_ID
	) RES_BUSINESS_UNIT
,QRSLT.TAX_LIAB_ACCT_CCID RES_TAX_LIABILITY_ACCOUNT
,QRSLT.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,QRSLT.CREATED_BY RSC_CREATED_BY
,QRSLT.CREATION_DATE RSC_CREATION_DATE
,QRSLT.LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,QRSLT.INTERNAL_ORGANIZATION_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT DISTINCT ZxRatesVl.TAX_REGIME_CODE
	,party.PARTY_NAME
	,ZxRatesVl.TAX
	,ZxRatesVl.tax_status_code
	,ZxRatesVl.tax_jurisdiction_code
	,ZxRatesVl.tax_rate_code
	,ZxRatesVl.PERCENTAGE_RATE
	,ZxRatesVl.UOM_CODE
	,ZxRatesVl.QUANTITY_RATE
	,ZxRatesVl.EFFECTIVE_FROM
	,ZxRatesVl.TAX_rate_ID
	,ZxRatesVl.CONTENT_OWNER_ID
	FROM ZX_RATES_VL ZxRatesVl
	,ZX_FIRST_PARTY_ORGS_MOAC_V party
	,ZX_REGIMES_VL RegimeTLEO
	,ZX_MCO_CHECK_ACCESS_V ZMCAV
	,ZX_MCO_LV_TAXES_V Tax
	WHERE RegimeTLEO.TAX_REGIME_CODE                 = ZxRatesVl.TAX_REGIME_CODE
	AND party.party_tax_profile_id                   = ZxRatesVl.CONTENT_OWNER_ID
	AND ZxRatesVl.ACTIVE_FLAG                        = 'Y'
	AND ZMCAV.TAX_REGIME_CODE                        = ZxRatesVl.TAX_REGIME_CODE
	AND ZMCAV.PARENT_FIRST_PTY_ORG_ID                = ZxRatesVl.CONTENT_OWNER_ID
	AND Tax.TAX_REGIME_CODE                          = ZxRatesVl.TAX_REGIME_CODE
	AND Tax.TAX                                      = ZxRatesVl.TAX
	AND Tax.CONTENT_OWNER_ID                         = ZxRatesVl.CONTENT_OWNER_ID
	AND ZxRatesVl.rate_type_code                    <> 'RECOVERY'
	AND UPPER(NVL(RegimeTLEO.REGIME_TYPE_FLAG,'I')) <> UPPER('I')
	) HEAD
,(SELECT ZA.TAX_ACCOUNT_ENTITY_CODE
	,ZA.CREATED_BY
	,ZA.CREATION_DATE
	,ZA.LAST_UPDATED_BY
	,ZA.LAST_UPDATE_DATE
	,ZA.TAX_ACCOUNT_ENTITY_ID
	,ZA.LEDGER_ID
	,ZA.INTERNAL_ORGANIZATION_ID
	,BusinessUnitPEO.BU_NAME     AS NAME
	,GL.NAME      AS LEDGER_NAME
	,ZA.TAX_LIAB_ACCT_CCID
	FROM ZX_ACCOUNTS ZA
	,GL_LEDGERS GL
	,FND_ID_FLEX_STRUCTURES FIFS
	,FUN_ALL_BUSINESS_UNITS_V BusinessUnitPEO
	WHERE GL.LEDGER_ID (+)        = ZA.LEDGER_ID
	AND FIFS.APPLICATION_ID (+)   = 101
	AND FIFS.ID_FLEX_CODE (+)     = 'GL#'
	AND FIFS.ID_FLEX_NUM          = GL.CHART_OF_ACCOUNTS_ID
	AND BusinessUnitPEO.BU_ID (+) = ZA.INTERNAL_ORGANIZATION_ID
	) QRSLT
WHERE HEAD.TAX_rate_ID = QRSLT.TAX_ACCOUNT_ENTITY_ID
ORDER BY (SELECT DECODE(TAX_TYPE_CODE,'OFFSET',1,2) 
	FROM ZX_TAXES_VL 
	WHERE TAX = HEAD.TAX 
	AND CONTENT_OWNER_ID = HEAD.CONTENT_OWNER_ID
	AND TAX_REGIME_CODE = HEAD.TAX_REGIME_CODE
	)
,HEAD.TAX_REGIME_CODE
,HEAD.tax_status_code
,RES_EFFECTIVE_START_DATE
,RES_LEDGER