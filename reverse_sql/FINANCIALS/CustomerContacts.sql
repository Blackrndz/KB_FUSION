/* ****************************************************************************
 * $Revision: 56649 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2016-07-12 11:20:44 +0700 (Tue, 12 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/branches/core/v2.2.0.0/reverse_sql/FINANCIALS/Currency%20Rates%20Manager%20-%20Rate%20Types.sql $:
 * $Id: Currency Rates Manager - Rate Types.sql 56649 2016-07-12 04:20:44Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- STRICTLY_BATCH_SEQ = RES_CONTACT_NUMBER

SELECT '' RES_BATCH_IDENTIFIER
,'I' RES_INSERT_UPDATE_INDICATOR
,HzOrgContactsE0.CONTACT_NUMBER RES_CONTACT_NUMBER
,HzOrgContactsE0.DEPARTMENT_CODE RES_DEPARTMENT_CODE
,HzOrgContactsE0.DEPARTMENT RES_DEPARTMENT_NAME
,HzOrgContactsE0.JOB_TITLE RES_JOB_TITLE
,HzOrgContactsE0.JOB_TITLE_CODE RES_JOB_TITLE_CODE
,HzOrgContactsE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzOrgContactsE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzOrgContactsE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_0
,HzOrgContactsE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_1
,HzOrgContactsE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,HzOrgContactsE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzOrgContactsE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzOrgContactsE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzOrgContactsE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzOrgContactsE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzOrgContactsE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzOrgContactsE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzOrgContactsE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzOrgContactsE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzOrgContactsE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzOrgContactsE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzOrgContactsE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzOrgContactsE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzOrgContactsE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzOrgContactsE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzOrgContactsE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzOrgContactsE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzOrgContactsE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzOrgContactsE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzOrgContactsE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzOrgContactsE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzOrgContactsE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzOrgContactsE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzOrgContactsE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzOrgContactsE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzOrgContactsE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzOrgContactsE0.ATTRIBUTE_NUMBER1 RES_DESCRIPTIVE_FLEXFIELD_NUMB
,HzOrgContactsE0.ATTRIBUTE_NUMBER2 RES_DESCRIPTIVE_FLEXFIELD_N_29
,HzOrgContactsE0.ATTRIBUTE_NUMBER3 RES_DESCRIPTIVE_FLEXFIELD_N_30
,HzOrgContactsE0.ATTRIBUTE_NUMBER4 RES_DESCRIPTIVE_FLEXFIELD_N_31
,HzOrgContactsE0.ATTRIBUTE_NUMBER5 RES_DESCRIPTIVE_FLEXFIELD_N_32
,HzOrgContactsE0.ATTRIBUTE_NUMBER6 RES_DESCRIPTIVE_FLEXFIELD_N_33
,HzOrgContactsE0.ATTRIBUTE_NUMBER7 RES_DESCRIPTIVE_FLEXFIELD_N_34
,HzOrgContactsE0.ATTRIBUTE_NUMBER8 RES_DESCRIPTIVE_FLEXFIELD_N_35
,HzOrgContactsE0.ATTRIBUTE_NUMBER9 RES_DESCRIPTIVE_FLEXFIELD_N_36
,HzOrgContactsE0.ATTRIBUTE_NUMBER10 RES_DESCRIPTIVE_FLEXFIELD_N_37
,HzOrgContactsE0.ATTRIBUTE_NUMBER11 RES_DESCRIPTIVE_FLEXFIELD_N_38
,HzOrgContactsE0.ATTRIBUTE_NUMBER12 RES_DESCRIPTIVE_FLEXFIELD_N_39
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE1,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_DATE
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE2,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_40
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE3,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_41
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE4,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_42
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE5,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_43
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE6,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_44
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE7,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_45
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE8,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_46
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE9,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_47
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE10,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_48
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE11,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_49
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE12,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_50
,'' RES_RELATIONSHIP_SOURCE_SYSTEM
,'' RES_RELATIONSHIP_SOURCE_SYS_51
,'' RES_PARTY_SITE_ORIGINAL_SYSTEM
,'' RES_PARTY_SITE_ORIGINAL_SYS_52
,HzOrgContactsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzOrgContactsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzOrgContactsE0.CREATED_BY RSC_CREATED_BY
,HzOrgContactsE0.CREATION_DATE RSC_CREATION_DATE
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
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = HzCustAccountRoles.CUST_ACCOUNT_ID
AND HzCustAccountRoles.CUST_ACCT_SITE_ID IS NULL
AND HzCustAccountRoles.RELATIONSHIP_ID = HzOrgContactsE0.PARTY_RELATIONSHIP_ID

UNION

SELECT '' RES_BATCH_IDENTIFIER
,'I' RES_INSERT_UPDATE_INDICATOR
,HzOrgContactsE0.CONTACT_NUMBER RES_CONTACT_NUMBER
,HzOrgContactsE0.DEPARTMENT_CODE RES_DEPARTMENT_CODE
,HzOrgContactsE0.DEPARTMENT RES_DEPARTMENT_NAME
,HzOrgContactsE0.JOB_TITLE RES_JOB_TITLE
,HzOrgContactsE0.JOB_TITLE_CODE RES_JOB_TITLE_CODE
,HzOrgContactsE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzOrgContactsE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzOrgContactsE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_0
,HzOrgContactsE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_1
,HzOrgContactsE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,HzOrgContactsE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzOrgContactsE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzOrgContactsE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzOrgContactsE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzOrgContactsE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzOrgContactsE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzOrgContactsE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzOrgContactsE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzOrgContactsE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzOrgContactsE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzOrgContactsE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzOrgContactsE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzOrgContactsE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzOrgContactsE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzOrgContactsE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzOrgContactsE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzOrgContactsE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzOrgContactsE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzOrgContactsE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzOrgContactsE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzOrgContactsE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzOrgContactsE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzOrgContactsE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzOrgContactsE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzOrgContactsE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzOrgContactsE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzOrgContactsE0.ATTRIBUTE_NUMBER1 RES_DESCRIPTIVE_FLEXFIELD_NUMB
,HzOrgContactsE0.ATTRIBUTE_NUMBER2 RES_DESCRIPTIVE_FLEXFIELD_N_29
,HzOrgContactsE0.ATTRIBUTE_NUMBER3 RES_DESCRIPTIVE_FLEXFIELD_N_30
,HzOrgContactsE0.ATTRIBUTE_NUMBER4 RES_DESCRIPTIVE_FLEXFIELD_N_31
,HzOrgContactsE0.ATTRIBUTE_NUMBER5 RES_DESCRIPTIVE_FLEXFIELD_N_32
,HzOrgContactsE0.ATTRIBUTE_NUMBER6 RES_DESCRIPTIVE_FLEXFIELD_N_33
,HzOrgContactsE0.ATTRIBUTE_NUMBER7 RES_DESCRIPTIVE_FLEXFIELD_N_34
,HzOrgContactsE0.ATTRIBUTE_NUMBER8 RES_DESCRIPTIVE_FLEXFIELD_N_35
,HzOrgContactsE0.ATTRIBUTE_NUMBER9 RES_DESCRIPTIVE_FLEXFIELD_N_36
,HzOrgContactsE0.ATTRIBUTE_NUMBER10 RES_DESCRIPTIVE_FLEXFIELD_N_37
,HzOrgContactsE0.ATTRIBUTE_NUMBER11 RES_DESCRIPTIVE_FLEXFIELD_N_38
,HzOrgContactsE0.ATTRIBUTE_NUMBER12 RES_DESCRIPTIVE_FLEXFIELD_N_39
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE1,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_DATE
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE2,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_40
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE3,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_41
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE4,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_42
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE5,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_43
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE6,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_44
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE7,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_45
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE8,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_46
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE9,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_47
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE10,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_48
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE11,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_49
,TO_CHAR(HzOrgContactsE0.ATTRIBUTE_DATE12,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_50
,'' RES_RELATIONSHIP_SOURCE_SYSTEM
,'' RES_RELATIONSHIP_SOURCE_SYS_51
,'CUSTOMER' RES_PARTY_SITE_ORIGINAL_SYSTEM
,HzPartySitesE0.PARTY_SITE_NUMBER RES_PARTY_SITE_ORIGINAL_SYS_52
,HzOrgContactsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzOrgContactsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzOrgContactsE0.CREATED_BY RSC_CREATED_BY
,HzOrgContactsE0.CREATION_DATE RSC_CREATION_DATE
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
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID
AND HzPartiesE0.PARTY_ID = HzPartySitesE0.PARTY_ID
AND HzPartySitesE0.PARTY_SITE_ID = HzCustAcctSitesAllE0.PARTY_SITE_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = HzCustAccountRoles.CUST_ACCOUNT_ID
AND HzCustAcctSitesAllE0.CUST_ACCT_SITE_ID = HzCustAccountRoles.CUST_ACCT_SITE_ID
AND HzCustAccountRoles.RELATIONSHIP_ID = HzOrgContactsE0.PARTY_RELATIONSHIP_ID