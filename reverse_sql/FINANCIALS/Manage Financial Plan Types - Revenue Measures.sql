/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Financial%20Plan%20Types%20-%20Revenue%20Measures.sql $:
* $Id: Manage Financial Plan Types - Revenue Measures.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */


WITH tmp_MEASURES AS (SELECT PLANNING_OPTION_ID
	,EXCEL_EXPORT_ID
	,NAME
	,STATUS_SELECTED
	FROM PJO_EXCEL_EXPORT_OPTIONS
	UNPIVOT INCLUDE NULLS(STATUS_SELECTED
		FOR NAME IN (PC_CON_RR AS 'PC_CON_RR'
			,PLC_CON_RR AS 'PLC_CON_RR'
			,PC_CON_CR AS 'PC_CON_CR'
			,PLC_CON_CR AS 'PLC_CON_CR'
			,MAR_TOTAL_COMM AS 'MAR_TOTAL_COMM'
			,MARGIN_ETC AS 'MARGIN_ETC'
			,MARGIN_EAC AS 'MARGIN_EAC'
			,MAR_PERC_TOTAL_COMM AS 'MAR_PERC_TOTAL_COMM'
			,MAR_PERC_ACT_AMT AS 'MAR_PERC_ACT_AMT'
			,MAR_PERC_ETC AS 'MAR_PERC_ETC'
			,MAR_PERC_EAC AS 'MAR_PERC_EAC'
			,MARGIN_PRCT_BUD AS 'MARGIN_PRCT_BUD'
			,MARGIN_PERC_ETC AS 'MARGIN_PERC_ETC'
			,MARGIN_PERC_EAC AS 'MARGIN_PERC_EAC'
			,FLAGGED_FOR_DELETION AS 'FLAGGED_FOR_DELETION'
			,CHANGED AS 'CHANGED'
			,ERRORS AS 'ERRORS'
			,STATUS AS 'STATUS'
			,TASK_NUMBER AS 'TASK_NUMBER'
			,TASK_NAME AS 'TASK_NAME'
			,PLANNING_RESOURCE AS 'PLANNING_RESOURCE'
			,UNIT_OF_MEASURE AS 'UNIT_OF_MEASURE'
			,PLANNING_CURRENCY AS 'PLANNING_CURRENCY'
			,FROM_DATE AS 'FROM_DATE'
			,TILL_DATE AS 'TILL_DATE'
			,PERIOD AS 'PERIOD'
			,PERIODIC_FROM_DATE AS 'PERIODIC_FROM_DATE'
			,PERIODIC_TO_DATE AS 'PERIODIC_TO_DATE'
			,RESOURCE_CLASS AS 'RESOURCE_CLASS'
			,SPREAD_CURVE AS 'SPREAD_CURVE'
			,ORG_BSLN_BUD_QTY AS 'ORG_BSLN_BUD_QTY'
			,CUR_BSLN_BUD_QTY AS 'CUR_BSLN_BUD_QTY'
			,RC_TOTAL AS 'RC_TOTAL'
			,RC_STAND_RATE AS 'RC_STAND_RATE'
			,RC_EFFCT_RATE AS 'RC_EFFCT_RATE'
			,RC_ORG_BSLN_BUD AS 'RC_ORG_BSLN_BUD'
			,RC_CUR_BSLN_BUD AS 'RC_CUR_BSLN_BUD'
			,BC_TOTAL AS 'BC_TOTAL'
			,BC_STAND_RATE AS 'BC_STAND_RATE'
			,BC_EFFCT_RATE AS 'BC_EFFCT_RATE'
			,BC_ORG_BSLN_BUD AS 'BC_ORG_BSLN_BUD'
			,BC_CUR_BSLN_BUD AS 'BC_CUR_BSLN_BUD'
			,BC_STAND_MULT AS 'BC_STAND_MULT'
			,BC_EFFECT_MULT AS 'BC_EFFECT_MULT'
			,PC_CON_CR_DATE_TYPE AS 'PC_CON_CR_DATE_TYPE'
			,PC_CON_CR_TYPE AS 'PC_CON_CR_TYPE'
			,PC_CON_CR_DATE AS 'PC_CON_CR_DATE'
			,PLC_CON_CR_DATE_TYPE AS 'PLC_CON_CR_DATE_TYPE'
			,PLC_CON_CR_TYPE AS 'PLC_CON_CR_TYPE'
			,PLC_CON_CR_DATE AS 'PLC_CON_CR_DATE'
			,RC_PC_ORG_BSLN_BUD AS 'RC_PC_ORG_BSLN_BUD'
			,RC_PC_CUR_BSLN_BUD AS 'RC_PC_CUR_BSLN_BUD'
			,RC_PC_TOTAL AS 'RC_PC_TOTAL'
			,RC_PLC_ORG_BSLN_BUD AS 'RC_PLC_ORG_BSLN_BUD'
			,RC_PLC_TOTAL AS 'RC_PLC_TOTAL'
			,BC_PC_ORG_BSLN_BUD AS 'BC_PC_ORG_BSLN_BUD'
			,BC_PC_CUR_BSLN_BUD AS 'BC_PC_CUR_BSLN_BUD'
			,BC_PC_TOTAL AS 'BC_PC_TOTAL'
			,BC_PLC_ORG_BSLN_BUD AS 'BC_PLC_ORG_BSLN_BUD'
			,BC_PLC_CUR_BSLN_BUD AS 'BC_PLC_CUR_BSLN_BUD'
			,BC_PLC_TOTAL AS 'BC_PLC_TOTAL'
			,TOT_QTY AS 'TOT_QTY'
			,REV_TOTAL AS 'REV_TOTAL'
			,REV_STD_RATE AS 'REV_STD_RATE'
			,REV_EFFCT_RATE AS 'REV_EFFCT_RATE'
			,REV_ORG_BSLN_BUD AS 'REV_ORG_BSLN_BUD'
			,REV_CUR_BSLN_BUD AS 'REV_CUR_BSLN_BUD'
			,PC_CON_RR_DATE_TYPE AS 'PC_CON_RR_DATE_TYPE'
			,PC_CON_RR_DATE AS 'PC_CON_RR_DATE'
			,PC_CON_RR_TYPE AS 'PC_CON_RR_TYPE'
			,PLC_CON_RR_DATE_TYPE AS 'PLC_CON_RR_DATE_TYPE'
			,PLC_CON_RR_DATE AS 'PLC_CON_RR_DATE'
			,PLC_CON_RR_TYPE AS 'PLC_CON_RR_TYPE'
			,REV_PC_ORG_BSLN_BUD AS 'REV_PC_ORG_BSLN_BUD'
			,REV_PC_CUR_BSLN_BUD AS 'REV_PC_CUR_BSLN_BUD'
			,REV_PC_TOTAL AS 'REV_PC_TOTAL'
			,REV_PLC_ORG_BSLN_BUD AS 'REV_PLC_ORG_BSLN_BUD'
			,REV_PLC_CUR_BSLN_BUD AS 'REV_PLC_CUR_BSLN_BUD'
			,REV_PLC_TOTAL AS 'REV_PLC_TOTAL'
			,MARGIN_BUDGET AS 'MARGIN_BUDGET'
			,MARG_ORG_BSLN_BUD AS 'MARG_ORG_BSLN_BUD'
			,MARG_CURR_BSLN_BUD AS 'MARG_CURR_BSLN_BUD'
			,MARG_PERC_BUD AS 'MARG_PERC_BUD'
			,MARG_PERC_ORG_BSLN_BUD AS 'MARG_PERC_ORG_BSLN_BUD'
			,MARG_PERC_CUR_BSLN_BUD AS 'MARG_PERC_CUR_BSLN_BUD'
			,MAR_PLC_TOTAL AS 'MAR_PLC_TOTAL'
			,QTY_COMM_REQ AS 'QTY_COMM_REQ'
			,QTY_COMM_PO AS 'QTY_COMM_PO'
			,QTY_COMM_SUPP_INV AS 'QTY_COMM_SUPP_INV'
			,QTY_COMM_EXT_COMM AS 'QTY_COMM_EXT_COMM'
			,RC_COMM_REQ AS 'RC_COMM_REQ'
			,RC_COMM_PO AS 'RC_COMM_PO'
			,RC_COMM_SUPP_INV AS 'RC_COMM_SUPP_INV'
			,RC_COMM_EXT_COMM AS 'RC_COMM_EXT_COMM'
			,BC_COMM_REQ AS 'BC_COMM_REQ'
			,BC_COMM_PO AS 'BC_COMM_PO'
			,BC_COMM_SUPP_INV AS 'BC_COMM_SUPP_INV'
			,BC_COMM_EXT_COMM AS 'BC_COMM_EXT_COMM'
			,TOT_COMM_QTY AS 'TOT_COMM_QTY'
			,ACT_AMT_QTY AS 'ACT_AMT_QTY'
			,ETC_QTY AS 'ETC_QTY'
			,EAC_QTY AS 'EAC_QTY'
			,PREV_FRCST_QTY_ACT AS 'PREV_FRCST_QTY_ACT'
			,PREV_FRCST_QTY_ETC AS 'PREV_FRCST_QTY_ETC'
			,PREV_FRCST_QTY_EAC AS 'PREV_FRCST_QTY_EAC'
			,TOT_COMM_RC AS 'TOT_COMM_RC'
			,ACT_AMT_RC AS 'ACT_AMT_RC'
			,ACT_AMT_BC AS 'ACT_AMT_BC'
			,ETC_RC AS 'ETC_RC'
			,EAC_RC AS 'EAC_RC'
			,PREV_FRCST_RC_ACT AS 'PREV_FRCST_RC_ACT'
			,PREV_FRCST_RC_ETC AS 'PREV_FRCST_RC_ETC'
			,PREV_FRCST_RC_EAC AS 'PREV_FRCST_RC_EAC'
			,TOT_COMM_BC AS 'TOT_COMM_BC'
			,ETC_BC AS 'ETC_BC'
			,EAC_BC AS 'EAC_BC'
			,PREV_FRCST_BC_ACT AS 'PREV_FRCST_BC_ACT'
			,PREV_FRCST_BC_ETC AS 'PREV_FRCST_BC_ETC'
			,PREV_FRCST_BC_EAC AS 'PREV_FRCST_BC_EAC'
			,RC_PC_TOT_COMM AS 'RC_PC_TOT_COMM'
			,RC_PC_ACT_AMT AS 'RC_PC_ACT_AMT'
			,RC_PC_ETC AS 'RC_PC_ETC'
			,RC_PC_EAC AS 'RC_PC_EAC'
			,RC_PLC_TOT_COMM AS 'RC_PLC_TOT_COMM'
			,RC_PLC_ACT_AMT AS 'RC_PLC_ACT_AMT'
			,RC_PLC_ETC AS 'RC_PLC_ETC'
			,RC_PLC_EAC AS 'RC_PLC_EAC'
			,BC_PC_TOT_COMM AS 'BC_PC_TOT_COMM'
			,BC_PC_ACT_AMT AS 'BC_PC_ACT_AMT'
			,BC_PC_ETC AS 'BC_PC_ETC'
			,BC_PC_EAC AS 'BC_PC_EAC'
			,BC_PLC_TOT_COMM AS 'BC_PLC_TOT_COMM'
			,BC_PLC_ACT_AMT AS 'BC_PLC_ACT_AMT'
			,BC_PLC_ETC AS 'BC_PLC_ETC'
			,BC_PLC_EAC AS 'BC_PLC_EAC'
			,RC_COMM_PC_REQ AS 'RC_COMM_PC_REQ'
			,RC_COMM_PC_PO AS 'RC_COMM_PC_PO'
			,RC_COMM_PC_SUP_INV AS 'RC_COMM_PC_SUP_INV'
			,RC_COMM_PC_EXT_COMM AS 'RC_COMM_PC_EXT_COMM'
			,RC_COMM_PLC_REQ AS 'RC_COMM_PLC_REQ'
			,RC_COMM_PLC_PO AS 'RC_COMM_PLC_PO'
			,RC_COMM_PLC_SUP_INV AS 'RC_COMM_PLC_SUP_INV'
			,RC_COMM_PLC_EXT_COMM AS 'RC_COMM_PLC_EXT_COMM'
			,BC_COMM_PC_REQ AS 'BC_COMM_PC_REQ'
			,BC_COMM_PC_PO AS 'BC_COMM_PC_PO'
			,BC_COMM_PC_SUP_INV AS 'BC_COMM_PC_SUP_INV'
			,BC_COMM_PC_EXT_COMM AS 'BC_COMM_PC_EXT_COMM'
			,BC_COMM_PLC_REQ AS 'BC_COMM_PLC_REQ'
			,BC_COMM_PLC_PO AS 'BC_COMM_PLC_PO'
			,BC_COMM_PLC_SUP_INV AS 'BC_COMM_PLC_SUP_INV'
			,BC_COMM_PLC_EXT_COMM AS 'BC_COMM_PLC_EXT_COMM'
			,PRV_FT_RC_PC_ACT_AMT AS 'PRV_FT_RC_PC_ACT_AMT'
			,PRV_FRCST_RC_PC_ETC AS 'PRV_FRCST_RC_PC_ETC'
			,PRV_FT_RC_PC_EAC AS 'PRV_FT_RC_PC_EAC'
			,PRV_FT_RC_PLC_ACT_AMT AS 'PRV_FT_RC_PLC_ACT_AMT'
			,PRV_FT_RC_PLC_ETC AS 'PRV_FT_RC_PLC_ETC'
			,PRV_FT_RC_PLC_EAC AS 'PRV_FT_RC_PLC_EAC'
			,PRV_FT_BC_PC_ACT_AMT AS 'PRV_FT_BC_PC_ACT_AMT'
			,PRV_FT_BC_PC_ETC AS 'PRV_FT_BC_PC_ETC'
			,PRV_FT_BC_PC_EAC AS 'PRV_FT_BC_PC_EAC'
			,PRV_FT_BC_PLC_ACT_AMT AS 'PRV_FT_BC_PLC_ACT_AMT'
			,PRV_FT_BC_PLC_ECT AS 'PRV_FT_BC_PLC_ECT'
			,PRV_FT_BC_PLC_EAC AS 'PRV_FT_BC_PLC_EAC'
			,REV_ACT_AMT AS 'REV_ACT_AMT'
			,REV_ETC AS 'REV_ETC'
			,REV_EAC AS 'REV_EAC'
			,PRV_FCST_REV_ETC AS 'PRV_FCST_REV_ETC'
			,PREV_FCST_REV_EAC AS 'PREV_FCST_REV_EAC'
			,REV_PC_ETC AS 'REV_PC_ETC'
			,REV_PC_EAC AS 'REV_PC_EAC'
			,REV_PLC_ETC AS 'REV_PLC_ETC'
			,REV_PLC_EAC AS 'REV_PLC_EAC'
			,PRE_FCST_REV_PC_AA AS 'PRE_FCST_REV_PC_AA'
			,PRE_FCST_REV_PC_ETC AS 'PRE_FCST_REV_PC_ETC'
			,PRE_FCST_REV_PC_EAC AS 'PRE_FCST_REV_PC_EAC'
			,PRE_FCST_REV_PLC_AA AS 'PRE_FCST_REV_PLC_AA'
			,PRE_FCST_REV_PLC_ETC AS 'PRE_FCST_REV_PLC_ETC'
			,PRE_FCST_REV_PLC_EAC AS 'PRE_FCST_REV_PLC_EAC'
			,MAR_TOT_COMM AS 'MAR_TOT_COMM'
			,MAR_ACT_AMT AS 'MAR_ACT_AMT'
			,MAR_ETC AS 'MAR_ETC'
			,MAR_EAC AS 'MAR_EAC'
			,PRV_FCST_MAR_ACT_AMT AS 'PRV_FCST_MAR_ACT_AMT'
			,PRV_FCST_MAR_ETC AS 'PRV_FCST_MAR_ETC'
			,PRV_FCST_MAR_EAC AS 'PRV_FCST_MAR_EAC'
			,MAR_PER_TOT_COMM AS 'MAR_PER_TOT_COMM'
			,MAR_PER_ACT_AMT AS 'MAR_PER_ACT_AMT'
			,MAR_PER_ETC AS 'MAR_PER_ETC'
			,MAR_PER_EAC AS 'MAR_PER_EAC'
			,PRE_FCST_MAR_PER_AA AS 'PRE_FCST_MAR_PER_AA'
			,PRE_FCST_MAR_PER_ETC AS 'PRE_FCST_MAR_PER_ETC'
			,PRE_FCST_MAR_PER_EAC AS 'PRE_FCST_MAR_PER_EAC'
			,MAR_PC_TOT_COMM AS 'MAR_PC_TOT_COMM'
			,MAR_PC_ACT_AMT AS 'MAR_PC_ACT_AMT'
			,MAR_PC_ETC AS 'MAR_PC_ETC'
			,MAR_PC_EAC AS 'MAR_PC_EAC'
			,MAR_PLC_TC AS 'MAR_PLC_TC'
			,MAR_PLC_TC AS 'MAR_PLC_TC'
			,MAR_PLC_AA AS 'MAR_PLC_AA'
			,MAR_PLC_ETC AS 'MAR_PLC_ETC'
			,MAR_PLC_EAC AS 'MAR_PLC_EAC'
			,PRE_FCST_MAR_PC_AA AS 'PRE_FCST_MAR_PC_AA'
			,PRE_FCST_MAR_PC_ETC AS 'PRE_FCST_MAR_PC_ETC'
			,PRE_FCST_MAR_PC_EAC AS 'PRE_FCST_MAR_PC_EAC'
			,PRE_FCST_MAR_PLC_AA AS 'PRE_FCST_MAR_PLC_AA'
			,PRE_FCST_MAR_PLC_ETC AS 'PRE_FCST_MAR_PLC_ETC'
			,PRE_FCST_MAR_PLC_EAC AS 'PRE_FCST_MAR_PLC_EAC'
	)))

