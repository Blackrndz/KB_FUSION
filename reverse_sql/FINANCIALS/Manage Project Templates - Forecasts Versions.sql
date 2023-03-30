/* ****************************************************************************
* $Revision: 78693 $:
* $Author: tanawat.wongjan $:
* $Date: 2022-06-07 17:22:14 +0700 (Tue, 07 Jun 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Project%20Templates%20-%20Forecasts%20Versions.sql $:
* $Id: Manage Project Templates - Forecasts Versions.sql 78693 2022-06-07 10:22:14Z tanawat.wongjan $:
* ****************************************************************************
* Description:
* ************************************************************************** */


SELECT projTemplatesE0.NAME RES_TEMPLATE_NAME
,projTemplatesE0.SEGMENT1 RES_TEMPLATE_NUMBER
,forecastsE0.VERSION_NAME RES_NAME
,(SELECT NAME 
	FROM PJO_PLAN_TYPES_VL
	WHERE PLAN_TYPE_ID = forecastsE0.PLAN_TYPE_ID
	) RES_FINANCIAL_PLAN_TYPE
,DECODE(planningOptionsE0.PRIMARY_COST_FORECAST_FLAG,'Y','Yes','No') RES_PRIMARY_COST_FORECAST
,DECODE(planningOptionsE0.PRIMARY_REV_FORECAST_FLAG,'Y','Yes','No') RES_PRIMARY_REVENUE_FORECAST
,(SELECT MEANING 
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'PJO_PLANNED_FOR_CODE'
	AND LOOKUP_CODE = forecastsE0.PLANNED_FOR_CODE
	) RES_PLANNING_AMOUNTS
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'MANUAL' THEN 
		'Manually create forecast lines'
	ELSE
		(SELECT MEANING 
			FROM FND_LOOKUPS
			WHERE LOOKUP_TYPE = 'PJO_BUDGET_CREATION_METHOD'
			AND LOOKUP_CODE = planningOptionsE0.BUDGET_CREATION_METHOD)
	END) RES_FORECAST_CREATION_METHOD
,forecastsE0.DESCRIPTION RES_DESCRIPTION
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'COPY' THEN
		(SELECT NAME 
			FROM PJO_PLAN_TYPES_VL
			WHERE PLAN_TYPE_ID = planningOptionsE0.COPY_SRC_PLAN_TYPE_ID)
	END) RES_PLAN_TYPE
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'COPY' THEN
		copiesE0.VERSION_NAME
	END) RES_PLAN_VERSION
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'COPY' THEN
		(CASE 
			WHEN copiesE0.CURRENT_PLAN_STATUS_FLAG = 'Y' AND copiesE0.PLAN_STATUS_CODE = 'W' THEN
				'Current working'
			ELSE
				(SELECT MEANING 
					FROM FND_LOOKUPS
					WHERE LOOKUP_TYPE = 'PJO_MNG_BUD_PLAN_STATUS'
					AND LOOKUP_CODE = copiesE0.PLAN_STATUS_CODE)
			END)
	END) RES_STATUS
,'' RES_ADJUSTMENT_PERCENTAGE
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'GENERATE' THEN
		(SELECT MEANING 
			FROM FND_LOOKUPS
			WHERE LOOKUP_TYPE = 'PJO_PLAN_TYPE_CODE'
			AND LOOKUP_CODE = planningOptionsE0.GEN_SRC_CODE)
	END) RES_ETC_GENERATION_SOURCE
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'GENERATE' THEN
		(CASE 
			WHEN planningOptionsE0.GEN_SRC_CODE = 'FINANCIAL_PLAN' THEN
				(SELECT NAME 
					FROM PJO_PLAN_TYPES_VL
					WHERE PLAN_TYPE_ID = planningOptionsE0.GEN_SRC_PLAN_TYPE_ID)
			WHEN planningOptionsE0.GEN_SRC_CODE = 'PROJECT_PLAN' THEN
				(SELECT (SELECT MEANING 
						FROM FND_LOOKUPS
						WHERE LOOKUP_TYPE = 'PJO_FCST_GEN_SRC_ALL'
						AND LOOKUP_CODE = PLAN_TYPE_CODE)
					FROM PJO_PLAN_TYPES_VL
					WHERE PLAN_TYPE_ID = planningOptionsE0.GEN_SRC_PLAN_TYPE_ID)
			END)
	END) RES_SOURCE_PLAN_TYPE
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'GENERATE' THEN
		(CASE 
			WHEN planningOptionsE0.GEN_SRC_CODE = 'FINANCIAL_PLAN' THEN
				generatedE0.VERSION_NAME
			WHEN planningOptionsE0.GEN_SRC_CODE = 'PROJECT_PLAN' THEN
				DECODE(generatedE0.CURRENT_PLAN_STATUS_FLAG,'Y','Current ') ||
				(SELECT MEANING 
					FROM FND_LOOKUPS
					WHERE LOOKUP_TYPE = 'PJO_MNG_BUD_PLAN_STATUS'
					AND LOOKUP_CODE = generatedE0.PLAN_STATUS_CODE)
			END)
	END) RES_SOURCE_PLAN_VERSION
,(CASE
	WHEN planningOptionsE0.BUDGET_CREATION_METHOD = 'GENERATE' THEN
		(CASE 
			WHEN generatedE0.CURRENT_PLAN_STATUS_FLAG = 'Y' THEN
				'Current working'
			ELSE
				(SELECT MEANING 
					FROM FND_LOOKUPS
					WHERE LOOKUP_TYPE = 'PJO_MNG_BUD_PLAN_STATUS'
					AND LOOKUP_CODE = generatedE0.PLAN_STATUS_CODE)
			END)
	END) RES_PLAN_VERSION_STATUS
,DECODE(planningOptionsE0.PLAN_IN_MULTI_CURR_FLAG,'Y','Yes','No') RES_MULTIPLE_TRANSACTION_CURRE
,forecastsE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,forecastsE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,forecastsE0.CREATED_BY  RSC_CREATED_BY
,forecastsE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,projTemplatesE0.ORG_ID RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PJF_PROJECTS_ALL_VL projTemplatesE0
,FUN_ALL_BUSINESS_UNITS_V buE0
,PJO_PLAN_VERSIONS_VL forecastsE0
,PJO_PLANNING_OPTIONS planningOptionsE0
,PJO_PLAN_VERSIONS_VL copiesE0
,PJO_PLAN_VERSIONS_VL generatedE0
WHERE projTemplatesE0.TEMPLATE_FLAG = 'Y'
AND projTemplatesE0.ORG_ID = buE0.BU_ID
AND projTemplatesE0.PROJECT_ID = forecastsE0.PROJECT_ID
AND forecastsE0.PLAN_CLASS_CODE = 'FORECAST'
AND forecastsE0.STRUCTURE_VERSION_ID IS NULL
AND forecastsE0.PLAN_VERSION_ID = planningOptionsE0.PLAN_VERSION_ID
AND planningOptionsE0.PLAN_TYPE_CODE = 'FINANCIAL_PLAN'
AND planningOptionsE0.COPY_SRC_PLAN_VERSION_ID = copiesE0.PLAN_VERSION_ID(+)
AND planningOptionsE0.GEN_SRC_PLAN_VERSION_ID = generatedE0.PLAN_VERSION_ID(+)
ORDER BY projTemplatesE0.NAME
,forecastsE0.VERSION_NAME