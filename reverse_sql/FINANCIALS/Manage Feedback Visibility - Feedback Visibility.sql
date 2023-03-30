/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Feedback%20Visibility%20-%20Feedback%20Visibility.sql $:
 * $Id: Manage Feedback Visibility - Feedback Visibility.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 -- RSC_PREREQUISITE_OBJECTS=HRT_NOTE_SETUP
 
SELECT hrtNOTESETUPEO.OBJECT_CONTEXT_LOOKUP_CODE RES_FEEDBACK_CONTEXT
,DECODE(hrtNOTESETUPEO.ALL_FLAG,'Y','Yes','No') RES_VISIBILITY_OPTIONS_EVERYON
,DECODE(hrtNOTESETUPEO.MANAGERS_FLAG,'Y','Yes','No') RES_VISIBILITY_OPTIONS_MANAGER
,DECODE(hrtNOTESETUPEO.MANAGERS_AND_SUBJECT_FLAG,'Y','Yes','No') RES_VISIBILITY_OPTIONS_MANAG_0
,DECODE(hrtNOTESETUPEO.PRIVATE_FLAG,'Y','Yes','No') RES_VISIBILITY_OPTIONS_ONLY_ME
,DECODE(hrtNOTESETUPEO.SUBJECT_FLAG,'Y','Yes','No') RES_VISIBILITY_OPTIONS_ONLY_WO
,NVL((SELECT MEANING FROM FND_LOOKUP_VALUES
		WHERE LOOKUP_CODE = hrtNOTESETUPEO.DEFAULT_NOTE_VISIBILITY_CODE
		AND LOOKUP_TYPE = 'ORA_NOTE_VISIBILITY_CODE'
		AND LANGUAGE = USERENV('LANG')
		AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))),'No default') RES_SET_DEFAULT
,hrtNOTESETUPEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hrtNOTESETUPEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hrtNOTESETUPEO.CREATED_BY RSC_CREATED_BY
,hrtNOTESETUPEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HRT_NOTE_SETUP hrtNOTESETUPEO
ORDER BY RES_FEEDBACK_CONTEXT

