/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=MSC_MEASURES_VL
 
SELECT MeasuresE0.NAME RES_MEASURE
,(SELECT NAME 
	FROM FND_CURRENCIES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND CURRENCY_CODE = MeasureCurrenciesE0.CURRENCY_CODE
	) RES_DISPLAY_CURRENCY
,'Yes' RES_ENABLE
,MeasureCurrenciesE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,MeasureCurrenciesE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,MeasureCurrenciesE0.CREATED_BY  RSC_CREATED_BY
,MeasureCurrenciesE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM MSC_MEASURES_VL MeasuresE0
,MSC_MEASURE_CURRENCY MeasureCurrenciesE0
WHERE MeasuresE0.MEASURE_ID = MeasureCurrenciesE0.MEASURE_ID
ORDER BY 1,2