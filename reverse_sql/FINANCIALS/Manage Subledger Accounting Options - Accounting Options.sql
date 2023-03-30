/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Subledger%20Accounting%20Options%20-%20Accounting%20Options.sql $:
* $Id: Manage Subledger Accounting Options - Accounting Options.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */


SELECT GlLedgers.NAME AS RES_LEDGER
,SUBLEDGERAPPLICATIONPEO.APPLICATION_NAME AS RES_SUBLEDGER_APPLICATION
,(CASE
		WHEN GLLEDGERS.LEDGER_CATEGORY_CODE = 'SECONDARY'
		THEN
			NVL((SELECT meaning
			FROM fnd_lookups
			WHERE lookup_type = 'YES_NO'
			AND lookup_code   = LedgerOptionEO.ENABLED_FLAG),'No')
		ELSE NULL
	END) AS RES_SUBLEDGER_ACCOUNTING_ENABL
,(CASE
		WHEN GLLEDGERS.LEDGER_CATEGORY_CODE = 'SECONDARY'
		THEN
			NVL((SELECT meaning
			FROM fnd_lookups
			WHERE lookup_type = 'YES_NO'
			AND lookup_code   = LedgerOptionEO.CAPTURE_EVENT_FLAG),'No')
		ELSE NULL
	END) AS RES_VALUATION_METHOD_LEDGER
,(SELECT MEANING
	FROM XLA_LOOKUPS
	WHERE LOOKUP_TYPE = 'XLA_GL_TRANSFER_MODE'
	AND lookup_code   = LedgerOptionEO.TRANSFER_TO_GL_MODE_CODE
	) AS RES_GENERAL_LEDGER_JOURNAL_ENT
,(SELECT MEANING
	FROM XLA_LOOKUPS
	WHERE LOOKUP_TYPE = 'XLA_REVERSAL_OPTIONS'
	AND lookup_code   = LedgerOptionEO.ACCT_REVERSAL_OPTION_CODE
	) AS RES_REVERSAL_METHOD
,(SELECT MEANING
	FROM XLA_LOOKUPS
	WHERE LOOKUP_TYPE = 'XLA_ROUNDING_RULE'
	AND lookup_code   = LedgerOptionEO.ROUNDING_RULE_CODE
	) AS RES_ROUNDING_RULE
,(SELECT MEANING
	FROM XLA_LOOKUPS
	WHERE LOOKUP_TYPE = 'XLA_MERGE_OPTIONS'
	AND lookup_code   = LedgerOptionEO.MERGE_ACCT_OPTION_CODE
	) AS RES_THIRD_PARTY_MERGE_ACCOUNTI
, (SELECT name 
	FROM xla_tab_acct_defs_vl  
	WHERE ACCOUNT_DEFINITION_CODE = LedgerOptionEO.ACCOUNT_DEFINITION_CODE
	AND APPLICATION_ID = LedgerOptionEO.APPLICATION_ID
	AND ACCOUNT_DEFINITION_TYPE_CODE = LedgerOptionEO.ACCOUNT_DEFINITION_TYPE_CODE
	AND STATUS_CODE != 'INACTIVE'
	) AS RES_TRANSACTION_ACCOUNT_DEFINI
,LedgerOptionEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,LedgerOptionEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,LedgerOptionEO.CREATED_BY RSC_CREATED_BY
,LedgerOptionEO.CREATION_DATE RSC_CREATION_DATE
,LedgerOptionEO.LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM GL_LEDGERS GlLedgers
,XLA_SUBLEDGERS_TL SUBLEDGERAPPLICATIONPEO
,XLA_LEDGER_OPTIONS LEDGEROPTIONEO
WHERE LEDGEROPTIONEO.LEDGER_ID       = GLLEDGERS.LEDGER_ID
AND LedgerOptionEO.APPLICATION_ID    = SUBLEDGERAPPLICATIONPEO.APPLICATION_ID
AND SUBLEDGERAPPLICATIONPEO.LANGUAGE = USERENV('LANG')
AND SUBLEDGERAPPLICATIONPEO.APPLICATION_NAME != 'Subledger Accounting'
ORDER BY GlLedgers.NAME