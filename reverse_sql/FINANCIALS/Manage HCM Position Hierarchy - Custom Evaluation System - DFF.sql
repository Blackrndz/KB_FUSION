/* ****************************************************************************
 * $Revision: 73715 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2020-03-06 18:11:02 +0700 (Fri, 06 Mar 2020) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.20/trunk/core/reverse_sql/FINANCIALS/Manage%20Positions%20-%20Position%20-%20DFF.sql $:
 * $Id: Manage Positions - Position - DFF.sql 73715 2020-03-06 11:11:02Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=800##RES##PER_EVALUATION_CRITERIA_DFF
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE

SELECT TO_CHAR(hrALLPOSTIONEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT BU_NAME
	FROM FUN_ALL_BUSINESS_UNITS_V
	WHERE BU_ID = hrALLPOSTIONEO.BUSINESS_UNIT_ID 
	) RES_BUSINESS_UNIT
,hrALLPOSTIONEO.NAME RES_NAME
,hrALLPOSTIONEO.POSITION_CODE RES_CODE
,jobs.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,jobs.ATTRIBUTE1 
,jobs.ATTRIBUTE2
,jobs.ATTRIBUTE3 
,jobs.ATTRIBUTE4 
,jobs.ATTRIBUTE5 
,jobs.ATTRIBUTE6 
,jobs.ATTRIBUTE7 
,jobs.ATTRIBUTE8 
,jobs.ATTRIBUTE9 
,jobs.ATTRIBUTE10 
,jobs.ATTRIBUTE11
,jobs.ATTRIBUTE12 
,jobs.ATTRIBUTE13
,jobs.ATTRIBUTE14 
,jobs.ATTRIBUTE15 
,jobs.ATTRIBUTE16 
,jobs.ATTRIBUTE17 
,jobs.ATTRIBUTE18 
,jobs.ATTRIBUTE19 
,jobs.ATTRIBUTE20
,jobs.ATTRIBUTE21
,jobs.ATTRIBUTE22
,jobs.ATTRIBUTE23
,jobs.ATTRIBUTE24
,jobs.ATTRIBUTE25
,jobs.ATTRIBUTE26
,jobs.ATTRIBUTE27
,jobs.ATTRIBUTE28
,jobs.ATTRIBUTE29
,jobs.ATTRIBUTE30
,jobs.ATTRIBUTE_NUMBER1
,jobs.ATTRIBUTE_NUMBER2
,jobs.ATTRIBUTE_NUMBER3
,jobs.ATTRIBUTE_NUMBER4
,jobs.ATTRIBUTE_NUMBER5
,jobs.ATTRIBUTE_NUMBER6
,jobs.ATTRIBUTE_NUMBER7
,jobs.ATTRIBUTE_NUMBER8
,jobs.ATTRIBUTE_NUMBER9
,jobs.ATTRIBUTE_NUMBER10
,jobs.ATTRIBUTE_NUMBER11
,jobs.ATTRIBUTE_NUMBER12
,jobs.ATTRIBUTE_NUMBER13
,jobs.ATTRIBUTE_NUMBER14
,jobs.ATTRIBUTE_NUMBER15
,jobs.ATTRIBUTE_NUMBER16
,jobs.ATTRIBUTE_NUMBER17
,jobs.ATTRIBUTE_NUMBER18
,jobs.ATTRIBUTE_NUMBER19
,jobs.ATTRIBUTE_NUMBER20
,TO_CHAR(jobs.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(jobs.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(jobs.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(jobs.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(jobs.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,TO_CHAR(jobs.ATTRIBUTE_DATE6,'DD-Mon-YYYY') ATTRIBUTE_DATE6
,TO_CHAR(jobs.ATTRIBUTE_DATE7,'DD-Mon-YYYY') ATTRIBUTE_DATE7
,TO_CHAR(jobs.ATTRIBUTE_DATE8,'DD-Mon-YYYY') ATTRIBUTE_DATE8
,TO_CHAR(jobs.ATTRIBUTE_DATE9,'DD-Mon-YYYY') ATTRIBUTE_DATE9
,TO_CHAR(jobs.ATTRIBUTE_DATE10,'DD-Mon-YYYY') ATTRIBUTE_DATE10
,TO_CHAR(jobs.ATTRIBUTE_DATE11,'DD-Mon-YYYY') ATTRIBUTE_DATE11
,TO_CHAR(jobs.ATTRIBUTE_DATE12,'DD-Mon-YYYY') ATTRIBUTE_DATE12
,TO_CHAR(jobs.ATTRIBUTE_DATE13,'DD-Mon-YYYY') ATTRIBUTE_DATE13
,TO_CHAR(jobs.ATTRIBUTE_DATE14,'DD-Mon-YYYY') ATTRIBUTE_DATE14
,TO_CHAR(jobs.ATTRIBUTE_DATE15,'DD-Mon-YYYY') ATTRIBUTE_DATE15

,jobs.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,jobs.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,jobs.CREATED_BY RSC_CREATED_BY
,jobs.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HR_ALL_POSITIONS_F_VL hrALLPOSTIONEO
,PER_JOB_EVALUATIONS jobs
WHERE hrALLPOSTIONEO.POSITION_ID = jobs.POSITION_ID
AND jobs.EVALUATION_SYSTEM = 'CUST'
AND (jobs.ATTRIBUTE_CATEGORY IS NOT NULL OR
	jobs.ATTRIBUTE1 IS NOT NULL OR
	jobs.ATTRIBUTE2 IS NOT NULL OR
	jobs.ATTRIBUTE3 IS NOT NULL OR 
	jobs.ATTRIBUTE5 IS NOT NULL OR 
	jobs.ATTRIBUTE6 IS NOT NULL OR 
	jobs.ATTRIBUTE7 IS NOT NULL OR 
	jobs.ATTRIBUTE8 IS NOT NULL OR 
	jobs.ATTRIBUTE9 IS NOT NULL OR 
	jobs.ATTRIBUTE10 IS NOT NULL OR 
	jobs.ATTRIBUTE11 IS NOT NULL OR 
	jobs.ATTRIBUTE12 IS NOT NULL OR 
	jobs.ATTRIBUTE13 IS NOT NULL OR 
	jobs.ATTRIBUTE14 IS NOT NULL OR 
	jobs.ATTRIBUTE15 IS NOT NULL OR 
	jobs.ATTRIBUTE16 IS NOT NULL OR 
	jobs.ATTRIBUTE17 IS NOT NULL OR 
	jobs.ATTRIBUTE18 IS NOT NULL OR 
	jobs.ATTRIBUTE19 IS NOT NULL OR 
	jobs.ATTRIBUTE20 IS NOT NULL OR 
	jobs.ATTRIBUTE21 IS NOT NULL OR 
	jobs.ATTRIBUTE22 IS NOT NULL OR 
	jobs.ATTRIBUTE23 IS NOT NULL OR 
	jobs.ATTRIBUTE24 IS NOT NULL OR 
	jobs.ATTRIBUTE25 IS NOT NULL OR 
	jobs.ATTRIBUTE26 IS NOT NULL OR 
	jobs.ATTRIBUTE27 IS NOT NULL OR 
	jobs.ATTRIBUTE28 IS NOT NULL OR 
	jobs.ATTRIBUTE29 IS NOT NULL OR 
	jobs.ATTRIBUTE30 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER1 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER2 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER3 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER4 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER5 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER6 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER7 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER8 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER9 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER10 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER11 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER12 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER13 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER14 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER15 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER16 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER17 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER18 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER19 IS NOT NULL OR 
	jobs.ATTRIBUTE_NUMBER20 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE1 IS NOT NULL OR
	jobs.ATTRIBUTE_DATE2 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE3 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE4 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE5 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE6 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE7 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE8 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE9 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE10 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE11 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE12 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE13 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE14 IS NOT NULL OR 
	jobs.ATTRIBUTE_DATE15 IS NOT NULL  )
ORDER BY hrALLPOSTIONEO.NAME
,hrALLPOSTIONEO.POSITION_CODE
,hrALLPOSTIONEO.EFFECTIVE_START_DATE