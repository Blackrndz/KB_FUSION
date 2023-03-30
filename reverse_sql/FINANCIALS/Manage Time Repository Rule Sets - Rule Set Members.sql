/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Time%20Repository%20Rule%20Sets%20-%20Rule%20Set%20Members.sql $:
 * $Id: Manage Time Repository Rule Sets - Rule Set Members.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT hwmRULESETEO.RULE_SET_NAME RES_NAME
,hwmRULESETMBREO.PROCESSING_ORDER RES_PROCESSING_SEQUENCE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE
	LOOKUP_CODE = hwmRULESETMBREO.MEMBER_TYPE AND LOOKUP_TYPE = 'HWM_RULE_SET_MEMBER_TYPE' AND LANGUAGE = USERENV('LANG')) RES_MEMBER_TYPE
,(SELECT RULE_NAME FROM HWM_RULES WHERE RULE_ID = hwmRULESETMBREO.MBR_RULE_ID) RES_MEMBER_NAME
,(SELECT TCAT_NAME FROM HWM_TCATS_VL WHERE TCAT_ID = hwmRULESETMBREO.TCAT_ID)  RES_TIME_CATEGORY_CONDITION

,hwmRULESETMBREO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hwmRULESETMBREO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hwmRULESETMBREO.CREATED_BY RSC_CREATED_BY
,hwmRULESETMBREO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HWM_RULE_SETS_F  hwmRULESETEO
,HWM_RULE_SET_MBRS hwmRULESETMBREO
WHERE hwmRULESETEO.RULE_SET_ID = hwmRULESETMBREO.RULE_SET_ID
AND hwmRULESETEO.RULE_SET_UNQ_ID = hwmRULESETMBREO.RULE_SET_UNQ_ID
AND SYSDATE BETWEEN hwmRULESETEO.EFFECTIVE_START_DATE AND hwmRULESETEO.EFFECTIVE_END_DATE
ORDER BY hwmRULESETEO.RULE_SET_NAME































