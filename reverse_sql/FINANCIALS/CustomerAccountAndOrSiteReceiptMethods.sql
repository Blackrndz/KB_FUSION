/* ****************************************************************************
 * $Revision: 56649 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2016-07-12 11:20:44 +0700 (Tue, 12 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/branches/core/v2.2.0.0/reverse_sql/FINANCIALS/Currency%20Rates%20Manager%20-%20Rate%20Types.sql $:
 * $Id: Currency Rates Manager - Rate Types.sql 56649 2016-07-12 04:20:44Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- STRICTLY_BATCH_SEQ = RES_CUSTOMER_ACCOUNT_SOURCE__0,RES_ACCOUNT_SITE_SOURCE_SYST_1,RES_RECEIPT_METHOD

-- Account Level
SELECT 'CUSTOMER' RES_CUSTOMER_ACCOUNT_SOURCE_SY
,HzCustAccountsE0.ACCOUNT_NUMBER RES_CUSTOMER_ACCOUNT_SOURCE__0
,(SELECT NAME
	FROM AR_RECEIPT_METHODS
	WHERE RECEIPT_METHOD_ID = RaCustReceiptMethodE0.RECEIPT_METHOD_ID
	) RES_RECEIPT_METHOD
,RaCustReceiptMethodE0.PRIMARY_FLAG RES_PRIMARY_INDICATOR
,'' RES_ACCOUNT_SITE_SOURCE_SYSTEM
,'' RES_ACCOUNT_SITE_SOURCE_SYST_1
,TO_CHAR(RaCustReceiptMethodE0.START_DATE,'YYYY/MM/DD') RES_START_DATE
,DECODE(TO_CHAR(RaCustReceiptMethodE0.END_DATE,'YYYY/MM/DD'),'4712/12/31',NULL,TO_CHAR(RaCustReceiptMethodE0.END_DATE,'YYYY/MM/DD')) RES_END_DATE
,'' RES_BATCH_IDENTIFIER
,RaCustReceiptMethodE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,RaCustReceiptMethodE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,RaCustReceiptMethodE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,RaCustReceiptMethodE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,RaCustReceiptMethodE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,RaCustReceiptMethodE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,RaCustReceiptMethodE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,RaCustReceiptMethodE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,RaCustReceiptMethodE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,RaCustReceiptMethodE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,RaCustReceiptMethodE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_S_10
,RaCustReceiptMethodE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_S_11
,RaCustReceiptMethodE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_12
,RaCustReceiptMethodE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_13
,RaCustReceiptMethodE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_14
,RaCustReceiptMethodE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_15
,'' RES_ORGANIZATION_ID
,RaCustReceiptMethodE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,RaCustReceiptMethodE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,RaCustReceiptMethodE0.CREATED_BY RSC_CREATED_BY
,RaCustReceiptMethodE0.CREATION_DATE RSC_CREATION_DATE
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
,RA_CUST_RECEIPT_METHODS RaCustReceiptMethodE0
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = RaCustReceiptMethodE0.CUSTOMER_ID
AND RaCustReceiptMethodE0.SITE_USE_ID IS NULL

UNION 

-- Account Site Level
SELECT 'CUSTOMER' RES_CUSTOMER_ACCOUNT_SOURCE_SY
,HzCustAccountsE0.ACCOUNT_NUMBER RES_CUSTOMER_ACCOUNT_SOURCE__0
,(SELECT NAME
	FROM AR_RECEIPT_METHODS
	WHERE RECEIPT_METHOD_ID = RaCustReceiptMethodE0.RECEIPT_METHOD_ID
	) RES_RECEIPT_METHOD
,RaCustReceiptMethodE0.PRIMARY_FLAG RES_PRIMARY_INDICATOR
,'CUSTOMER' RES_ACCOUNT_SITE_SOURCE_SYSTEM
,HzPartySitesE0.PARTY_SITE_NUMBER RES_ACCOUNT_SITE_SOURCE_SYST_1
,TO_CHAR(RaCustReceiptMethodE0.START_DATE,'YYYY/MM/DD') RES_START_DATE
,DECODE(TO_CHAR(RaCustReceiptMethodE0.END_DATE,'YYYY/MM/DD'),'4712/12/31',NULL,TO_CHAR(RaCustReceiptMethodE0.END_DATE,'YYYY/MM/DD')) RES_END_DATE
,'' RES_BATCH_IDENTIFIER
,RaCustReceiptMethodE0.ATTRIBUTE_CATEGORY RES_USER_DEFINED_CONTEXT_PROMP
,RaCustReceiptMethodE0.ATTRIBUTE1 RES_DESCRIPTIVE_FLEXFIELD_SEGM
,RaCustReceiptMethodE0.ATTRIBUTE2 RES_DESCRIPTIVE_FLEXFIELD_SE_2
,RaCustReceiptMethodE0.ATTRIBUTE3 RES_DESCRIPTIVE_FLEXFIELD_SE_3
,RaCustReceiptMethodE0.ATTRIBUTE4 RES_DESCRIPTIVE_FLEXFIELD_SE_4
,RaCustReceiptMethodE0.ATTRIBUTE5 RES_DESCRIPTIVE_FLEXFIELD_SE_5
,RaCustReceiptMethodE0.ATTRIBUTE6 RES_DESCRIPTIVE_FLEXFIELD_SE_6
,RaCustReceiptMethodE0.ATTRIBUTE7 RES_DESCRIPTIVE_FLEXFIELD_SE_7
,RaCustReceiptMethodE0.ATTRIBUTE8 RES_DESCRIPTIVE_FLEXFIELD_SE_8
,RaCustReceiptMethodE0.ATTRIBUTE9 RES_DESCRIPTIVE_FLEXFIELD_SE_9
,RaCustReceiptMethodE0.ATTRIBUTE10 RES_DESCRIPTIVE_FLEXFIELD_S_10
,RaCustReceiptMethodE0.ATTRIBUTE11 RES_DESCRIPTIVE_FLEXFIELD_S_11
,RaCustReceiptMethodE0.ATTRIBUTE12 RES_DESCRIPTIVE_FLEXFIELD_S_12
,RaCustReceiptMethodE0.ATTRIBUTE13 RES_DESCRIPTIVE_FLEXFIELD_S_13
,RaCustReceiptMethodE0.ATTRIBUTE14 RES_DESCRIPTIVE_FLEXFIELD_S_14
,RaCustReceiptMethodE0.ATTRIBUTE15 RES_DESCRIPTIVE_FLEXFIELD_S_15
,buE0.BU_NAME RES_ORGANIZATION_ID
,RaCustReceiptMethodE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,RaCustReceiptMethodE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,RaCustReceiptMethodE0.CREATED_BY RSC_CREATED_BY
,RaCustReceiptMethodE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,buE0.BU_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HZ_PARTIES HzPartiesE0
,HZ_PARTY_USG_ASSIGNMENTS HzPartyUsgAssignmentsE0
,HZ_PARTY_SITES HzPartySitesE0
,HZ_CUST_ACCOUNTS HzCustAccountsE0
,RA_CUST_RECEIPT_METHODS RaCustReceiptMethodE0
,HZ_CUST_ACCT_SITES_ALL HzCustAcctSitesAllE0
,HZ_CUST_SITE_USES_ALL HzCustSiteUsesAllE0
,FUN_ALL_BUSINESS_UNITS_V buE0
WHERE HzPartiesE0.PARTY_ID = HzPartyUsgAssignmentsE0.PARTY_ID
AND HzPartyUsgAssignmentsE0.PARTY_USAGE_CODE = 'CUSTOMER'
AND HzPartiesE0.PARTY_ID = HzCustAccountsE0.PARTY_ID
AND HzPartiesE0.PARTY_ID = HzPartySitesE0.PARTY_ID
AND HzPartySitesE0.PARTY_SITE_ID = HzCustAcctSitesAllE0.PARTY_SITE_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = RaCustReceiptMethodE0.CUSTOMER_ID
AND HzCustAccountsE0.CUST_ACCOUNT_ID = HzCustAcctSitesAllE0.CUST_ACCOUNT_ID
AND HzCustAcctSitesAllE0.CUST_ACCT_SITE_ID = HzCustSiteUsesAllE0.CUST_ACCT_SITE_ID
AND HzCustSiteUsesAllE0.SITE_USE_ID = RaCustReceiptMethodE0.SITE_USE_ID
AND HzCustSiteUsesAllE0.STATUS = 'A'
AND HzCustAcctSitesAllE0.SET_ID = buE0.DEFAULT_SET_ID(+)