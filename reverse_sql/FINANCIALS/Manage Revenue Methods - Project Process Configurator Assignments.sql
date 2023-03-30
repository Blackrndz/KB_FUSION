/* ****************************************************************************
 * $Revision: 79011 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-07-14 13:20:58 +0700 (Thu, 14 Jul 2022) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Revenue%20Methods%20-%20Billing%20Extension%20Assignments.sql $:
 * $Id: Manage Revenue Methods - Billing Extension Assignments.sql 79011 2022-07-14 06:20:58Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

--RSC_PREREQUISITE_OBJECTS=PJB_BILLING_METHODS_VL
--RSC_PREREQUISITE_OBJECTS=PJB_BILLING_ASSIGNMENTS
 
SELECT pjbBMethodE0.BILL_METHOD_NAME RES_REVENUE_METHOD_NAME
,(SELECT MEANING FROM FND_LOOKUPS
	WHERE LOOKUP_CODE = pjbBMethodE0.METHOD_CFG_TYPE
	AND LOOKUP_TYPE = 'ORA_PJB_CFG_BILL_METHOD_TYPE') RES_METHOD_ASSIGNMENT_TYPE
,(SELECT MEANING FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'PJB_EXTENSION_EXECUTION_LEVEL'
	AND LOOKUP_CODE = pjbBMethodE0.CALCULATION_LEVEL_CODE) RES_CALCULATION_LEVEL
,pjbBAssignE0.PROCESSING_ORDER RES_PROCESSING_ORDER
,(SELECT NAME FROM PJB_PROC_CONFIGURATORS_VL 
	WHERE CONFIGURATION_ID  = pjbBAssignE0.CONFIGURATION_ID)  RES_NAME
,(SELECT MEANING FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_PJB_CFG_TRANSACTION_CODE'
	AND LOOKUP_CODE = pjbBAssignE0.TRANSACTION_CODE) RES_TRANSACTION
,(SELECT EVENT_TYPE_NAME
			FROM PJF_EVENT_TYPES_TL
			WHERE LANGUAGE = USERENV('LANG')
			AND EVENT_TYPE_ID = pjbBAssignE0.TRANSACTION_TYPE) RES_TRANSACTION_TYPE
			
 ,pjbBAssignE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
 ,pjbBAssignE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
 ,pjbBAssignE0.CREATED_BY RSC_CREATED_BY
 ,pjbBAssignE0.CREATION_DATE RSC_CREATION_DATE
 ,NULL RSC_LEDGER_ID
 ,NULL RSC_CHART_OF_ACCOUNTS_ID
 ,NULL RSC_BUSINESS_UNIT_ID
 ,NULL RSC_LEGAL_ENTITY_ID
 ,NULL RSC_ORGANIZATION_ID
 ,NULL RSC_BUSINESS_GROUP_ID
 ,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PJB_BILLING_METHODS_VL pjbBMethodE0
 ,PJB_BILLING_ASSIGNMENTS pjbBAssignE0
 
WHERE pjbBMethodE0.BILL_METHOD_ID = pjbBAssignE0.BILL_METHOD_ID
AND pjbBMethodE0.BILL_METHOD_FLAG = 'R'
AND pjbBAssignE0.TRANSACTION_CODE IS NOT NULL
AND pjbBAssignE0.TRANSACTION_TYPE IS NOT NULL
ORDER BY pjbBMethodE0.BILL_METHOD_NAME,pjbBAssignE0.PROCESSING_ORDER
