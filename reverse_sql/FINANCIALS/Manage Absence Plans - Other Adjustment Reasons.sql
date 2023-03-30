/* ****************************************************************************
 * $Revision: 55346 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-05-23 14:11:43 +0700 (Mon, 23 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Chart%20of%20Accounts%20Value%20Set%20Values%20-%20Manage%20Values.sql $:
 * $Id: Manage Chart of Accounts Value Set Values - Manage Values.sql 55346 2016-05-23 07:11:43Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=ANC_ABSENCE_PLANS_F

WITH PREP_DATA AS (SELECT ABSENCE_PLAN_ID
	,REPLACE(OTHER_REASONS||',',' ','') A1
	FROM ANC_ABSENCE_PLANS_F
	WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND ENTL_METHOD_CD IN ('ORA_ANC_DON','N'))
,REASON_TO_ROW AS (SELECT * 
	FROM (SELECT ABSENCE_PLAN_ID
		,1 SEQ
		,SUBSTR(A1,1,INSTR(A1,',',1,1)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,2 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,1)+1,INSTR(A1,',',1,2) - INSTR(A1,',',1,1)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,3 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,2)+1,INSTR(A1,',',1,3) - INSTR(A1,',',1,2)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,4 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,3)+1,INSTR(A1,',',1,4) - INSTR(A1,',',1,3)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,5 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,4)+1,INSTR(A1,',',1,5) - INSTR(A1,',',1,4)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,6 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,5)+1,INSTR(A1,',',1,6) - INSTR(A1,',',1,5)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,7 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,6)+1,INSTR(A1,',',1,7) - INSTR(A1,',',1,6)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,8 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,7)+1,INSTR(A1,',',1,8) - INSTR(A1,',',1,7)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,9 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,8)+1,INSTR(A1,',',1,9) - INSTR(A1,',',1,8)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,10 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,9)+1,INSTR(A1,',',1,10) - INSTR(A1,',',1,9)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,11 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,10)+1,INSTR(A1,',',1,11) - INSTR(A1,',',1,10)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,12 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,11)+1,INSTR(A1,',',1,12) - INSTR(A1,',',1,11)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,13 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,12)+1,INSTR(A1,',',1,13) - INSTR(A1,',',1,12)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,14 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,13)+1,INSTR(A1,',',1,14) - INSTR(A1,',',1,13)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,15 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,14)+1,INSTR(A1,',',1,15) - INSTR(A1,',',1,14)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,16 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,15)+1,INSTR(A1,',',1,16) - INSTR(A1,',',1,15)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,17 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,16)+1,INSTR(A1,',',1,17) - INSTR(A1,',',1,16)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,18 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,17)+1,INSTR(A1,',',1,18) - INSTR(A1,',',1,17)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,19 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,18)+1,INSTR(A1,',',1,19) - INSTR(A1,',',1,18)-1) REASON
		FROM PREP_DATA
		
		UNION
		
		SELECT ABSENCE_PLAN_ID
		,20 SEQ
		,SUBSTR(A1,INSTR(A1,',',1,19)+1,INSTR(A1,',',1,20) - INSTR(A1,',',1,19)-1) REASON
		FROM PREP_DATA)
	WHERE REASON IS NOT NULL
	)

SELECT (SELECT NAME 
	FROM ANC_ABSENCE_PLANS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND ABSENCE_PLAN_ID = absencePlansE0.ABSENCE_PLAN_ID
	AND EFFECTIVE_START_DATE = absencePlansE0.EFFECTIVE_START_DATE
	) RES_PLAN
,(SELECT TERRITORY_SHORT_NAME
	FROM FND_TERRITORIES_VL
	WHERE TERRITORY_CODE = absencePlansE0.LEGISLATION_CODE 
	) RES_LEGISLATION
,(SELECT NAME
	FROM PER_LEGISLATIVE_DATA_GROUPS_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LEGISLATIVE_DATA_GROUP_ID = absencePlansE0.LEGISLATIVE_DATA_GROUP_ID 
	) RES_LEGISLATIVE_DATA_GROUP
,TO_CHAR(absencePlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,DECODE(TO_CHAR(absencePlansE0.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(absencePlansE0.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_EFFECTIVE_END_DATE
,allReasonsE0.MEANING RES_OTHER_ADJUSTMENT_REASON_NA
,(CASE
	WHEN EXISTS (SELECT 1 FROM REASON_TO_ROW WHERE ABSENCE_PLAN_ID = absencePlansE0.ABSENCE_PLAN_ID AND REASON = allReasonsE0.LOOKUP_CODE) THEN
		'Yes'
	ELSE
		'No'
	END) RES_OTHER_ADJUSTMENT_REASON_VA
,absencePlansE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,absencePlansE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,absencePlansE0.CREATED_BY  RSC_CREATED_BY
,absencePlansE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,absencePlansE0.LEGISLATION_CODE RSC_COUNTRY_ID
 
FROM ANC_ABSENCE_PLANS_F absencePlansE0
,(SELECT MEANING
	,LOOKUP_CODE
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ANC_ABS_PLAN_OTHER_REASONS'
	) allReasonsE0
WHERE absencePlansE0.ENTL_METHOD_CD IN ('ORA_ANC_DON','N')
AND absencePlansE0.OTHER_ADJUSTMENT_FLAG = 'Y'
ORDER BY 1
,absencePlansE0.EFFECTIVE_START_DATE