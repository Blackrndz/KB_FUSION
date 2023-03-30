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
,benELIGDSBEO.ORDR_NUM RES_SEQUENCE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benELIGDSBEO.DSBLD_CD
	AND LOOKUP_TYPE = 'REGISTERED_DISABLED' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_DISABILITY_TYPE
,DECODE(benELIGDSBEO.EXCLD_FLAG,'Y','Yes','No') RES_EXCLUDE
,TO_CHAR(benELIGDSBEO.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(benELIGDSBEO.END_DATE,'DD-Mon-YYYY') RES_END_DATE


,benELIGDSBEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,benELIGDSBEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,benELIGDSBEO.CREATED_BY  RSC_CREATED_BY
,benELIGDSBEO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM BEN_ELIGY_PRFL benELIGYEO
,BEN_ELIG_DSBLD_PRTE benELIGDSBEO
WHERE benELIGYEO.ELIGY_PRFL_ID = benELIGDSBEO.ELIGY_PRFL_ID 
AND benELIGYEO.PROFILE_TYPE = 'PRTP'
AND benELIGYEO.END_DATE BETWEEN benELIGDSBEO.START_DATE AND NVL(benELIGDSBEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN benELIGYEO.START_DATE AND NVL(benELIGYEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY benELIGYEO.NAME,benELIGDSBEO.ORDR_NUM