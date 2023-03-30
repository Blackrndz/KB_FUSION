 /* ****************************************************************************
 * $Revision: 48884 $:
 * $Author: dhara.pithadiya $:
 * $Date: 2015-08-18 14:24:02 +0700 (Tue, 18 Aug 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Transaction%20Types%20-%20Manage%20Transaction%20Types.sql $:
 * $Id: Manage Transaction Types - Manage Transaction Types.sql 48884 2015-08-18 07:24:02Z dhara.pithadiya $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=QP_DISCOUNT_LISTS_TL 
-- RSC_PREREQUISITE_OBJECTS=QP_DISCOUNT_LISTS_ALL_B 
-- RSC_PREREQUISITE_OBJECTS=QP_DISCOUNT_LIST_ITEMS
-- RSC_PREREQUISITE_OBJECTS=QP_PRICING_TERMS_VL
-- RSC_PREREQUISITE_OBJECTS=QP_TIER_HEADERS

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=667##RES##QP_TIER_HEADERS_FLEX
-- DFF_ATTRIBUTES=ATTRIBUTE_CHAR,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

SELECT QpDiscountListsTl.NAME RES_NAME
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_QP_ITEM_LEVELS'
	AND LOOKUP_CODE = QpDiscountListItems.ITEM_LEVEL_CODE
	) RES_ITEM_LEVEL
,(SELECT ITEM_NUMBER
	FROM EGP_SYSTEM_ITEMS_VL
	WHERE INVENTORY_ITEM_ID = QpDiscountListItems.ITEM_ID
	AND INVENTORY_ORGANIZATION_ID = QpDiscountListsAllB.ORG_ID
	) RES_DISCOUNT_LINES_NAME
,(SELECT UNIT_OF_MEASURE
	FROM INV_UNITS_OF_MEASURE_VL
	WHERE UOM_CODE = QpDiscountListItems.PRICING_UOM_CODE
	) RES_PRICING_UOM
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_QP_RETURN_LINE_TYPES'
	AND LOOKUP_CODE = QpDiscountListItems.LINE_TYPE_CODE
	) RES_LINE_TYPE
,QpPricingTermsVl.NAME RES_RULE_NAME
,QpTierHeaders.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,QpTierHeaders.ATTRIBUTE_CHAR1
,QpTierHeaders.ATTRIBUTE_CHAR2
,QpTierHeaders.ATTRIBUTE_CHAR3
,QpTierHeaders.ATTRIBUTE_CHAR4
,QpTierHeaders.ATTRIBUTE_CHAR5
,QpTierHeaders.ATTRIBUTE_CHAR6
,QpTierHeaders.ATTRIBUTE_CHAR7
,QpTierHeaders.ATTRIBUTE_CHAR8
,QpTierHeaders.ATTRIBUTE_CHAR9
,QpTierHeaders.ATTRIBUTE_CHAR10
,QpTierHeaders.ATTRIBUTE_CHAR11
,QpTierHeaders.ATTRIBUTE_CHAR12
,QpTierHeaders.ATTRIBUTE_CHAR13
,QpTierHeaders.ATTRIBUTE_CHAR14
,QpTierHeaders.ATTRIBUTE_CHAR15
,QpTierHeaders.ATTRIBUTE_CHAR16
,QpTierHeaders.ATTRIBUTE_CHAR17
,QpTierHeaders.ATTRIBUTE_CHAR18
,QpTierHeaders.ATTRIBUTE_CHAR19
,QpTierHeaders.ATTRIBUTE_CHAR20
,QpTierHeaders.ATTRIBUTE_NUMBER1
,QpTierHeaders.ATTRIBUTE_NUMBER2
,QpTierHeaders.ATTRIBUTE_NUMBER3
,QpTierHeaders.ATTRIBUTE_NUMBER4
,QpTierHeaders.ATTRIBUTE_NUMBER5
,QpTierHeaders.ATTRIBUTE_NUMBER6
,QpTierHeaders.ATTRIBUTE_NUMBER7
,QpTierHeaders.ATTRIBUTE_NUMBER8
,QpTierHeaders.ATTRIBUTE_NUMBER9
,QpTierHeaders.ATTRIBUTE_NUMBER10
,TO_CHAR(QpTierHeaders.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(QpTierHeaders.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(QpTierHeaders.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(QpTierHeaders.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(QpTierHeaders.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,TO_CHAR(QpTierHeaders.ATTRIBUTE_TIMESTAMP1,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP1
,TO_CHAR(QpTierHeaders.ATTRIBUTE_TIMESTAMP2,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP2
,TO_CHAR(QpTierHeaders.ATTRIBUTE_TIMESTAMP3,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP3
,TO_CHAR(QpTierHeaders.ATTRIBUTE_TIMESTAMP4,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP4
,TO_CHAR(QpTierHeaders.ATTRIBUTE_TIMESTAMP5,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP5
,QpTierHeaders.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,QpTierHeaders.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,QpTierHeaders.CREATED_BY  RSC_CREATED_BY
,QpTierHeaders.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,QpDiscountListsAllB.ORG_ID RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM QP_DISCOUNT_LISTS_TL QpDiscountListsTl
,QP_DISCOUNT_LISTS_ALL_B QpDiscountListsAllB
,QP_DISCOUNT_LIST_ITEMS QpDiscountListItems
,QP_PRICING_TERMS_VL QpPricingTermsVl
,QP_TIER_HEADERS QpTierHeaders
WHERE QpDiscountListsTl.DISCOUNT_LIST_ID = QpDiscountListsAllB.DISCOUNT_LIST_ID
AND QpDiscountListsTl.DISCOUNT_LIST_ID = QpDiscountListItems.DISCOUNT_LIST_ID
AND QpDiscountListItems.DISCOUNT_LIST_ITEM_ID = QpPricingTermsVl.PARENT_ENTITY_KEY_COLUMN1
AND QpPricingTermsVl.PRICING_RULE_TYPE_CODE = 'TIERED_PRICING'
AND QpPricingTermsVl.TIERED_PRICING_HEADER_ID = QpTierHeaders.TIERED_PRICING_HEADER_ID
AND QpDiscountListsTl.LANGUAGE = USERENV('LANG')
AND (QpTierHeaders.ATTRIBUTE_CATEGORY IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR1 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR2 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR3 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR4 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR5 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR6 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR7 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR8 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR9 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR10 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR11 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR12 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR13 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR14 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR15 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR16 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR17 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR18 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR19 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_CHAR20 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER1 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER2 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER3 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER4 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER5 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER6 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER7 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER8 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER9 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_NUMBER10 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_DATE1 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_DATE2 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_DATE3 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_DATE4 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_DATE5 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_TIMESTAMP1 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_TIMESTAMP2 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_TIMESTAMP3 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_TIMESTAMP4 IS NOT NULL
OR QpTierHeaders.ATTRIBUTE_TIMESTAMP5 IS NOT NULL)
ORDER BY QpDiscountListsTl.NAME
,RES_ITEM_LEVEL
,RES_DISCOUNT_LINES_NAME
,QpPricingTermsVl.NAME