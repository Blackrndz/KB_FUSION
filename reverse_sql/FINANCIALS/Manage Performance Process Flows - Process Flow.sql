/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
--RSC_PREREQUISITE_OBJECTS=HRA_PF_DEFNS_VL

SELECT pfsE0.NAME RES_NAME
,pfsE0.DESCRIPTION RES_DESCRIPTION
,TO_CHAR(pfsE0.DATE_FROM,'DD-Mon-YYYY') RES_FROM_DATE
,TO_CHAR(pfsE0.DATE_TO,'DD-Mon-YYYY') RES_TO_DATE
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'ACTIVE_INACTIVE'
    AND LOOKUP_CODE = pfsE0.STATUS_CODE
    ) RES_STATUS
     
--Setting Goals
,DECODE(pfsE0.CONFIRM_CRITERIA_FLAG,'Y','Yes','No') RES_INCLUDE_TASK_TO_SET_GOALS
,(CASE
    WHEN pfsE0.CONFIRM_CRITERIA_FLAG = 'Y' THEN
        DECODE(pfsE0.MGR_SET_EVAL_CRTRIA_FLAG,'Y','Yes','No')
    END) RES_MANAGER_CAN_SET_GOALS
,(CASE
    WHEN pfsE0.CONFIRM_CRITERIA_FLAG = 'Y' AND pfsE0.MGR_SET_EVAL_CRTRIA_FLAG = 'Y' THEN
        DECODE(pfsE0.MGR_CMPLT_EVAL_CRTRIA_FLAG,'Y','Yes','No')
    END) RES_MANAGER_CAN_COMPLETE_TASK_
,(CASE
    WHEN pfsE0.CONFIRM_CRITERIA_FLAG = 'Y' THEN
        DECODE(pfsE0.WKR_SET_EVAL_CRTRIA_FLAG,'Y','Yes','No')
    END) RES_WORKER_CAN_SET_GOALS
,(CASE
    WHEN pfsE0.CONFIRM_CRITERIA_FLAG = 'Y' AND pfsE0.WKR_SET_EVAL_CRTRIA_FLAG = 'Y' THEN
        DECODE(pfsE0.WKR_CMPLT_EVAL_CRTRIA_FLAG,'Y','Yes','No')
    END) RES_WORKER_CAN_COMPLETE_TASK_T

--Worker Self-Evaluation and Manager Evaluation
,DECODE(pfsE0.WKR_SELF_EVAL_FLAG,'Y','Yes','No') RES_INCLUDE_WORKER_SELF_EVALUA
,DECODE(pfsE0.MGR_EVAL_OF_WRKR_FLAG,'Y','Yes','No') RES_INCLUDE_MANAGER_EVALUATION
,(CASE
    WHEN pfsE0.MGR_EVAL_OF_WRKR_FLAG = 'Y' THEN
        DECODE(pfsE0.DISABLE_RESUBMIT_MGR_EVAL,'Y','Yes','No')
    END) RES_DO_NOT_ALLOW_ADDITIONAL_ED
,(CASE
    WHEN pfsE0.WKR_SELF_EVAL_FLAG = 'Y' AND pfsE0.MGR_EVAL_OF_WRKR_FLAG = 'Y' THEN
        DECODE(pfsE0.EVAL_TASKS_CONCURRENT_FLAG,'Y','Yes','No')
    END) RES_EVALUATION_TASKS_CAN_BE_PE

--Participant Feedback
,DECODE(pfsE0.ASSIGN_PARTICIPANTS_FLAG,'Y','Yes','No') RES_INCLUDE_MANAGE_PARTICIPANT
,(CASE
    WHEN pfsE0.ASSIGN_PARTICIPANTS_FLAG = 'Y' THEN
        DECODE(pfsE0.MGR_SELECT_PCPNS_FLAG,'Y','Yes','No')
    END) RES_MANAGER_CAN_SELECT_PARTICI
,(CASE
    WHEN pfsE0.MGR_SELECT_PCPNS_FLAG = 'Y' THEN
        DECODE(pfsE0.MGR_ADD_QUESTION_FLAG,'Y','Yes','No')
    END) RES_MANAGER_CAN_ADD_QUESTIONS
,(CASE
    WHEN pfsE0.ASSIGN_PARTICIPANTS_FLAG = 'Y' THEN
        DECODE(pfsE0.MGR_TRACK_PCPNS_FLAG,'Y','Yes','No')
    END) RES_MANAGER_CAN_TRACK_PARTICIP
