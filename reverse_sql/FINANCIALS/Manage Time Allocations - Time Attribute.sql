/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- VALUE_SET_LOGIC_TO_APPLY_FIELDS=RES_TIME_ATTRIBUTE_VALUE
 
-- RSC_PREREQUISITE_OBJECTS=HWM_ALLOCATIONS_HDR_VL

WITH ATTRS_HEAD AS (SELECT lnAtr.ALLOCATION_RULE_ID
	,lnAtr.ALLOCATION_LINE_ID
	,lnAtr.TM_ATRB_FLD_ID
	,lnAtr.ATRB_FLD_NAME
	,lnAtr.ATRB_DATA_TYPE
	,lnAtr.ATRB_VALUE_TEXT
	,lnAtr.ATRB_VALUE_NUMBER
	,lnAtr.ATRB_VALUE_TIMESTAMP
	,lnAtr.UI_ATRB_SEQUENCE
	,lnAtr.LAST_UPDATED_BY
	,lnAtr.LAST_UPDATE_DATE
	,lnAtr.CREATED_BY
	,lnAtr.CREATION_DATE
	,ds.IMPLEMENTATION_TYPE
	,ds.EXECUTABLE_CODE
	,ROW_NUMBER() OVER(PARTITION BY lnAtr.ALLOCATION_RULE_ID,lnAtr.ALLOCATION_LINE_ID ORDER BY lnAtr.UI_ATRB_SEQUENCE) R1
	FROM HWM_ALLOCATION_LN_ATRBS_F lnAtr
	,(SELECT dsE0.EXECUTABLE_CODE
		,dsUsage.TM_ATRB_FLD_ID
		,dsE0.IMPLEMENTATION_TYPE
		FROM HWM_DATA_SOURCE_USAGES dsUsage
		,HWM_DATA_SOURCES_VL dsE0
		WHERE dsE0.DATA_SOURCE_ID = dsUsage.DATA_SOURCE_ID
		AND dsUsage.DEFAULT_FLAG = 'Y'
		AND dsUsage.USAGE_TYPE = 'ADMIN'
		) ds
	WHERE lnAtr.TM_ATRB_FLD_ID = ds.TM_ATRB_FLD_ID(+)
	AND SYSDATE BETWEEN lnAtr.EFFECTIVE_START_DATE AND lnAtr.EFFECTIVE_END_DATE )

SELECT timeAlloWcationsE0.ALLOCATION_NAME RES_ALLOCATION_NAME
,sourcesE0.ALLOCATION_RULE_PRIORITY RES_PROCESSING_SOURCE_SEQUENCE
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'ORA_HWM_ALLOCATION_TYPE'
    AND LOOKUP_CODE = sourcesE0.ALLOCATION_TYPE
    ) RES_ALLOCATION_TYPE
,outputsE0.ALLOCATION_LINE_PRIORITY RES_PROCESSING_OUTPUT_SEQUENCE
,ATTRS_HEAD.UI_ATRB_SEQUENCE RES_ATTRIBUTE_DISPLAY_SEQUENCE
,(SELECT DISPLAY_NAME
	FROM HWM_TM_ATRB_FLDS_TL
    WHERE LANGUAGE = USERENV('LANG')
	AND TM_ATRB_FLD_ID = ATTRS_HEAD.TM_ATRB_FLD_ID 
	) RES_TIME_ATTRIBUTE_NAME
