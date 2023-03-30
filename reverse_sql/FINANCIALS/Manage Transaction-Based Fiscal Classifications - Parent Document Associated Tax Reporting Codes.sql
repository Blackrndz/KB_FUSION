/* ****************************************************************************
 * $Revision: 78732 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-06-13 13:32:46 +0700 (Mon, 13 Jun 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Transaction-Based%20Fiscal%20Classifications%20-%20Parent%20Document%20Associated%20Tax%20Reporting%20Codes.sql $:
 * $Id: Manage Transaction-Based Fiscal Classifications - Parent Document Associated Tax Reporting Codes.sql 78732 2022-06-13 06:32:46Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT fcCodesE0.CLASSIFICATION_CODE RES_CODE
,reportingTypesE0.REPORTING_TYPE_CODE RES_TAX_REPORTING_TYPE_CODE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ZX_REPORTING_DATA'
	AND LOOKUP_CODE = reportingTypesE0.REPORTING_TYPE_DATATYPE_CODE
	) RES_DATA_TYPE
,NVL(reportCodeAsscE0.REPORTING_CODE_CHAR_VALUE
  ,NVL(TO_CHAR(reportCodeAsscE0.REPORTING_CODE_DATE_VALUE,'DD-Mon-YYYY'),TO_CHAR(reportCodeAsscE0.REPORTING_CODE_NUM_VALUE))
  ) RES_TAX_REPORTING_CODE
,reportingCodesE0.REPORTING_CODE_NAME RES_DESCRIPTION
,TO_CHAR(reportCodeAsscE0.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(reportCodeAsscE0.EFFECTIVE_TO,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE
,reportCodeAsscE0.CREATED_BY AS RSC_CREATED_BY
,reportCodeAsscE0.CREATION_DATE AS RSC_CREATION_DATE
,reportCodeAsscE0.LAST_UPDATED_BY AS RSC_LAST_UPDATED_BY
,reportCodeAsscE0.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
FROM ZX_FC_CODES_VL fcCodesE0
,ZX_REPORT_CODES_ASSOC reportCodeAsscE0
,ZX_REPORTING_TYPES_VL reportingTypesE0
,ZX_REPORTING_CODES_VL reportingCodesE0
WHERE fcCodesE0.CLASSIFICATION_TYPE_CODE = 'DOCUMENT_SUBTYPE'
AND fcCodesE0.PARENT_CLASSIFICATION_ID IS NULL
AND fcCodesE0.CLASSIFICATION_ID = reportCodeAsscE0.ENTITY_ID
AND reportCodeAsscE0.ENTITY_CODE = 'ZX_FC_CODES_B'
AND reportCodeAsscE0.REPORTING_TYPE_ID = reportingTypesE0.REPORTING_TYPE_ID
AND reportCodeAsscE0.REPORTING_CODE_ID = reportingCodesE0.REPORTING_CODE_ID(+)
ORDER BY fcCodesE0.CLASSIFICATION_CODE
,reportingTypesE0.REPORTING_TYPE_NAME
,NVL(reportCodeAsscE0.REPORTING_CODE_CHAR_VALUE
	,NVL(TO_CHAR(reportCodeAsscE0.REPORTING_CODE_DATE_VALUE,'DD-Mon-YYYY'),TO_CHAR(reportCodeAsscE0.REPORTING_CODE_NUM_VALUE)))