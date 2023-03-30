/* ****************************************************************************
 * $Revision: 56649 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2016-07-12 11:20:44 +0700 (Tue, 12 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/branches/core/v2.2.0.0/reverse_sql/FINANCIALS/Currency%20Rates%20Manager%20-%20Rate%20Types.sql $:
 * $Id: Currency Rates Manager - Rate Types.sql 56649 2016-07-12 04:20:44Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- STRICTLY_BATCH_SEQ = RES_PARTY_ORIGINAL_SYSTEM_REFE

SELECT '' RES_BATCH_IDENTIFIER
,'CUSTOMER' RES_PARTY_ORIGINAL_SYSTEM
,HzPartiesE0.PARTY_NUMBER RES_PARTY_ORIGINAL_SYSTEM_REFE
,'I' RES_INSERT_UPDATE_INDICATOR
,'ORGANIZATION' RES_PARTY_TYPE
,HzPartiesE0.PARTY_NUMBER RES_PARTY_NUMBER
,'' RES_SALUTATION
,HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE RES_PARTY_USAGE_CODE
,HzOrganizationProfilesE0.JGZZ_FISCAL_CODE RES_TAXPAYER_IDENTIFICATION_NU
,HzPartiesE0.PARTY_NAME RES_ORGANIZATION_NAME
,HzPartiesE0.DUNS_NUMBER_C RES_DUNS_NUMBER
,'' RES_PERSON_FIRST_NAME
,'' RES_PERSON_LAST_NAME
,'' RES_PERSON_LAST_NAME_PREFIX
,'' RES_PERSON_SECOND_LAST_NAME
,'' RES_PERSON_MIDDLE_NAME
,'' RES_PERSON_NAME_SUFFIX
,'' RES_PERSON_TITLE
,HzPartiesE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzPartiesE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzPartiesE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_0
,HzPartiesE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_1
,HzPartiesE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,HzPartiesE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzPartiesE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzPartiesE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzPartiesE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzPartiesE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzPartiesE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzPartiesE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzPartiesE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzPartiesE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzPartiesE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzPartiesE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzPartiesE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzPartiesE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzPartiesE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzPartiesE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzPartiesE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzPartiesE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzPartiesE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzPartiesE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzPartiesE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzPartiesE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzPartiesE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzPartiesE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzPartiesE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzPartiesE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzPartiesE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzPartiesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzPartiesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzPartiesE0.CREATED_BY RSC_CREATED_BY
,HzPartiesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HZ_PARTIES HzPartiesE0
,HZ_PARTY_USG_ASSIGNMENTS HzPartyUsgAssignmentsE0
,HZ_ORGANIZATION_PROFILES HzOrganizationProfilesE0
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartiesE0.PARTY_ID = HzOrganizationProfilesE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_TYPE = 'ORGANIZATION'

UNION

SELECT '' RES_BATCH_IDENTIFIER
,'CUSTOMER' RES_PARTY_ORIGINAL_SYSTEM
,HzPartiesE0.PARTY_NUMBER RES_PARTY_ORIGINAL_SYSTEM_REFE
,'I' RES_INSERT_UPDATE_INDICATOR
,'PERSON' RES_PARTY_TYPE
,HzPartiesE0.PARTY_NUMBER RES_PARTY_NUMBER
,HzPersonProfilesE0.SALUTATION RES_SALUTATION
,HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE RES_PARTY_USAGE_CODE
,HzPersonProfilesE0.JGZZ_FISCAL_CODE RES_TAXPAYER_IDENTIFICATION_NU
,NULL RES_ORGANIZATION_NAME
,HzPartiesE0.DUNS_NUMBER_C RES_DUNS_NUMBER
,HzPersonProfilesE0.PERSON_FIRST_NAME RES_PERSON_FIRST_NAME
,HzPersonProfilesE0.PERSON_LAST_NAME RES_PERSON_LAST_NAME
,HzPersonProfilesE0.PERSON_LAST_NAME_PREFIX RES_PERSON_LAST_NAME_PREFIX
,HzPersonProfilesE0.PERSON_SECOND_LAST_NAME RES_PERSON_SECOND_LAST_NAME
,HzPersonProfilesE0.PERSON_MIDDLE_NAME RES_PERSON_MIDDLE_NAME
,HzPersonProfilesE0.PERSON_NAME_SUFFIX RES_PERSON_NAME_SUFFIX
,HzPersonProfilesE0.PERSON_TITLE RES_PERSON_TITLE
,HzPartiesE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzPartiesE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzPartiesE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_0
,HzPartiesE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_1
,HzPartiesE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,HzPartiesE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzPartiesE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzPartiesE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzPartiesE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzPartiesE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzPartiesE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzPartiesE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzPartiesE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzPartiesE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzPartiesE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzPartiesE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzPartiesE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzPartiesE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzPartiesE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzPartiesE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzPartiesE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzPartiesE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzPartiesE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzPartiesE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzPartiesE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzPartiesE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzPartiesE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzPartiesE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzPartiesE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzPartiesE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzPartiesE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzPartiesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzPartiesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzPartiesE0.CREATED_BY RSC_CREATED_BY
,HzPartiesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HZ_PARTIES HzPartiesE0
,HZ_PARTY_USG_ASSIGNMENTS HzPartyUsgAssignmentsE0
,HZ_PERSON_PROFILES HzPersonProfilesE0
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartiesE0.PARTY_ID = HzPersonProfilesE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_TYPE = 'PERSON'