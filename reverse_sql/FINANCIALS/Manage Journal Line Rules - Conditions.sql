/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

WITH STATEMENT1 AS
	(SELECT ' '||BRACKET_LEFT_CODE||(CASE
		WHEN NAME IS NOT NULL THEN
			' "'||NAME||'"'||(CASE
			WHEN KEY_FLEXFIELD_FLAG = 'Y' THEN
				(CASE
					WHEN FLEXFIELD_SEGMENT_CODE IS NULL THEN
						'."All"'
					ELSE
						'."'||(SELECT NAME FROM FND_KF_SEGMENT_LABELS_VL
							WHERE APPLICATION_ID = XX.FLEXFIELD_APPLICATION_ID
							AND KEY_FLEXFIELD_CODE = XX.ID_FLEX_CODE
							AND SEGMENT_LABEL_CODE = XX.FLEXFIELD_SEGMENT_CODE)||'"'
				END)
			WHEN (SELECT COUNT(*) CNT FROM XLA_SOURCES_VL WHERE NAME = XX.NAME) > 1 OR (SELECT COUNT(*) CNT FROM XLA_SOURCES_VL WHERE SOURCE_CODE = XX.SOURCE_CODE) > 1 THEN
				'('||NVL((SELECT APPLICATION_SHORT_NAME FROM FND_APPLICATION WHERE APPLICATION_ID = XX.APPLICATION_ID)
					,(SELECT APPLICATION_NAME FROM XLA_SUBLEDGERS_TL WHERE LANGUAGE = USERENV('LANG') AND APPLICATION_ID = XX.APPLICATION_ID))||') '
			/*WHEN (SELECT COUNT(*) CNT FROM XLA_SOURCES_VL WHERE SOURCE_CODE = XX.SOURCE_CODE) > 1 THEN
				'('||(SELECT APPLICATION_SHORT_NAME FROM FND_APPLICATION_VL WHERE APPLICATION_ID = XX.APPLICATION_ID)||') '*/
			END)
		||' '||DECODE(LINE_OPERATOR_CODE,'E','=','D','!=','N','Is null','X','is not null','G','>','H','>=','L','<','M','<=')||' '||
		(CASE
			WHEN XX.LOOKUP_TYPE IS NOT NULL THEN
				(SELECT MEANING
					FROM FND_LOOKUP_VALUES
					WHERE LOOKUP_TYPE = XX.LOOKUP_TYPE
					AND LOOKUP_CODE = XX.VALUE_CONSTANT
					AND VIEW_APPLICATION_ID = XX.VIEW_APPLICATION_ID
					AND LANGUAGE = USERENV('LANG'))
			ELSE 
				VALUE_CONSTANT
			END)
		END)
		||' '||BRACKET_RIGHT_CODE||' '||DECODE(LOGICAL_OPERATOR_CODE,'A','''AND''','O','''Or''') CONTEXT
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	,CON_APP_ID
	,AMB_CONTEXT_CODE
	,ENTITY_CODE
	,EVENT_CLASS_CODE
	,ACCOUNTING_LINE_TYPE_CODE
	,ACCOUNTING_LINE_CODE
	FROM (SELECT ConditionEO.SEGMENT_RULE_DETAIL_ID
		,ConditionEO.USER_SEQUENCE
		,ConditionEO.BRACKET_LEFT_CODE
		,ConditionEO.BRACKET_RIGHT_CODE
		,ConditionEO.VALUE_TYPE_CODE
		,SourceE0.NAME
		,SourceE0.SOURCE_CODE
		,SourceE0.KEY_FLEXFIELD_FLAG
		,SourceE0.APPLICATION_ID
		,ROW_NUMBER() OVER (PARTITION BY ConditionEO.APPLICATION_ID	,ConditionEO.AMB_CONTEXT_CODE	,ConditionEO.ENTITY_CODE ,ConditionEO.EVENT_CLASS_CODE ,ConditionEO.ACCOUNTING_LINE_TYPE_CODE ,ConditionEO.ACCOUNTING_LINE_CODE ORDER BY USER_SEQUENCE) SEQ1
		,ConditionEO.VALUE_CONSTANT
		,ConditionEO.LINE_OPERATOR_CODE
		,ConditionEO.LOGICAL_OPERATOR_CODE
		,ConditionEO.FLEXFIELD_SEGMENT_CODE
		,SourceE0.FLEXFIELD_APPLICATION_ID
		,SourceE0.ID_FLEX_CODE
		,ConditionEO.LAST_UPDATED_BY
		,ConditionEO.LAST_UPDATE_DATE
		,ConditionEO.CREATED_BY
		,ConditionEO.CREATION_DATE
		,ConditionEO.APPLICATION_ID CON_APP_ID
		,ConditionEO.AMB_CONTEXT_CODE
		,ConditionEO.ENTITY_CODE
		,ConditionEO.EVENT_CLASS_CODE
		,ConditionEO.ACCOUNTING_LINE_TYPE_CODE
		,ConditionEO.ACCOUNTING_LINE_CODE
		,SourceE0.LOOKUP_TYPE
		,SourceE0.VIEW_APPLICATION_ID
		FROM XLA_CONDITIONS ConditionEO
		,XLA_SOURCES_VL SourceE0
		WHERE SourceE0.APPLICATION_ID(+) = ConditionEO.APPLICATION_ID
		AND SourceE0.SOURCE_TYPE_CODE(+) = ConditionEO.SOURCE_TYPE_CODE
		AND SourceE0.SOURCE_CODE(+) = ConditionEO.SOURCE_CODE) XX
	WHERE SEQ1 = 1
	AND ACCOUNTING_LINE_CODE IS NOT NULL)
