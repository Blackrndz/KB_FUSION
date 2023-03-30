/* ****************************************************************************
 * $Revision: 56510 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-07-06 09:21:36 +0700 (Wed, 06 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Locations%20(United%20States)%20-%20Manage%20Locations.sql $:
 * $Id: Manage Locations (United States) - Manage Locations.sql 56510 2016-07-06 02:21:36Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 
SELECT xleENTITYPROFILES.NAME RES_LEGAL_ENTITY_NAME
,xleENTITYPROFILES.LEGAL_ENTITY_IDENTIFIER RES_LEGAL_ENTITY_IDENTIFIER
,hzPATIESE0.PARTY_NAME RES_CONTACT_NAME
,hzORGCONTACTE0.CONTACT_NUMBER RES_CONTACT_NUMBER
,hzcontactPOINTE0.CONTACT_POINT_TYPE RES_CONTACT_POINT_TYPE
,(CASE WHEN hzcontactPOINTE0.PHONE_AREA_CODE IS NULL
	THEN '+'||hzcontactPOINTE0.PHONE_COUNTRY_CODE||' '||hzcontactPOINTE0.PHONE_NUMBER||' x'||hzcontactPOINTE0.PHONE_EXTENSION
	WHEN hzcontactPOINTE0.PHONE_EXTENSION IS NULL
	THEN '+'||hzcontactPOINTE0.PHONE_COUNTRY_CODE||' ('||hzcontactPOINTE0.PHONE_AREA_CODE||')'||hzcontactPOINTE0.PHONE_NUMBER
	WHEN hzcontactPOINTE0.PHONE_AREA_CODE IS NULL AND hzcontactPOINTE0.PHONE_EXTENSION IS NULL
	THEN '+'||hzcontactPOINTE0.PHONE_COUNTRY_CODE||' '||hzcontactPOINTE0.PHONE_NUMBER 
	ELSE '+'||hzcontactPOINTE0.PHONE_COUNTRY_CODE||' ('||hzcontactPOINTE0.PHONE_AREA_CODE||')'||hzcontactPOINTE0.PHONE_NUMBER||' x'||hzcontactPOINTE0.PHONE_EXTENSION
	END) RES_VALUE
,hzcontactPOINTE0.PHONE_NUMBER RES_PHONE
,hzcontactPOINTE0.EMAIL_ADDRESS RES_E_MAIL
,hzcontactPOINTE0.INSTANT_MESSAGING_ADDRESS RES_USER_ID
,hzcontactPOINTE0.URL RES_URL
,TO_CHAR(hzCONTACTPRE0.PREFERENCE_START_DATE,'DD-Mon-YYYY') RES_FROM_DATE
,TO_CHAR(hzCONTACTPRE0.PREFERENCE_END_DATE,'DD-Mon-YYYY') RES_TO_DATE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'CONTACT_TYPE'
	AND LOOKUP_CODE = hzCONTACTPRE0.CONTACT_TYPE
	) RES_CONTACT_TYPE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'PREFERENCE_CODE'
	AND LOOKUP_CODE = hzCONTACTPRE0.PREFERENCE_CODE
	) RES_PREFERENCE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'REASON_CODE'
	AND LOOKUP_CODE = hzCONTACTPRE0.REASON_CODE
	) RES_REASON

,hzCONTACTPRE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hzCONTACTPRE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hzCONTACTPRE0.CREATED_BY RSC_CREATED_BY
,hzCONTACTPRE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FUSION.XLE_ENTITY_PROFILES xleENTITYPROFILES 
,HZ_RELATIONSHIPS hzRELATIONE0 
,HZ_ORG_CONTACTS hzORGCONTACTE0
,HZ_PARTIES hzPATIESE0
,HZ_CONTACT_POINTS hzcontactPOINTE0
,HZ_CONTACT_PREFERENCES hzCONTACTPRE0

WHERE xleENTITYPROFILES.PARTY_ID = hzRELATIONE0.OBJECT_ID
AND hzRELATIONE0.RELATIONSHIP_ID = hzORGCONTACTE0.PARTY_RELATIONSHIP_ID
AND hzRELATIONE0.SUBJECT_ID = hzPATIESE0.PARTY_ID
AND hzPATIESE0.PARTY_ID = hzcontactPOINTE0.OWNER_TABLE_ID
AND hzcontactPOINTE0.CONTACT_POINT_ID = hzCONTACTPRE0.CONTACT_LEVEL_TABLE_ID
ORDER BY xleENTITYPROFILES.NAME,hzPATIESE0.PARTY_NAME