/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Banks%20-%20Bank%20Contact%20-%20DFF.sql $:
* $Id: Manage Banks - Bank Contact - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10024##RES##HZ_PERSON_PROFILES
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE
-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.
SELECT BankEO.COUNTRY_NAME AS RES_COUNTRY ,
  BankEO.BANK_NAME         AS RES_BANK_NAME ,
  PersonProfileE0.PERSON_NAME RES_CONTACT_NAME ,
  PersonProfileE0.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE ,
  PersonProfileE0.ATTRIBUTE1 ,
  PersonProfileE0.ATTRIBUTE2 ,
  PersonProfileE0.ATTRIBUTE3 ,
  PersonProfileE0.ATTRIBUTE4 ,
  PersonProfileE0.ATTRIBUTE5 ,
  PersonProfileE0.ATTRIBUTE6 ,
  PersonProfileE0.ATTRIBUTE7 ,
  PersonProfileE0.ATTRIBUTE8 ,
  PersonProfileE0.ATTRIBUTE9 ,
  PersonProfileE0.ATTRIBUTE10 ,
  PersonProfileE0.ATTRIBUTE11 ,
  PersonProfileE0.ATTRIBUTE12 ,
  PersonProfileE0.ATTRIBUTE13 ,
  PersonProfileE0.ATTRIBUTE14 ,
  PersonProfileE0.ATTRIBUTE15 ,
  PersonProfileE0.ATTRIBUTE16 ,
  PersonProfileE0.ATTRIBUTE17 ,
  PersonProfileE0.ATTRIBUTE18 ,
  PersonProfileE0.ATTRIBUTE19 ,
  PersonProfileE0.ATTRIBUTE20 ,
  PersonProfileE0.ATTRIBUTE21 ,
  PersonProfileE0.ATTRIBUTE22 ,
  PersonProfileE0.ATTRIBUTE23 ,
  PersonProfileE0.ATTRIBUTE24 ,
  PersonProfileE0.ATTRIBUTE25 ,
  PersonProfileE0.ATTRIBUTE26 ,
  PersonProfileE0.ATTRIBUTE27 ,
  PersonProfileE0.ATTRIBUTE28 ,
  PersonProfileE0.ATTRIBUTE29 ,
  PersonProfileE0.ATTRIBUTE30 ,
  PersonProfileE0.ATTRIBUTE_NUMBER1 ,
  PersonProfileE0.ATTRIBUTE_NUMBER2 ,
  PersonProfileE0.ATTRIBUTE_NUMBER3 ,
  PersonProfileE0.ATTRIBUTE_NUMBER4 ,
  PersonProfileE0.ATTRIBUTE_NUMBER5 ,
  PersonProfileE0.ATTRIBUTE_NUMBER6 ,
  PersonProfileE0.ATTRIBUTE_NUMBER7 ,
  PersonProfileE0.ATTRIBUTE_NUMBER8 ,
  PersonProfileE0.ATTRIBUTE_NUMBER9 ,
  PersonProfileE0.ATTRIBUTE_NUMBER10 ,
  PersonProfileE0.ATTRIBUTE_NUMBER11 ,
  PersonProfileE0.ATTRIBUTE_NUMBER12 ,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE1, 'DD-Mon-YYYY') ATTRIBUTE_DATE1,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE2, 'DD-Mon-YYYY') ATTRIBUTE_DATE2,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE3, 'DD-Mon-YYYY') ATTRIBUTE_DATE3,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE4, 'DD-Mon-YYYY') ATTRIBUTE_DATE4,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE5, 'DD-Mon-YYYY') ATTRIBUTE_DATE5,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE6, 'DD-Mon-YYYY') ATTRIBUTE_DATE6,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE7, 'DD-Mon-YYYY') ATTRIBUTE_DATE7,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE8, 'DD-Mon-YYYY') ATTRIBUTE_DATE8,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE9, 'DD-Mon-YYYY') ATTRIBUTE_DATE9,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE10, 'DD-Mon-YYYY') ATTRIBUTE_DATE10,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE11, 'DD-Mon-YYYY') ATTRIBUTE_DATE11,
  TO_CHAR(PersonProfileE0.ATTRIBUTE_DATE12, 'DD-Mon-YYYY') ATTRIBUTE_DATE12,
  PersonProfileE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY ,
  PersonProfileE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE ,
  PersonProfileE0.CREATED_BY RSC_CREATED_BY ,
  PersonProfileE0.CREATION_DATE RSC_CREATION_DATE ,
  NULL RSC_LEDGER_ID ,
  NULL RSC_CHART_OF_ACCOUNTS_ID ,
  NULL RSC_BUSINESS_UNIT_ID ,
  NULL RSC_LEGAL_ENTITY_ID ,
  NULL RSC_ORGANIZATION_ID ,
  NULL RSC_BUSINESS_GROUP_ID ,
  NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CE_BANKS_V BankEO ,
  CE_CONTACT_ASSIGNMENTS CeContactAssignments ,
  HZ_RELATIONSHIPS RelationshipEO ,
  HZ_PERSON_PROFILES PersonProfileE0 ,
  HZ_PARTIES OrganizationPartyEO
WHERE BankEO.BANK_PARTY_ID               = RelationshipEO.SUBJECT_ID
AND RelationshipEO.OBJECT_ID             = PersonProfileE0.PARTY_ID
AND RelationshipEO.OBJECT_ID             = OrganizationPartyEO.PARTY_ID
AND RelationshipEO.RELATIONSHIP_TYPE     = 'CONTACT'
AND CeContactAssignments.RELATIONSHIP_ID = RelationshipEO.RELATIONSHIP_ID
AND BankEO.BANK_PARTY_ID                 = CeContactAssignments.BANK_PARTY_ID
AND(CeContactAssignments.ASSIGNMENT_TYPE = 'BANK')
AND (PersonProfileE0.ATTRIBUTE_CATEGORY IS NOT NULL
OR PersonProfileE0.ATTRIBUTE1           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE2           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE3           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE4           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE5           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE6           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE7           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE8           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE9           IS NOT NULL
OR PersonProfileE0.ATTRIBUTE10          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE11          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE12          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE13          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE14          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE15          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE16          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE17          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE18          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE19          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE20          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE21          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE22          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE23          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE24          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE25          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE26          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE27          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE28          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE29          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE30          IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER1    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER2    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER3    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER4    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER5    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER6    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER7    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER8    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER9    IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER10   IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER11   IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_NUMBER12   IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE1      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE2      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE3      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE4      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE5      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE6      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE7      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE8      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE9      IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE10     IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE11     IS NOT NULL
OR PersonProfileE0.ATTRIBUTE_DATE12     IS NOT NULL )
ORDER BY RES_COUNTRY ,
  RES_BANK_NAME