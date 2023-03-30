/* ****************************************************************************
 * $Revision: 58428 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-09-23 18:27:01 +0700 (Fri, 23 Sep 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/customized/In%20Develop/reverse_sql/Manage%20Units%20of%20Measure%20Profiles%20-%20Profile%20Values.sql $:
 * $Id: Manage Units of Measure Profiles - Profile Values.sql 58428 2016-09-23 11:27:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=EGP_SYSTEM_ITEMS_B
-- STRICTLY_BATCH_SEQ = RES_ITEM_NUMBER,RES_ORGANIZATION_CODE

SELECT /*+ PARALLEL(8) */ 'CREATE' RES_TRANSACTION_TYPE
,'' RES_BATCH_ID
,'' RES_BATCH_NUMBER
,ItemsE0.ITEM_NUMBER RES_ITEM_NUMBER
,(SELECT ORGANIZATION_CODE
	FROM INV_ORG_PARAMETERS
	WHERE ORGANIZATION_ID = ItemsE0.ORGANIZATION_ID
	) RES_ORGANIZATION_CODE
,SupplierPtyEO.PARTY_NAME RES_SUPPLIER_NAME
,(SELECT PARTY_SITE_NAME
	FROM HZ_PARTY_SITES
	WHERE PARTY_ID = supplierEFFE0.SUPPLIER_ID
	AND PARTY_SITE_ID = supplierEFFE0.SUPPLIER_SITE_ID
	) RES_SUPPLIER_ADDRESS_NAME
