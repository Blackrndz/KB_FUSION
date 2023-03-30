/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Functional%20Area%20Catalogs%20-%20Functional%20Area%20Category%20-%20DFF.sql $:
 * $Id: Manage Functional Area Catalogs - Functional Area Category - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10011##RES##EGP_CATEGORY_DFF
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields. 

SELECT QRSLT.RES_CATALOG_NAME
,(SELECT CATEGORY_NAME FROM EGP_CATEGORIES_VL WHERE CATEGORY_ID = CatalogCatagoriesE0.PARENT_CATEGORY_ID )RES_PARENT_CATEGORY_NAME
,CatagoriesE0.CATEGORY_NAME RES_CATEGORY_NAME
,CatagoriesE0.CATEGORY_CODE RES_CATEGORY_CODE
,CatagoriesE0.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,CatagoriesE0.ATTRIBUTE1
,CatagoriesE0.ATTRIBUTE2
,CatagoriesE0.ATTRIBUTE3
,CatagoriesE0.ATTRIBUTE4
,CatagoriesE0.ATTRIBUTE5
,CatagoriesE0.ATTRIBUTE6
,CatagoriesE0.ATTRIBUTE7
,CatagoriesE0.ATTRIBUTE8
,CatagoriesE0.ATTRIBUTE9
,CatagoriesE0.ATTRIBUTE10
,CatagoriesE0.ATTRIBUTE11
,CatagoriesE0.ATTRIBUTE12
,CatagoriesE0.ATTRIBUTE13
,CatagoriesE0.ATTRIBUTE14
,CatagoriesE0.ATTRIBUTE15
,CatagoriesE0.ATTRIBUTE_NUMBER1
,CatagoriesE0.ATTRIBUTE_NUMBER2
,CatagoriesE0.ATTRIBUTE_NUMBER3
,CatagoriesE0.ATTRIBUTE_NUMBER4
,CatagoriesE0.ATTRIBUTE_NUMBER5
,CatagoriesE0.ATTRIBUTE_NUMBER6
,CatagoriesE0.ATTRIBUTE_NUMBER7
,CatagoriesE0.ATTRIBUTE_NUMBER8
,CatagoriesE0.ATTRIBUTE_NUMBER9
,CatagoriesE0.ATTRIBUTE_NUMBER10
,TO_CHAR(CatagoriesE0.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(CatagoriesE0.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(CatagoriesE0.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(CatagoriesE0.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(CatagoriesE0.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,CatagoriesE0.ATTRIBUTE_TIMESTAMP1
,CatagoriesE0.ATTRIBUTE_TIMESTAMP2
,CatagoriesE0.ATTRIBUTE_TIMESTAMP3
,CatagoriesE0.ATTRIBUTE_TIMESTAMP4
,CatagoriesE0.ATTRIBUTE_TIMESTAMP5
,CatagoriesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,CatagoriesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,CatagoriesE0.CREATED_BY RSC_CREATED_BY
,CatagoriesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EGP_CATEGORY_SET_VALID_CATS CatalogCatagoriesE0
,EGP_CATEGORIES_VL CatagoriesE0
,(SELECT RES_FUNCTIONAL_AREA 
	,RES_CATALOG_NAME
	,RES_CATALOG_SET_ID
	FROM (SELECT  ROW_NUMBER() over (PARTITION BY QRSLT.CATEGORY_SET_NAME ORDER BY QRSLT.CATEGORY_SET_NAME ) AS COUNTMAX 
		,QRSLT.MEANING RES_FUNCTIONAL_AREA
		,QRSLT.CATEGORY_SET_NAME  RES_CATALOG_NAME
		,QRSLT.CATEGORY_SET_ID RES_CATALOG_SET_ID
		from (SELECT DefaultCatalogEO.CATEGORY_SET_ID
			,CatalogEO.CATEGORY_SET_NAME
			,CatalogEO.DEFAULT_CATEGORY_ID
			,LookupPEO.MEANING
			FROM EGP_DEFAULT_CATEGORY_SETS DefaultCatalogEO
			,EGP_CATEGORY_SETS_VL CatalogEO
			,FND_LOOKUP_VALUES LookupPEO
			WHERE((DefaultCatalogEO.CATEGORY_SET_ID = CatalogEO.CATEGORY_SET_ID(+)))
			AND LookupPEO.lookup_code               = DefaultCatalogEO.functional_area_id
			AND LookupPEO.LOOKUP_TYPE               = 'EGP_CATALOG_FUNCTIONAL_AREAS'
			AND LookupPEO.LANGUAGE = USERENV('LANG')
			) QRSLT
		,EGP_CATEGORY_SET_VALID_CATS EgpCategorySetValidCatsE0
		,EGP_CATEGORIES_VL EgpCategoriesE0
		WHERE QRSLT.CATEGORY_SET_ID = EgpCategorySetValidCatsE0.CATEGORY_SET_ID
		AND EgpCategorySetValidCatsE0.CATEGORY_ID = EgpCategoriesE0.CATEGORY_ID

		order by QRSLT.MEANING
		,(CASE
			WHEN QRSLT.DEFAULT_CATEGORY_ID = EgpCategorySetValidCatsE0.CATEGORY_ID THEN 
				1
			ELSE
				2
			END )
		,EgpCategoriesE0.CATEGORY_NAME)
	WHERE COUNTMAX = 1) QRSLT
WHERE QRSLT.RES_CATALOG_SET_ID = CatalogCatagoriesE0.CATEGORY_SET_ID
AND CatalogCatagoriesE0.CATEGORY_ID = CatagoriesE0.CATEGORY_ID
AND (CatagoriesE0.ATTRIBUTE_CATEGORY IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE1 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE2 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE3 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE4 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE5 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE6 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE7 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE8 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE9 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE10 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE11 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE12 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE13 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE14 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE15 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER1 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER2 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER3 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER4 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER5 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER6 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER7 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER8 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER9 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_NUMBER10 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_DATE1 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_DATE2 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_DATE3 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_DATE4 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_DATE5 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_TIMESTAMP1 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_TIMESTAMP2 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_TIMESTAMP3 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_TIMESTAMP4 IS NOT NULL
	OR CatagoriesE0.ATTRIBUTE_TIMESTAMP5 IS NOT NULL)
ORDER BY QRSLT.RES_CATALOG_NAME
,CatagoriesE0.CATEGORY_NAME