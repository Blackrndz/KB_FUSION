/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=IRC_APPLY_FLOWS_VL
-- RSC_PREREQUISITE_OBJECTS=IRC_AF_VERSIONS

SELECT flowsE0.APPLY_FLOW_NAME RES_APPLICATION_FLOW_NAME
,versionsE0.VERSION_NAME RES_VERSION_NAME
,TO_CHAR(versionsE0.VERSION_START_DATE,'DD-Mon-YYYY') RES_VERSION_START_DATE
,(SELECT MEANING FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = versionsE0.VERSION_STATUS_CODE AND LOOKUP_TYPE = 'ORA_IRC_AF_VERSION_STATUS'
	AND LANGUAGE = USERENV('LANG')) RES_VERSION_STATUS
,'' RES_START_ON_ACTIVATION
,DECODE(versionsE0.LEGAL_ENABLED_FLAG,'Y','Yes','No') RES_LEGAL_DISCLAIMER
,DECODE(versionsE0.ESIGN_ENABLED_FLAG,'Y','Yes','No') RES_E_SIGNATURE
,DECODE(versionsE0.OPTIN_ENABLED_FLAG,'Y','Yes','No') RES_CAMPAIGN_OPT_IN
,DECODE(versionsE0.SINGLE_CLICK_APPLY_FLAG,'Y','Yes','No') RES_ONE_PAGE_APPLICATION_FLOW
,DECODE(versionsE0.TC_OPTIN_ENABLED_FLAG,'Y','Yes','No') RES_JOB_ALERT_OPT_IN
,versionsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,versionsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,versionsE0.CREATED_BY RSC_CREATED_BY
,versionsE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM IRC_APPLY_FLOWS_VL flowsE0
,IRC_AF_VERSIONS versionsE0
WHERE flowsE0.APPLY_FLOW_ID = versionsE0.APPLY_FLOW_ID
ORDER BY flowsE0.APPLY_FLOW_NAME
,versionsE0.VERSION_NAME