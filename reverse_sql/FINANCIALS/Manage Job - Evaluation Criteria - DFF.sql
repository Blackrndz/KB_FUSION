/* ****************************************************************************
 * $Revision: 53683 $:
 * $Author: nasrullah.dusenmahamad $:
 * $Date: 2016-03-18 18:09:04 +0700 (Fri, 18 Mar 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Job%20-%20Evaluation%20Criteria.sql $:
 * $Id: Manage Job - Evaluation Criteria.sql 53683 2016-03-18 11:09:04Z nasrullah.dusenmahamad $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 -- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=800##RES##PER_EVALUATION_CRITERIA_DFF
--  DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE
-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields. 

select JOBDEO.name RES_NAME
,JOBDEO.JOB_CODE RES_CODE
,TO_CHAR(JOBDEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY')  RES_EFFECTIVE_START_DATE
,TO_CHAR(JOBDEO.EFFECTIVE_END_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE
,EVALUATIONEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,EVALUATIONEO.ATTRIBUTE1 
,EVALUATIONEO.ATTRIBUTE2
,EVALUATIONEO.ATTRIBUTE3
,EVALUATIONEO.ATTRIBUTE4
,EVALUATIONEO.ATTRIBUTE5
,EVALUATIONEO.ATTRIBUTE6
,EVALUATIONEO.ATTRIBUTE7
,EVALUATIONEO.ATTRIBUTE8
,EVALUATIONEO.ATTRIBUTE9
,EVALUATIONEO.ATTRIBUTE10
,EVALUATIONEO.ATTRIBUTE11
,EVALUATIONEO.ATTRIBUTE12
,EVALUATIONEO.ATTRIBUTE13
,EVALUATIONEO.ATTRIBUTE14
,EVALUATIONEO.ATTRIBUTE15
,EVALUATIONEO.ATTRIBUTE16 
,EVALUATIONEO.ATTRIBUTE17
,EVALUATIONEO.ATTRIBUTE18
,EVALUATIONEO.ATTRIBUTE19
,EVALUATIONEO.ATTRIBUTE20
,EVALUATIONEO.ATTRIBUTE21
,EVALUATIONEO.ATTRIBUTE22
,EVALUATIONEO.ATTRIBUTE23
,EVALUATIONEO.ATTRIBUTE24
,EVALUATIONEO.ATTRIBUTE25
,EVALUATIONEO.ATTRIBUTE26
,EVALUATIONEO.ATTRIBUTE27
,EVALUATIONEO.ATTRIBUTE28
,EVALUATIONEO.ATTRIBUTE29
,EVALUATIONEO.ATTRIBUTE30
,EVALUATIONEO.ATTRIBUTE_NUMBER1 
,EVALUATIONEO.ATTRIBUTE_NUMBER2
,EVALUATIONEO.ATTRIBUTE_NUMBER3
,EVALUATIONEO.ATTRIBUTE_NUMBER4
,EVALUATIONEO.ATTRIBUTE_NUMBER5
,EVALUATIONEO.ATTRIBUTE_NUMBER6
,EVALUATIONEO.ATTRIBUTE_NUMBER7
,EVALUATIONEO.ATTRIBUTE_NUMBER8
,EVALUATIONEO.ATTRIBUTE_NUMBER9
,EVALUATIONEO.ATTRIBUTE_NUMBER10
,EVALUATIONEO.ATTRIBUTE_NUMBER11
,EVALUATIONEO.ATTRIBUTE_NUMBER12
,EVALUATIONEO.ATTRIBUTE_NUMBER13
,EVALUATIONEO.ATTRIBUTE_NUMBER14
,EVALUATIONEO.ATTRIBUTE_NUMBER15
,EVALUATIONEO.ATTRIBUTE_NUMBER16
,EVALUATIONEO.ATTRIBUTE_NUMBER17
,EVALUATIONEO.ATTRIBUTE_NUMBER18
,EVALUATIONEO.ATTRIBUTE_NUMBER19
,EVALUATIONEO.ATTRIBUTE_NUMBER20
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE1, 'DD-Mon-YYYY') ATTRIBUTE_DATE1
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE2, 'DD-Mon-YYYY') ATTRIBUTE_DATE2
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE3, 'DD-Mon-YYYY') ATTRIBUTE_DATE3
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE4, 'DD-Mon-YYYY') ATTRIBUTE_DATE4
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE5, 'DD-Mon-YYYY') ATTRIBUTE_DATE5
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE6, 'DD-Mon-YYYY') ATTRIBUTE_DATE6
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE7, 'DD-Mon-YYYY') ATTRIBUTE_DATE7
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE8, 'DD-Mon-YYYY') ATTRIBUTE_DATE8
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE9, 'DD-Mon-YYYY') ATTRIBUTE_DATE9
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE10, 'DD-Mon-YYYY') ATTRIBUTE_DATE10
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE11, 'DD-Mon-YYYY') ATTRIBUTE_DATE11
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE12, 'DD-Mon-YYYY') ATTRIBUTE_DATE12
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE13, 'DD-Mon-YYYY') ATTRIBUTE_DATE13
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE14, 'DD-Mon-YYYY') ATTRIBUTE_DATE14
, TO_CHAR(EVALUATIONEO.ATTRIBUTE_DATE15, 'DD-Mon-YYYY') ATTRIBUTE_DATE15
,EVALUATIONEO.LAST_UPDATED_BY as RSC_LAST_UPDATED_BY
,EVALUATIONEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE
,EVALUATIONEO.CREATED_BY  RSC_CREATED_BY
,EVALUATIONEO.CREATION_DATE  RSC_CREATION_DATE
, null RSC_LEDGER_ID
, null RSC_CHART_OF_ACCOUNTS_ID
, null RSC_BUSINESS_UNIT_ID
, null RSC_LEGAL_ENTITY_ID
, null RSC_ORGANIZATION_ID
, null RSC_BUSINESS_GROUP_ID
, NULL RSC_ENTERPRISE_ID
, NULL RSC_COUNTRY_ID
    
from PER_JOBS_F_VL JOBDEO
,PER_JOB_EVALUATIONS EVALUATIONEO
where JOBDEO.JOB_ID  		= EVALUATIONEO.JOB_ID
and  (EVALUATIONEO.ATTRIBUTE_CATEGORY IS NOT NULL OR
EVALUATIONEO.ATTRIBUTE1 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE2 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE3 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE4 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE5 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE6 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE7 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE8 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE9 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE10 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE11 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE12 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE13 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE14 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE15 IS NOT NULL OR
EVALUATIONEO.ATTRIBUTE16 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE17 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE18 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE19 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE20 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE21 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE22 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE23 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE24 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE25 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE26 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE27 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE28 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE29 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE30 IS NOT NULL OR
EVALUATIONEO.ATTRIBUTE_NUMBER1 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER2 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER3 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER4 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER5 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER6 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER7 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER8 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER9 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER10 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER11 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER12 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER13 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER14 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER15 IS NOT NULL OR
EVALUATIONEO.ATTRIBUTE_NUMBER16 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER17 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER18 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER19 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_NUMBER20 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE1 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE2 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE3 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE4 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE5 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE6 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE7 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE8 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE9 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE10 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE11 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE12 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE13 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE14 IS NOT NULL OR 
EVALUATIONEO.ATTRIBUTE_DATE15 IS NOT NULL )
order by  JOBDEO.name,JOBDEO.JOB_CODE,JOBDEO.EFFECTIVE_START_DATE