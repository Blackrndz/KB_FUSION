/* ****************************************************************************
* $Revision: 55345 $:
* $Author: wuttipong.thongvises $:
* $Date: 2016-05-23 12:42:33 +0700 (Mon, 23 May 2016) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/
FINANCIALS/Manage%20Server%20Configurations%20-%20Manage%20Data%20Quality%20Server%20Configurations.sql $:
* $Id: Manage Server Configurations - Manage Data Quality Server Configurations.sql 55345 2016-05-23 05:42:33Z
wuttipong.thongvises $:
* ****************************************************************************
* Description:
* ************************************************************************** */


SELECT benELIGYEO.NAME RES_NAME
,benELIGQUALEO.ORDR_NUM RES_SEQUENCE
,(SELECT CONTENT_TYPE_NAME FROM HRT_CONTENT_TYPES_VL  WHERE CONTENT_TYPE_ID = benELIGQUALEO.QUALIFICATION_TYPE_ID) RES_QUALIFICATION_TYPE 
,(SELECT NAME FROM HRT_CONTENT_ITEMS_VL WHERE CONTENT_ITEM_ID = benELIGQUALEO.QUALIFICATION_ID
	AND CONTENT_TYPE_ID = benELIGQUALEO.QUALIFICATION_TYPE_ID
	AND SYSDATE BETWEEN DATE_FROM AND NVL(DATE_TO,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_QUALIFICATION_TITLE
,DECODE(benELIGQUALEO.EXCLD_FLAG,'Y','Yes','No') RES_EXCLUDE
,TO_CHAR(benELIGQUALEO.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(benELIGQUALEO.END_DATE,'DD-Mon-YYYY') RES_END_DATE


,benELIGQUALEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,benELIGQUALEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,benELIGQUALEO.CREATED_BY  RSC_CREATED_BY
,benELIGQUALEO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM BEN_ELIGY_PRFL benELIGYEO
,BEN_ELIG_QUAL_TITL_PRTE benELIGQUALEO
WHERE benELIGYEO.ELIGY_PRFL_ID = benELIGQUALEO.ELIGY_PRFL_ID 
AND benELIGYEO.PROFILE_TYPE = 'PRTP'
AND benELIGYEO.END_DATE BETWEEN benELIGQUALEO.START_DATE AND NVL(benELIGQUALEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN benELIGYEO.START_DATE AND NVL(benELIGYEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY benELIGYEO.NAME,benELIGQUALEO.ORDR_NUM