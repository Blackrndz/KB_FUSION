/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Time%20Definitions%20-%20Time%20Definition.sql $:
 * $Id: Manage Time Definitions - Time Definition.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT (SELECT NAME FROM PER_LEGISLATIVE_DATA_GROUPS_VL WHERE LEGISLATIVE_DATA_GROUP_ID = payTIMEEO.LEGISLATIVE_DATA_GROUP_ID) RES_LEGISLATIVE_DATA_GROUP
,payTIMEEO.DEFINITION_NAME RES_NAME
,payTIMEEO.SHORT_NAME RES_SHORT_NAME
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = payTIMEEO.DEFINITION_TYPE 
			AND LOOKUP_TYPE = 'PAY_TIME_DEFINITION_TYPE' AND LANGUAGE = USERENV('LANG')
			AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_TYPE
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'R'
	THEN (SELECT USER_NAME FROM FF_DATABASE_ITEMS_VL WHERE DATABASE_ITEM_ID = payTIMEEO.DATABASE_ITEM_ID) 
	ELSE NULL END) RES_RETRIEVAL_DATE
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'P'
	THEN (SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = payTIMEEO.PERIOD_TYPE 
			AND LOOKUP_TYPE = 'PAY_TIME_SPAN_PERIOD_TYPE' AND LANGUAGE = USERENV('LANG')
			AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY')))
	ELSE NULL END) RES_PERIOD_TYPE
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'P'
	THEN payTIMEEO.PERIOD_UNIT 
	ELSE NULL END) RES_PERIOD_UNIT
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'U'
	THEN (SELECT DEFINITION_NAME FROM PAY_TIME_DEFINITIONS WHERE TIME_DEFINITION_ID = payTIMEEO.BASE_TIME_DEFINITION_ID)
	ELSE NULL END) RES_USER_DEFINED_DATE
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'S'
	THEN (SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = payTIMEEO.PERIOD_TYPE 
			AND LOOKUP_TYPE = 'PAY_TIME_SPAN_PERIOD_TYPE' AND LANGUAGE = USERENV('LANG')
			AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY')))
	ELSE NULL END) RES_PERIOD_BASIS
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'U'
	THEN payTIMEEO.PERIOD_TYPE
	ELSE NULL END) RES_ADJUSTMENT_TYPE
,(CASE WHEN payTIMEEO.DEFINITION_TYPE IN ('U','P')
	THEN payTIMEEO.DAY_ADJUSTMENT 
	ELSE NULL END) RES_ADJUSTMENT_DAYS
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'S'
	THEN TO_CHAR(payTIMEEO.START_DATE,'DD-Mon-YYYY')
	ELSE NULL END) RES_FIRST_PERIOD_START_DATE
,(CASE WHEN payTIMEEO.DEFINITION_TYPE = 'S'
	THEN NUMBER_OF_YEARS
	ELSE NULL END) RES_NUMBER_OF_YEARS

,payTIMEEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,payTIMEEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,payTIMEEO.CREATED_BY RSC_CREATED_BY
,payTIMEEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PAY_TIME_DEFINITIONS payTIMEEO
ORDER BY RES_NAME,RES_SHORT_NAME