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
--,(SELECT NAME FROM BEN_ACTN_TYP_VL WHERE ACTN_TYP_ID = benLERPOPLACTNTYPEEO.ACTN_TYP_ID) RES_ACTION_ITEM
,(SELECT NAME FROM BEN_LER_F_VL WHERE LER_ID = benLERPOPLACTNTYPEEO.LER_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_LIFE_EVENT
,TO_CHAR(benLERPOPLACTNTYPEEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_CERTIFICATION_EFFECTIVE_ST
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'BEN_DPNT_CVG_CTFN_TYP'
    AND LOOKUP_CODE = benLERCHGDPNTCVGEO.DPNT_CVG_CTFN_TYP_CD
    ) RES_CERTIFICATION_TYPE
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'CONTACT'
    AND LOOKUP_CODE = benLERCHGDPNTCVGEO.RLSHP_TYP_CD 
    ) RES_RELATIONSHIP_TYPE 
,DECODE(benLERCHGDPNTCVGEO.RQD_FLAG,'Y','Yes','No') RES_CERTIFICATION_TYPE_REQUIRE
,(SELECT FORMULA_NAME
    FROM FF_FORMULAS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND FORMULA_ID = benLERCHGDPNTCVGEO.DPNT_CTFN_DETERMINE_CD
    ) RES_CERTIFICATION_TYPE_DETERMI
,TO_CHAR(benLERCHGDPNTCVGEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_CERTIFICATION_TYPE_EFFECTI
,DECODE(TO_CHAR(benLERCHGDPNTCVGEO.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(benLERCHGDPNTCVGEO.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_CERTIFICATION_TYPE_EFFEC_0


,benLERCHGDPNTCVGEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benLERCHGDPNTCVGEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benLERCHGDPNTCVGEO.CREATED_BY RSC_CREATED_BY
,benLERCHGDPNTCVGEO.CREATION_DATE RSC_CREATION_DATE
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
,BEN_LER_CHG_DPNT_CVG_CTFN_F benLERCHGDPNTCVGEO
WHERE benPGMEO.PGM_ID = benPT.PGM_ID
AND benPT.PL_TYP_ID = benPLT.PL_TYP_ID
AND benPT.PTIP_ID = benLERPOPLACTNTYPEEO.PTIP_ID
AND benLERCHGDPNTCVGEO.LER_POPL_ACTN_TYP_ID = benLERPOPLACTNTYPEEO.LER_POPL_ACTN_TYP_ID
AND SYSDATE BETWEEN benPGMEO.EFFECTIVE_START_DATE AND NVL(benPGMEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPT.EFFECTIVE_START_DATE AND NVL(benPT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPLT.EFFECTIVE_START_DATE AND NVL(benPLT.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benLERPOPLACTNTYPEEO.EFFECTIVE_START_DATE AND NVL(benLERPOPLACTNTYPEEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benLERCHGDPNTCVGEO.EFFECTIVE_START_DATE AND NVL(benLERCHGDPNTCVGEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))

ORDER BY 1,2,3