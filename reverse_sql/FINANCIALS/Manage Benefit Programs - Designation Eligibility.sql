/* ****************************************************************************
 * $Revision: 79100 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-08-01 16:28:55 +0700 (Mon, 01 Aug 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Programs%20-%20Designation%20Eligibility.sql $:
 * $Id: Manage Benefit Programs - Designation Eligibility.sql 79100 2022-08-01 09:28:55Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT benPGMEO.NAME RES_PROGRAM_NAME
,TO_CHAR(benPGMEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_EFFECTIVE_START_DATE
,benPLT.NAME RES_PLAN_TYPE
,(SELECT NAME FROM BEN_ELIGY_PRFL WHERE ELIGY_PRFL_ID = benDPNTELIGEO.DPNT_CVG_ELIGY_PRFL_ID
	AND SYSDATE BETWEEN START_DATE AND NVL(END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_ELIGIBILITY_PROFILE
,(SELECT FORMULA_NAME
    FROM FF_FORMULAS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND FORMULA_ID = benDPNTELIGEO.APLD_DPNT_CVG_ELIG_RL
    ) RES_ELIGIBILITY_FORMULA
,DECODE(benDPNTELIGEO.MNDTRY_FLAG,'Y','Yes','No') RES_ELIGIBILITY_REQUIRED
,TO_CHAR(benDPNTELIGEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_ELIGIBILITY_EFFECTIVE_STAR
,DECODE(TO_CHAR(benDPNTELIGEO.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(benDPNTELIGEO.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_ELIGIBILITY_EFFECTIVE_END_

,benDPNTELIGEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benDPNTELIGEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benDPNTELIGEO.CREATED_BY RSC_CREATED_BY
,benDPNTELIGEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPGMEO.LEGISLATION_CODE RSC_COUNTRY_ID


FROM BEN_PGM_F benPGMEO
,BEN_PTIP_F benPT
,BEN_PL_TYP_F benPLT 
,BEN_APLD_DPNT_CVG_ELIG_PRFL_F benDPNTELIGEO
WHERE benPGMEO.PGM_ID = benPT.PGM_ID
AND benPT.PL_TYP_ID = benPLT.PL_TYP_ID
AND benPT.PTIP_ID = benDPNTELIGEO.PTIP_ID
AND SYSDATE BETWEEN benPGMEO.EFFECTIVE_START_DATE AND NVL(benPGMEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPT.EFFECTIVE_START_DATE AND NVL(benPT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPLT.EFFECTIVE_START_DATE AND NVL(benPLT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benDPNTELIGEO.EFFECTIVE_START_DATE AND NVL(benDPNTELIGEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))


ORDER BY 1,2,3
