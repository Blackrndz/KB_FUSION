/* ****************************************************************************
 * $Revision$:
 * $Author$:
 * $Date$:
 * $HeadURL$:
 * $Id$:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=XCC_CONTROL_BUDGETS


SELECT xccCONTROLBUDE0.NAME RES_NAME
,DECODE(xccCONTROLBUDE0.ALLOW_OVERRIDES_FLAG,'Y','Yes','No') RES_ALLOW_OVERRIDES
,xccOVERIDE0.NAME RES_OVERRIDE_RULES_NAME
,'All' RES_JOURNAL_CATEGORIES
,NULL RES_ENABLED

,xccOVERIDE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,xccOVERIDE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,xccOVERIDE0.CREATED_BY RSC_CREATED_BY
,xccOVERIDE0.CREATION_DATE RSC_CREATION_DATE
,xccCONTROLBUDE0.LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM XCC_CONTROL_BUDGETS xccCONTROLBUDE0
,XCC_CB_OVERRIDE_RULES xccOVERIDE0
WHERE xccCONTROLBUDE0.CONTROL_BUDGET_ID = xccOVERIDE0.CONTROL_BUDGET_ID
AND xccOVERIDE0.ALL_JOURNAL_CATEGORIES_FLAG = 'Y'
AND xccCONTROLBUDE0.ALLOW_OVERRIDES_FLAG = 'Y'

UNION

SELECT xccCONTROLBUDE0.NAME  RES_NAME
,DECODE(xccCONTROLBUDE0.ALLOW_OVERRIDES_FLAG,'Y','Yes','No') RES_ALLOW_OVERRIDES
,xccOVERIDE0.NAME RES_OVERRIDE_RULES_NAME
,(SELECT USER_JE_CATEGORY_NAME FROM GL_JE_CATEGORIES_VL WHERE JE_CATEGORY_NAME = xccOVERIDJOURE0.JE_CATEGORY_CODE 
	AND LANGUAGE = USERENV('LANG')) RES_JOURNAL_CATEGORIES
,'Yes' RES_ENABLED

,xccOVERIDJOURE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,xccOVERIDJOURE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,xccOVERIDJOURE0.CREATED_BY RSC_CREATED_BY
,xccOVERIDJOURE0.CREATION_DATE RSC_CREATION_DATE
,xccCONTROLBUDE0.LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM XCC_CONTROL_BUDGETS xccCONTROLBUDE0
,XCC_CB_OVERRIDE_RULES xccOVERIDE0
,XCC_CB_OVERRIDE_JOURNALS xccOVERIDJOURE0
WHERE xccCONTROLBUDE0.CONTROL_BUDGET_ID = xccOVERIDE0.CONTROL_BUDGET_ID
AND xccOVERIDE0.OVERRIDE_RULE_ID = xccOVERIDJOURE0.OVERRIDE_RULE_ID
AND xccOVERIDE0.ALL_JOURNAL_CATEGORIES_FLAG = 'N'
AND xccCONTROLBUDE0.ALLOW_OVERRIDES_FLAG = 'Y'

ORDER BY 1,3