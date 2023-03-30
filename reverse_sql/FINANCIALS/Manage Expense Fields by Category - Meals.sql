/* ****************************************************************************
* $Revision: 61485 $:
* $Author: chanatip.buabhom $:
* $Date: 2017-03-21 17:10:25 +0700 (Tue, 21 Mar 2017) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/customized/In%20Develop/reverse_sql/Manage%20Expense%20Fields%20by%20Category%20-%20Meals.sql $:
* $Id: Manage Expense Fields by Category - Meals.sql 61485 2017-03-21 10:10:25Z chanatip.buabhom $:
* ****************************************************************************
* Description:
* ************************************************************************** */


SELECT 'Yes' RES_ENABLE_FIELDS_FOR_MEALS
,BUSINESSUNITPEO.BU_NAME RES_BUSINESS_UNIT
,DECODE(CATEGORYFIELDEO.MERCHANT_FIELD,'ENABLED','Optional','DISABLED','Hidden','REQUIRED','Required') RES_MERCHANT
,CategoryFieldEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,CategoryFieldEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,CategoryFieldEO.CREATED_BY  RSC_CREATED_BY
,CategoryFieldEO.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,CATEGORYFIELDEO.ORG_ID RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EXM_CATEGORY_FIELDS CategoryFieldEO
,FUN_ALL_BUSINESS_UNITS_V BusinessUnitPEO
WHERE CATEGORYFIELDEO.ORG_ID = BUSINESSUNITPEO.BU_ID
and Category_code = 'MEALS'
order by BUSINESSUNITPEO.BU_NAME