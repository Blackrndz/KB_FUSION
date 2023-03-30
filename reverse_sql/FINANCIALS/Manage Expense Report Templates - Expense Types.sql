/* ****************************************************************************
 * $Revision: 80316 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2023-02-24 11:48:56 +0700 (Fri, 24 Feb 2023) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Expense%20Report%20Templates%20-%20Expense%20Types.sql $:
 * $Id: Manage Expense Report Templates - Expense Types.sql 80316 2023-02-24 04:48:56Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT ExpenseTemplateEO.NAME RES_EXPENSE_REPORT_TEMPLATES_N
,(SELECT BU_NAME
	FROM FUN_ALL_BUSINESS_UNITS_V
	WHERE BU_ID = ExpenseTemplateEO.ORG_ID
	) RES_BUSINESS_UNIT
,ExpenseTypeEO.NAME RES_EXPENSE_TYPE_NAME
,ExpenseTypeEO.DESCRIPTION RES_DESCRIPTION
,(SELECT DISPLAYED_FIELD
	FROM EXM_LOOKUP_VALUES
	WHERE LOOKUP_TYPE = 'EXM_EXPENSE_TYPE_CATEGORY'
	AND ENABLED_FLAG  = 'Y'
	AND LOOKUP_CODE   = ExpenseTypeEO.CATEGORY_CODE
	) RES_CATEGORY
,ExpenseTypeEO.TAX_CLASSIFICATION_CODE RES_TAX_CLASSIFICATION_CODE
,(SELECT CONCAT_LEAF_CODE 
	FROM ZX_FC_PRODUCT_CATEGORIES_V
	WHERE CLASSIFICATION_CODE = ExpenseTypeEO.TAX_PRODUCT_CATEGORY_CODE
	) RES_TAX_PRODUCT_CATEGORY
,TO_CHAR(ExpenseTypeEO.START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(ExpenseTypeEO.END_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE
/*,(SELECT PROMPT
	FROM FND_KF_SEGMENTS_VL
	WHERE DEFAULT_VALUE_SET_ID   = SC.VALUE_SET_ID
	AND STRUCTURE_ID = SC.STRUCTURE_ID
	) RES_ACCOUNT_NAME*/
,ExpenseTypeEO.SEGMENT1 RES_ACCOUNT_VALUE
,DECODE(ExpenseTypeEO.ITEMIZATION_ONLY_FLAG,'Y','Yes','No') RES_THIS_EXPENSE_TYPE_USED_IN_
,DECODE(ExpenseTypeEO.PREPAID_FLAG,'Y','Yes','No') RES_ALLOW_PREPAID_EXPENSE_ITEM 
,ExpenseTypeEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ExpenseTypeEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ExpenseTypeEO.CREATED_BY RSC_CREATED_BY
,ExpenseTypeEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,ExpenseTemplateEO.ORG_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EXM_EXPENSE_TEMPLATES ExpenseTemplateEO
,EXM_EXPENSE_TYPES ExpenseTypeEO
/*,(SELECT ValueSetValuePEO.VALUE_SET_ID
	,ValueSetValuePEO.VALUE
	,STRInstanceE0.STRUCTURE_ID
	,ExpenseTemplateEO.EXPENSE_TEMPLATE_ID
	FROM FND_VS_VALUES_VL ValueSetValuePEO
	,FND_VS_VALUE_SETS ValueSetPEO
	,FND_KF_STR_INSTANCES_VL STRInstanceE0
	,FND_KF_SEGMENT_INSTANCES SegmentInstanceE0
	,GL_LEDGERS LedgerE0
	,EXM_EXPENSE_TEMPLATES ExpenseTemplateEO
	WHERE ValueSetValuePEO.VALUE_SET_ID = ValueSetPEO.VALUE_SET_ID
	AND ValueSetPEO.VALUE_DATA_TYPE     = 'VARCHAR2'
	AND STRInstanceE0.APPLICATION_ID = 101
	AND STRInstanceE0.KEY_FLEXFIELD_CODE = 'GL#'
	AND STRInstanceE0.STRUCTURE_INSTANCE_ID = SegmentInstanceE0.STRUCTURE_INSTANCE_ID
	AND SegmentInstanceE0.VALUE_SET_ID = ValueSetValuePEO.VALUE_SET_ID
	AND STRInstanceE0.STRUCTURE_INSTANCE_NUMBER = LedgerE0.CHART_OF_ACCOUNTS_ID
	AND LedgerE0.LEDGER_ID = (SELECT PRIMARY_LEDGER_ID
											FROM FUN_ALL_BUSINESS_UNITS_V
											WHERE BU_ID = ExpenseTemplateEO.ORG_ID
											)
	) SC*/
WHERE ExpenseTemplateEO.EXPENSE_TEMPLATE_ID = ExpenseTypeEO.EXPENSE_TEMPLATE_ID
/*AND SC.VALUE(+) = ExpenseTypeEO.SEGMENT1
AND SC.EXPENSE_TEMPLATE_ID(+) = ExpenseTypeEO.EXPENSE_TEMPLATE_ID*/
ORDER BY ExpenseTemplateEO.NAME
,RES_BUSINESS_UNIT
,ExpenseTypeEO.NAME