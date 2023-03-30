/* ****************************************************************************
 * $Revision: 74208 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2020-06-03 19:08:12 +0700 (Wed, 03 Jun 2020) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.20/branches/core/v2.2.3.0.B/reverse_sql/FINANCIALS/Manage%20AutoPost%20Criteria%20Sets%20-%20AutoPost%20Criteria.sql $:
 * $Id: Manage AutoPost Criteria Sets - AutoPost Criteria.sql 74208 2020-06-03 12:08:12Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT personNamesE0.DISPLAY_NAME RES_PERSON_NAME
,personsE0.PERSON_NUMBER RES_PERSON_NUMBER
,'Yes' RES_ACTIVE_PERSON
,(SELECT NAME
	FROM PER_JOBS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND JOB_ID = assignmentsE0.JOB_ID 
	) RES_PRIMARY_JOB
,(SELECT NAME
	FROM HR_ORGANIZATION_UNITS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND ORGANIZATION_ID = assignmentsE0.ORGANIZATION_ID 
	) RES_PRIMARY_ORGANIZATION
,(SELECT EMAIL_ADDRESS
	FROM PER_EMAIL_ADDRESSES
	WHERE PERSON_ID = personelE0.PERSON_ID
	AND SYSDATE BETWEEN DATE_FROM AND DATE_TO
	) RES_EMAIL
,DECODE(personelE0.ELIGIBLE_PI,'Y','Yes','No') RES_PRINCIPAL_INVESTIGATOR
,DECODE(personelE0.CONFLICT_OF_INTEREST_COMPLETE,'1','Yes','No') RES_REVIEW_COMPLETED
,TO_CHAR(personelE0.CONFL_OF_INTEREST_COMP_DATE,'DD-Mon-YYYY') RES_CERTIFIED_DATE
,personelE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,personelE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,personelE0.CREATED_BY RSC_CREATED_BY
,personelE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM GMS_PERSONS personelE0
,PER_ALL_PEOPLE_F personsE0
,PER_PERSON_NAMES_F personNamesE0
,PER_ALL_ASSIGNMENTS_M assignmentsE0
WHERE personelE0.PERSON_ID = personsE0.PERSON_ID
AND personelE0.PERSON_ID = personNamesE0.PERSON_ID
AND personNamesE0.NAME_TYPE = 'GLOBAL'
AND personelE0.PERSON_ID = assignmentsE0.PERSON_ID
AND assignmentsE0.PRIMARY_FLAG = 'Y'
AND SYSDATE BETWEEN personsE0.EFFECTIVE_START_DATE AND NVL(personsE0.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN personNamesE0.EFFECTIVE_START_DATE AND NVL(personNamesE0.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN assignmentsE0.EFFECTIVE_START_DATE AND NVL(assignmentsE0.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
ORDER BY personNamesE0.DISPLAY_NAME