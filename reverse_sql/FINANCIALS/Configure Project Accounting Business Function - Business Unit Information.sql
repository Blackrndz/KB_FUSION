/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT buE0.SHORT_CODE RES_BUSINESS_UNIT_CODE
,buE0.BU_NAME RES_BUSINESS_UNIT_NAME
,(CASE WHEN PROJ_TREE_VERSION_ID = '-1'
	THEN (SELECT MEANING
    FROM FND_LOOKUPS
    WHERE LOOKUP_TYPE = 'ORA_PJF_NO_TREE_STRINGS'
    AND LOOKUP_CODE = typeE0.ORG_HIERARCHY_TYPE_CODE)
	ELSE 'HCM Organization Hierarchy Tree Structure' END)RES_ORGANIZATION_HIERARCHY_TYP
,(SELECT TREE_NAME
    FROM FND_TREE_VL
    WHERE TREE_STRUCTURE_CODE = buInplAllE0.PROJ_TREE_STRUCTURE_CODE
    AND TREE_CODE = buInplAllE0.PROJ_TREE_CODE
    ) RES_PROJECT_TASK_OWNING_ORGANI
,(SELECT TREE_VERSION_NAME 
    FROM FND_TREE_VERSION_VL
    WHERE TREE_STRUCTURE_CODE = buInplAllE0.PROJ_TREE_STRUCTURE_CODE
    AND TREE_CODE = buInplAllE0.PROJ_TREE_CODE
    AND TREE_VERSION_ID = buInplAllE0.PROJ_TREE_VERSION_ID
    ) RES_PROJECT_TASK_OWNING_ORGA_0
,(SELECT NAME
    FROM HR_ALL_ORGANIZATION_UNITS
    WHERE ORGANIZATION_ID = buInplAllE0.PROJ_START_ORG_ID
     ) RES_PROJECT_TASK_OWNING_ORGA_1
,(CASE WHEN buInplAllE0.PROJ_TREE_STRUCTURE_CODE = buInplAllE0.EXP_TREE_STRUCTURE_CODE AND buInplAllE0.PROJ_TREE_CODE = buInplAllE0.EXP_TREE_CODE
	AND buInplAllE0.PROJ_START_ORG_ID = buInplAllE0.EXP_START_ORG_ID AND buInplAllE0.PROJ_TREE_VERSION_ID = buInplAllE0.EXP_TREE_VERSION_ID
	THEN 'No'
	ELSE 'Yes' END ) RES_USE_DIFFERENT_DETAILS_FOR_
,(SELECT TREE_NAME
    FROM FND_TREE_VL
    WHERE TREE_STRUCTURE_CODE = buInplAllE0.EXP_TREE_STRUCTURE_CODE
    AND TREE_CODE = buInplAllE0.EXP_TREE_CODE
    ) RES_PROJECT_EXPENDITURE_ORGANI
,(SELECT TREE_VERSION_NAME 
    FROM FND_TREE_VERSION_VL
    WHERE TREE_STRUCTURE_CODE = buInplAllE0.EXP_TREE_STRUCTURE_CODE
    AND TREE_CODE = buInplAllE0.EXP_TREE_CODE
    AND TREE_VERSION_ID = buInplAllE0.EXP_TREE_VERSION_ID
    ) RES_PROJECT_EXPENDITURE_ORGA_2
,(SELECT NAME
    FROM HR_ALL_ORGANIZATION_UNITS
    WHERE ORGANIZATION_ID = buInplAllE0.EXP_START_ORG_ID
    ) RES_PROJECT_EXPENDITURE_ORGA_3
,DECODE(buInplAllE0.SAME_PA_GL_PERIOD,'N','Yes','No') RES_ACCOUNTING_PERIOD_USE_DIFF
,(SELECT USER_PERIOD_SET_NAME
	FROM GL_CALENDARS
	WHERE PERIOD_SET_NAME = buInplAllE0.PERIOD_SET_NAME 
	) RES_ACCOUNTING_PERIOD_PROJECT_
,(SELECT USER_CONVERSION_TYPE 
    FROM GL_DAILY_CONVERSION_TYPES
    WHERE CONVERSION_TYPE = buInplAllE0.DEFAULT_RATE_TYPE
    )  RES_COSTING_CURRENCY_CONVERSIO
,(SELECT MEANING
    FROM FND_LOOKUPS
    WHERE LOOKUP_TYPE = 'PJF_BU_RATE_DATE'
    AND LOOKUP_CODE = buInplAllE0.DEFAULT_RATE_DATE_CODE
    ) RES_COSTING_CURRENCY_CONVERS_4
,(SELECT MEANING
    FROM FND_LOOKUPS
    WHERE LOOKUP_TYPE = 'PJF_EXP_START_DAY'
    AND LOOKUP_CODE = buInplAllE0.EXP_CYCLE_START_DAY_CODE
    ) RES_COSTING_EXPENDITURE_CYCLE_
,buInplAllE0.BOOK_TYPE_CODE RES_COSTING_DEFAULT_ASSET_BOOK
,DECODE(buInplAllE0.RET_PROCESS_FLAG,'Y','Yes','No') RES_ENABLE_RETIREMENT_PROCESSI
,DECODE(buInplAllE0.SEPARATION_OF_DUTIES_FLAG,'Y','Yes','No') RES_SEPARATE_THE_DUTIES_TO_ENT
,(SELECT MEANING
    FROM FND_LOOKUPS
    WHERE LOOKUP_TYPE = 'PJF_BU_RATE_DATE'
    AND LOOKUP_CODE = buInplAllE0.CC_DEFAULT_RATE_DATE_CODE
    ) RES_TRANSFER_PRICE_CURRENCY_CO
,(SELECT USER_CONVERSION_TYPE 
    FROM GL_DAILY_CONVERSION_TYPES
    WHERE CONVERSION_TYPE = buInplAllE0.CC_DEFAULT_RATE_TYPE
    ) RES_TRANSFER_PRICE_CURRENCY__5
,NVL((SELECT MEANING
    FROM FND_LOOKUPS
    WHERE LOOKUP_TYPE = 'PJC_CROSS_CHARGE_BU'
    AND LOOKUP_CODE = buInplAllE0.CC_PROCESS_IO_CODE
    ),'None') RES_PROCESSING_METHOD_WITHIN_B
,NVL((SELECT MEANING
    FROM FND_LOOKUPS
    WHERE LOOKUP_TYPE = 'PJC_CROSS_CHARGE_BU'
    AND LOOKUP_CODE = buInplAllE0.CC_PROCESS_IU_CODE
    ),'None') RES_PROCESSING_METHOD_BETWEEN_
,buE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,buE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,buE0.CREATED_BY RSC_CREATED_BY
,buE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,buE0.BU_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PJF_BU_IMPL_ALL buInplAllE0
,FUN_ALL_BUSINESS_UNITS_V buE0
,(SELECT ORG_HIERARCHY_TYPE_CODE FROM PJF_ORG_HIERARCHY_TYPE WHERE ROWNUM = 1) typeE0
WHERE buInplAllE0.ORG_ID = buE0.BU_ID
ORDER BY buE0.BU_NAME