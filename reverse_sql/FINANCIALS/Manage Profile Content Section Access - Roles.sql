/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Profile%20Content%20Section%20Access%20-%20Roles.sql $:
 * $Id: Manage Profile Content Section Access - Roles.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=HRT_PROFILE_TYP_SECTIONS
-- RSC_PREREQUISITE_OBJECTS=HRT_CONTENT_TYPES_TL
-- RSC_PREREQUISITE_OBJECTS=HRT_PROFILE_TYPE_GRANTS
 
SELECT  hrtCONTENTTYPEO.CONTENT_TYPE_NAME RES_NAME
,(SELECT ROLE_NAME FROM PER_ROLES_DN_VL WHERE ROLE_ID = hrtPROFILETYPGRAEO.ROLE_ID) RES_ROLES_NAME
,DECODE(hrtPROFILETYPGRAEO.SECURITY_VIEW_FLAG,'Y','Yes','No') RES_VIEW
,DECODE(hrtPROFILETYPGRAEO.SECURITY_MODIFY_FLAG,'Y','Yes','No') RES_EDIT
,DECODE(hrtPROFILETYPGRAEO.SECURITY_REPORT_FLAG,'Y','Yes','No') RES_REPORT

,hrtPROFILETYPGRAEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hrtPROFILETYPGRAEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hrtPROFILETYPGRAEO.CREATED_BY RSC_CREATED_BY
,hrtPROFILETYPGRAEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HRT_PROFILE_TYP_SECTIONS hrtPROFILETYPSECEO
,HRT_CONTENT_TYPES_TL hrtCONTENTTYPEO
,HRT_PROFILE_TYPE_GRANTS hrtPROFILETYPGRAEO
WHERE hrtPROFILETYPSECEO.CONTENT_TYPE_ID = hrtCONTENTTYPEO.CONTENT_TYPE_ID
AND hrtPROFILETYPSECEO.SECTION_ID = hrtPROFILETYPGRAEO.SECTION_ID
AND hrtCONTENTTYPEO.LANGUAGE = USERENV('LANG')
AND hrtPROFILETYPSECEO.PROFILE_TYPE_ID = 1
AND hrtPROFILETYPSECEO.ACTIVE_FLAG = 'Y'
ORDER BY RES_NAME,RES_ROLES_NAME