/* ****************************************************************************
 * $Revision: 56649 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2016-07-12 11:20:44 +0700 (Tue, 12 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/branches/core/v2.2.0.0/reverse_sql/FINANCIALS/Currency%20Rates%20Manager%20-%20Rate%20Types.sql $:
 * $Id: Currency Rates Manager - Rate Types.sql 56649 2016-07-12 04:20:44Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- STRICTLY_BATCH_SEQ = RES_CONTACT_POINT_ORIGINAL_S_0

SELECT '' RES_BATCH_IDENTIFIER
,'CUSTOMER' RES_CONTACT_POINT_ORIGINAL_SYS
,HzContactPointE0.CONTACT_POINT_ID RES_CONTACT_POINT_ORIGINAL_S_0
,'CUSTOMER' RES_PARTY_ORIGINAL_SYSTEM
,HzPartiesE0.PARTY_NUMBER RES_PARTY_ORIGINAL_SYSTEM_REFE
,'' RES_PARTY_SITE_ORIGINAL_SYSTEM
,'' RES_PARTY_SITE_ORIGINAL_SYST_1
,HzContactPointE0.PRIMARY_FLAG RES_PRIMARY_INDICATOR
,'I' RES_INSERT_UPDATE_INDICATOR
,HzContactPointE0.CONTACT_POINT_TYPE RES_CONTACT_POINT_TYPE
,HzContactPointE0.CONTACT_POINT_PURPOSE RES_CONTACT_POINT_PURPOSE
,HzContactPointE0.EMAIL_ADDRESS RES_EMAIL_ADDRESS
,HzContactPointE0.EMAIL_FORMAT RES_EMAIL_FORMAT
,HzContactPointE0.PHONE_AREA_CODE RES_PHONE_AREA_CODE
,HzContactPointE0.PHONE_COUNTRY_CODE RES_PHONE_COUNTRY_CODE
,HzContactPointE0.PHONE_EXTENSION RES_PHONE_EXTENSION
,HzContactPointE0.PHONE_LINE_TYPE RES_PHONE_LINE_TYPE
,HzContactPointE0.PHONE_NUMBER RES_PHONE_NUMBER
,HzContactPointE0.URL RES_URL
,HzContactPointE0.PHONE_CALLING_CALENDAR RES_PHONE_CALLING_CALENDAR
,TO_CHAR(HzContactPointE0.START_DATE,'YYYY/MM/DD') RES_FROM_DATE
,DECODE(TO_CHAR(HzContactPointE0.END_DATE,'YYYY/MM/DD'),'4712/12/31',NULL,TO_CHAR(HzContactPointE0.END_DATE,'YYYY/MM/DD')) RES_TO_DATE
,HzContactPointE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzContactPointE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzContactPointE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,HzContactPointE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzContactPointE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzContactPointE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzContactPointE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzContactPointE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzContactPointE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzContactPointE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzContactPointE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzContactPointE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzContactPointE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzContactPointE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzContactPointE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzContactPointE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzContactPointE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzContactPointE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzContactPointE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzContactPointE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzContactPointE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzContactPointE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzContactPointE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzContactPointE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzContactPointE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzContactPointE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzContactPointE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzContactPointE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzContactPointE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzContactPointE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_29
,HzContactPointE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_30
,HzContactPointE0.ATTRIBUTE_NUMBER1 RES_DESCRIPTIVE_FLEXFIELD_NUMB
,HzContactPointE0.ATTRIBUTE_NUMBER2 RES_DESCRIPTIVE_FLEXFIELD_N_31
,HzContactPointE0.ATTRIBUTE_NUMBER3 RES_DESCRIPTIVE_FLEXFIELD_N_32
,HzContactPointE0.ATTRIBUTE_NUMBER4 RES_DESCRIPTIVE_FLEXFIELD_N_33
,HzContactPointE0.ATTRIBUTE_NUMBER5 RES_DESCRIPTIVE_FLEXFIELD_N_34
,HzContactPointE0.ATTRIBUTE_NUMBER6 RES_DESCRIPTIVE_FLEXFIELD_N_35
,HzContactPointE0.ATTRIBUTE_NUMBER7 RES_DESCRIPTIVE_FLEXFIELD_N_36
,HzContactPointE0.ATTRIBUTE_NUMBER8 RES_DESCRIPTIVE_FLEXFIELD_N_37
,HzContactPointE0.ATTRIBUTE_NUMBER9 RES_DESCRIPTIVE_FLEXFIELD_N_38
,HzContactPointE0.ATTRIBUTE_NUMBER10 RES_DESCRIPTIVE_FLEXFIELD_N_39
,HzContactPointE0.ATTRIBUTE_NUMBER11 RES_DESCRIPTIVE_FLEXFIELD_N_40
,HzContactPointE0.ATTRIBUTE_NUMBER12 RES_DESCRIPTIVE_FLEXFIELD_N_41
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE1,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_DATE
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE2,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_42
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE3,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_43
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE4,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_44
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE5,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_45
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE6,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_46
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE7,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_47
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE8,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_48
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE9,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_49
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE10,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_50
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE11,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_51
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE12,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_52
,'' RES_RELATIONSHIP_SOURCE_SYSTEM
,'' RES_RELATIONSHIP_SOURCE_SYS_53
,HzContactPointE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzContactPointE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzContactPointE0.CREATED_BY RSC_CREATED_BY
,HzContactPointE0.CREATION_DATE RSC_CREATION_DATE
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
,HZ_CUST_ACCOUNTS HzCustAccountsE0
,HZ_ORG_CONTACTS HzOrgContactsE0
,HZ_CUST_ACCOUNT_ROLES HzCustAccountRoles
,HZ_CONTACT_POINTS HzContactPointE0
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = HzCustAccountRoles.CUST_ACCOUNT_ID
AND HzCustAccountRoles.CUST_ACCT_SITE_ID IS NULL
AND HzCustAccountRoles.RELATIONSHIP_ID = HzOrgContactsE0.PARTY_RELATIONSHIP_ID
AND HzCustAccountRoles.RELATIONSHIP_ID = HzContactPointE0.RELATIONSHIP_ID
AND HzCustAccountRoles.CONTACT_PERSON_ID = HzContactPointE0.OWNER_TABLE_ID

UNION

SELECT '' RES_BATCH_IDENTIFIER
,'CUSTOMER' RES_CONTACT_POINT_ORIGINAL_SYS
,HzContactPointE0.CONTACT_POINT_ID RES_CONTACT_POINT_ORIGINAL_S_0
,'CUSTOMER' RES_PARTY_ORIGINAL_SYSTEM
,HzPartiesE0.PARTY_NUMBER RES_PARTY_ORIGINAL_SYSTEM_REFE
,'CUSTOMER' RES_PARTY_SITE_ORIGINAL_SYSTEM
,HzPartySitesE0.PARTY_SITE_NUMBER RES_PARTY_SITE_ORIGINAL_SYST_1
,HzContactPointE0.PRIMARY_FLAG RES_PRIMARY_INDICATOR
,'I' RES_INSERT_UPDATE_INDICATOR
,HzContactPointE0.CONTACT_POINT_TYPE RES_CONTACT_POINT_TYPE
,HzContactPointE0.CONTACT_POINT_PURPOSE RES_CONTACT_POINT_PURPOSE
,HzContactPointE0.EMAIL_ADDRESS RES_EMAIL_ADDRESS
,HzContactPointE0.EMAIL_FORMAT RES_EMAIL_FORMAT
,HzContactPointE0.PHONE_AREA_CODE RES_PHONE_AREA_CODE
,HzContactPointE0.PHONE_COUNTRY_CODE RES_PHONE_COUNTRY_CODE
,HzContactPointE0.PHONE_EXTENSION RES_PHONE_EXTENSION
,HzContactPointE0.PHONE_LINE_TYPE RES_PHONE_LINE_TYPE
,HzContactPointE0.PHONE_NUMBER RES_PHONE_NUMBER
,HzContactPointE0.URL RES_URL
,HzContactPointE0.PHONE_CALLING_CALENDAR RES_PHONE_CALLING_CALENDAR
,TO_CHAR(HzContactPointE0.START_DATE,'YYYY/MM/DD') RES_FROM_DATE
,TO_CHAR(HzContactPointE0.END_DATE,'YYYY/MM/DD') RES_TO_DATE
,HzContactPointE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzContactPointE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzContactPointE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,HzContactPointE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzContactPointE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzContactPointE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzContactPointE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzContactPointE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzContactPointE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzContactPointE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzContactPointE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzContactPointE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzContactPointE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzContactPointE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzContactPointE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzContactPointE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzContactPointE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzContactPointE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzContactPointE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzContactPointE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzContactPointE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzContactPointE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzContactPointE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzContactPointE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzContactPointE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzContactPointE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzContactPointE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzContactPointE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzContactPointE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzContactPointE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_29
,HzContactPointE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_30
,HzContactPointE0.ATTRIBUTE_NUMBER1 RES_DESCRIPTIVE_FLEXFIELD_NUMB
,HzContactPointE0.ATTRIBUTE_NUMBER2 RES_DESCRIPTIVE_FLEXFIELD_N_31
,HzContactPointE0.ATTRIBUTE_NUMBER3 RES_DESCRIPTIVE_FLEXFIELD_N_32
,HzContactPointE0.ATTRIBUTE_NUMBER4 RES_DESCRIPTIVE_FLEXFIELD_N_33
,HzContactPointE0.ATTRIBUTE_NUMBER5 RES_DESCRIPTIVE_FLEXFIELD_N_34
,HzContactPointE0.ATTRIBUTE_NUMBER6 RES_DESCRIPTIVE_FLEXFIELD_N_35
,HzContactPointE0.ATTRIBUTE_NUMBER7 RES_DESCRIPTIVE_FLEXFIELD_N_36
,HzContactPointE0.ATTRIBUTE_NUMBER8 RES_DESCRIPTIVE_FLEXFIELD_N_37
,HzContactPointE0.ATTRIBUTE_NUMBER9 RES_DESCRIPTIVE_FLEXFIELD_N_38
,HzContactPointE0.ATTRIBUTE_NUMBER10 RES_DESCRIPTIVE_FLEXFIELD_N_39
,HzContactPointE0.ATTRIBUTE_NUMBER11 RES_DESCRIPTIVE_FLEXFIELD_N_40
,HzContactPointE0.ATTRIBUTE_NUMBER12 RES_DESCRIPTIVE_FLEXFIELD_N_41
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE1,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_DATE
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE2,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_42
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE3,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_43
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE4,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_44
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE5,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_45
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE6,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_46
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE7,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_47
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE8,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_48
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE9,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_49
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE10,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_50
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE11,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_51
,TO_CHAR(HzContactPointE0.ATTRIBUTE_DATE12,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_52
,'' RES_RELATIONSHIP_SOURCE_SYSTEM
,'' RES_RELATIONSHIP_SOURCE_SYS_53
,HzContactPointE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzContactPointE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzContactPointE0.CREATED_BY RSC_CREATED_BY
,HzContactPointE0.CREATION_DATE RSC_CREATION_DATE
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
,HZ_CUST_ACCOUNTS HzCustAccountsE0
,HZ_PARTY_SITES HzPartySitesE0
,HZ_CUST_ACCT_SITES_ALL HzCustAcctSitesAllE0
,HZ_ORG_CONTACTS HzOrgContactsE0
,HZ_CUST_ACCOUNT_ROLES HzCustAccountRoles
,HZ_CONTACT_POINTS HzContactPointE0
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = HzCustAccountRoles.CUST_ACCOUNT_ID
AND HzCustAcctSitesAllE0.CUST_ACCT_SITE_ID = HzCustAccountRoles.CUST_ACCT_SITE_ID
AND HzPartiesE0.PARTY_ID = HzPartySitesE0.PARTY_ID
AND HzPartySitesE0.PARTY_SITE_ID = HzCustAcctSitesAllE0.PARTY_SITE_ID
AND HzCustAccountRoles.RELATIONSHIP_ID = HzOrgContactsE0.PARTY_RELATIONSHIP_ID
AND HzCustAccountRoles.RELATIONSHIP_ID = HzContactPointE0.RELATIONSHIP_ID
AND HzCustAccountRoles.CONTACT_PERSON_ID = HzContactPointE0.OWNER_TABLE_ID