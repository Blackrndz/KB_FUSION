/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Default%20Item%20Class%20-%20Item%20-%20DFF.sql $:
 * $Id: Manage Default Item Class - Item - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10011##RES##EGP_SYSTEM_ITEMS_DFF
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
,ItemVersionEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,ItemVersionEO.ATTRIBUTE1
,ItemVersionEO.ATTRIBUTE2
,ItemVersionEO.ATTRIBUTE3
,ItemVersionEO.ATTRIBUTE4
,ItemVersionEO.ATTRIBUTE5
,ItemVersionEO.ATTRIBUTE6
,ItemVersionEO.ATTRIBUTE7
,ItemVersionEO.ATTRIBUTE8
,ItemVersionEO.ATTRIBUTE9
,ItemVersionEO.ATTRIBUTE10
,ItemVersionEO.ATTRIBUTE11
,ItemVersionEO.ATTRIBUTE12
,ItemVersionEO.ATTRIBUTE13
,ItemVersionEO.ATTRIBUTE14
,ItemVersionEO.ATTRIBUTE15
,ItemVersionEO.ATTRIBUTE16
,ItemVersionEO.ATTRIBUTE17
,ItemVersionEO.ATTRIBUTE18
,ItemVersionEO.ATTRIBUTE19
,ItemVersionEO.ATTRIBUTE20
,ItemVersionEO.ATTRIBUTE21
,ItemVersionEO.ATTRIBUTE22
,ItemVersionEO.ATTRIBUTE23
,ItemVersionEO.ATTRIBUTE24
,ItemVersionEO.ATTRIBUTE25
,ItemVersionEO.ATTRIBUTE26
,ItemVersionEO.ATTRIBUTE27
,ItemVersionEO.ATTRIBUTE28
,ItemVersionEO.ATTRIBUTE29
,ItemVersionEO.ATTRIBUTE30
,ItemVersionEO.ATTRIBUTE_NUMBER1
,ItemVersionEO.ATTRIBUTE_NUMBER2
,ItemVersionEO.ATTRIBUTE_NUMBER3
,ItemVersionEO.ATTRIBUTE_NUMBER4
,ItemVersionEO.ATTRIBUTE_NUMBER5
,ItemVersionEO.ATTRIBUTE_NUMBER6
,ItemVersionEO.ATTRIBUTE_NUMBER7
,ItemVersionEO.ATTRIBUTE_NUMBER8
,ItemVersionEO.ATTRIBUTE_NUMBER9
,ItemVersionEO.ATTRIBUTE_NUMBER10
,TO_CHAR(ItemVersionEO.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(ItemVersionEO.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(ItemVersionEO.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(ItemVersionEO.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(ItemVersionEO.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,ItemVersionEO.ATTRIBUTE_TIMESTAMP1
,ItemVersionEO.ATTRIBUTE_TIMESTAMP2
,ItemVersionEO.ATTRIBUTE_TIMESTAMP3
,ItemVersionEO.ATTRIBUTE_TIMESTAMP4
,ItemVersionEO.ATTRIBUTE_TIMESTAMP5
,ItemVersionEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ItemVersionEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ItemVersionEO.CREATED_BY RSC_CREATED_BY
,ItemVersionEO.CREATION_DATE RSC_CREATION_DATE
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
WHERE ItemClassPEO.PARENT_ITEM_CLASS_ID NOT IN (SELECT ITEM_CLASS_ID FROM EGP_ITEM_CLASSES_VL)
AND ItemVersionEO.TEMPLATE_NAME IS NOT NULL
AND ItemClassPEO.ITEM_CLASS_ID             = ItemVersionEO.ITEM_CATALOG_GROUP_ID
AND(ItemVersionEO.ATTRIBUTE_CATEGORY  IS NOT NULL
OR ItemVersionEO.ATTRIBUTE1           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE2           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE3           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE4           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE5           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE6           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE7           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE8           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE9           IS NOT NULL
OR ItemVersionEO.ATTRIBUTE10          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE11          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE12          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE13          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE14          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE15          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE16          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE17          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE18          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE19          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE20          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE21          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE22          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE23          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE24          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE25          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE26          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE27          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE28          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE29          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE30          IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER1    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER2    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER3    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER4    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER5    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER6    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER7    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER8    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER9    IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_NUMBER10   IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_DATE1      IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_DATE2      IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_DATE3      IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_DATE4      IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_DATE5      IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_TIMESTAMP1 IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_TIMESTAMP2 IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_TIMESTAMP3 IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_TIMESTAMP4 IS NOT NULL
OR ItemVersionEO.ATTRIBUTE_TIMESTAMP5 IS NOT NULL)
ORDER BY ItemClassPEO.ITEM_CLASS_CODE
,ItemVersionEO.TEMPLATE_NAME
,3