,STATEMENT_CONCAT AS
	(SELECT ' '||BRACKET_LEFT_CODE||(CASE
		WHEN NAME IS NOT NULL THEN
			' "'||NAME||'"'||(CASE
			WHEN KEY_FLEXFIELD_FLAG = 'Y' THEN
				(CASE
					WHEN FLEXFIELD_SEGMENT_CODE IS NULL THEN
						'."All"'
					ELSE
						'."'||(SELECT NAME FROM FND_KF_SEGMENT_LABELS_VL
							WHERE APPLICATION_ID = XX.FLEXFIELD_APPLICATION_ID
							AND KEY_FLEXFIELD_CODE = XX.ID_FLEX_CODE
							AND SEGMENT_LABEL_CODE = XX.FLEXFIELD_SEGMENT_CODE)||'"'
				END)
			WHEN (SELECT COUNT(*) CNT FROM XLA_SOURCES_VL WHERE NAME = XX.NAME) > 1 OR (SELECT COUNT(*) CNT FROM XLA_SOURCES_VL WHERE SOURCE_CODE = XX.SOURCE_CODE) > 1 THEN
				'('||NVL((SELECT APPLICATION_SHORT_NAME FROM FND_APPLICATION WHERE APPLICATION_ID = XX.APPLICATION_ID)
					,(SELECT APPLICATION_NAME FROM XLA_SUBLEDGERS_TL WHERE LANGUAGE = USERENV('LANG') AND APPLICATION_ID = XX.APPLICATION_ID))||') '
			END)
		||' '||DECODE(LINE_OPERATOR_CODE,'E','=','D','!=','N','Is null','X','is not null','G','>','H','>=','L','<','M','<=')||' '||
		(CASE
			WHEN XX.LOOKUP_TYPE IS NOT NULL THEN
				(SELECT MEANING
					FROM FND_LOOKUP_VALUES
					WHERE LOOKUP_TYPE = XX.LOOKUP_TYPE
					AND LOOKUP_CODE = XX.VALUE_CONSTANT
					AND VIEW_APPLICATION_ID = XX.VIEW_APPLICATION_ID
					AND LANGUAGE = USERENV('LANG'))
			ELSE 
				VALUE_CONSTANT
			END)
		END)||' '||BRACKET_RIGHT_CODE||' '||DECODE(LOGICAL_OPERATOR_CODE,'A','''AND''','O','''Or''') CONTEXT
	,CON_APP_ID
	,AMB_CONTEXT_CODE
	,ENTITY_CODE
	,EVENT_CLASS_CODE
	,ACCOUNTING_LINE_TYPE_CODE
	,ACCOUNTING_LINE_CODE
	,SEQ1
	FROM (SELECT ConditionEO.SEGMENT_RULE_DETAIL_ID
		,ConditionEO.USER_SEQUENCE
		,ConditionEO.BRACKET_LEFT_CODE
		,ConditionEO.BRACKET_RIGHT_CODE
		,ConditionEO.VALUE_TYPE_CODE
		,SourceE0.NAME
		,SourceE0.SOURCE_CODE
		,SourceE0.KEY_FLEXFIELD_FLAG
		,SourceE0.APPLICATION_ID
		,ROW_NUMBER() OVER (PARTITION BY ConditionEO.APPLICATION_ID	,ConditionEO.AMB_CONTEXT_CODE	,ConditionEO.ENTITY_CODE ,ConditionEO.EVENT_CLASS_CODE ,ConditionEO.ACCOUNTING_LINE_TYPE_CODE ,ConditionEO.ACCOUNTING_LINE_CODE ORDER BY USER_SEQUENCE) SEQ1
		,ConditionEO.VALUE_CONSTANT
		,ConditionEO.LINE_OPERATOR_CODE
		,ConditionEO.LOGICAL_OPERATOR_CODE
		,ConditionEO.FLEXFIELD_SEGMENT_CODE
		,SourceE0.FLEXFIELD_APPLICATION_ID
		,SourceE0.ID_FLEX_CODE
		,ConditionEO.APPLICATION_ID CON_APP_ID
		,ConditionEO.AMB_CONTEXT_CODE
		,ConditionEO.ENTITY_CODE
		,ConditionEO.EVENT_CLASS_CODE
		,ConditionEO.ACCOUNTING_LINE_TYPE_CODE
		,ConditionEO.ACCOUNTING_LINE_CODE
		,SourceE0.LOOKUP_TYPE
		,SourceE0.VIEW_APPLICATION_ID
		FROM XLA_CONDITIONS ConditionEO
		,XLA_SOURCES_VL SourceE0
		WHERE SourceE0.APPLICATION_ID(+) = ConditionEO.APPLICATION_ID
		AND SourceE0.SOURCE_TYPE_CODE(+) = ConditionEO.SOURCE_TYPE_CODE
		AND SourceE0.SOURCE_CODE(+) = ConditionEO.SOURCE_CODE) XX
	WHERE SEQ1 BETWEEN 2 AND 35
	AND ACCOUNTING_LINE_CODE IS NOT NULL)

