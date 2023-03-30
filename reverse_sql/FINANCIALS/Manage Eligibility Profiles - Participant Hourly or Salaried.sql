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
,benELIGHRLYSLRDEO.ORDR_NUM RES_SEQUENCE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benELIGHRLYSLRDEO.HRLY_SLRD_CD
	AND LOOKUP_TYPE = 'HOURLY_SALARIED_CODE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_HOURLY_OR_SALARIED
,DECODE(benELIGHRLYSLRDEO.EXCLD_FLAG,'Y','Yes','No') RES_EXCLUDE
,TO_CHAR(benELIGHRLYSLRDEO.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(benELIGHRLYSLRDEO.END_DATE,'DD-Mon-YYYY') RES_END_DATE


,benELIGHRLYSLRDEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,benELIGHRLYSLRDEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,benELIGHRLYSLRDEO.CREATED_BY  RSC_CREATED_BY
,benELIGHRLYSLRDEO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM BEN_ELIGY_PRFL benELIGYEO
,BEN_ELIG_HRLY_SLRD_PRTE benELIGHRLYSLRDEO
WHERE benELIGYEO.ELIGY_PRFL_ID = benELIGHRLYSLRDEO.ELIGY_PRFL_ID 
AND benELIGYEO.END_DATE BETWEEN benELIGHRLYSLRDEO.START_DATE AND NVL(benELIGHRLYSLRDEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN benELIGYEO.START_DATE AND NVL(benELIGYEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY benELIGYEO.NAME,benELIGHRLYSLRDEO.ORDR_NUM