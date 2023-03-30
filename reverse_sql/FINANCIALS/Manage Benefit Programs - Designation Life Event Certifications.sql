/* ****************************************************************************
 * $Revision$:
 * $Author$:
 * $Date$:
 * $HeadURL$:
 * $Id$:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT benPGMEO.NAME RES_PROGRAM_NAME
,TO_CHAR(benPGMEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_EFFECTIVE_START_DATE
,benPLT.NAME RES_PLAN_TYPE
,(SELECT NAME FROM BEN_LER_F_VL WHERE LER_ID = benLERPOPLACTNTYPEEO.LER_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_LIFE_EVENT
,TO_CHAR(benLERPOPLACTNTYPEEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_CERTIFICATION_EFFECTIVE_ST
,DECODE(TO_CHAR(benLERPOPLACTNTYPEEO.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(benLERPOPLACTNTYPEEO.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_CERTIFICATION_EFFECTIVE_EN
,(SELECT NAME FROM BEN_ACTN_TYP_VL WHERE ACTN_TYP_ID = benLERPOPLACTNTYPEEO.ACTN_TYP_ID) RES_CERTIFICATION_ACTION_ITEM
,DECODE(benLERPOPLACTNTYPEEO.SSPND_FLAG,'Y','Yes','No') RES_CERTIFICATION_SUSPEND_ENRO
,DECODE(benLERPOPLACTNTYPEEO.RQD_FLAG,'Y','Yes','No') RES_CERTIFICATION_REQUIRED
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'BEN_ACTN_TYP_DUE_DT'
    AND LOOKUP_CODE = benLERPOPLACTNTYPEEO.ACTN_TYP_DUE_DT_CD
    ) RES_CERTIFICATION_DUE_DATE
,(SELECT FORMULA_NAME
    FROM FF_FORMULAS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND FORMULA_ID = benLERPOPLACTNTYPEEO.ACTN_TYP_DUE_DT_RL
    ) RES_CERTIFICATION_DUE_DATE_FOR

,benLERPOPLACTNTYPEEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benLERPOPLACTNTYPEEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benLERPOPLACTNTYPEEO.CREATED_BY RSC_CREATED_BY
,benLERPOPLACTNTYPEEO.CREATION_DATE RSC_CREATION_DATE
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
,BEN_LER_POPL_ACTN_TYP_F benLERPOPLACTNTYPEEO
WHERE benPGMEO.PGM_ID = benPT.PGM_ID
AND benPT.PL_TYP_ID = benPLT.PL_TYP_ID
AND benPT.PTIP_ID = benLERPOPLACTNTYPEEO.PTIP_ID

AND SYSDATE BETWEEN benPGMEO.EFFECTIVE_START_DATE AND NVL(benPGMEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPT.EFFECTIVE_START_DATE AND NVL(benPT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPLT.EFFECTIVE_START_DATE AND NVL(benPLT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benLERPOPLACTNTYPEEO.EFFECTIVE_START_DATE AND NVL(benLERPOPLACTNTYPEEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))

ORDER BY 1,2,3