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
,benELIGPSTLCDREO.ORDR_NUM RES_SEQUENCE
,(SELECT FROM_VALUE||'-'||TO_VALUE FROM BEN_PSTL_ZIP_RNG WHERE PSTL_ZIP_RNG_ID = benELIGPSTLCDREO.PSTL_ZIP_RNG_ID
	AND SYSDATE BETWEEN START_DATE AND NVL(END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_POSTAL_CODE_RANGE
,DECODE(benELIGPSTLCDREO.EXCLD_FLAG,'Y','Yes','No') RES_EXCLUDE
,TO_CHAR(benELIGPSTLCDREO.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(benELIGPSTLCDREO.END_DATE,'DD-Mon-YYYY') RES_END_DATE


,benELIGPSTLCDREO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,benELIGPSTLCDREO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,benELIGPSTLCDREO.CREATED_BY  RSC_CREATED_BY
,benELIGPSTLCDREO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM BEN_ELIGY_PRFL benELIGYEO
,BEN_ELIG_PSTL_CD_R_RNG_PRTE benELIGPSTLCDREO
WHERE benELIGYEO.ELIGY_PRFL_ID = benELIGPSTLCDREO.ELIGY_PRFL_ID 
AND benELIGYEO.END_DATE BETWEEN benELIGPSTLCDREO.START_DATE AND NVL(benELIGPSTLCDREO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN benELIGYEO.START_DATE AND NVL(benELIGYEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY benELIGYEO.NAME,benELIGPSTLCDREO.ORDR_NUM