,(CASE
    WHEN pfsE0.ASSIGN_PARTICIPANTS_FLAG = 'Y' THEN
        DECODE(pfsE0.WRK_SELECT_PCPNS_FLAG,'Y','Yes','No')
    END) RES_WORKER_CAN_SELECT_PARTICIP
,(CASE
    WHEN pfsE0.WRK_SELECT_PCPNS_FLAG = 'Y' THEN
        DECODE(pfsE0.WRK_ADD_QUESTION_FLAG,'Y','Yes','No')
    END) RES_WORKER_CAN_ADD_QUESTIONS
,(CASE
    WHEN pfsE0.WRK_SELECT_PCPNS_FLAG = 'Y' THEN
        DECODE(pfsE0.WRK_REQUEST_PCPNS_FLAG,'Y','Yes','No')
    END) RES_WORKER_CAN_REQUEST_FEEDBAC
,(CASE
    WHEN pfsE0.ASSIGN_PARTICIPANTS_FLAG = 'Y' THEN
        DECODE(pfsE0.WRK_TRACK_PCPNS_FLAG,'Y','Yes','No')
    END) RES_WORKER_CAN_TRACK_PARTICIPA
,(CASE
    WHEN pfsE0.WRK_TRACK_PCPNS_FLAG = 'Y' THEN
        DECODE(pfsE0.WRK_VIEW_SUB_FDBCK_FLAG,'Y','Yes','No')
    END) RES_WORKER_CAN_VIEW_FEEDBACK_B

--Approval, Review and Meetings
,DECODE(pfsE0.FIRST_APPROVAL_FLAG,'Y','Yes','No') RES_INCLUDE_APPROVAL_PROCESSIN
,(CASE
    WHEN pfsE0.FIRST_APPROVAL_FLAG = 'Y' THEN
        DECODE(pfsE0.SECOND_APPROVAL_FLAG,'Y','Yes','No')
    END) RES_INCLUDE_SECOND_APPROVAL_PR
,(CASE
    WHEN pfsE0.FIRST_APPROVAL_FLAG = 'Y' THEN
        DECODE(pfsE0.AUTO_SUBMIT_APPROVAL_FLAG,'Y','Yes','No')
    END) RES_AUTOMATICALLY_SUBMIT_APPRO
,DECODE(pfsE0.SHARE_PERFORMANCE_DOC_FLAG,'Y','Yes','No') RES_INCLUDE_DOCUMENT_SHARING_T
,(CASE
    WHEN pfsE0.SHARE_PERFORMANCE_DOC_FLAG = 'Y' THEN
        DECODE(pfsE0.ALLOW_SHARE_LOCK_FOR_CALIB,'Y','Yes','No')
    END) RES_ALLOW_DOCUMENT_SHARING_TAS
,(CASE
    WHEN pfsE0.SHARE_PERFORMANCE_DOC_FLAG = 'Y' THEN
        DECODE(pfsE0.WKR_ACK_DOC_FLAG,'Y','Yes','No')
    END) RES_WORKER_MUST_ACKNOWLEDGE_DO
,DECODE(pfsE0.CONDUCT_MEETINGS_FLAG,'Y','Yes','No') RES_INCLUDE_REVIEW_MEETING_TAS
,(CASE
    WHEN pfsE0.CONDUCT_MEETINGS_FLAG = 'Y' THEN
        DECODE(pfsE0.WKR_ACK_REVIEW_MTG_FLAG,'Y','Yes','No')
    END) RES_WORKER_MUST_ACKNOWLEDGE_RE
,DECODE(pfsE0.WKR_FINAL_FEEDBCK_FLAG,'Y','Yes','No') RES_INCLUDE_WORKER_PROVIDE_FIN
,(CASE
    WHEN pfsE0.WKR_FINAL_FEEDBCK_FLAG = 'Y' THEN
        DECODE(pfsE0.MGR_FINAL_FEEDBACK_FLAG,'Y','Yes','No')
    END) RES_INCLUDE_MANAGER_PROVIDE_FI
,pfsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,pfsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,pfsE0.CREATED_BY RSC_CREATED_BY
,pfsE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HRA_PF_DEFNS_VL pfsE0
ORDER BY pfsE0.NAME