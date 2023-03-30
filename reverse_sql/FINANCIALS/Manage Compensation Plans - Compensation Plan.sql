/* ****************************************************************************
 * $Revision: 72749 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2019-10-23 15:22:46 +0700 (Wed, 23 Oct 2019) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.19/trunk/core/reverse_sql/FINANCIALS/Manage%20Availability%20Lookups%20-%20Lookup%20Types.sql $:
 * $Id: Manage Availability Lookups - Lookup Types.sql 72749 2019-10-23 08:22:46Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT cmpPLANEO.PLAN_NAME RES_PLAN
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = cmpPLANEO.STATUS_CODE
			AND LOOKUP_TYPE = 'CMP_PLAN_STATUS' AND LANGUAGE = USERENV('LANG')
			AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_STATUS


,cmpPLANEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,cmpPLANEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,cmpPLANEO.CREATED_BY RSC_CREATED_BY
,cmpPLANEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CMP_PLANS_VL cmpPLANEO
WHERE cmpPLANEO.COMP_TYPE = 'CWB'
ORDER BY cmpPLANEO.PLAN_NAME