,(CASE
    WHEN ATTRS_HEAD.ATRB_DATA_TYPE = 'VARCHAR2' THEN
        (CASE
            WHEN ATTRS_HEAD.IMPLEMENTATION_TYPE = 'VIEW_OBJECT' THEN
				(CASE
					WHEN ATTRS_HEAD.EXECUTABLE_CODE = 'oracle.apps.hcm.globalAbsences.typesSetup.publicView.AbsenceTypesPVO' THEN
						(SELECT NAME 
							FROM ANC_ABSENCE_TYPES_F_TL 
							WHERE LANGUAGE = USERENV('LANG')
							AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
							AND TO_CHAR(ABSENCE_TYPE_ID) = ATTRS_HEAD.ATRB_VALUE_TEXT)
					ELSE
						ATTRS_HEAD.ATRB_VALUE_TEXT
				END)
           
            WHEN ATTRS_HEAD.IMPLEMENTATION_TYPE = 'TABLE_VALUE_SET' THEN
                (CASE
                WHEN ATTRS_HEAD.ATRB_VALUE_TEXT IS NOT NULL THEN
                    ATTRS_HEAD.EXECUTABLE_CODE||'###R4C###'||ATTRS_HEAD.ATRB_VALUE_TEXT
                END)
            WHEN ATTRS_HEAD.IMPLEMENTATION_TYPE = 'FORMAT_VALUE_SET' THEN
                ATTRS_HEAD.ATRB_VALUE_TEXT
            WHEN ATTRS_HEAD.IMPLEMENTATION_TYPE = 'INDEPENDENT_VALUE_SET' THEN
                ATTRS_HEAD.ATRB_VALUE_TEXT
			WHEN ATRB_FLD_NAME = 'AbsenceReason' THEN
				(SELECT NAME FROM ANC_ABSENCE_REASONS_VL WHERE ABSENCE_REASON_ID = ATTRS_HEAD.ATRB_VALUE_TEXT)
            END)
    WHEN ATTRS_HEAD.ATRB_DATA_TYPE = 'NUMBER' THEN
        TO_CHAR(ATTRS_HEAD.ATRB_VALUE_NUMBER)
    WHEN ATTRS_HEAD.ATRB_DATA_TYPE = 'DATE' THEN
		TO_CHAR(ATTRS_HEAD.ATRB_VALUE_TIMESTAMP,'DD-Mon-YYYY')
    ELSE
		TO_CHAR(ATTRS_HEAD.ATRB_VALUE_TIMESTAMP,'HH:MI:SS')
    END) RES_TIME_ATTRIBUTE_VALUE
,ATTRS_HEAD.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ATTRS_HEAD.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ATTRS_HEAD.CREATED_BY RSC_CREATED_BY
,ATTRS_HEAD.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,timeAlloWcationsE0.ENTERPRISE_ID RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HWM_ALLOCATIONS_HDR_VL timeAlloWcationsE0
,HWM_ALLOCATION_RULES_F sourcesE0
,HWM_ALLOCATION_LINES_F outputsE0
/*,(SELECT *
	FROM HWM_ALLOCATION_ATTRIBUTE_F
	WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) attrsE0*/
,ATTRS_HEAD
WHERE SYSDATE BETWEEN timeAlloWcationsE0.EFFECTIVE_START_DATE AND NVL(timeAlloWcationsE0.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND timeAlloWcationsE0.ALLOCATION_ID = sourcesE0.ALLOCATION_ID
--AND sourcesE0.ALLOCATION_RULE_ID = attrsE0.ALLOCATION_RULE_ID
AND sourcesE0.ALLOCATION_RULE_ID = outputsE0.ALLOCATION_RULE_ID
AND outputsE0.ALLOCATION_RULE_ID = ATTRS_HEAD.ALLOCATION_RULE_ID
AND outputsE0.ALLOCATION_LINE_ID = ATTRS_HEAD.ALLOCATION_LINE_ID
AND SYSDATE BETWEEN sourcesE0.EFFECTIVE_START_DATE AND sourcesE0.EFFECTIVE_END_DATE 
AND SYSDATE BETWEEN outputsE0.EFFECTIVE_START_DATE AND outputsE0.EFFECTIVE_END_DATE 
ORDER BY timeAlloWcationsE0.ALLOCATION_NAME
,sourcesE0.ALLOCATION_RULE_PRIORITY
,outputsE0.ALLOCATION_LINE_PRIORITY
,ATTRS_HEAD.UI_ATRB_SEQUENCE