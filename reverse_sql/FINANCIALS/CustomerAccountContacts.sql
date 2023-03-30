/* ****************************************************************************
 * $Revision: 56649 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2016-07-12 11:20:44 +0700 (Tue, 12 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/branches/core/v2.2.0.0/reverse_sql/FINANCIALS/Currency%20Rates%20Manager%20-%20Rate%20Types.sql $:
 * $Id: Currency Rates Manager - Rate Types.sql 56649 2016-07-12 04:20:44Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- STRICTLY_BATCH_SEQ = RES_ACCOUNT_CONTACT_SOURCE_S_2

SELECT '' RES_BATCH_IDENTIFIER
,'CUSTOMER' RES_CUSTOMER_ACCOUNT_SOURCE_SY
,HzCustAccountsE0.ACCOUNT_NUMBER RES_CUSTOMER_ACCOUNT_SOURCE__0
,'CUSTOMER' RES_ACCOUNT_SITE_SOURCE_SYSTEM
,HzPartySitesE0.PARTY_SITE_NUMBER RES_ACCOUNT_SITE_SOURCE_SYST_1
,'CUSTOMER' RES_ACCOUNT_CONTACT_SOURCE_SYS
,HzCustAccountRolesE0.CUST_ACCOUNT_ROLE_ID RES_ACCOUNT_CONTACT_SOURCE_S_2
,HzCustAccountRolesE0.ROLE_TYPE RES_ROLE_TYPE
,HzCustAccountRolesE0.PRIMARY_FLAG RES_PRIMARY_INDICATOR
,'I' RES_INSERT_UPDATE_INDICATOR
,HzCustAccountRolesE0.SOURCE_CODE RES_SOURCE_CODE
,HzCustAccountRolesE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzCustAccountRolesE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzCustAccountRolesE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzCustAccountRolesE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzCustAccountRolesE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzCustAccountRolesE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzCustAccountRolesE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzCustAccountRolesE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzCustAccountRolesE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzCustAccountRolesE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzCustAccountRolesE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzCustAccountRolesE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzCustAccountRolesE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzCustAccountRolesE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzCustAccountRolesE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzCustAccountRolesE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzCustAccountRolesE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzCustAccountRolesE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzCustAccountRolesE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzCustAccountRolesE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzCustAccountRolesE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzCustAccountRolesE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzCustAccountRolesE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzCustAccountRolesE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzCustAccountRolesE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzCustAccountRolesE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzCustAccountRolesE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzCustAccountRolesE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzCustAccountRolesE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_29
,HzCustAccountRolesE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_30
,HzCustAccountRolesE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_31
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER1 RES_DESCRIPTIVE_FLEXFIELD_NUMB
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER2 RES_DESCRIPTIVE_FLEXFIELD_N_32
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER3 RES_DESCRIPTIVE_FLEXFIELD_N_33
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER4 RES_DESCRIPTIVE_FLEXFIELD_N_34
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER5 RES_DESCRIPTIVE_FLEXFIELD_N_35
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER6 RES_DESCRIPTIVE_FLEXFIELD_N_36
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER7 RES_DESCRIPTIVE_FLEXFIELD_N_37
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER8 RES_DESCRIPTIVE_FLEXFIELD_N_38
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER9 RES_DESCRIPTIVE_FLEXFIELD_N_39
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER10 RES_DESCRIPTIVE_FLEXFIELD_N_40
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER11 RES_DESCRIPTIVE_FLEXFIELD_N_41
,HzCustAccountRolesE0.ATTRIBUTE_NUMBER12 RES_DESCRIPTIVE_FLEXFIELD_N_42
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE1,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_DATE
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE2,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_43
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE3,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_44
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE4,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_45
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE5,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_46
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE6,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_47
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE7,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_48
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE8,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_49
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE9,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_50
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE10,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_51
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE11,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_52
,TO_CHAR(HzCustAccountRolesE0.ATTRIBUTE_DATE12,'YYYY/MM/DD') RES_DESCRIPTIVE_FLEXFIELD_D_53
,'' RES_RELATIONSHIP_SOURCE_SYSTEM
,'' RES_RELATIONSHIP_SOURCE_SYS_54
,HzCustAccountRolesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzCustAccountRolesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzCustAccountRolesE0.CREATED_BY RSC_CREATED_BY
,HzCustAccountRolesE0.CREATION_DATE RSC_CREATION_DATE
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
,HZ_PARTY_SITES HzPartySitesE0
,HZ_CUST_ACCOUNTS HzCustAccountsE0
,HZ_CUST_ACCOUNT_ROLES HzCustAccountRolesE0
,HZ_CUST_ACCT_SITES_ALL HzCustAcctSitesAllE0
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID
AND HzPartiesE0.PARTY_ID = HzPartySitesE0.PARTY_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = HzCustAccountRolesE0.CUST_ACCOUNT_ID
AND HzPartySitesE0.PARTY_SITE_ID = HzCustAcctSitesAllE0.PARTY_SITE_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = HzCustAcctSitesAllE0.CUST_ACCOUNT_ID