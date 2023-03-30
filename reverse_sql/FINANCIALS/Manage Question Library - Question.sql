/* ****************************************************************************
 * $Revision: 78284 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-13 13:03:20 +0700 (Wed, 13 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Question%20Library%20-%20Question.sql $:
 * $Id: Manage Question Library - Question.sql 78284 2022-04-13 06:03:20Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=HRQ_QUESTIONS_VL

WITH CAT AS (SELECT CATEGORY_ID
	,(SELECT NAME 
		FROM HRQ_CATEGORIES_TL 
		WHERE LANGUAGE = USERENV('LANG')
		AND CATEGORY_ID = SUBSTR(HIER,INSTR(HIER,'###',1,1)+3,INSTR(HIER,'###',1,2)-4)
		) PARENT_FOLDER_1
	,(SELECT NAME 
		FROM HRQ_CATEGORIES_TL 
		WHERE LANGUAGE = USERENV('LANG')
		AND CATEGORY_ID = SUBSTR(HIER,INSTR(HIER,'###',1,2)+3,INSTR(HIER,'###',1,3) - INSTR(HIER,'###',1,2)-3)
		) PARENT_FOLDER_2
	,(SELECT NAME 
		FROM HRQ_CATEGORIES_TL 
		WHERE LANGUAGE = USERENV('LANG')
		AND CATEGORY_ID = SUBSTR(HIER,INSTR(HIER,'###',1,3)+3,INSTR(HIER,'###',1,4) - INSTR(HIER,'###',1,3)-3) 
		) PARENT_FOLDER_3
	,(SELECT NAME 
		FROM HRQ_CATEGORIES_TL 
		WHERE LANGUAGE = USERENV('LANG')
		AND CATEGORY_ID = SUBSTR(HIER,INSTR(HIER,'###',1,4)+3,INSTR(HIER,'###',1,5) - INSTR(HIER,'###',1,4)-3) 
		) PARENT_FOLDER_4
	,(SELECT NAME 
		FROM HRQ_CATEGORIES_TL 
		WHERE LANGUAGE = USERENV('LANG')
		AND CATEGORY_ID = SUBSTR(HIER,INSTR(HIER,'###',1,5)+3,INSTR(HIER,'###',1,6) - INSTR(HIER,'###',1,5)-3) 
		) PARENT_FOLDER_5
	FROM (SELECT CATEGORY_ID
		,NAME
		,SUBSCRIBER_ID
		,PARENT_CATEGORY_ID
		,LEVEL LV
		,REPLACE(SYS_CONNECT_BY_PATH(NVL(PARENT_CATEGORY_ID,0),'###'),'###0',NULL)||'###' HIER
		,LAST_UPDATED_BY
		,LAST_UPDATE_DATE
		,CREATED_BY
		,CREATION_DATE
		FROM HRQ_CATEGORIES_VL
		WHERE SUBSCRIBER_ID IN (SELECT SUBSCRIBER_ID 
			FROM HRQ_SUBSCRIBERS_VL 
			WHERE SUBSCRIBER_CODE IN ('HRA','PER_CHK','WLF_ASSESSMENTS','WFL','WLF_ENROLLMENTS','HWR','IRC','HWRTMS','HXLTLTC','HNS'))
		AND CONTAIN_QUESTIONS !='N'
		START WITH PARENT_CATEGORY_ID IS NULL
		CONNECT BY PRIOR CATEGORY_ID = PARENT_CATEGORY_ID)
	)


SELECT hrqQUESTIONSEO.QUESTION_CODE RES_QUESTION_CODE
,(SELECT NAME 
	FROM HRQ_SUBSCRIBERS_VL 
	WHERE SUBSCRIBER_ID = hrqQUESTIONSEO.SUBSCRIBER_ID
	) RES_SUBSCRIBER
,NVL((SELECT DISPLAY_NAME 
	FROM PER_PERSON_NAMES_F 
	WHERE PERSON_ID = hrqQUESTIONSEO.OWNER 
	AND NAME_TYPE = 'GLOBAL'
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('4512-12-31','YYYY-MM-DD')))
	,hrqQUESTIONSEO.OWNER
	) RES_OWNER_NAME

,(SELECT PERSON_NUMBER 
	FROM PER_PEOPLE_F 
	WHERE PERSON_ID = hrqQUESTIONSEO.OWNER 
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('4512-12-31','YYYY-MM-DD'))
	) RES_OWNER_NUMBER
,CAT.PARENT_FOLDER_1 RES_PARENT_FOLDER_1
,CAT.PARENT_FOLDER_2 RES_PARENT_FOLDER_2
,CAT.PARENT_FOLDER_3 RES_PARENT_FOLDER_3
,CAT.PARENT_FOLDER_4 RES_PARENT_FOLDER_4
,CAT.PARENT_FOLDER_5 RES_PARENT_FOLDER_5

,(SELECT NAME 
	FROM HRQ_CATEGORIES_VL 
	WHERE CATEGORY_ID = hrqQUESTIONSEO.CATEGORY_ID
	) RES_FOLDER
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = hrqQUESTIONSEO.STATUS
	AND LOOKUP_TYPE = 'HRQ_QUESTIONNAIRE_STATUS' 
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4512-12-31','YYYY-MM-DD'))
	) RES_STATUS
,hrqQUESTIONSEO.QSTN_VERSION_NUM  RES_QUESTION_VERSION_NUMBER
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = hrqQUESTIONSEO.PRIVACY_FLAG
	AND LOOKUP_TYPE = 'HRQ_PRIVACY' 
	AND LANGUAGE = USERENV('LANG') 
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4512-12-31','YYYY-MM-DD'))
	) RES_PRIVACY
,hrqQUESTIONSEO.QUESTION_TEXT RES_QUESTION_TEXT
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'HRQ_QUESTION_TYPE'
	AND LOOKUP_CODE = hrqQUESTIONSEO.QUESTION_TYPE 
	) RES_QUESTION_TYPE
,DECODE(hrqQUESTIONSEO.CONDITION_DISPLAY,'Y','Yes','No') RES_DISPLAY_THE_QUESTION_CONDI
,(SELECT QUESTION_CODE 
	FROM HRQ_QUESTIONS_VL 
	WHERE LATEST_VERSION = 'Y'
	AND QUESTION_ID = hrqQUESTIONSEO.CONDITION_QUESTION_ID
	) RES_CONTROLLING_QUESTION_CODE
,(SELECT LONG_TEXT 
	FROM HRQ_QSTN_ANSWERS_VL 
	WHERE QSTN_ANSWER_ID = hrqQUESTIONSEO.CONDITION_ANSWER_ID  
	AND QUESTION_ID = hrqQUESTIONSEO.CONDITION_QUESTION_ID
	) RES_CONTROLLING_RESPONSE
,DECODE(hrqQUESTIONSEO.SCORED_FLAG,'Y','Yes','No') RES_SCORE_QUESTION
,hrqQUESTIONSEO.MIN_THRESHOLD_SCORE RES_MINIMUM_CALCULATED_SCORE
,hrqQUESTIONSEO.MAX_THRESHOLD_SCORE RES_MAXIMUM_CALCULATED_SCORE
,(SELECT NAME 
	FROM HRQ_RESPONSE_TYPES_VL 
	WHERE RESPONSE_TYPE_ID = hrqQUESTIONSEO.RESPONSE_TYPE_ID
	) RES_RESPONSE_TYPE
,DECODE(hrqQUESTIONSEO.ATTACHMENT_ALLOWED,'Y','Yes','No') RES_ALLOW_ATTACHMENTS
,hrqQUESTIONSEO.MIN_SELECTIONS RES_MINIMUM_NUMBER_OF_SELECTIO
,hrqQUESTIONSEO.MAX_SELECTIONS RES_MAXIMUM_NUMBER_OF_SELECTIO
,(SELECT RATING_NAME  
	FROM HRT_RATING_MODELS_VL 
	WHERE RATING_MODEL_ID  = hrqQUESTIONSEO.RATING_MODEL_ID 
	AND SYSDATE BETWEEN DATE_FROM  AND NVL(DATE_TO ,TO_DATE('4512-12-31','YYYY-MM-DD'))
	) RES_RATING_MODEL
,hrqQUESTIONSEO.MIN_LENGTH RES_MINIMUM_LENGTH
,hrqQUESTIONSEO.MAX_LENGTH RES_MAXIMUM_LENGTH
,(CASE
	WHEN hrqQUESTIONSEO.QUESTION_TYPE IN ('MULTCHOICE','1CHOICE') THEN
		(SELECT MEANING 
		FROM FND_LOOKUP_VALUES 
		WHERE LANGUAGE = USERENV('LANG')
		AND LOOKUP_TYPE = 'HRQ_QUESTION_ORDER'
		AND LOOKUP_CODE = NVL(hrqQUESTIONSEO.QSTN_RESPONSE_ORDER,'V'))
	END) RES_RESPONSE_ORDER
,(CASE
	WHEN hrqQUESTIONSEO.QSTN_RESPONSE_ORDER = 'R' THEN
		hrqQUESTIONSEO.QSTN_SAMPLE_SIZE 
	END) RES_SAMPLE_SIZE
,hrqQUESTIONSEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hrqQUESTIONSEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hrqQUESTIONSEO.CREATED_BY RSC_CREATED_BY
,hrqQUESTIONSEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HRQ_QUESTIONS_VL hrqQUESTIONSEO
,CAT
WHERE hrqQUESTIONSEO.CATEGORY_ID = CAT.CATEGORY_ID
ORDER BY RES_SUBSCRIBER
,DECODE(CAT.PARENT_FOLDER_1,NULL,0,1)
,DECODE(CAT.PARENT_FOLDER_2,NULL,0,1)
,DECODE(CAT.PARENT_FOLDER_3,NULL,0,1)
,DECODE(CAT.PARENT_FOLDER_4,NULL,0,1)
,DECODE(CAT.PARENT_FOLDER_5,NULL,0,1)
,hrqQUESTIONSEO.QUESTION_CODE