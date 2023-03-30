/* ****************************************************************************
 * $Revision: 56649 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2016-07-12 11:20:44 +0700 (Tue, 12 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/branches/core/v2.2.0.0/reverse_sql/FINANCIALS/Currency%20Rates%20Manager%20-%20Rate%20Types.sql $:
 * $Id: Currency Rates Manager - Rate Types.sql 56649 2016-07-12 04:20:44Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- STRICTLY_BATCH_SEQ = RES_ACCOUNT_NUMBER

SELECT '' RES_BATCH_IDENTIFIER
,'CUSTOMER' RES_CUSTOMER_ACCOUNT_SOURCE_SY
,HzCustAccountsE0.ACCOUNT_NUMBER RES_CUSTOMER_ACCOUNT_SOURCE__0
,'CUSTOMER' RES_PARTY_ORIGINAL_SYSTEM
,HzPartiesE0.PARTY_NUMBER RES_PARTY_ORIGINAL_SYSTEM_REFE
,HzCustAccountsE0.ACCOUNT_NUMBER RES_ACCOUNT_NUMBER
,'I' RES_INSERT_UPDATE_INDICATOR
,HzCustAccountsE0.CUSTOMER_TYPE RES_ACCOUNT_TYPE
,HzCustAccountsE0.CUSTOMER_CLASS_CODE RES_CUSTOMER_CLASS
,HzCustAccountsE0.ACCOUNT_NAME RES_ACCOUNT_DESCRIPTION
,TO_CHAR(HzCustAccountsE0.ACCOUNT_ESTABLISHED_DATE,'YYYY/MM/DD') RES_ACCOUNT_ESTABLISHED_DATE
,HzCustAccountsE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,HzCustAccountsE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,HzCustAccountsE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_1
,HzCustAccountsE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,HzCustAccountsE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,HzCustAccountsE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,HzCustAccountsE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,HzCustAccountsE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,HzCustAccountsE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,HzCustAccountsE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,HzCustAccountsE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,HzCustAccountsE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_S_10
,HzCustAccountsE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_11
,HzCustAccountsE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_12
,HzCustAccountsE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_13
,HzCustAccountsE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_14
,HzCustAccountsE0.ATTRIBUTE16 RES_DESCRIPTIVE_FLEXFIELD_S_15
,HzCustAccountsE0.ATTRIBUTE17 RES_DESCRIPTIVE_FLEXFIELD_S_16
,HzCustAccountsE0.ATTRIBUTE18 RES_DESCRIPTIVE_FLEXFIELD_S_17
,HzCustAccountsE0.ATTRIBUTE19 RES_DESCRIPTIVE_FLEXFIELD_S_18
,HzCustAccountsE0.ATTRIBUTE20 RES_DESCRIPTIVE_FLEXFIELD_S_19
,HzCustAccountsE0.ATTRIBUTE21 RES_DESCRIPTIVE_FLEXFIELD_S_20
,HzCustAccountsE0.ATTRIBUTE22 RES_DESCRIPTIVE_FLEXFIELD_S_21
,HzCustAccountsE0.ATTRIBUTE23 RES_DESCRIPTIVE_FLEXFIELD_S_22
,HzCustAccountsE0.ATTRIBUTE24 RES_DESCRIPTIVE_FLEXFIELD_S_23
,HzCustAccountsE0.ATTRIBUTE25 RES_DESCRIPTIVE_FLEXFIELD_S_24
,HzCustAccountsE0.ATTRIBUTE26 RES_DESCRIPTIVE_FLEXFIELD_S_25
,HzCustAccountsE0.ATTRIBUTE27 RES_DESCRIPTIVE_FLEXFIELD_S_26
,HzCustAccountsE0.ATTRIBUTE28 RES_DESCRIPTIVE_FLEXFIELD_S_27
,HzCustAccountsE0.ATTRIBUTE29 RES_DESCRIPTIVE_FLEXFIELD_S_28
,HzCustAccountsE0.ATTRIBUTE30 RES_DESCRIPTIVE_FLEXFIELD_S_29
,DECODE(TO_CHAR(HzCustAccountsE0.ACCOUNT_TERMINATION_DATE,'YYYY/MM/DD'),'4712/12/31',NULL,TO_CHAR(HzCustAccountsE0.ACCOUNT_TERMINATION_DATE,'YYYY/MM/DD')) RES_ACCOUNT_TERMINATION_DATE
,HzCustAccountsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HzCustAccountsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HzCustAccountsE0.CREATED_BY RSC_CREATED_BY
,HzCustAccountsE0.CREATION_DATE RSC_CREATION_DATE
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
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID