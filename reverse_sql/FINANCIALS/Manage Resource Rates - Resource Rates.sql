/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=WIS_RESOURCES_VL
 
SELECT (SELECT SCENARIO_NUMBER
	FROM CST_SCENARIOS
	WHERE SCENARIO_ID = CostResourceRatesE0.SCENARIO_ID
	) RES_SCENARIO
,(SELECT COST_ORG_NAME
	FROM CST_COST_ORGS_V
	WHERE COST_ORG_ID =  CostResourceRatesE0.COST_ORG_ID
	) RES_COST_ORGANIZATION
,(SELECT COST_BOOK_DESC
	FROM CST_COST_BOOKS_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND COST_BOOK_ID = CostResourceRatesE0.COST_BOOK_ID
	) RES_COST_BOOK
,(SELECT ORGANIZATION_NAME
	FROM INV_ORGANIZATION_DEFINITIONS_V
	WHERE ORGANIZATION_ID = CostResourceRatesE0.INV_ORG_ID
	) RES_PLANT
,ResourcesE0.RESOURCE_NAME RES_RESOURCE
,(SELECT MEANING 
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_WIS_RESOURCE_TYPE'
	AND LOOKUP_CODE = ResourcesE0.RESOURCE_TYPE
	) RES_RESOURCE_TYPE
,(SELECT UNIT_OF_MEASURE
	FROM INV_UNITS_OF_MEASURE_VL
	WHERE UOM_CODE = ResourcesE0.UOM_CODE
	) RES_UOM
,(SELECT NAME
	FROM FND_CURRENCIES_TL
	WHERE CURRENCY_CODE = CostResourceRatesE0.CURRENCY_CODE
	AND LANGUAGE = USERENV('LANG')
	) RES_CURRENCY_NAME
,TO_CHAR(CostResourceRatesE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT MEANING 
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_CST_STD_COST_STATUSES'
	AND LOOKUP_CODE = CostResourceRatesE0.STATUS_CODE
	) RES_STATUS
,CostResourceRatesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,CostResourceRatesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,CostResourceRatesE0.CREATED_BY RSC_CREATED_BY
,CostResourceRatesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,CostResourceRatesE0.COST_ORG_ID RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CST_STD_RESOURCE_RATES CostResourceRatesE0
,WIS_RESOURCES_VL ResourcesE0
WHERE CostResourceRatesE0.RESOURCE_ID = ResourcesE0.RESOURCE_ID
AND CostResourceRatesE0.INV_ORG_ID = ResourcesE0.ORGANIZATION_ID
ORDER BY 1,2