SELECT 	pjoPlanTypeEO.NAME RES_NAME
,(SELECT DISTINCT MEANING
    FROM PJO_LOOKUPS
    WHERE LOOKUP_CODE = tmpMEASEO.NAME
	) RES_SELECTED_MEASURES
,pjoPlanOptionEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,pjoPlanOptionEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,pjoPlanOptionEO.CREATED_BY  RSC_CREATED_BY
,pjoPlanOptionEO.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PJO_PLAN_TYPES_VL pjoPlanTypeEO
,PJO_PLANNING_OPTIONS pjoPlanOptionEO
,tmp_MEASURES tmpMEASEO
WHERE pjoPlanTypeEO.PLAN_TYPE_CODE = 'FINANCIAL_PLAN'
AND pjoPlanTypeEO.PLAN_TYPE_ID = pjoPlanOptionEO.PLAN_TYPE_ID
AND pjoPlanOptionEO.PLAN_OPTION_LEVEL_CODE = 'PLAN_TYPE'
AND pjoPlanOptionEO.PLANNING_OPTION_ID = tmpMEASEO.PLANNING_OPTION_ID
AND tmpMEASEO.STATUS_SELECTED = 'Y'
AND pjoPlanOptionEO.PLANNED_FOR_CODE = 'REVENUE'
AND pjoPlanOptionEO.PROJECT_ID = 0