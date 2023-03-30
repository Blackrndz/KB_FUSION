/* ****************************************************************************
 * $Revision: 79100 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-08-01 16:28:55 +0700 (Mon, 01 Aug 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Programs%20-%20Enrollment%20Life%20Event%20Formulas.sql $:
 * $Id: Manage Benefit Programs - Enrollment Life Event Formulas.sql 79100 2022-08-01 09:28:55Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=BEN_PGM_F
-- RSC_PREREQUISITE_OBJECTS=BEN_LER_CHG_PL_NIP_ENRT_F
 
SELECT benPGMEO.NAME RES_PROGRAM_NAME
,TO_CHAR(benPGMEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT NAME FROM BEN_PGM_F WHERE PGM_ID = schedulPeriodsE0.PGM_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_PROGRAM_HIERARCHY
,'Programs' RES_PROGRAM_HIERARCHY_DESCRIPT
,DECODE(TO_CHAR(benPGMEO.EFFECTIVE_END_DATE,'DD-Mon-YYYY'),'31-12-4712',NULL,TO_CHAR(benPGMEO.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_EFFECTIVE_END_DATE
,(SELECT NAME FROM BEN_LER_F_VL WHERE LER_ID = periodsE0.LER_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_LIFE_EVENT
,TO_CHAR(benLERCHGPGMEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_LIFE_EVENT_EFFECTIVE_START
,periodFormulasE0.ORDR_TO_APLY_NUM RES_SEQUENCE
,(SELECT FORMULA_NAME
    FROM FF_FORMULAS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND FORMULA_ID = periodFormulasE0.FORMULA_ID
    ) RES_ENROLLMENT_FORMULA
,TO_CHAR(periodFormulasE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_LIFE_EVENT_FORMULAS_EFFECT
,DECODE(TO_CHAR(periodFormulasE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY'),'31-12-4712',NULL,TO_CHAR(periodFormulasE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_LIFE_EVENT_FORMULAS_EFFE_0


,periodFormulasE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,periodFormulasE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,periodFormulasE0.CREATED_BY  RSC_CREATED_BY
,periodFormulasE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPGMEO.LEGISLATION_CODE RSC_COUNTRY_ID

FROM BEN_PGM_F benPGMEO
/*,(SELECT *
    FROM BEN_LER_CHG_PL_NIP_ENRT_F
    WHERE LER_ID IN (SELECT LER_ID FROM BEN_LER_F WHERE TYP_CD = 'SCHEDDUO')
    ) restrictsE0*/
,(SELECT *
	FROM BEN_POPL_ENRT_TYP_CYCL 
	WHERE COMP_OBJ_TYPE = 'PGM'
	) schedulPeriodsE0
,BEN_ENRT_PERD periodsE0
,BEN_SCHEDD_ENRT_RL_F periodFormulasE0
,(SELECT * FROM BEN_LER_CHG_PGM_ENRT_F 
	WHERE LER_ID NOT IN (SELECT LER_ID FROM BEN_LER_F_VL WHERE TYP_CD IN ('SCHEDDA','SCHEDDO')
				AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) 
				AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))) benLERCHGPGMEO
WHERE SYSDATE BETWEEN benPGMEO.EFFECTIVE_START_DATE AND benPGMEO.EFFECTIVE_END_DATE
--AND benPGMEO.PGM_ID = restrictsE0.PGM_ID
AND benPGMEO.PGM_ID = schedulPeriodsE0.PGM_ID
--AND restrictsE0.LER_ID = periodsE0.LER_ID
AND schedulPeriodsE0.POPL_ENRT_TYP_CYCL_ID = periodsE0.POPL_ENRT_TYP_CYCL_ID
AND benPGMEO.PGM_ID = benLERCHGPGMEO.PGM_ID (+)
AND periodsE0.ENRT_PERD_ID = periodFormulasE0.ENRT_PERD_ID

