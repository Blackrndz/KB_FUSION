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
,benELIGGENCRITEO.ORDR_NUM RES_SEQUENCE
,DECODE(benELIGGENCRITEO.CRIT_CHAR1,'Y','Yes','No') RES_PEOPLE_MANAGER
,DECODE(benELIGGENCRITEO.EXCLD_FLAG,'Y','Yes','No') RES_EXCLUDE
,TO_CHAR(benELIGGENCRITEO.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(benELIGGENCRITEO.END_DATE,'DD-Mon-YYYY') RES_END_DATE

,benELIGGENCRITEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,benELIGGENCRITEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,benELIGGENCRITEO.CREATED_BY  RSC_CREATED_BY
,benELIGGENCRITEO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM BEN_ELIGY_PRFL benELIGYEO
,BEN_ELIG_GEN_CRIT_PRTE benELIGGENCRITEO
WHERE benELIGYEO.ELIGY_PRFL_ID = benELIGGENCRITEO.ELIGY_PRFL_ID 
AND benELIGGENCRITEO.ELIG_CRITERIA_CODE = 'MNG'
AND benELIGYEO.END_DATE BETWEEN benELIGGENCRITEO.START_DATE AND NVL(benELIGGENCRITEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN benELIGYEO.START_DATE AND NVL(benELIGYEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY benELIGYEO.NAME,benELIGGENCRITEO.ORDR_NUM