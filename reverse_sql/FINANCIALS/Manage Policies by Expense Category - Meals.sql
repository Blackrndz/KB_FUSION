/* ****************************************************************************
 * $Revision: 53782 $:
 * $Author: nasrullah.dusenmahamad $:
 * $Date: 2016-03-31 18:00:16 +0700 (Tue, 22 Mar 2016) $:
 * $HeadURL: $:
 * $Id: Manage Enterprise HCM Information - Attachments.sql 53782 2016-03-22 11:00:16Z nasrullah.dusenmahamad $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=EXM_MEALS_POLICIES

SELECT 'Meals' RES_EXPENSE_CATEGORY
,ExmMealPolicies.POLICY_NAME RES_POLICY_NAME
,ExmMealPolicies.DESCRIPTION RES_DESCRIPTION
,DECODE(ExmMealPolicies.SINGLE_INSTANCE_LIMIT_FLAG,'Y','Yes','No') RES_SINGLE_INSTANCE_LIMIT
,DECODE(ExmMealPolicies.DAILY_LIMIT_FLAG,'Y','Yes','No') RES_DAILY_SUM_LIMIT
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EXM_CURRENCY_OPTION'
	AND LOOKUP_CODE = ExmMealPolicies.CURRENCY_OPTION_CODE
	) RES_RATE_CURRENCY
,(CASE
	WHEN ExmMealPolicies.CURRENCY_OPTION_CODE = 'MULTIPLE' THEN
		NULL
	ELSE
		ExmMealPolicies.CURRENCY_CODE||' - '||
		(SELECT NAME 
			FROM FND_CURRENCIES_TL
			WHERE CURRENCY_CODE = ExmMealPolicies.CURRENCY_CODE
			AND LANGUAGE = USERENV('LANG'))
	END) RES_CURRENCY
,DECODE(ExmMealPolicies.ENABLED_ROLE_FLAG,'Y','Yes','No') RES_ROLE
,(CASE
	WHEN ExmMealPolicies.ENABLED_ROLE_FLAG = 'Y' THEN
		(SELECT MEANING
		FROM FND_LOOKUPS
		WHERE LOOKUP_TYPE = 'EXM_POLICY_ROLE'
		AND LOOKUP_CODE = ExmMealPolicies.POLICY_ROLE_CODE)
	END) RES_ROLE_TYPE
,DECODE(ExmMealPolicies.ENABLED_LOCATION_FLAG,'Y','Yes','No') RES_LOCATION
,(CASE
	WHEN ExmMealPolicies.ENABLED_LOCATION_FLAG = 'Y' THEN
		(SELECT MEANING
		FROM FND_LOOKUPS
		WHERE LOOKUP_TYPE = 'EXM_LOCATION_TYPE'
		AND LOOKUP_CODE = ExmMealPolicies.LOCATION_TYPE_CODE)
	END) RES_LOCATION_TYPE
,(CASE
	WHEN ExmMealPolicies.ENABLED_LOCATION_FLAG = 'Y' AND ExmMealPolicies.LOCATION_TYPE_CODE = 'ZONE' THEN
		(SELECT MEANING 
			FROM FND_LOOKUP_TYPES_TL
			WHERE LANGUAGE = USERENV('LANG')
			AND LOOKUP_TYPE = ExmMealPolicies.ZONE_TYPE_CODE)
	END) RES_ZONE_TYPE
,(SELECT MEANING
		FROM FND_LOOKUPS
		WHERE LOOKUP_TYPE = 'EXM_POLICY_ENFORCEMENT'
		AND LOOKUP_CODE = ExmMealPolicies.POLICY_ENFORCEMENT_CODE
		) RES_POLICY_ENFORCEMENT
,(CASE
	WHEN ExmMealPolicies.POLICY_ENFORCEMENT_CODE = 'VIOLATION' THEN
		DECODE(ExmMealPolicies.POLICY_VIOLATION_FLAG,'Y','Yes','No')
	END) RES_POLICY_VIOLATION_WARNING
,ExmMealPolicies.WARNING_TOLERANCE RES_WARNING_TOLERANCE_PERCENTA
,(CASE
	WHEN ExmMealPolicies.POLICY_ENFORCEMENT_CODE = 'VIOLATION' AND ExmMealPolicies.POLICY_VIOLATION_FLAG = 'Y' THEN
		DECODE(ExmMealPolicies.DISP_WARNING_TO_USER_FLAG,'Y','Yes','No')
	END) RES_DISPLAY_WARNING_TO_USER
,(CASE
	WHEN ExmMealPolicies.POLICY_ENFORCEMENT_CODE = 'VIOLATION' THEN
		DECODE(ExmMealPolicies.PREVENT_SUBMISSION_FLAG,'Y','Yes','No')
	END) RES_PREVENT_REPORT_SUBMISSION
,ExmMealPolicies.ERROR_TOLERANCE RES_ERROR_TOLERANCE_PERCENTAGE
,ExmMealPolicies.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ExmMealPolicies.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ExmMealPolicies.CREATED_BY RSC_CREATED_BY
,ExmMealPolicies.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EXM_MEALS_POLICIES ExmMealPolicies
ORDER BY ExmMealPolicies.POLICY_NAME