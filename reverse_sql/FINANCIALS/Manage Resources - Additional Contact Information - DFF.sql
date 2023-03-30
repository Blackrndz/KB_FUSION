/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10024##RES##HZ_CONTACT_POINTS
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

SELECT PartyPEO.PARTY_NAME RES_RESOURCE_NAME
,PartyPEO.PARTY_NUMBER RES_REGISTRY_ID
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'COMMUNICATION_TYPE'
	AND LOOKUP_CODE   = ContactPointEO.CONTACT_POINT_TYPE
	) RES_CONTACT_POINT_TYPE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'PHONE_LINE_TYPE'
	AND LOOKUP_CODE   = ContactPointEO.PHONE_LINE_TYPE
	) RES_TYPE
,ContactPointEO.RAW_PHONE_NUMBER RES_PHONE
,ContactPointEO.EMAIL_ADDRESS RES_E_MAIL
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'HZ_INSTANT_MESSENGER_TYPE'
	AND LOOKUP_CODE   = ContactPointEO.INSTANT_MESSENGER_TYPE
	) RES_SOCIAL_NETWORK
,ContactPointEO.INSTANT_MESSAGING_ADDRESS RES_USER_ID
,ContactPointEO.URL RES_URL
,TO_CHAR(ContactPointEO.START_DATE,'DD-Mon-YYYY') RES_FROM_DATE
,ContactPointEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,ContactPointEO.ATTRIBUTE1
,ContactPointEO.ATTRIBUTE2
,ContactPointEO.ATTRIBUTE3
,ContactPointEO.ATTRIBUTE4
,ContactPointEO.ATTRIBUTE5
,ContactPointEO.ATTRIBUTE6
,ContactPointEO.ATTRIBUTE7
,ContactPointEO.ATTRIBUTE8
,ContactPointEO.ATTRIBUTE9
,ContactPointEO.ATTRIBUTE10
,ContactPointEO.ATTRIBUTE11
,ContactPointEO.ATTRIBUTE12
,ContactPointEO.ATTRIBUTE13
,ContactPointEO.ATTRIBUTE14
,ContactPointEO.ATTRIBUTE15
,ContactPointEO.ATTRIBUTE16
,ContactPointEO.ATTRIBUTE17
,ContactPointEO.ATTRIBUTE18
,ContactPointEO.ATTRIBUTE19
,ContactPointEO.ATTRIBUTE20
,ContactPointEO.ATTRIBUTE21
,ContactPointEO.ATTRIBUTE22
,ContactPointEO.ATTRIBUTE23
,ContactPointEO.ATTRIBUTE24
,ContactPointEO.ATTRIBUTE25
,ContactPointEO.ATTRIBUTE26
,ContactPointEO.ATTRIBUTE27
,ContactPointEO.ATTRIBUTE28
,ContactPointEO.ATTRIBUTE29
,ContactPointEO.ATTRIBUTE30
,ContactPointEO.ATTRIBUTE_NUMBER1
,ContactPointEO.ATTRIBUTE_NUMBER2
,ContactPointEO.ATTRIBUTE_NUMBER3
,ContactPointEO.ATTRIBUTE_NUMBER4
,ContactPointEO.ATTRIBUTE_NUMBER5
,ContactPointEO.ATTRIBUTE_NUMBER6
,ContactPointEO.ATTRIBUTE_NUMBER7
,ContactPointEO.ATTRIBUTE_NUMBER8
,ContactPointEO.ATTRIBUTE_NUMBER9
,ContactPointEO.ATTRIBUTE_NUMBER10
,ContactPointEO.ATTRIBUTE_NUMBER11
,ContactPointEO.ATTRIBUTE_NUMBER12
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE1, 'DD-Mon-YYYY') ATTRIBUTE_DATE1
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE2, 'DD-Mon-YYYY') ATTRIBUTE_DATE2
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE3, 'DD-Mon-YYYY') ATTRIBUTE_DATE3
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE4, 'DD-Mon-YYYY') ATTRIBUTE_DATE4
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE5, 'DD-Mon-YYYY') ATTRIBUTE_DATE5
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE6, 'DD-Mon-YYYY') ATTRIBUTE_DATE6
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE7, 'DD-Mon-YYYY') ATTRIBUTE_DATE7
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE8, 'DD-Mon-YYYY') ATTRIBUTE_DATE8
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE9, 'DD-Mon-YYYY') ATTRIBUTE_DATE9
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE10, 'DD-Mon-YYYY') ATTRIBUTE_DATE10
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE11, 'DD-Mon-YYYY') ATTRIBUTE_DATE11
, TO_CHAR(ContactPointEO.ATTRIBUTE_DATE12, 'DD-Mon-YYYY') ATTRIBUTE_DATE12
,ContactPointEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ContactPointEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ContactPointEO.CREATED_BY RSC_CREATED_BY
,ContactPointEO.CREATION_DATE RSC_CREATION_DATE
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
--,HZ_PARTY_USG_ASSIGNMENTS PartyUsageAssignmentPEO
,(SELECT *
	FROM HZ_CONTACT_POINTS
	WHERE SYSDATE BETWEEN START_DATE AND END_DATE
	AND OWNER_TABLE_NAME          = 'HZ_PARTIES'
	AND(ATTRIBUTE_CATEGORY       IS NOT NULL
	OR ATTRIBUTE1                IS NOT NULL
	OR ATTRIBUTE2                IS NOT NULL
	OR ATTRIBUTE3                IS NOT NULL
	OR ATTRIBUTE4                IS NOT NULL
	OR ATTRIBUTE5                IS NOT NULL
	OR ATTRIBUTE6                IS NOT NULL
	OR ATTRIBUTE7                IS NOT NULL
	OR ATTRIBUTE8                IS NOT NULL
	OR ATTRIBUTE9                IS NOT NULL
	OR ATTRIBUTE10               IS NOT NULL
	OR ATTRIBUTE11               IS NOT NULL
	OR ATTRIBUTE12               IS NOT NULL
	OR ATTRIBUTE13               IS NOT NULL
	OR ATTRIBUTE14               IS NOT NULL
	OR ATTRIBUTE15               IS NOT NULL
	OR ATTRIBUTE16               IS NOT NULL
	OR ATTRIBUTE17               IS NOT NULL
	OR ATTRIBUTE18               IS NOT NULL
	OR ATTRIBUTE19               IS NOT NULL
	OR ATTRIBUTE20               IS NOT NULL
	OR ATTRIBUTE21               IS NOT NULL
	OR ATTRIBUTE22               IS NOT NULL
	OR ATTRIBUTE23               IS NOT NULL
	OR ATTRIBUTE24               IS NOT NULL
	OR ATTRIBUTE25               IS NOT NULL
	OR ATTRIBUTE26               IS NOT NULL
	OR ATTRIBUTE27               IS NOT NULL
	OR ATTRIBUTE28               IS NOT NULL
	OR ATTRIBUTE29               IS NOT NULL
	OR ATTRIBUTE30               IS NOT NULL
	OR ATTRIBUTE_NUMBER1         IS NOT NULL
	OR ATTRIBUTE_NUMBER2         IS NOT NULL
	OR ATTRIBUTE_NUMBER3         IS NOT NULL
	OR ATTRIBUTE_NUMBER4         IS NOT NULL
	OR ATTRIBUTE_NUMBER5         IS NOT NULL
	OR ATTRIBUTE_NUMBER6         IS NOT NULL
	OR ATTRIBUTE_NUMBER7         IS NOT NULL
	OR ATTRIBUTE_NUMBER8         IS NOT NULL
	OR ATTRIBUTE_NUMBER9         IS NOT NULL
	OR ATTRIBUTE_NUMBER10        IS NOT NULL
	OR ATTRIBUTE_NUMBER11        IS NOT NULL
	OR ATTRIBUTE_NUMBER12        IS NOT NULL
	OR ATTRIBUTE_DATE1           IS NOT NULL
	OR ATTRIBUTE_DATE2           IS NOT NULL
	OR ATTRIBUTE_DATE3           IS NOT NULL
	OR ATTRIBUTE_DATE4           IS NOT NULL
	OR ATTRIBUTE_DATE5           IS NOT NULL
	OR ATTRIBUTE_DATE6           IS NOT NULL
	OR ATTRIBUTE_DATE7           IS NOT NULL
	OR ATTRIBUTE_DATE8           IS NOT NULL
	OR ATTRIBUTE_DATE9           IS NOT NULL
	OR ATTRIBUTE_DATE10          IS NOT NULL
	OR ATTRIBUTE_DATE11          IS NOT NULL
	OR ATTRIBUTE_DATE12          IS NOT NULL)
	) ContactPointEO
,(SELECT PERSON_ID
	FROM PER_ALL_PEOPLE_F 
	WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) PersonDPEONQ1
,HZ_ORIG_SYS_REFERENCES OrigSysRefPEONQ1
WHERE ResourceEO.PARTY_ID                    = PartyPEO.PARTY_ID
--AND PartyPEO.PARTY_ID                        = PartyUsageAssignmentPEO.PARTY_ID
AND ResourceEO.PARTY_ID                        = ContactPointEO.OWNER_TABLE_ID
AND TO_CHAR(PersonDPEONQ1.PERSON_ID)         = OrigSysRefPEONQ1.ORIG_SYSTEM_REFERENCE
AND ResourceEO.PARTY_ID                      = OrigSysRefPEONQ1.OWNER_TABLE_ID
ORDER BY RES_RESOURCE_NAME