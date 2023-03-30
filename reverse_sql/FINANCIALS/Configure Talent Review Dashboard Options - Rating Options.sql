/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT talentRwTemplatesE0.NAME RES_TEMPLATE_NAME

,impactOfLossE0.LABEL RES_IMPACT_OF_LOSS_DISPLAYED_L
,(SELECT RATING_NAME
    FROM HRT_RATING_MODELS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND RATING_MODEL_ID = impactOfLossE0.RATING_MODEL_ID
    ) RES_IMPACT_OF_LOSS_RATING_MODE 
,DECODE(impactOfLossE0.USE_AS_AXIS_FLAG,'Y','Yes','No') RES_IMPACT_OF_LOSS_SELECT_AVAI

,overallCompE0.LABEL RES_OVERALL_COMPETENCIES_RATIN
,(SELECT RATING_NAME
    FROM HRT_RATING_MODELS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND RATING_MODEL_ID = overallCompE0.RATING_MODEL_ID
    ) RES_OVERALL_COMPETENCIES_RAT_0
,DECODE(overallCompE0.USE_AS_AXIS_FLAG,'Y','Yes','No') RES_OVERALL_COMPETENCIES_RAT_1

,overallGoalE0.LABEL RES_OVERALL_GOALS_RATING_DISPL
,(SELECT RATING_NAME
    FROM HRT_RATING_MODELS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND RATING_MODEL_ID = overallGoalE0.RATING_MODEL_ID
    ) RES_OVERALL_GOALS_RATING_RATIN
,DECODE(overallGoalE0.USE_AS_AXIS_FLAG,'Y','Yes','No') RES_OVERALL_GOALS_RATING_SELEC

,PerformanceE0.LABEL RES_PERFORMANCE_DISPLAYED_LABE
,(SELECT RATING_NAME
    FROM HRT_RATING_MODELS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND RATING_MODEL_ID = PerformanceE0.RATING_MODEL_ID
    ) RES_PERFORMANCE_RATING_MODEL
,DECODE(PerformanceE0.USE_AS_AXIS_FLAG,'Y','Yes','No') RES_PERFORMANCE_SELECT_AVAILAB

,PotentialE0.LABEL RES_POTENTIAL_DISPLAYED_LABELS
,(SELECT RATING_NAME
    FROM HRT_RATING_MODELS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND RATING_MODEL_ID = PotentialE0.RATING_MODEL_ID
    ) RES_POTENTIAL_RATING_MODEL
,DECODE(PotentialE0.USE_AS_AXIS_FLAG,'Y','Yes','No') RES_POTENTIAL_SELECT_AVAILABLE

,riskOfLossE0.LABEL RES_RISK_OF_LOSS_DISPLAYED_LAB
,(SELECT RATING_NAME
    FROM HRT_RATING_MODELS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND RATING_MODEL_ID = riskOfLossE0.RATING_MODEL_ID
    ) RES_RISK_OF_LOSS_RATING_MODEL
,DECODE(riskOfLossE0.USE_AS_AXIS_FLAG,'Y','Yes','No') RES_RISK_OF_LOSS_SELECT_AVAILA

,talentScoreE0.LABEL RES_TALENT_SCORE_DISPLAYED_LAB
,(SELECT RATING_NAME
    FROM HRT_RATING_MODELS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND RATING_MODEL_ID = talentScoreE0.RATING_MODEL_ID
    ) RES_TALENT_SCORE_RATING_MODEL
,DECODE(talentScoreE0.USE_AS_AXIS_FLAG,'Y','Yes','No') RES_TALENT_SCORE_SELECT_AVAILA

,impactOfLossE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,impactOfLossE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,impactOfLossE0.CREATED_BY RSC_CREATED_BY
,impactOfLossE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID



FROM HRR_DASHBOARD_TMPLS_VL talentRwTemplatesE0
,(SELECT DASHBOARD_TMPL_ID
	,LABEL
	,DASHBOARD_COLUMN_NAME
	,RATING_MODEL_ID
	,USE_AS_AXIS_FLAG
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM HRR_TMPL_METRIC_CONFIG_VL
	WHERE METRIC_CODE = 'RISK_IMPACT_OF_LOSS'
	) impactOfLossE0
,(SELECT DASHBOARD_TMPL_ID
	,LABEL
	,DASHBOARD_COLUMN_NAME
	,RATING_MODEL_ID
	,USE_AS_AXIS_FLAG
	FROM HRR_TMPL_METRIC_CONFIG_VL
	WHERE METRIC_CODE = 'SECTION_RATINGS_COMPETENCIES'
	) overallCompE0
,(SELECT DASHBOARD_TMPL_ID
	,LABEL
	,DASHBOARD_COLUMN_NAME
	,RATING_MODEL_ID
	,USE_AS_AXIS_FLAG
	FROM HRR_TMPL_METRIC_CONFIG_VL
	WHERE METRIC_CODE = 'SECTION_RATINGS_GOALS'
	) overallGoalE0
,(SELECT DASHBOARD_TMPL_ID
	,LABEL
	,DASHBOARD_COLUMN_NAME
	,RATING_MODEL_ID
	,USE_AS_AXIS_FLAG
	FROM HRR_TMPL_METRIC_CONFIG_VL
	WHERE METRIC_CODE = 'PERFORMANCE_RATING'
	) PerformanceE0
,(SELECT DASHBOARD_TMPL_ID
	,LABEL
	,DASHBOARD_COLUMN_NAME
	,RATING_MODEL_ID
	,USE_AS_AXIS_FLAG
	FROM HRR_TMPL_METRIC_CONFIG_VL
	WHERE METRIC_CODE = 'POTENTIAL'
	) PotentialE0
,(SELECT DASHBOARD_TMPL_ID
	,LABEL
	,DASHBOARD_COLUMN_NAME
	,RATING_MODEL_ID
	,USE_AS_AXIS_FLAG
	FROM HRR_TMPL_METRIC_CONFIG_VL
	WHERE METRIC_CODE = 'RISK_RISK_OF_LOSS'
	) riskOfLossE0
,(SELECT DASHBOARD_TMPL_ID
	,LABEL
	,DASHBOARD_COLUMN_NAME
	,RATING_MODEL_ID
	,USE_AS_AXIS_FLAG
	FROM HRR_TMPL_METRIC_CONFIG_VL
	WHERE METRIC_CODE = 'TALENT_SCORE'
	) talentScoreE0

WHERE talentRwTemplatesE0.DASHBOARD_TMPL_ID = impactOfLossE0.DASHBOARD_TMPL_ID(+)
AND talentRwTemplatesE0.DASHBOARD_TMPL_ID = overallCompE0.DASHBOARD_TMPL_ID(+)
AND talentRwTemplatesE0.DASHBOARD_TMPL_ID = overallGoalE0.DASHBOARD_TMPL_ID(+)
AND talentRwTemplatesE0.DASHBOARD_TMPL_ID = PerformanceE0.DASHBOARD_TMPL_ID(+)
AND talentRwTemplatesE0.DASHBOARD_TMPL_ID = PotentialE0.DASHBOARD_TMPL_ID(+)
AND talentRwTemplatesE0.DASHBOARD_TMPL_ID = riskOfLossE0.DASHBOARD_TMPL_ID(+)
AND talentRwTemplatesE0.DASHBOARD_TMPL_ID = talentScoreE0.DASHBOARD_TMPL_ID(+)
ORDER BY talentRwTemplatesE0.NAME