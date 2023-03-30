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
,benELIGDPNTOTHRPTIPEO.ORDR_NUM RES_SEQUENCE
,(SELECT benP.NAME||'-'||benT.NAME 
	FROM BEN_PGM_F benP,BEN_PL_TYP_F benT 
	WHERE benP.PGM_ID = benPTIPEO.PGM_ID 
	AND benT.PL_TYP_ID = benPTIPEO.PL_TYP_ID
	AND  SYSDATE BETWEEN benP.EFFECTIVE_START_DATE AND NVL(benP.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	AND  SYSDATE BETWEEN benT.EFFECTIVE_START_DATE AND NVL(benT.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_PLAN_TYPE_IN_PROGRAM
,DECODE(benELIGDPNTOTHRPTIPEO.EXCLD_FLAG,'Y','Yes','No') RES_EXCLUDE
,TO_CHAR(benELIGDPNTOTHRPTIPEO.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(benELIGDPNTOTHRPTIPEO.END_DATE,'DD-Mon-YYYY') RES_END_DATE
,benELIGDPNTOTHRPTIPEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,benELIGDPNTOTHRPTIPEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,benELIGDPNTOTHRPTIPEO.CREATED_BY  RSC_CREATED_BY
,benELIGDPNTOTHRPTIPEO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM BEN_ELIGY_PRFL benELIGYEO
,BEN_ELIG_DPNT_OTHR_PTIP benELIGDPNTOTHRPTIPEO
,BEN_PTIP_F benPTIPEO
WHERE SYSDATE BETWEEN benELIGYEO.START_DATE AND NVL(benELIGYEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND benELIGYEO.ELIGY_PRFL_ID = benELIGDPNTOTHRPTIPEO.ELIGY_PRFL_ID 
AND benELIGYEO.END_DATE BETWEEN benELIGDPNTOTHRPTIPEO.START_DATE AND NVL(benELIGDPNTOTHRPTIPEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND benELIGDPNTOTHRPTIPEO.PTIP_ID = benPTIPEO.PTIP_ID
AND benELIGDPNTOTHRPTIPEO.END_DATE BETWEEN benPTIPEO.EFFECTIVE_START_DATE AND NVL(benPTIPEO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY benELIGYEO.NAME
,benELIGDPNTOTHRPTIPEO.ORDR_NUM