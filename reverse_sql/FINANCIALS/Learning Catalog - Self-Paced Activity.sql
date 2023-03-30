/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=WLF_LEARNING_ITEMS_F

SELECT learningTlE0.NAME RES_OFFERING_TITLE
,(SELECT NAME 
	FROM WLF_LEARNING_ITEMS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND LEARNING_ITEM_ID = activityDtlsE0.LEARNING_ITEM_ID
	) RES_TITLE_ACTIVITY
,activityDtlsE0.LEARNING_ITEM_NUMBER RES_ACTIVITY_NUMBER
,(SELECT DESCRIPTION
	FROM WLF_LEARNING_ITEMS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND LEARNING_ITEM_ID = activityDtlsE0.LEARNING_ITEM_ID
	) RES_DESCRIPTION
,(SELECT NAME
	FROM WLF_LEARNING_ITEMS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND LEARNING_ITEM_ID = activitiesE0.RELATED_CONTENT_ID
	) RES_OFFERING_CONTENT
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'ORA_WLF_ACTIVITY_CONTENT_TYPE'
    AND LOOKUP_CODE = (SELECT TRACKING_TYPE
		FROM WLF_LI_CONTENT_F
		WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
		AND LEARNING_ITEM_ID = activitiesE0.RELATED_CONTENT_ID)
	) RES_CONTENT_TYPE
,activityDtlsE0.DURATION RES_EXPECTED_EFFORT
,DECODE(activitiesE0.SELF_COMPLETE_FLAG,'Y','Yes','No') RES_ALLOW_PERSON_COMPLETING_TH -- Allow person completing the activity to mark themselves complete
,activitiesE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,activitiesE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,activitiesE0.CREATED_BY  RSC_CREATED_BY
,activitiesE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM WLF_LEARNING_ITEMS_F_TL learningTlE0
,WLF_LEARNING_ITEMS_F learningE0
--,WLF_LI_CLASSES_F learningDtlsE0


,(SELECT * 
	FROM WLF_LI_ACTIVITIES_F 
	WHERE ACTIVITY_TYPE IN ('ORA_ONLINE_SP','ORA_OFFLINE_SP')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) activitiesE0
,(SELECT * 
	FROM WLF_LEARNING_ITEMS_F
	WHERE LEARNING_ITEM_TYPE = 'ORA_ACTIVITY' 
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) activityDtlsE0
,WLF_LI_HIERARCHIES_F sortingsE0
WHERE learningE0.LEARNING_ITEM_TYPE = 'ORA_CLASS'
AND SYSDATE BETWEEN learningE0.EFFECTIVE_START_DATE AND learningE0.EFFECTIVE_END_DATE

AND learningE0.LEARNING_ITEM_ID = learningTlE0.LEARNING_ITEM_ID
AND learningE0.EFFECTIVE_START_DATE = learningTlE0.EFFECTIVE_START_DATE
AND learningTlE0.LANGUAGE = USERENV('LANG')

AND learningE0.LEARNING_ITEM_ID = activitiesE0.PARENT_LEARNING_ITEM_ID
AND learningE0.EFFECTIVE_END_DATE BETWEEN activitiesE0.EFFECTIVE_START_DATE AND activitiesE0.EFFECTIVE_END_DATE

AND activitiesE0.LEARNING_ITEM_ID = activityDtlsE0.LEARNING_ITEM_ID
AND activitiesE0.EFFECTIVE_END_DATE BETWEEN activityDtlsE0.EFFECTIVE_START_DATE AND activityDtlsE0.EFFECTIVE_END_DATE

AND activityDtlsE0.LEARNING_ITEM_ID = sortingsE0.CHILD_LEARNING_ITEM_ID
AND activityDtlsE0.EFFECTIVE_END_DATE BETWEEN sortingsE0.EFFECTIVE_START_DATE AND sortingsE0.EFFECTIVE_END_DATE

ORDER BY learningE0.LEARNING_ITEM_NUMBER
,sortingsE0.POSITION