/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT TO_CHAR(gradesE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,gradesE0.NAME RES_NAME
,gradesE0.GRADE_CODE RES_CODE
,legislativeGroupsE0.NAME RES_LEGISLATIVE_DATA_GROUP
,ratesE0.NAME RES_GRADE_RATE
,(SELECT MEANING 
  FROM FND_LOOKUP_VALUES_VL
  WHERE LOOKUP_TYPE = 'GRADE_PAY_RATE_TYPE'
  AND LOOKUP_CODE = ratesE0.RATE_TYPE
  ) RES_RATE_TYPE
,(SELECT MEANING 
  FROM FND_LOOKUP_VALUES_VL
  WHERE LOOKUP_TYPE = 'CMP_SALARY_BASIS'
  AND LOOKUP_CODE = ratesE0.RATE_FREQUENCY
  ) RES_FREQUENCY
,ratesE0.ANNUALIZATION_FACTOR RES_ANNUALIZATION_FACTOR
,ratesE0.CURRENCY_CODE RES_CURRENCY
,rateValuesE0.MINIMUM RES_MINIMUM
,rateValuesE0.MAXIMUM RES_MAXIMUM
,rateValuesE0.MID_VALUE RES_MIDPOINT
,rateValuesE0.VALUE RES_VALUE
,(SELECT ACTION_REASON
	FROM PER_ACTION_OCCURRENCES actOccE0
	,PER_ACTION_REASONS_VL actReasonsE0
	WHERE actOccE0.ACTION_REASON_ID = actReasonsE0.ACTION_REASON_ID
	AND actOccE0.ACTION_OCCURRENCE_ID = rateValuesE0.ACTION_OCCURRENCE_ID
	) RES_ACTION_REASON
,rateValuesE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,rateValuesE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,rateValuesE0.CREATED_BY  RSC_CREATED_BY
,rateValuesE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,gradesE0.BUSINESS_GROUP_ID RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
   
FROM PER_GRADES_F_VL gradesE0
,PER_RATE_VALUES_F rateValuesE0
,PER_RATES_F_VL ratesE0
,PER_LEGISLATIVE_DATA_GROUPS_VL legislativeGroupsE0
WHERE gradesE0.GRADE_ID = rateValuesE0.RATE_OBJECT_ID
AND gradesE0.EFFECTIVE_END_DATE BETWEEN rateValuesE0.EFFECTIVE_START_DATE AND rateValuesE0.EFFECTIVE_END_DATE
AND rateValuesE0.RATE_ID = ratesE0.RATE_ID
AND rateValuesE0.EFFECTIVE_END_DATE BETWEEN ratesE0.EFFECTIVE_START_DATE AND ratesE0.EFFECTIVE_END_DATE
AND ratesE0.LEGISLATIVE_DATA_GROUP_ID = legislativeGroupsE0.LEGISLATIVE_DATA_GROUP_ID
ORDER BY gradesE0.NAME
,gradesE0.GRADE_CODE
,gradesE0.EFFECTIVE_START_DATE
,legislativeGroupsE0.NAME
,ratesE0.NAME