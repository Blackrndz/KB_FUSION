/* ****************************************************************************
 * $Revision: 55017 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-05-06 17:03:01 +0700 (Fri, 06 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Contact%20Point%20Lookups%20-%20Standard%20Lookup%20Type.sql $:
 * $Id: Manage Contact Point Lookups - Standard Lookup Type.sql 55017 2016-05-06 10:03:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT PartyPEO.PARTY_NAME RES_RESOURCE_NAME
,PartyPEO.PARTY_NUMBER RES_REGISTRY_ID
,ORGRuleE0.ROLE_NAME RES_ROLE_NAME
,DECODE(ORGRuleE0.MEMBER_FLAG,'Y','Yes','No') RES_MEMBER
,DECODE(ORGRuleE0.MANAGER_FLAG,'Y','Yes','No') RES_MANAGER
,DECODE(ORGRuleE0.ADMIN_FLAG,'Y','Yes','No') RES_ADMINISTRATOR
,DECODE(ORGRuleE0.LEAD_FLAG,'Y','Yes','No') RES_LEAD
,TO_CHAR(ORGRuleE0.START_DATE_ACTIVE,'DD-Mon-YYYY') RES_FROM_DATE
,DECODE(TO_CHAR(ORGRuleE0.END_DATE_ACTIVE,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(ORGRuleE0.END_DATE_ACTIVE,'DD-Mon-YYYY')) RES_TO_DATE
,ORGRuleE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ORGRuleE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ORGRuleE0.CREATED_BY RSC_CREATED_BY
,ORGRuleE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM JTF_RS_RESOURCE_PROFILES ResourceEO
,HZ_PARTIES PartyPEO
,(SELECT PERSON_ID
	FROM PER_ALL_PEOPLE_F 
	WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) PersonDPEONQ1
,HZ_ORIG_SYS_REFERENCES OrigSysRefPEONQ1
,(SELECT ResourceRoleAssign.ROLE_RESOURCE_ID PARTY_ID
	,ResourceRole.ROLE_NAME
	,ResourceRole.LEAD_FLAG
	,ResourceRole.MEMBER_FLAG
	,ResourceRole.MANAGER_FLAG
	,ResourceRole.ADMIN_FLAG
	,ResourceRoleAssign.START_DATE_ACTIVE
	,ResourceRoleAssign.END_DATE_ACTIVE
	,ResourceRoleAssign.LAST_UPDATED_BY
	,ResourceRoleAssign.LAST_UPDATE_DATE
	,ResourceRoleAssign.CREATED_BY
	,ResourceRoleAssign.CREATION_DATE
	FROM (SELECT ROLE_ID
		,ROLE_RESOURCE_ID
		,START_DATE_ACTIVE
		,END_DATE_ACTIVE
		,LAST_UPDATED_BY
		,LAST_UPDATE_DATE
		,CREATED_BY
		,CREATION_DATE
		FROM JTF_RS_ROLE_RELATIONS 
		WHERE ROLE_RESOURCE_TYPE = 'RS_INDIVIDUAL'
		AND DELETE_FLAG <> 'Y'
		AND SYSDATE BETWEEN START_DATE_ACTIVE AND END_DATE_ACTIVE
		) ResourceRoleAssign
	,JTF_RS_ROLES_VL ResourceRole
	WHERE ResourceRoleAssign.ROLE_ID = ResourceRole.ROLE_ID
	) ORGRuleE0
WHERE ResourceEO.PARTY_ID                    = PartyPEO.PARTY_ID
AND ResourceEO.PARTY_ID                        = ORGRuleE0.PARTY_ID
AND TO_CHAR(PersonDPEONQ1.PERSON_ID)         = OrigSysRefPEONQ1.ORIG_SYSTEM_REFERENCE
AND ResourceEO.PARTY_ID                      = OrigSysRefPEONQ1.OWNER_TABLE_ID
ORDER BY RES_RESOURCE_NAME