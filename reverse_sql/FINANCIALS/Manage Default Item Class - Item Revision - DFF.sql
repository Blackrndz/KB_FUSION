/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Default%20Item%20Class%20-%20Item%20Revision%20-%20DFF.sql $:
 * $Id: Manage Default Item Class - Item Revision - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10011##RES##EGP_ITEM_REVISIONS_DFF
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.

SELECT ItemClassPEO.ITEM_CLASS_CODE RES_INTERNAL_NAME
,ItemVersionEO.TEMPLATE_NAME RES_NAME
,(SELECT ORGANIZATION_CODE
	FROM INV_ORG_PARAMETERS
	WHERE ORGANIZATION_ID = ItemVersionEO.ORGANIZATION_ID
	) RES_ORGANIZATION
,ItemRevisionEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,ItemRevisionEO.ATTRIBUTE1
,ItemRevisionEO.ATTRIBUTE2
,ItemRevisionEO.ATTRIBUTE3
,ItemRevisionEO.ATTRIBUTE4
,ItemRevisionEO.ATTRIBUTE5
,ItemRevisionEO.ATTRIBUTE6
,ItemRevisionEO.ATTRIBUTE7
,ItemRevisionEO.ATTRIBUTE8
,ItemRevisionEO.ATTRIBUTE9
,ItemRevisionEO.ATTRIBUTE10
,ItemRevisionEO.ATTRIBUTE11
,ItemRevisionEO.ATTRIBUTE12
,ItemRevisionEO.ATTRIBUTE13
,ItemRevisionEO.ATTRIBUTE14
,ItemRevisionEO.ATTRIBUTE15
,ItemRevisionEO.ATTRIBUTE_NUMBER1
,ItemRevisionEO.ATTRIBUTE_NUMBER2
,ItemRevisionEO.ATTRIBUTE_NUMBER3
,ItemRevisionEO.ATTRIBUTE_NUMBER4
,ItemRevisionEO.ATTRIBUTE_NUMBER5
,ItemRevisionEO.ATTRIBUTE_NUMBER6
,ItemRevisionEO.ATTRIBUTE_NUMBER7
,ItemRevisionEO.ATTRIBUTE_NUMBER8
,ItemRevisionEO.ATTRIBUTE_NUMBER9
,ItemRevisionEO.ATTRIBUTE_NUMBER10
,TO_CHAR(ItemRevisionEO.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(ItemRevisionEO.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(ItemRevisionEO.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(ItemRevisionEO.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(ItemRevisionEO.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,ItemRevisionEO.ATTRIBUTE_TIMESTAMP1
,ItemRevisionEO.ATTRIBUTE_TIMESTAMP2
,ItemRevisionEO.ATTRIBUTE_TIMESTAMP3
,ItemRevisionEO.ATTRIBUTE_TIMESTAMP4
,ItemRevisionEO.ATTRIBUTE_TIMESTAMP5
,ItemRevisionEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ItemRevisionEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ItemRevisionEO.CREATED_BY RSC_CREATED_BY
,ItemRevisionEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,ItemVersionEO.ORGANIZATION_ID RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EGP_ITEM_CLASSES_VL ItemClassPEO
,EGP_SYSTEM_ITEMS_V ItemVersionEO
,EGP_ITEM_REVISIONS_VL ItemRevisionEO
WHERE ItemClassPEO.PARENT_ITEM_CLASS_ID NOT IN (SELECT ITEM_CLASS_ID FROM EGP_ITEM_CLASSES_VL)
AND ItemVersionEO.TEMPLATE_NAME IS NOT NULL
AND ItemClassPEO.ITEM_CLASS_ID = ItemVersionEO.ITEM_CATALOG_GROUP_ID
AND ItemVersionEO.INVENTORY_ITEM_ID = ItemRevisionEO.INVENTORY_ITEM_ID
AND(ItemRevisionEO.ATTRIBUTE_CATEGORY  IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE1           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE2           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE3           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE4           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE5           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE6           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE7           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE8           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE9           IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE10          IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE11          IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE12          IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE13          IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE14          IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE15          IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER1    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER2    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER3    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER4    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER5    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER6    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER7    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER8    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER9    IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_NUMBER10   IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_DATE1      IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_DATE2      IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_DATE3      IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_DATE4      IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_DATE5      IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_TIMESTAMP1 IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_TIMESTAMP2 IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_TIMESTAMP3 IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_TIMESTAMP4 IS NOT NULL
OR ItemRevisionEO.ATTRIBUTE_TIMESTAMP5 IS NOT NULL)
ORDER BY ItemClassPEO.ITEM_CLASS_CODE
,ItemVersionEO.TEMPLATE_NAME
,3