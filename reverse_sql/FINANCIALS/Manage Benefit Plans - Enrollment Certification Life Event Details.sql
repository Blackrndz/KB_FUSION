/* ****************************************************************************
 * $Revision: 78875 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-06-27 14:11:47 +0700 (Mon, 27 Jun 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Plans%20-%20Enrollment%20Certification%20Life%20Event%20Details.sql $:
 * $Id: Manage Benefit Plans - Enrollment Certification Life Event Details.sql 78875 2022-06-27 07:11:47Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=BEN_PL_F
 
SELECT * 
FROM (SELECT benPlansE0.NAME RES_PLAN_NAME
    ,TO_CHAR(benPlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
	,benPlansE0.NAME RES_PLAN_OR_OPTION_NAME
	,'Plan' RES_PLAN_OR_OPTION_DESCRIPTION
	,(SELECT NAME
		FROM BEN_LER_F_TL
		WHERE LANGUAGE = USERENV('LANG')
		AND LER_ID = enrollCertLerE0.LER_ID
		) RES_LIFE_EVENT
    ,(SELECT MEANING
         FROM FND_LOOKUP_VALUES
         WHERE LANGUAGE = USERENV('LANG')
         AND LOOKUP_TYPE = 'BEN_ENRT_CTFN_TYP'
         AND LOOKUP_CODE = lerTypesE0.ENRT_CTFN_TYP_CD
         ) RES_CERTIFICATION_TYPE
    ,(SELECT MEANING
         FROM FND_LOOKUP_VALUES
         WHERE LANGUAGE = USERENV('LANG')
         AND LOOKUP_TYPE = 'BEN_DET_CTFN'
         AND LOOKUP_CODE = lerTypesE0.CTFN_DETERMINE_CD
         ) RES_DETERMINATION_RULE
    ,(SELECT FORMULA_NAME
         FROM FF_FORMULAS_TL
         WHERE LANGUAGE = USERENV('LANG')
         AND FORMULA_ID = lerTypesE0.CTFN_RQD_WHEN_RL
         ) RES_DETERMINATION_FORMULA
    ,DECODE(lerTypesE0.RQD_FLAG,'Y','Yes','No') RES_REQUIRED
    ,TO_CHAR(lerTypesE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_LIFE_EVENT_DETAILS_EFFECTI
	,DECODE(TO_CHAR(lerTypesE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY'),'31-12-4712',NULL,TO_CHAR(lerTypesE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_LIFE_EVENT_DETAILS_EFFEC_0
	,lerTypesE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
	,lerTypesE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
	,lerTypesE0.CREATED_BY  RSC_CREATED_BY
	,lerTypesE0.CREATION_DATE  RSC_CREATION_DATE
	,null RSC_LEDGER_ID
	,null RSC_CHART_OF_ACCOUNTS_ID
	,null RSC_BUSINESS_UNIT_ID
	,null RSC_LEGAL_ENTITY_ID
	,null RSC_ORGANIZATION_ID
	,null RSC_BUSINESS_GROUP_ID
	,NULL RSC_ENTERPRISE_ID
	,benPlansE0.LEGISLATION_CODE RSC_COUNTRY_ID

    FROM BEN_PL_F benPlansE0
	,(SELECT NAME
		,PL_TYP_ID
		FROM BEN_PL_TYP_F
		WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
		AND OPT_TYP_CD != 'FLXCR'
		) planTypesE0
    ,BEN_LER_POPL_ACTN_TYP_F enrollCertLerE0
    ,BEN_LER_ENRT_CTFN_F lerTypesE0
    WHERE SYSDATE BETWEEN benPlansE0.EFFECTIVE_START_DATE AND benPlansE0.EFFECTIVE_END_DATE
	AND benPlansE0.PL_TYP_ID = planTypesE0.PL_TYP_ID
	AND benPlansE0.PL_ID = enrollCertLerE0.PL_ID
    AND enrollCertLerE0.ACTN_TYP_LVL_CD = 'ENRTCTFN'
    AND enrollCertLerE0.LER_POPL_ACTN_TYP_ID = lerTypesE0.LER_POPL_ACTN_TYP_ID
    
    UNION
    
    SELECT benPlansE0.NAME RES_PLAN
    ,TO_CHAR(benPlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
    ,(SELECT NAME
         FROM BEN_OPT_F
         WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
         AND OPT_ID = planOptionsE0.OPT_ID
         ) RES_PLAN_OR_OPTION_NAME
	,'Options' RES_PLAN_OR_OPTION_DESCRIPTION
	,(SELECT NAME
		FROM BEN_LER_F_TL
		WHERE LANGUAGE = USERENV('LANG')
		AND LER_ID = enrollCertLerE0.LER_ID
		) RES_LIFE_EVENT
    ,(SELECT MEANING
         FROM FND_LOOKUP_VALUES
         WHERE LANGUAGE = USERENV('LANG')
         AND LOOKUP_TYPE = 'BEN_ENRT_CTFN_TYP'
         AND LOOKUP_CODE = lerTypesE0.ENRT_CTFN_TYP_CD
         ) RES_CERTIFICATION_TYPE
    ,(SELECT MEANING
         FROM FND_LOOKUP_VALUES
         WHERE LANGUAGE = USERENV('LANG')
         AND LOOKUP_TYPE = 'BEN_DET_CTFN'
         AND LOOKUP_CODE = lerTypesE0.CTFN_DETERMINE_CD
         ) RES_DETERMINATION_RULE
    ,(SELECT FORMULA_NAME
         FROM FF_FORMULAS_TL
         WHERE LANGUAGE = USERENV('LANG')
         AND FORMULA_ID = lerTypesE0.CTFN_RQD_WHEN_RL
         ) RES_DETERMINATION_FORMULA
    ,DECODE(lerTypesE0.RQD_FLAG,'Y','Yes','No') RES_REQUIRED
    ,TO_CHAR(enrollCertLerE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_LIFE_EVENT_DETAILS_EFFECTI
    ,TO_CHAR(lerTypesE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_LIFE_EVENT_DETAILS_EFFEC_0
	,lerTypesE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
	,lerTypesE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
	,lerTypesE0.CREATED_BY  RSC_CREATED_BY
	,lerTypesE0.CREATION_DATE  RSC_CREATION_DATE
	,null RSC_LEDGER_ID
	,null RSC_CHART_OF_ACCOUNTS_ID
	,null RSC_BUSINESS_UNIT_ID
	,null RSC_LEGAL_ENTITY_ID
	,null RSC_ORGANIZATION_ID
	,null RSC_BUSINESS_GROUP_ID
	,NULL RSC_ENTERPRISE_ID
	,benPlansE0.LEGISLATION_CODE RSC_COUNTRY_ID
    
    
    FROM BEN_PL_F benPlansE0
    ,BEN_OIPL_F planOptionsE0
    ,BEN_LER_POPL_ACTN_TYP_F enrollCertLerE0
    ,BEN_LER_ENRT_CTFN_F lerTypesE0
    WHERE benPlansE0.PL_ID = planOptionsE0.PL_ID
    AND planOptionsE0.OIPL_ID = enrollCertLerE0.OIPL_ID
    AND enrollCertLerE0.ACTN_TYP_LVL_CD = 'ENRTCTFN'
    AND enrollCertLerE0.LER_POPL_ACTN_TYP_ID = lerTypesE0.LER_POPL_ACTN_TYP_ID
    )
ORDER BY RES_PLAN_NAME