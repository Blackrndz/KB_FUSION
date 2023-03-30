/* ****************************************************************************
 * $Revision: 55346 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-05-23 14:11:43 +0700 (Mon, 23 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Chart%20of%20Accounts%20Value%20Set%20Values%20-%20Manage%20Values.sql $:
 * $Id: Manage Chart of Accounts Value Set Values - Manage Values.sql 55346 2016-05-23 07:11:43Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 
--RSC_PREREQUISITE_OBJECTS=HRC_DL_LAYOUTS_VL
--RSC_PREREQUISITE_OBJECTS=HRC_SDL_LAYOUT_ROLE_MAP

SELECT hdcDLLAYOUTEO.LAYOUT_CODE RES_CODE
,DECODE(hrcSDLROLEO.ACTIVE_STATUS,'Y','Yes','No') RES_ENABLED
,perROLE0.ROLE_NAME RES_ROLE_NAME
,perROLE0.ROLE_COMMON_NAME RES_ROLE_CODE
,perROLE0.DESCRIPTION RES_DESCRIPTION

,hrcSDLROLEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hrcSDLROLEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hrcSDLROLEO.CREATED_BY RSC_CREATED_BY
,hrcSDLROLEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,(SELECT LEGISLATION_CODE 
	FROM PER_LEGISLATIVE_DATA_GROUPS
	WHERE LEGISLATIVE_DATA_GROUP_ID = hdcDLLAYOUTEO.LEGISLATIVE_DATA_GROUP_ID
	) RSC_COUNTRY_ID

FROM HRC_DL_LAYOUTS_VL  hdcDLLAYOUTEO
,HRC_SDL_LAYOUT_ROLE_MAP  hrcSDLROLEO
,PER_ROLES_DN_VL perROLE0
WHERE hdcDLLAYOUTEO.LAYOUT_ID = hrcSDLROLEO.LAYOUT_ID
AND hrcSDLROLEO.ROLE_ID = perROLE0.ROLE_ID
AND hrcSDLROLEO.MANAGE_TEMPLATE = 'Y'
ORDER BY hdcDLLAYOUTEO.LAYOUT_CODE