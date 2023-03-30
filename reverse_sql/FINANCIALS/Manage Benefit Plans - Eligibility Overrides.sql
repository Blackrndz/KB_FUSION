/* ****************************************************************************
 * $Revision: 78875 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-06-27 14:11:47 +0700 (Mon, 27 Jun 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Plans%20-%20Eligibility%20Overrides.sql $:
 * $Id: Manage Benefit Plans - Eligibility Overrides.sql 78875 2022-06-27 07:11:47Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=BEN_PL_F
 
SELECT * 
FROM (SELECT benPlansE0.NAME RES_PLAN_NAME
	,TO_CHAR(benPlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
    ,benPlansE0.NAME RES_PLAN_OR_OPTION_NAME
	,'Plan' RES_PLAN_OR_OPTION_DESCRIPTION
	,TO_CHAR(benPlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_ELIGIBILITY_OVERRIDES_EFFE
    ,DECODE(TO_CHAR(benPlansE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY'),'31-12-4712',NULL,TO_CHAR(benPlansE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_ELIGIBILITY_OVERRIDES_EF_0
	,(SELECT MEANING
        FROM FND_LOOKUP_VALUES
        WHERE LANGUAGE = USERENV('LANG')
        AND LOOKUP_TYPE = 'BEN_FMLY_MMBR'
        AND LOOKUP_CODE = benPlansE0.VRFY_FMLY_MMBR_CD
        ) RES_FAMILY_MEMBER_RULE
	,(SELECT FORMULA_NAME
        FROM FF_FORMULAS_TL
        WHERE LANGUAGE = USERENV('LANG')
        AND FORMULA_ID = benPlansE0.VRFY_FMLY_MMBR_RL
        ) RES_FAMILY_MEMBER_FORMULA
    ,(SELECT MEANING
        FROM FND_LOOKUP_VALUES
        WHERE LANGUAGE = USERENV('LANG')
        AND LOOKUP_TYPE = 'BEN_PER_CVRD'
        AND LOOKUP_CODE = benPlansE0.PER_CVRD_CD
        ) RES_PARTICIPANT_ELIGIBILITY_VE
    ,DECODE(benPlansE0.TRK_INELIG_PER_FLAG,'Y','Yes','No') RES_TRACK_INELIGIBLE_PERSONS
    ,DECODE(benPlansE0.PRTN_ELIG_OVRID_ALWD_FLAG,'Y','Yes','No') RES_ENABLE_PARTICIPATION_ELIGI
    ,DECODE(benPlansE0.WVBL_FLAG,'Y','Yes','No') RES_ENABLE_PARTICIPATION_TO_BE
	,benPlansE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
	,benPlansE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
	,benPlansE0.CREATED_BY  RSC_CREATED_BY
	,benPlansE0.CREATION_DATE  RSC_CREATION_DATE
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
	WHERE SYSDATE BETWEEN benPlansE0.EFFECTIVE_START_DATE AND benPlansE0.EFFECTIVE_END_DATE
	AND benPlansE0.PL_TYP_ID = planTypesE0.PL_TYP_ID
    
    UNION
	
	SELECT benPlansE0.NAME RES_PLAN_NAME
	,TO_CHAR(benPlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
    ,(SELECT NAME
		FROM BEN_OPT_F
		WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
		AND OPT_ID = planOptionsE0.OPT_ID
		) RES_PLAN_OR_OPTION_NAME
	,'Options' RES_PLAN_OR_OPTION_DESCRIPTION
	,TO_CHAR(benPlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_ELIGIBILITY_OVERRIDES_EFFE
    ,DECODE(TO_CHAR(benPlansE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY'),'31-12-4712',NULL,TO_CHAR(benPlansE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_ELIGIBILITY_OVERRIDES_EF_0
	,(SELECT MEANING
        FROM FND_LOOKUP_VALUES
        WHERE LANGUAGE = USERENV('LANG')
        AND LOOKUP_TYPE = 'BEN_FMLY_MMBR'
        AND LOOKUP_CODE = benPlansE0.VRFY_FMLY_MMBR_CD
        ) RES_FAMILY_MEMBER_RULE
	,(SELECT FORMULA_NAME
        FROM FF_FORMULAS_TL
        WHERE LANGUAGE = USERENV('LANG')
        AND FORMULA_ID = benPlansE0.VRFY_FMLY_MMBR_RL
        ) RES_FAMILY_MEMBER_FORMULA
    ,(SELECT MEANING
        FROM FND_LOOKUP_VALUES
        WHERE LANGUAGE = USERENV('LANG')
        AND LOOKUP_TYPE = 'BEN_PER_CVRD'
        AND LOOKUP_CODE = benPlansE0.PER_CVRD_CD
        ) RES_PARTICIPANT_ELIGIBILITY_VE
    ,DECODE(benPlansE0.TRK_INELIG_PER_FLAG,'Y','Yes','No') RES_TRACK_INELIGIBLE_PERSONS
    ,DECODE(benPlansE0.PRTN_ELIG_OVRID_ALWD_FLAG,'Y','Yes','No') RES_ENABLE_PARTICIPATION_ELIGI
    ,DECODE(benPlansE0.WVBL_FLAG,'Y','Yes','No') RES_ENABLE_PARTICIPATION_TO_BE
	,benPlansE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
	,benPlansE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
	,benPlansE0.CREATED_BY  RSC_CREATED_BY
	,benPlansE0.CREATION_DATE  RSC_CREATION_DATE
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
    WHERE benPlansE0.PL_ID = planOptionsE0.PL_ID
    )
    
ORDER BY RES_PLAN_NAME