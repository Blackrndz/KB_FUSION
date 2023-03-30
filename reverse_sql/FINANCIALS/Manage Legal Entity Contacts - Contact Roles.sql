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
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'XLE_CONTACT_ROLE'
	AND LOOKUP_CODE = xleCONTACTLEGALROLE0.LOOKUP_CODE
	)  RES_LEGAL_ROLE





,xleCONTACTLEGALROLE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,xleCONTACTLEGALROLE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,xleCONTACTLEGALROLE0.CREATED_BY RSC_CREATED_BY
,xleCONTACTLEGALROLE0.CREATION_DATE RSC_CREATION_DATE
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
,XLE_CONTACT_LEGAL_ROLES xleCONTACTLEGALROLE0


WHERE xleENTITYPROFILES.PARTY_ID = hzRELATIONE0.OBJECT_ID
AND hzRELATIONE0.RELATIONSHIP_ID = hzORGCONTACTE0.PARTY_RELATIONSHIP_ID
AND hzRELATIONE0.SUBJECT_ID = hzPATIESE0.PARTY_ID
AND hzPATIESE0.PARTY_ID = xleCONTACTLEGALROLE0.CONTACT_PARTY_ID
ORDER BY xleENTITYPROFILES.NAME,hzPATIESE0.PARTY_NAME