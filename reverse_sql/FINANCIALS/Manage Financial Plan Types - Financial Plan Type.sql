/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Financial%20Plan%20Types%20-%20Financial%20Plan%20Type.sql $:
* $Id: Manage Financial Plan Types - Financial Plan Type.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

SELECT 	pjoPlanTypeEO.NAME							RES_NAME
,(CASE
	WHEN EXISTS (SELECT 1 FROM PJO_XCC_SETTINGS , PJO_PLANNING_OPTIONS
					WHERE PJO_XCC_SETTINGS.PLANNING_OPTION_ID = PJO_PLANNING_OPTIONS.PLANNING_OPTION_ID
						AND PJO_PLANNING_OPTIONS.PLAN_TYPE_ID = pjoPlanTypeEO.PLAN_TYPE_ID
						AND PJO_PLANNING_OPTIONS.PLAN_OPTION_LEVEL_CODE = 'PLAN_TYPE'
						AND PJO_XCC_SETTINGS.CONTROL_BUDGET_CODE = 'AWD_FUND_PROJECT')
		THEN 'Financial Plan Type for Sponsored Project'  
		ELSE
			'Financial Plan Type for Non-Sponsored Project'
			END)	RES_SPONSORED_PROJECT
,pjoPlanTypeEO.DESCRIPTION							RES_DESCRIPTION
,(SELECT MEANING FROM FND_LOOKUPS
		WHERE LOOKUP_CODE = pjoPlanTypeEO.PLAN_CLASS_CODE
			AND LOOKUP_TYPE = 'PJO_PLAN_CLASS') RES_PLAN_CLASS
,TO_CHAR(pjoPlanTypeEO.START_DATE,'DD-Mon-YYYY') RES_FROM_DATE
,TO_CHAR(pjoPlanTypeEO.END_DATE,'DD-Mon-YYYY') RES_TO_DATE
,(SELECT MEANING FROM FND_LOOKUPS
		WHERE LOOKUP_CODE = pjoPlanTypeEO.PLAN_OPTION_CODE
			AND LOOKUP_TYPE = 'PJO_PLAN_OPTION_CODE') RES_PLANNING_AMOUNTS
,DECODE(pjoPlanTypeEO.APPROVED_COST_PLAN_TYPE_FLAG,'Y','Yes','No') RES_DESIGNATE_AS_APPROVED_COST
,DECODE(pjoPlanTypeEO.APPROVED_REV_PLAN_TYPE_FLAG,'Y','Yes','No') RES_DESIGNATE_AS_APPROVED_REVE
,DECODE(pjoPlanTypeEO.ENABLE_WF_FLAG,'Y','Yes','No') RES_USE_WORKFLOW_FOR_STATUS_CH
,DECODE(pjoPlanTypeEO.DEFAULT_FIN_PLAN_TYPE_FLAG,'Y','Yes','No') RES_SET_AS_DEFAULT_FINANCIAL_P
,DECODE(pjoPlanTypeEO.PLAN_IN_MULTI_CURR_FLAG,'Y','Yes','No') RES_ENABLE_PLANNING_IN_MULTIPL
,DECODE(pjoPlanTypeEO.PRIMARY_COST_FORECAST_FLAG,'Y','Yes','No') RES_DESIGNATE_AS_PRIMARY_COST_
,DECODE(pjoPlanTypeEO.PRIMARY_REV_FORECAST_FLAG,'Y','Yes','No') RES_DESIGNATE_AS_PRIMARY_REVEN
,DECODE(pjoPlanTypeEO.BUDGETARY_CONTROLS_FLAG,'Y','Yes','No') RES_ENABLE_BUDGETARY_CONTROLS
,DECODE(pjoPlanTypeEO.AUTO_SUBMIT_FOR_APPR,'Y','Yes','No') RES_AUTOMATICALLY_SUBMIT_FOREC
,DECODE(pjoPlanTypeEO.AUTO_APPROVE_FLAG,'Y','Yes','No') RES_AUTOMATICALLY_APPROVE_FORE
,pjoPlanTypeEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,pjoPlanTypeEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,pjoPlanTypeEO.CREATED_BY  RSC_CREATED_BY
,pjoPlanTypeEO.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PJO_PLAN_TYPES_VL pjoPlanTypeEO
WHERE pjoPlanTypeEO.PLAN_TYPE_CODE = 'FINANCIAL_PLAN'
ORDER BY pjoPlanTypeEO.NAME