SELECT  (SELECT APPLICATION_NAME
	FROM XLA_SUBLEDGERS_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND APPLICATION_ID = JELineRulesE0.APPLICATION_ID
	) RES_SUBLEDGER_APPLICATION
,JELineRulesE0.NAME RES_NAME
,(SELECT NAME
	FROM XLA_EVENT_CLASSES_TL
	WHERE ENTITY_CODE = JELineRulesE0.ENTITY_CODE
	AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
	AND APPLICATION_ID = JELineRulesE0.APPLICATION_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_EVENT_CLASS
,STATEMENT1.CONTEXT
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 2)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 3)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 4)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 5)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 6)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 7)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 8)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 9)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 10)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 11)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 12)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 13)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 14)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 15)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 16)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 17)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 18)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 19)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 20)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 21)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 22)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 23)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 24)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 25)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 26)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 27)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 28)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 29)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 30)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 31)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 32)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 33)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 34)
	||(SELECT CONTEXT 
		FROM STATEMENT_CONCAT 
		WHERE CON_APP_ID = JELineRulesE0.APPLICATION_ID 
		AND AMB_CONTEXT_CODE = JELineRulesE0.AMB_CONTEXT_CODE
		AND ENTITY_CODE = JELineRulesE0.ENTITY_CODE
		AND EVENT_CLASS_CODE = JELineRulesE0.EVENT_CLASS_CODE
		AND ACCOUNTING_LINE_TYPE_CODE = JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE
		AND ACCOUNTING_LINE_CODE = JELineRulesE0.ACCOUNTING_LINE_CODE
		AND SEQ1 = 35)
	RES_CONDITIONS
,STATEMENT1.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,STATEMENT1.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,STATEMENT1.CREATED_BY RSC_CREATED_BY
,STATEMENT1.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM XLA_ACCT_LINE_TYPES_VL JELineRulesE0
,STATEMENT1
WHERE JELineRulesE0.APPLICATION_ID = STATEMENT1.CON_APP_ID(+)
AND JELineRulesE0.AMB_CONTEXT_CODE = STATEMENT1.AMB_CONTEXT_CODE(+)
AND JELineRulesE0.ENTITY_CODE = STATEMENT1.ENTITY_CODE(+)
AND JELineRulesE0.EVENT_CLASS_CODE = STATEMENT1.EVENT_CLASS_CODE(+)
AND JELineRulesE0.ACCOUNTING_LINE_TYPE_CODE = STATEMENT1.ACCOUNTING_LINE_TYPE_CODE(+)
AND JELineRulesE0.ACCOUNTING_LINE_CODE = STATEMENT1.ACCOUNTING_LINE_CODE(+)

ORDER BY 1,2