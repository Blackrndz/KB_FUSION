/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Questionnaires%20-%20Questions%20Response.sql $:
 * $Id: Manage Questionnaires - Questions Response.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=HRQ_QSTN_ANSWERS_VL
-- REPLACE_HTML_KEYWORD = RES_RESPONSE_FEEDBACK

SELECT (SELECT NAME
    FROM HRQ_SUBSCRIBERS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND SUBSCRIBER_ID = foldersE0.SUBSCRIBER_ID
	) RES_SUBSCRIBER
,(SELECT QUESTIONNAIRE_CODE FROM HRQ_QUESTIONNAIRES_VL WHERE QUESTIONNAIRE_ID = qTemplatesE0.QUESTIONNAIRE_ID) RES_QUESTIONNAIRE_TEMPLATE_ID
,qTemplatesE0.NAME RES_QUESTIONNAIRE_TEMPLATE_NAM
,questionairsE0.QUESTIONNAIRE_CODE RES_QUESTIONNAIRE_CODE
,questionairsE0.NAME RES_QUESTIONNAIRE_NAME
,foldersE0.RES_PARENT_FOLDER_1
,foldersE0.RES_PARENT_FOLDER_2
,foldersE0.RES_PARENT_FOLDER_3
,foldersE0.RES_PARENT_FOLDER_4
,foldersE0.RES_PARENT_FOLDER_5
,foldersE0.NAME RES_FOLDER
,sectionsE0.NAME RES_TITLE
,questionsE0.QUESTION_CODE RES_QUESTION_CODE
,responsesE0.ANSWER_CODE RES_RESPONSE_CODE
,responsesE0.LONG_TEXT RES_SHORT_DESCRIPTION
,responsesE0.SCORE_WEIGHT RES_SCORE
,DECODE(responsesE0.CORRECT_FLAG,'Y','Yes','No') RES_CORRECT_RESPONSE
,REPLACE(REPLACE(REPLACE(responsesE0.RESPONSE_FEEDBACK,'&','#AMP#'),'<','#OPENTAG#'),'>','#CLOSETAG#') RES_RESPONSE_FEEDBACK
,responsesE0.SHORT_TEXT RES_NAME
,responsesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,responsesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,responsesE0.CREATED_BY RSC_CREATED_BY
,responsesE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM (SELECT SUBSTR(SYS_CONNECT_BY_PATH(NAME,'###'),INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,1)+3,INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,2)-4) RES_PARENT_FOLDER_1
,SUBSTR(SYS_CONNECT_BY_PATH(NAME,'###'),INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,2)+3,INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,3) - INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,2)-3) RES_PARENT_FOLDER_2
,SUBSTR(SYS_CONNECT_BY_PATH(NAME,'###'),INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,3)+3,INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,4) - INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,3)-3) RES_PARENT_FOLDER_3
,SUBSTR(SYS_CONNECT_BY_PATH(NAME,'###'),INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,4)+3,INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,5) - INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,4)-3) RES_PARENT_FOLDER_4
,SUBSTR(SYS_CONNECT_BY_PATH(NAME,'###'),INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,5)+3,INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,6) - INSTR(SYS_CONNECT_BY_PATH(NAME,'###'),'###',1,5)-3) RES_PARENT_FOLDER_5
,CATEGORY_ID,NAME,CONTAIN_QUESTIONNAIRES,SUBSCRIBER_ID FROM HRQ_CATEGORIES_VL START WITH PARENT_CATEGORY_ID IS NULL
CONNECT BY PRIOR CATEGORY_ID = PARENT_CATEGORY_ID) foldersE0
,HRQ_QUESTIONNAIRES_VL questionairsE0
,HRQ_QSTNR_TEMPLATES_VL qTemplatesE0
,HRQ_QSTNR_SECTIONS_VL sectionsE0
,HRQ_QSTNR_QUESTIONS secQuestionsE0
,HRQ_QUESTIONS_VL questionsE0
,HRQ_QSTN_ANSWERS_VL responsesE0
WHERE foldersE0.SUBSCRIBER_ID IN (SELECT SUBSCRIBER_ID 
	FROM HRQ_SUBSCRIBERS_VL 
	WHERE SUBSCRIBER_CODE IN ('PER_CHK'
		,'WLF_ASSESSMENTS'
		,'WLF_ENROLLMENTS'
		,'WFL'
		,'HRA','HWR'
		,'IRC'
		,'HWRTMS'
		,'HXLTLTC'
		,'HNS'))
AND foldersE0.CONTAIN_QUESTIONNAIRES = 'Y'
AND foldersE0.CATEGORY_ID = questionairsE0.CATEGORY_ID
AND questionairsE0.TEMPLATE_FLAG = 'N'
AND questionairsE0.CATEGORY_ID IN (SELECT CATEGORY_ID FROM HRQ_CATEGORIES_VL foldersE0
START WITH foldersE0.PARENT_CATEGORY_ID IS NULL
CONNECT BY PRIOR foldersE0.CATEGORY_ID = foldersE0.PARENT_CATEGORY_ID)
AND questionairsE0.QSTNR_TEMPLATE_ID = qTemplatesE0.QSTNR_TEMPLATE_ID
AND questionairsE0.QUESTIONNAIRE_ID = sectionsE0.QUESTIONNAIRE_ID
AND sectionsE0.QSTNR_SECTION_ID = secQuestionsE0.QSTNR_SECTION_ID
AND secQuestionsE0.QUESTION_ID = questionsE0.QUESTION_ID
AND questionsE0.QUESTION_ID = responsesE0.QUESTION_ID
ORDER BY 1,questionairsE0.NAME,questionsE0.QUESTION_CODE,responsesE0.ANSWER_CODE