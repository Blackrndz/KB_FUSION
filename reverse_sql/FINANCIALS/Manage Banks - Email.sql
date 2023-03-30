/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Banks%20-%20Email.sql $:
* $Id: Manage Banks - Email.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */
SELECT BankEO.COUNTRY_NAME                        AS RES_COUNTRY ,
  BankEO.BANK_NAME                                AS RES_BANK_NAME ,
  PersonProfileE0.PERSON_NAME                     AS RES_CONTACT_NAME ,
  DECODE(EmailEO.PRIMARY_FLAG,'Y','Yes','No') AS RES_PRIMARY ,
  (SELECT MEANING
  FROM FND_LOOKUP_VALUES
  WHERE LOOKUP_TYPE = 'CONTACT_POINT_PURPOSE'
  AND LANGUAGE = USERENV('LANG')
  AND LOOKUP_CODE   = EmailEO.CONTACT_POINT_PURPOSE
  )                     AS RES_PURPOSE ,
  EmailEO.EMAIL_ADDRESS AS RES_E_MAIL ,
  EmailEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY ,
  EmailEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE ,
  EmailEO.CREATED_BY RSC_CREATED_BY ,
  EmailEO.CREATION_DATE RSC_CREATION_DATE ,
  NULL RSC_LEDGER_ID ,
  NULL RSC_CHART_OF_ACCOUNTS_ID ,
  NULL RSC_BUSINESS_UNIT_ID ,
  NULL RSC_LEGAL_ENTITY_ID ,
  NULL RSC_ORGANIZATION_ID ,
  NULL RSC_BUSINESS_GROUP_ID ,
  NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HZ_ORG_CONTACTS OrganizationContactEO ,
  CE_BANKS_V BankEO ,
  CE_CONTACT_ASSIGNMENTS CeContactAssignments ,
  HZ_RELATIONSHIPS RelationshipEO ,
  HZ_PERSON_PROFILES PersonProfileE0 ,
  HZ_PARTIES OrganizationPartyEO ,
  HZ_CONTACT_POINTS EmailEO
WHERE OrganizationContactEO.PARTY_RELATIONSHIP_ID = RelationshipEO.RELATIONSHIP_ID
AND CeContactAssignments.RELATIONSHIP_ID          = RelationshipEO.RELATIONSHIP_ID
AND(CeContactAssignments.ASSIGNMENT_TYPE          = 'BANK')
AND BankEO.BANK_PARTY_ID                          = CeContactAssignments.BANK_PARTY_ID
AND BankEO.BANK_PARTY_ID                          = RelationshipEO.SUBJECT_ID
AND RelationshipEO.OBJECT_ID                      = PersonProfileE0.PARTY_ID
AND RelationshipEO.OBJECT_ID                      = OrganizationPartyEO.PARTY_ID
AND RelationshipEO.RELATIONSHIP_TYPE              = 'CONTACT'
AND PersonProfileE0.PARTY_ID                      = EmailEO.OWNER_TABLE_ID
AND EmailEO.CONTACT_POINT_TYPE                    = 'EMAIL'
ORDER BY RES_COUNTRY ,
  RES_BANK_NAME ,
  RES_CONTACT_NAME