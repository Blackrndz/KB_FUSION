/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Asset%20Categories%20-%20Accounts%20Rules%20-%20GDF.sql $:
* $Id: Manage Asset Categories - Accounts Rules - GDF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

 -- syntax: GDF_CODE (Descriptive Flexfield name)
 -- GDF_LOGIC_TO_APPLY=JG_FA_CATEGORY_BOOKS
 -- GDF_ATTRIBUTES=GLOBAL_ATTRIBUTE
 -- IMPORTANT:
 -- - the alias names for the Foreign keys must be the same as in the inventory.
 -- - the alias name for context code must be RES_CONTEXT_CODE
 -- - NO ALIASES for attributes fields.

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookEO.BOOK_TYPE_CODE AS RES_BOOK
,CategoryBookEO.GLOBAL_ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,CategoryBookEO.GLOBAL_ATTRIBUTE1
,CategoryBookEO.GLOBAL_ATTRIBUTE2
,CategoryBookEO.GLOBAL_ATTRIBUTE3
,CategoryBookEO.GLOBAL_ATTRIBUTE4
,CategoryBookEO.GLOBAL_ATTRIBUTE5
,CategoryBookEO.GLOBAL_ATTRIBUTE6
,CategoryBookEO.GLOBAL_ATTRIBUTE7
,CategoryBookEO.GLOBAL_ATTRIBUTE8
,CategoryBookEO.GLOBAL_ATTRIBUTE9
,CategoryBookEO.GLOBAL_ATTRIBUTE10
,CategoryBookEO.GLOBAL_ATTRIBUTE11
,CategoryBookEO.GLOBAL_ATTRIBUTE12
,CategoryBookEO.GLOBAL_ATTRIBUTE13
,CategoryBookEO.GLOBAL_ATTRIBUTE14
,CategoryBookEO.GLOBAL_ATTRIBUTE15
,CategoryBookEO.GLOBAL_ATTRIBUTE16
,CategoryBookEO.GLOBAL_ATTRIBUTE17
,CategoryBookEO.GLOBAL_ATTRIBUTE18
,CategoryBookEO.GLOBAL_ATTRIBUTE19
,CategoryBookEO.GLOBAL_ATTRIBUTE20
,CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER1
,CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER2
,CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER3
,CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER4
,CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER5
, TO_CHAR(CategoryBookEO.GLOBAL_ATTRIBUTE_DATE1, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE1
, TO_CHAR(CategoryBookEO.GLOBAL_ATTRIBUTE_DATE2, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE2
, TO_CHAR(CategoryBookEO.GLOBAL_ATTRIBUTE_DATE3, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE3
, TO_CHAR(CategoryBookEO.GLOBAL_ATTRIBUTE_DATE4, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE4
, TO_CHAR(CategoryBookEO.GLOBAL_ATTRIBUTE_DATE5, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE5
,CategoryBookEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,CategoryBookEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,CategoryBookEO.CREATED_BY RSC_CREATED_BY
,CategoryBookEO.CREATION_DATE RSC_CREATION_DATE
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FA_CATEGORY_BOOKS CategoryBookEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE(CategoryBookEO.GLOBAL_ATTRIBUTE_CATEGORY IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE1            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE2            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE3            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE4            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE5            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE6            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE7            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE8            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE9            IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE10           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE11           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE12           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE13           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE14           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE15           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE16           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE17           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE18           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE19           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE20           IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER1     IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER2     IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER3     IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER4     IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_NUMBER5     IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_DATE1       IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_DATE2       IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_DATE3       IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_DATE4       IS NOT NULL
OR CategoryBookEO.GLOBAL_ATTRIBUTE_DATE5       IS NOT NULL)
AND CategoryBookEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
ORDER BY RES_CATEGORY1