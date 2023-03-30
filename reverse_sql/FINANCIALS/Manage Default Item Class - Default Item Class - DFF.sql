/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Default%20Item%20Class%20-%20Default%20Item%20Class%20-%20DFF.sql $:
 * $Id: Manage Default Item Class - Default Item Class - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10011##RES##EGP_ITEM_CLASS_DFF
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.

SELECT ItemClassPEO.ITEM_CLASS_CODE RES_INTERNAL_NAME
,ItemClassPEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,ItemClassPEO.ATTRIBUTE1
,ItemClassPEO.ATTRIBUTE2
,ItemClassPEO.ATTRIBUTE3
,ItemClassPEO.ATTRIBUTE4
,ItemClassPEO.ATTRIBUTE5
,ItemClassPEO.ATTRIBUTE6
,ItemClassPEO.ATTRIBUTE7
,ItemClassPEO.ATTRIBUTE8
,ItemClassPEO.ATTRIBUTE9
,ItemClassPEO.ATTRIBUTE10
,ItemClassPEO.ATTRIBUTE11
,ItemClassPEO.ATTRIBUTE12
,ItemClassPEO.ATTRIBUTE13
,ItemClassPEO.ATTRIBUTE14
,ItemClassPEO.ATTRIBUTE15
,ItemClassPEO.ATTRIBUTE16
,ItemClassPEO.ATTRIBUTE17
,ItemClassPEO.ATTRIBUTE18
,ItemClassPEO.ATTRIBUTE19
,ItemClassPEO.ATTRIBUTE20
,ItemClassPEO.ATTRIBUTE_NUMBER1
,ItemClassPEO.ATTRIBUTE_NUMBER2
,ItemClassPEO.ATTRIBUTE_NUMBER3
,ItemClassPEO.ATTRIBUTE_NUMBER4
,ItemClassPEO.ATTRIBUTE_NUMBER5
,ItemClassPEO.ATTRIBUTE_NUMBER6
,ItemClassPEO.ATTRIBUTE_NUMBER7
,ItemClassPEO.ATTRIBUTE_NUMBER8
,ItemClassPEO.ATTRIBUTE_NUMBER9
,ItemClassPEO.ATTRIBUTE_NUMBER10
,TO_CHAR(ItemClassPEO.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(ItemClassPEO.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(ItemClassPEO.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(ItemClassPEO.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(ItemClassPEO.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,ItemClassPEO.ATTRIBUTE_TIMESTAMP1
,ItemClassPEO.ATTRIBUTE_TIMESTAMP2
,ItemClassPEO.ATTRIBUTE_TIMESTAMP3
,ItemClassPEO.ATTRIBUTE_TIMESTAMP4
,ItemClassPEO.ATTRIBUTE_TIMESTAMP5
,ItemClassPEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ItemClassPEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ItemClassPEO.CREATED_BY RSC_CREATED_BY
,ItemClassPEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EGP_ITEM_CLASSES_VL ItemClassPEO
WHERE ItemClassPEO.PARENT_ITEM_CLASS_ID NOT IN (SELECT ITEM_CLASS_ID FROM EGP_ITEM_CLASSES_VL)
AND(ItemClassPEO.ATTRIBUTE_CATEGORY       IS NOT NULL
OR ItemClassPEO.ATTRIBUTE1                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE2                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE3                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE4                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE5                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE6                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE7                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE8                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE9                IS NOT NULL
OR ItemClassPEO.ATTRIBUTE10               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE11               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE12               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE13               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE14               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE15               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE16               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE17               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE18               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE19               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE20               IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER1         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER2         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER3         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER4         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER5         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER6         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER7         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER8         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER9         IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_NUMBER10        IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_DATE1           IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_DATE2           IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_DATE3           IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_DATE4           IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_DATE5           IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_TIMESTAMP1      IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_TIMESTAMP2      IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_TIMESTAMP3      IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_TIMESTAMP4      IS NOT NULL
OR ItemClassPEO.ATTRIBUTE_TIMESTAMP5      IS NOT NULL)