/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=707##RES##CST_ITEM_COST_PROFILES
-- DFF_ATTRIBUTES=ATTRIBUTE_CHAR,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.

SELECT (SELECT COST_ORG_NAME
	FROM CST_COST_ORGS_V
	WHERE COST_ORG_ID =  ItemCostProfilesE0.COST_ORG_ID
	) RES_COST_ORGANIZATION
,(SELECT COST_BOOK_CODE
	FROM CST_COST_BOOKS_B
	WHERE COST_BOOK_ID = ItemCostProfilesE0.COST_BOOK_ID
	) RES_COST_BOOK
,(SELECT ITEM_NUMBER
	FROM EGP_SYSTEM_ITEMS_VL
	WHERE INVENTORY_ITEM_ID = ItemCostProfilesE0.INVENTORY_ITEM_ID
	AND ORGANIZATION_ID = ItemCostProfilesE0.INV_ORG_ID
	) RES_ITEM
,ItemCostProfilesE0.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,ItemCostProfilesE0.ATTRIBUTE_CHAR1
,ItemCostProfilesE0.ATTRIBUTE_CHAR2
,ItemCostProfilesE0.ATTRIBUTE_CHAR3
,ItemCostProfilesE0.ATTRIBUTE_CHAR4
,ItemCostProfilesE0.ATTRIBUTE_CHAR5
,ItemCostProfilesE0.ATTRIBUTE_CHAR6
,ItemCostProfilesE0.ATTRIBUTE_CHAR7
,ItemCostProfilesE0.ATTRIBUTE_CHAR8
,ItemCostProfilesE0.ATTRIBUTE_CHAR9
,ItemCostProfilesE0.ATTRIBUTE_CHAR10
,ItemCostProfilesE0.ATTRIBUTE_CHAR11
,ItemCostProfilesE0.ATTRIBUTE_CHAR12
,ItemCostProfilesE0.ATTRIBUTE_CHAR13
,ItemCostProfilesE0.ATTRIBUTE_CHAR14
,ItemCostProfilesE0.ATTRIBUTE_CHAR15
,ItemCostProfilesE0.ATTRIBUTE_CHAR16
,ItemCostProfilesE0.ATTRIBUTE_CHAR17
,ItemCostProfilesE0.ATTRIBUTE_CHAR18
,ItemCostProfilesE0.ATTRIBUTE_CHAR19
,ItemCostProfilesE0.ATTRIBUTE_CHAR20
,ItemCostProfilesE0.ATTRIBUTE_NUMBER1
,ItemCostProfilesE0.ATTRIBUTE_NUMBER2
,ItemCostProfilesE0.ATTRIBUTE_NUMBER3
,ItemCostProfilesE0.ATTRIBUTE_NUMBER4
,ItemCostProfilesE0.ATTRIBUTE_NUMBER5
,ItemCostProfilesE0.ATTRIBUTE_NUMBER6
,ItemCostProfilesE0.ATTRIBUTE_NUMBER7
,ItemCostProfilesE0.ATTRIBUTE_NUMBER8
,ItemCostProfilesE0.ATTRIBUTE_NUMBER9
,ItemCostProfilesE0.ATTRIBUTE_NUMBER10
,TO_CHAR(ItemCostProfilesE0.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(ItemCostProfilesE0.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(ItemCostProfilesE0.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(ItemCostProfilesE0.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(ItemCostProfilesE0.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP1
,ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP2
,ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP3
,ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP4
,ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP5
,ItemCostProfilesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ItemCostProfilesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ItemCostProfilesE0.CREATED_BY RSC_CREATED_BY
,ItemCostProfilesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,ItemCostProfilesE0.COST_ORG_ID RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CST_ITEM_COST_PROFILES ItemCostProfilesE0
WHERE (ItemCostProfilesE0.ATTRIBUTE_CATEGORY IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR1 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR2 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR3 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR4 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR5 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR6 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR7 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR8 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR9 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR10 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR11 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR12 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR13 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR14 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR15 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR16 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR17 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR18 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR19 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_CHAR20 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER1 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER2 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER3 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER4 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER5 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER6 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER7 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER8 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER9 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_NUMBER10 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_DATE1 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_DATE2 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_DATE3 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_DATE4 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_DATE5 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP1 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP2 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP3 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP4 IS NOT NULL
OR ItemCostProfilesE0.ATTRIBUTE_TIMESTAMP5 IS NOT NULL)
ORDER BY 1,2,3