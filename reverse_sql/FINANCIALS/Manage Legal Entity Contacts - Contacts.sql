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
,DECODE(hzRELATIONE0.RELATIONSHIP_CODE,'ORA_AUTHORIZED_BY','Authorized agents for business entity.','BOARD_MEMBER_OF','Board Member'
,'CONTACT_OF','Person who is contact for an organization.','ORA_OWNER_OF','Business entities haveing an owner.','EMPLOYEE_OF','Employee'
,'INTERNAL_EXPERT_ON','Internal Expert','BENEFACTOR_OF','Organization benefactor') RES_ROLE
,hzPATIESE0.PERSON_FIRST_NAME RES_FIRST_NAME
,hzPATIESE0.PERSON_LAST_NAME RES_LAST_NAME
,xleENTITYPROFILES.NAME RES_CUSTOMER_NAME
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'RESPONSIBILITY'
	AND LOOKUP_CODE = hzORGCONTACTE0.JOB_TITLE_CODE
	) RES_JOB_TITLE_CODE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'DEPARTMENT_TYPE'
	AND LOOKUP_CODE = hzORGCONTACTE0.DEPARTMENT_CODE
	) RES_DEPARTMENT_CODE
,HZ_FORMAT_PUB.FORMAT_ADDRESS(P_LOCATION_ID => hzPARTYSITE0.LOCATION_ID , P_LINE_BREAK => ',') RES_FULL_ADDRESS
,hzPARTYSITE0.PARTY_SITE_NAME RES_SITE_NAME
,TO_CHAR(hzRELATIONE0.START_DATE,'DD-Mon-YYYY') RES_FROM_DATE
,TO_CHAR(hzRELATIONE0.END_DATE,'DD-Mon-YYYY')RES_TO_DATE
,hzRELATIONE0.COMMENTS RES_COMMENTS
,DECODE(hzORGCONTACTE0.REFERENCE_USE_FLAG,'Y','Yes','No') RES_REFERENCE
,DECODE(hzORGCONTACTE0.DECISION_MAKER_FLAG,'Y','Yes','No') RES_DECISION_MAKER

,hzRELATIONE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hzRELATIONE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hzRELATIONE0.CREATED_BY RSC_CREATED_BY
,hzRELATIONE0.CREATION_DATE RSC_CREATION_DATE
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
,HZ_PARTY_SITES hzPARTYSITE0

WHERE xleENTITYPROFILES.PARTY_ID = hzRELATIONE0.OBJECT_ID
AND hzRELATIONE0.RELATIONSHIP_ID = hzORGCONTACTE0.PARTY_RELATIONSHIP_ID
AND hzRELATIONE0.SUBJECT_ID = hzPATIESE0.PARTY_ID
AND hzORGCONTACTE0.PARTY_SITE_ID = hzPARTYSITE0.PARTY_SITE_ID(+)
ORDER BY xleENTITYPROFILES.NAME,hzPATIESE0.PARTY_NAME