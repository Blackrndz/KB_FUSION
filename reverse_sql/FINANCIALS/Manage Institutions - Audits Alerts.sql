/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT gmsINSTITUE0.INSTITUTION_NAME RES_NAME
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = gmsINSTITUAUDITE0.AUDIT_TYPE
	AND LOOKUP_TYPE = 'ORA_GMS_AWARD_AUDIT_TYPE' AND LANGUAGE = USERENV('LANG')
	) RES_TYPES_NAME
,gmsINSTITUAUDETAILE0.PROGRAM_COVERAGE RES_PROGRAM_COVERAGE
,gmsINSTITUAUALERTE0.ALERT_NUMBER RES_NUMBER
,personE0.DISPLAY_NAME RES_RESOLUTION_OFFICIAL_NAME
,gmsINSTITUAUALERTE0.DESCRIPTION RES_DESCRIPTION
,personE0.EMAIL_ADDRESS RES_RESOLUTION_EMAIL
,personE0.JOB RES_RESOLUTION_JOB

,gmsINSTITUAUALERTE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,gmsINSTITUAUALERTE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,gmsINSTITUAUALERTE0.CREATED_BY  RSC_CREATED_BY
,gmsINSTITUAUALERTE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM GMS_INSTITUTIONS_VL gmsINSTITUE0
,GMS_INSTN_AUDIT_TYPES gmsINSTITUAUDITE0
,GMS_INSTN_AUDIT_DETAILS_VL gmsINSTITUAUDETAILE0
,GMS_INSTN_AUDIT_ALERTS_VL gmsINSTITUAUALERTE0
,(SELECT PersonDPEO.PERSON_ID,
    JobDPEO.NAME AS JOB,
    EmailAddressPEO.EMAIL_ADDRESS,
    PersonNameDPEO.DISPLAY_NAME
  FROM FUSION.PER_ALL_PEOPLE_F PersonDPEO,
    FUSION.PER_EMAIL_ADDRESSES EmailAddressPEO,
    FUSION.PER_PERSON_NAMES_F_V PersonNameDPEO,
    FUSION.PER_ALL_ASSIGNMENTS_M AssignmentDPEO,
    FUSION.PER_JOBS_F_TL JobDPEO
  WHERE SYSDATE BETWEEN PersonDPEO.EFFECTIVE_START_DATE AND PersonDPEO.EFFECTIVE_END_DATE
  AND EmailAddressPEO.EMAIL_ADDRESS_ID(+) = PersonDPEO.PRIMARY_EMAIL_ID
  AND PersonDPEO.PERSON_ID = PersonNameDPEO.PERSON_ID
  AND SYSDATE BETWEEN PersonNameDPEO.EFFECTIVE_START_DATE AND PersonNameDPEO.EFFECTIVE_END_DATE
  AND PersonDPEO.PERSON_ID = AssignmentDPEO.PERSON_ID (+)
  AND AssignmentDPEO.WORK_TERMS_ASSIGNMENT_ID (+) IS NOT NULL
  AND AssignmentDPEO.ASSIGNMENT_STATUS_TYPE = 'ACTIVE'
  AND AssignmentDPEO.EFFECTIVE_LATEST_CHANGE (+)   = 'Y'
  AND SYSDATE BETWEEN AssignmentDPEO.EFFECTIVE_START_DATE(+) AND AssignmentDPEO.EFFECTIVE_END_DATE(+)
  AND (JobDPEO.JOB_ID (+) = ASSIGNMENTDPEO.JOB_ID
  AND SYSDATE BETWEEN JobDPEO.EFFECTIVE_START_DATE(+) AND JobDPEO.EFFECTIVE_END_DATE(+)
  AND JobDPEO.language(+) = userenv('LANG'))
) personE0
WHERE gmsINSTITUE0.INSTITUTION_ID = gmsINSTITUAUDITE0.INSTITUTION_ID
AND gmsINSTITUAUDITE0.INSTN_AUDIT_TYPE_ID = gmsINSTITUAUDETAILE0.INSTN_AUDIT_TYPE_ID
AND gmsINSTITUAUDETAILE0.INSTN_AUDIT_DETAIL_ID  = gmsINSTITUAUALERTE0.INSTN_AUDIT_DETAIL_ID 
AND gmsINSTITUAUALERTE0.RESOLUTION_OFFICIAL_ID = personE0.PERSON_ID(+)
ORDER BY gmsINSTITUE0.INSTITUTION_NAME,RES_TYPES_NAME,gmsINSTITUAUDETAILE0.PROGRAM_COVERAGE,gmsINSTITUAUALERTE0.ALERT_NUMBER