,'' RES_SOURCE_SYSTEM_CODE
,'' RES_SOURCE_SYSTEM_REFERENCE
,supplierEFFTlE0.CONTEXT_CODE RES_ATTRIBUTE_GROUP_CODE
,supplierEFFTlE0.ATTRIBUTE_CHAR1 RES_ATTRIBUTE_CHAR1
,supplierEFFTlE0.ATTRIBUTE_CHAR2 RES_ATTRIBUTE_CHAR2
,supplierEFFTlE0.ATTRIBUTE_CHAR3 RES_ATTRIBUTE_CHAR3
,supplierEFFTlE0.ATTRIBUTE_CHAR4 RES_ATTRIBUTE_CHAR4
,supplierEFFTlE0.ATTRIBUTE_CHAR5 RES_ATTRIBUTE_CHAR5
,supplierEFFTlE0.ATTRIBUTE_CHAR6 RES_ATTRIBUTE_CHAR6
,supplierEFFTlE0.ATTRIBUTE_CHAR7 RES_ATTRIBUTE_CHAR7
,supplierEFFTlE0.ATTRIBUTE_CHAR8 RES_ATTRIBUTE_CHAR8
,supplierEFFTlE0.ATTRIBUTE_CHAR9 RES_ATTRIBUTE_CHAR9
,supplierEFFTlE0.ATTRIBUTE_CHAR10 RES_ATTRIBUTE_CHAR10
,supplierEFFTlE0.ATTRIBUTE_CHAR11 RES_ATTRIBUTE_CHAR11
,supplierEFFTlE0.ATTRIBUTE_CHAR12 RES_ATTRIBUTE_CHAR12
,supplierEFFTlE0.ATTRIBUTE_CHAR13 RES_ATTRIBUTE_CHAR13
,supplierEFFTlE0.ATTRIBUTE_CHAR14 RES_ATTRIBUTE_CHAR14
,supplierEFFTlE0.ATTRIBUTE_CHAR15 RES_ATTRIBUTE_CHAR15
,supplierEFFTlE0.ATTRIBUTE_CHAR16 RES_ATTRIBUTE_CHAR16
,supplierEFFTlE0.ATTRIBUTE_CHAR17 RES_ATTRIBUTE_CHAR17
,supplierEFFTlE0.ATTRIBUTE_CHAR18 RES_ATTRIBUTE_CHAR18
,supplierEFFTlE0.ATTRIBUTE_CHAR19 RES_ATTRIBUTE_CHAR19
,supplierEFFTlE0.ATTRIBUTE_CHAR20 RES_ATTRIBUTE_CHAR20
,supplierEFFTlE0.ATTRIBUTE_CHAR21 RES_ATTRIBUTE_CHAR21
,supplierEFFTlE0.ATTRIBUTE_CHAR22 RES_ATTRIBUTE_CHAR22
,supplierEFFTlE0.ATTRIBUTE_CHAR23 RES_ATTRIBUTE_CHAR23
,supplierEFFTlE0.ATTRIBUTE_CHAR24 RES_ATTRIBUTE_CHAR24
,supplierEFFTlE0.ATTRIBUTE_CHAR25 RES_ATTRIBUTE_CHAR25
,supplierEFFTlE0.ATTRIBUTE_CHAR26 RES_ATTRIBUTE_CHAR26
,supplierEFFTlE0.ATTRIBUTE_CHAR27 RES_ATTRIBUTE_CHAR27
,supplierEFFTlE0.ATTRIBUTE_CHAR28 RES_ATTRIBUTE_CHAR28
,supplierEFFTlE0.ATTRIBUTE_CHAR29 RES_ATTRIBUTE_CHAR29
,supplierEFFTlE0.ATTRIBUTE_CHAR30 RES_ATTRIBUTE_CHAR30
,supplierEFFTlE0.ATTRIBUTE_CHAR31 RES_ATTRIBUTE_CHAR31
,supplierEFFTlE0.ATTRIBUTE_CHAR32 RES_ATTRIBUTE_CHAR32
,supplierEFFTlE0.ATTRIBUTE_CHAR33 RES_ATTRIBUTE_CHAR33
,supplierEFFTlE0.ATTRIBUTE_CHAR34 RES_ATTRIBUTE_CHAR34
,supplierEFFTlE0.ATTRIBUTE_CHAR35 RES_ATTRIBUTE_CHAR35
,supplierEFFTlE0.ATTRIBUTE_CHAR36 RES_ATTRIBUTE_CHAR36
,supplierEFFTlE0.ATTRIBUTE_CHAR37 RES_ATTRIBUTE_CHAR37
,supplierEFFTlE0.ATTRIBUTE_CHAR38 RES_ATTRIBUTE_CHAR38
,supplierEFFTlE0.ATTRIBUTE_CHAR39 RES_ATTRIBUTE_CHAR39
,supplierEFFTlE0.ATTRIBUTE_CHAR40 RES_ATTRIBUTE_CHAR40
,TO_CHAR(supplierEFFE0.VERSION_START_DATE,'YYYY/MM/DD') RES_VERSION_START_DATE
,(SELECT VERSION_CODE
	FROM EGO_VERSIONS_B
	WHERE VERSION_ID = supplierEFFTlE0.VERSION_ID
	) RES_VERSION_REVISION_CODE
,supplierEFFTlE0.SOURCE_LANG RES_SOURCE_LANGUAGE
,supplierEFFTlE0.LANGUAGE RES_LANGUAGE
,supplierEFFTlE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,supplierEFFTlE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,supplierEFFTlE0.CREATED_BY  RSC_CREATED_BY
,supplierEFFTlE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,ItemsE0.ORGANIZATION_ID RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EGP_SYSTEM_ITEMS_B ItemsE0
,EGO_ITEM_SUPPLIER_EFF_B supplierEFFE0
,HZ_PARTIES SupplierPtyEO
,EGO_ITEM_SUPPLIER_EFF_TL supplierEFFTlE0
WHERE ItemsE0.INVENTORY_ITEM_ID = supplierEFFE0.INVENTORY_ITEM_ID
AND ItemsE0.ORGANIZATION_ID = supplierEFFE0.ORGANIZATION_ID
AND ItemsE0.TEMPLATE_ITEM_FLAG = 'N'
AND ItemsE0.ACD_TYPE = 'PROD'
AND supplierEFFE0.SUPPLIER_ID = SupplierPtyEO.PARTY_ID
AND supplierEFFE0.EFF_LINE_ID = supplierEFFTlE0.EFF_LINE_ID