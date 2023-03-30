/* ****************************************************************************
 * $Revision: 78239 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 22:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Programs%20-%20Eligibility%20Formula.sql $:
 * $Id: Manage Benefit Programs - Eligibility Formula.sql 78239 2022-04-07 15:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT RES_PROGRAM_NAME
,RES_EFFECTIVE_START_DATE
,RES_PROGRAM_HIERARCHY
,RES_PROGRAM_HIERARCHY_DESCRIPT
,RES_PARTICIPATION_ELIGIBILITY_
,RES_SEQUENCE
,RES_ELIGIBILITY_FORMULA
,RES_REQUIRED
,RES_DERIVABLE_FACTORS_APPLY
,RES_FORMULA_EFFECTIVE_START_DA
,RES_FORMULA_EFFECTIVE_END_DATE

,RSC_LAST_UPDATED_BY
,RSC_LAST_UPDATE_DATE
,RSC_CREATED_BY
,RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,RSC_COUNTRY_ID


FROM

(SELECT benPGMEO.NAME RES_PROGRAM_NAME
,(SELECT NAME FROM BEN_PGM_F WHERE PGM_ID = benPRTNELIGEO.PGM_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_PROGRAM_HIERARCHY
,'Programs' RES_PROGRAM_HIERARCHY_DESCRIPT
,TO_CHAR(benPGMEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(benPRTNELIGEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_PARTICIPATION_ELIGIBILITY_
,TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_FORMULA_EFFECTIVE_START_DA
,DECODE(TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_FORMULA_EFFECTIVE_END_DATE
,benPRTNELIGRLFEO.ORDR_TO_APLY_NUM RES_SEQUENCE
,(SELECT FORMULA_NAME FROM FF_FORMULAS_VL  WHERE FORMULA_ID = benPRTNELIGRLFEO.FORMULA_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_ELIGIBILITY_FORMULA
,DECODE(benPRTNELIGRLFEO.MNDTRY_FLAG,'Y','Yes','No') RES_REQUIRED
,DECODE(benPRTNELIGRLFEO.DRVBL_FCTR_APLS_FLAG,'Y','Yes','No') RES_DERIVABLE_FACTORS_APPLY
,'1' RES_SEQUENCE_0

,benPRTNELIGRLFEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benPRTNELIGRLFEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benPRTNELIGRLFEO.CREATED_BY RSC_CREATED_BY
,benPRTNELIGRLFEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPGMEO.LEGISLATION_CODE RSC_COUNTRY_ID
	
FROM BEN_PGM_F benPGMEO
,BEN_PRTN_ELIG_F benPRTNELIGEO
,BEN_PRTN_ELIGY_RL_F benPRTNELIGRLFEO
WHERE benPGMEO.PGM_ID = benPRTNELIGEO.PGM_ID
AND benPRTNELIGEO.PRTN_ELIG_ID = benPRTNELIGRLFEO.PRTN_ELIG_ID 
AND SYSDATE BETWEEN benPGMEO.EFFECTIVE_START_DATE AND NVL(benPGMEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPRTNELIGEO.EFFECTIVE_START_DATE AND NVL(benPRTNELIGEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPRTNELIGRLFEO.EFFECTIVE_START_DATE AND NVL(benPRTNELIGRLFEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))


UNION

SELECT benPGMEO.NAME RES_PROGRAM_NAME
,benPLT.NAME RES_PROGRAM_HIERARCHY
,'Plan Type' RES_PROGRAM_HIERARCHY_DESCRIPT
,TO_CHAR(benPGMEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(benPRTNELIGEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_PARTICIPATION_ELIGIBILITY_
,TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_FORMULA_EFFECTIVE_START_DA
,DECODE(TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_FORMULA_EFFECTIVE_END_DATE
,benPRTNELIGRLFEO.ORDR_TO_APLY_NUM RES_SEQUENCE
,(SELECT FORMULA_NAME FROM FF_FORMULAS_VL  WHERE FORMULA_ID = benPRTNELIGRLFEO.FORMULA_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_ELIGIBILITY_FORMULA
,DECODE(benPRTNELIGRLFEO.MNDTRY_FLAG,'Y','Yes','No') RES_REQUIRED
,DECODE(benPRTNELIGRLFEO.DRVBL_FCTR_APLS_FLAG,'Y','Yes','No') RES_DERIVABLE_FACTORS_APPLY
,'2' RES_SEQUENCE_0

,benPRTNELIGRLFEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benPRTNELIGRLFEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benPRTNELIGRLFEO.CREATED_BY RSC_CREATED_BY
,benPRTNELIGRLFEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPGMEO.LEGISLATION_CODE RSC_COUNTRY_ID

FROM BEN_PGM_F benPGMEO
,BEN_PRTN_ELIG_F benPRTNELIGEO
,BEN_PTIP_F benPT
,BEN_PL_TYP_F benPLT
,BEN_PRTN_ELIGY_RL_F benPRTNELIGRLFEO
WHERE benPGMEO.PGM_ID = benPT.PGM_ID
AND benPT.PL_TYP_ID = benPLT.PL_TYP_ID
AND benPRTNELIGEO.PTIP_ID = benPT.PTIP_ID
AND benPRTNELIGEO.PRTN_ELIG_ID = benPRTNELIGRLFEO.PRTN_ELIG_ID
AND SYSDATE BETWEEN benPGMEO.EFFECTIVE_START_DATE AND NVL(benPGMEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPT.EFFECTIVE_START_DATE AND NVL(benPT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPLT.EFFECTIVE_START_DATE AND NVL(benPLT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPRTNELIGEO.EFFECTIVE_START_DATE AND NVL(benPRTNELIGEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPRTNELIGRLFEO.EFFECTIVE_START_DATE AND NVL(benPRTNELIGRLFEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))


UNION

SELECT benPGMEO.NAME RES_PROGRAM_NAME
,benPL.NAME RES_PROGRAM_HIERARCHY
,'Plan' RES_PROGRAM_HIERARCHY_DESCRIPT
,TO_CHAR(benPGMEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(benPRTNELIGEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_PARTICIPATION_ELIGIBILITY_
,TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_FORMULA_EFFECTIVE_START_DA
,DECODE(TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(benPRTNELIGRLFEO.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_FORMULA_EFFECTIVE_END_DATE
,benPRTNELIGRLFEO.ORDR_TO_APLY_NUM RES_SEQUENCE
,(SELECT FORMULA_NAME FROM FF_FORMULAS_VL  WHERE FORMULA_ID = benPRTNELIGRLFEO.FORMULA_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_ELIGIBILITY_FORMULA
,DECODE(benPRTNELIGRLFEO.MNDTRY_FLAG,'Y','Yes','No') RES_REQUIRED
,DECODE(benPRTNELIGRLFEO.DRVBL_FCTR_APLS_FLAG,'Y','Yes','No') RES_DERIVABLE_FACTORS_APPLY
,'3' RES_SEQUENCE_0

,benPRTNELIGRLFEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benPRTNELIGRLFEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benPRTNELIGRLFEO.CREATED_BY RSC_CREATED_BY
,benPRTNELIGRLFEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPGMEO.LEGISLATION_CODE RSC_COUNTRY_ID
	
FROM BEN_PGM_F benPGMEO
,BEN_PRTN_ELIG_F benPRTNELIGEO
,BEN_PLIP_F benPLIP
,BEN_PL_F benPL
,BEN_PRTN_ELIGY_RL_F benPRTNELIGRLFEO
WHERE benPLIP.PL_ID = benPL.PL_ID
AND benPGMEO.PGM_ID = benPLIP.PGM_ID
AND benPRTNELIGEO.PLIP_ID = benPLIP.PLIP_ID
AND benPRTNELIGEO.PRTN_ELIG_ID = benPRTNELIGRLFEO.PRTN_ELIG_ID 
AND SYSDATE BETWEEN benPGMEO.EFFECTIVE_START_DATE AND NVL(benPGMEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPLIP.EFFECTIVE_START_DATE AND NVL(benPLIP.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPL.EFFECTIVE_START_DATE AND NVL(benPL.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY')) 
AND SYSDATE BETWEEN benPRTNELIGEO.EFFECTIVE_START_DATE AND NVL(benPRTNELIGEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPRTNELIGRLFEO.EFFECTIVE_START_DATE AND NVL(benPRTNELIGRLFEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))

ORDER BY RES_PROGRAM_NAME,RES_SEQUENCE_0,RES_ELIGIBILITY_FORMULA)