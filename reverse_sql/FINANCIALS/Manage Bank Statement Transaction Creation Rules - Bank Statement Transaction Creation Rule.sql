/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Bank%20Statement%20Transaction%20Creation%20Rules%20-%20Bank%20Statement%20Transaction%20Creation%20Rule.sql $:
 * $Id: Manage Bank Statement Transaction Creation Rules - Bank Statement Transaction Creation Rule.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- FIELD_TO_APPLY_FUNCTION=RES_CASH_ACCOUNT/GET_CODE_COMBINATION
-- FIELD_TO_APPLY_FUNCTION=RES_OFFSET_ACCOUNT/GET_CODE_COMBINATION

SELECT DISTINCT CEJEMAPPINGS.RULE_NAME RES_NAME
,LE.LEGAL_ENTITY_NAME RES_LEGAL_ENTITY
,LE.LEGAL_ENTITY_IDENTIFIER RES_LEGAL_ENTITY_IDENTIFIER
,DECODE(CEJEMAPPINGS.ACTIVE_FLAG,'Y','Yes','No') RES_ACTIVE
,CeJeMappings.DESCRIPTION RES_DESCRIPTION
,CELOOKUPPEOSTMTTRXTYPE.MEANING RES_STATEMENT_LINE_IDENTIFICAT
,BANKTRANSACTIONCODESEO.TRX_CODE RES_TRANSACTION_CODE
,CeLookupPEOSearchField.MEANING RES_SEARCH_FIELD
,CEJEMAPPINGS.SEARCH_STRING_TXT RES_SEARCH_STRING
,CELOOKUPPEOBANKTRXTYPE.MEANING RES_TRANSACTION_DETAILS_TYPE
,BUSINESSUNITPEO.BU_NAME        RES_BUSINESS_UNIT
,DECODE(CEJEMAPPINGS.ACCOUNTING_FLAG,'Y','Yes','No') RES_ACCOUNTING
,CEJEMAPPINGS.GL_CASH_CCID RES_CASH_ACCOUNT
,CEJEMAPPINGS.GL_OFFSET_CCID RES_OFFSET_ACCOUNT
,CeJeMappings.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,CeJeMappings.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,CeJeMappings.CREATED_BY RSC_CREATED_BY
,CeJeMappings.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,CeJeMappings.BUSINESS_UNIT_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CE_JE_MAPPINGS CeJeMappings
,FUN_ALL_BUSINESS_UNITS_V BusinessUnitPEO
,CE_TRANSACTION_CODES BankTransactionCodesEO
,CE_LOOKUPS CeLookupPEOBankTrxType
,CE_LOOKUPS CeLookupPEOStmtTrxType
,CE_LOOKUPS CeLookupPEOSearchField
,XLE_ENTITY_PROFILES XleEntityProfiles
,gl_sets_of_books sob
,XLE_LE_OU_LEDGER_V le
WHERE CeJeMappings.BUSINESS_UNIT_ID       = BusinessUnitPEO.BU_ID(+)
AND CEJEMAPPINGS.TRX_CODE_ID              = BANKTRANSACTIONCODESEO.TRANSACTION_CODE_ID(+)
AND CeJeMappings.BANK_TRX_TYPE            = CeLookupPEOBankTrxType.LOOKUP_CODE(+)
AND CeLookupPEOBankTrxType.LOOKUP_TYPE(+) = 'CE_TRX_TYPE'
AND CeJeMappings.STMT_TRX_TYPE            = CeLookupPEOStmtTrxType.LOOKUP_CODE(+)
AND CeLookupPEOStmtTrxType.LOOKUP_TYPE(+) = 'CE_TRX_TYPE'
AND CeLookupPEOSearchField.lookup_type(+) = 'CE_BSTCR_SEARCH_FIELDS'
AND CeLookupPEOSearchField.lookup_code(+) = CeJeMappings.SEARCH_FIELD
AND CeJeMappings.LEGAL_ENTITY_ID          = XleEntityProfiles.LEGAL_ENTITY_ID
AND XleEntityProfiles.LEGAL_ENTITY_ID     = le.LEGAL_ENTITY_ID(+)
AND sob.SET_OF_BOOKS_ID(+)                = le.LEDGER_ID
ORDER BY RULE_NAME