/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Repeating%20Time%20Periods%20-%20Repeating%20Time%20Period.sql $:
 * $Id: Manage Repeating Time Periods - Repeating Time Period.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
-- RSC_PREREQUISITE_OBJECTS=HWM_RP_TM_PERIODS_VL
 
SELECT HRTPEO.NAME RES_NAME
,HRTPEO.DESCRIPTION RES_DESCRIPTION
,DECODE(HRTPEO.TIME_ENTRY_USAGE ,'Y','Yes','No') RES_PERIOD_USAGE_TIME_CARD
,DECODE(HRTPEO.APPROVAL_USAGE ,'Y','Yes','No') RES_PERIOD_USAGE_APPROVAL
,DECODE(HRTPEO.ACCRUAL_USAGE ,'Y','Yes','No') RES_PERIOD_USAGE_ACCRUAL_PROCE
,DECODE(HRTPEO.OVERTIME_USAGE ,'Y','Yes','No') RES_PERIOD_USAGE_OVERTIME
,DECODE(HRTPEO.BALANCE_USAGE ,'Y','Yes','No') RES_PERIOD_USAGE_BALANCES
,(SELECT MEANING FROM FND_COMMON_LOOKUPS WHERE LOOKUP_CODE = HRTPEO.PERIOD_CLASS AND LOOKUP_TYPE = 'HWM_PERIOD_TYPE') RES_PERIOD_TYPE
,(SELECT MEANING FROM FND_COMMON_LOOKUPS WHERE LOOKUP_CODE IN (HRTPEO.WEEK_TYPE,HRTPEO.MONTH_TYPE,HRTPEO.ONE_OR_MANY) AND LOOKUP_TYPE IN ('HWM_MONTH_TYPE','HWM_WEEK_TYPE','HWM_ONEORMORE_TYPE')) RES_PERIOD_LENGTH
,(CASE WHEN HRTPEO.ONE_OR_MANY = 'MORETHANONE' 
	THEN HRTPEO.MULTIPLE ELSE NULL END) RES_NUMBER_OF_DAYS
,(CASE WHEN HRTPEO.WEEK_TYPE = 'MORETHANWEEK' 
	THEN HRTPEO.MULTIPLE ELSE NULL END) RES_NUMBER_OF_WEEKS
,(CASE WHEN HRTPEO.MONTH_TYPE = 'MULTIMONTHS' 
	THEN HRTPEO.MULTIPLE ELSE NULL END) RES_NUMBER_OF_MONTHS
,TO_CHAR(HRTPEO.REFERENCE_DATE,'DD-Mon-YYYY') RES_SAMPLE_START_DATE
,(CASE WHEN HRTPEO.PERIOD_TYPE = 'FIXED_WEEKS' THEN 
	DECODE(TO_CHAR(HRTPEO.PERIOD_START_DATE,'DAY'),'1','Monday','2','Tuesday','3','Wednesday','4','Thursday','5','Friday','6','Saturday','7','Sunday')
	ELSE
		NULL END) RES_START_DAY
,NULL RES_PREVIEW_PERIOD_START_DATE
,NULL RES_PREVIEW_PERIOD_END_DATE
		
,HRTPEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,HRTPEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,HRTPEO.CREATED_BY RSC_CREATED_BY
,HRTPEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HWM_RP_TM_PERIODS_VL  HRTPEO































