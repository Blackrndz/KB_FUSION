 /* ****************************************************************************
 * $Revision: 48884 $:
 * $Author: dhara.pithadiya $:
 * $Date: 2015-08-18 14:24:02 +0700 (Tue, 18 Aug 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Transaction%20Types%20-%20Manage%20Transaction%20Types.sql $:
 * $Id: Manage Transaction Types - Manage Transaction Types.sql 48884 2015-08-18 07:24:02Z dhara.pithadiya $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=HRG_GOAL_PLAN_GOALS

SELECT goldPlansE0.GOAL_PLAN_NAME RES_GOAL_PLAN
,hrgGOALE0.GOAL_NAME RES_GOAL_NAME
,hrgGOALACTIONE0.ACTION_NAME RES_TASKS_NAME
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'HRG_GOAL_TASK_TYPE'
	AND LOOKUP_CODE = hrgGOALACTIONE0.ACTION_TYPE_CODE 
	) RES_TYPE
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'HRG_GOAL_STATUS'
	AND LOOKUP_CODE = hrgGOALACTIONE0.STATUS_CODE 
	) RES_STATUS
,TO_CHAR(hrgGOALACTIONE0.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,hrgGOALACTIONE0.ACTION_URL RES_RELATED_LINK
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'HRG_PRIORITY'
	AND LOOKUP_CODE = hrgGOALACTIONE0.PRIORITY_CODE 
	) RES_PRIORITY
,hrgGOALACTIONE0.PERCENT_COMPLETE_CODE RES_COMPLETION_PERCENTAGE
,TO_CHAR(hrgGOALACTIONE0.TARGET_COMPLETION_DATE,'DD-Mon-YYYY') RES_TARGET_COMPLETION_DATE
,hrgGOALACTIONE0.COMMENTS RES_COMMENTS

,hrgGOALACTIONE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,hrgGOALACTIONE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,hrgGOALACTIONE0.CREATED_BY  RSC_CREATED_BY
,hrgGOALACTIONE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,goldPlansE0.BUSINESS_GROUP_ID RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM HRG_GOAL_PLANS_VL goldPlansE0
,HRG_GOAL_PLAN_GOALS goalsE0
,HRG_GOALS hrgGOALE0
,HRG_GOAL_ACTIONS hrgGOALACTIONE0
WHERE goldPlansE0.GOAL_PLAN_ID = goalsE0.GOAL_PLAN_ID
AND goalsE0.GOAL_ID = hrgGOALE0.GOAL_ID
AND hrgGOALE0.GOAL_ID = hrgGOALACTIONE0.GOAL_ID
AND goldPlansE0.GOAL_PLAN_TYPE_CODE = 'ORA_HRG_WORKER'
AND goldPlansE0.MASS_REQUEST_ID = hrgGOALE0.MASS_REQUEST_ID
AND SYSDATE BETWEEN NVL(goalsE0.EFFECTIVE_START_DATE,TO_DATE('01-01-1950','DD-MM-YYYY')) AND NVL(goalsE0.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
ORDER BY goldPlansE0.GOAL_PLAN_NAME