/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=MSC_FORECAST_PROFILES_VL
 
SELECT ForecastProfilesE0.PROFILE_NAME RES_PROFILE_NAME
,DecompositionGroupE0.CF_DECOMP_GRP_NAME RES_DECOMPOSITION_GROUP
,'' RES_AVAILABLE_MEASURES
,(SELECT (SELECT NAME
		FROM MSC_MEASURES_TL
		WHERE LANGUAGE = USERENV('LANG')
		AND MEASURE_ID = DEFINING_MEASURE)
	FROM MSC_CAUSAL_FACTORS
	WHERE CAUSAL_FACTOR_ID = FactorValuesE0.CAUSAL_FACTOR_ID
	) RES_SELECTED_MEASURES
,DECODE(FactorValuesE0.SHORT_METHODS,'1','Yes','No') RES_SHORT
,DECODE(FactorValuesE0.LONG_METHODS,'1','Yes','No') RES_LONG
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_MSC_FCSTMULTIPMET_GRPS'
	AND LOOKUP_CODE = FactorValuesE0.MULTI_METHOD_GRP1
	) RES_MULTIPLICATIVE
,DECODE(FactorValuesE0.NON_SEASONAL,'1','Yes','No') RES_NOT_SEASONAL
,DECODE(FactorValuesE0.FILL_MISSING_VALUES,'1','Yes','No') RES_FILL_MISSING
,FactorValuesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,FactorValuesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,FactorValuesE0.CREATED_BY RSC_CREATED_BY
,FactorValuesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM MSC_FORECAST_PROFILES_VL ForecastProfilesE0
,MSC_FCSTPRF_DECOMP_GRP ForecastProfileDecompGroupsE0
,MSC_CF_DECOMP_GROUPS_TL DecompositionGroupE0
,MSC_FCSTPRF_CF_PARAMS FactorValuesE0
WHERE ForecastProfilesE0.PROFILE_ID = ForecastProfileDecompGroupsE0.PROFILE_ID
AND ForecastProfileDecompGroupsE0.CF_DECOMP_GRP_ID = DecompositionGroupE0.CF_DECOMP_GRP_ID
AND DecompositionGroupE0.LANGUAGE = USERENV('LANG')
AND ForecastProfileDecompGroupsE0.PROFILE_ID = FactorValuesE0.PROFILE_ID
AND ForecastProfileDecompGroupsE0.CF_DECOMP_GRP_ID = FactorValuesE0.CF_DECOMP_GRP_ID
ORDER BY 1,2,4