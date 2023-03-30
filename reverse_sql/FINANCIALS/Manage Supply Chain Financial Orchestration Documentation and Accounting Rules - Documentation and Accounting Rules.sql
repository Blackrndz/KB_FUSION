/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2017-10-11  $:
 * $HeadURL:  $:
 * $Id: Manage Supply Chain Financial Orchestration System Options - Supply Chain Financial Orchestration System Options.sql  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT FosTaRuleSetE0.TA_RULE_SET_NAME RES_NAME
,FosTaRuleSetE0.DESCRIPTION RES_DESCRIPTION
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'FOS_CURRENCY_OPTIONS'
	AND LOOKUP_CODE = FosTaRuleSetE0.CURRENCY_OPTION
	) RES_CURRENCY_OPTION
,(SELECT USER_CONVERSION_TYPE 
	FROM GL_DAILY_CONVERSION_TYPES
	WHERE CONVERSION_TYPE = FosTaRuleSetE0.CONVERSION_TYPE
	) RES_CONVERSION_TYPE
,TO_CHAR(FosTaRuleSetE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,DECODE(Extract(YEAR FROM FosTaRuleSetE0.EFFECTIVE_END_DATE),'4712',NULL,TO_CHAR(FosTaRuleSetE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_EFFECTIVE_END_DATE
,'Yes' RES_TRADE_DISTRIBUTIONS
,DECODE(FosTaRuleSetE0.TRACK_PROFITS_FLAG,'Y','Yes','No') RES_TRACK_PROFITS_IN_INVENTORY
,(SELECT DECODE(ENABLED_FLAG,'Y','Yes','No')
	FROM FOS_TA_RULE_SET_DOCUMENTS_F
	WHERE TA_RULE_SET_ID = FosTaRuleSetE0.TA_RULE_SET_ID
	AND TRANSACTION_TYPE = 'APINVOICE'
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) RES_INTERCOMPANY_INVOICES
,(SELECT (SELECT EVENT_TYPE_NAME
		FROM FOS_EVENT_DEFINITIONS_TL 
		WHERE EVENT_DEFINITION_ID = IMT_EVENT_DEF_ID
		AND LANGUAGE = USERENV('LANG')		)
	FROM FOS_TA_RULE_SET_DOCUMENTS_F
	WHERE TA_RULE_SET_ID = FosTaRuleSetE0.TA_RULE_SET_ID
	AND TRANSACTION_TYPE = 'INTRANSIT_RECEIPT'
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) RES_FORWARD_FLOW
,(SELECT (SELECT EVENT_TYPE_NAME
		FROM FOS_EVENT_DEFINITIONS_TL 
		WHERE EVENT_DEFINITION_ID = IMT_EVENT_DEF_ID
		AND LANGUAGE = USERENV('LANG')		)
	FROM FOS_TA_RULE_SET_DOCUMENTS_F
	WHERE TA_RULE_SET_ID = FosTaRuleSetE0.TA_RULE_SET_ID
	AND TRANSACTION_TYPE = 'INTRANSIT_RETURN_RECEIPT'
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) RES_RETURN_FLOW
,FosTaRuleSetE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,FosTaRuleSetE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,FosTaRuleSetE0.CREATED_BY RSC_CREATED_BY
,FosTaRuleSetE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,FosTaRuleSetE0.ENTERPRISE_ID RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FOS_TA_RULE_SET_VL FosTaRuleSetE0