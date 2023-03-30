
/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2017-12-28  $:
 * $HeadURL: $:
 * $Id: $:Journals Import (Posted)
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- NO_REMOVE_COMMENTS 
-- STRICTLY_BATCH_SEQ = RES_ATTRIBUTE19_VALUE_FOR_JOUR,RES_ATTRIBUTE20_VALUE_FOR_JOUR
 
select /*+ PARALLEL(8) */ 'NEW' RES_STATUS_CODE
,JH.LEDGER_ID RES_LEDGER_ID
,TO_CHAR(JH.DEFAULT_EFFECTIVE_DATE,'YYYY/MM/DD') RES_EFFECTIVE_DATE_OF_TRANSACT
,(SELECT USER_JE_SOURCE_NAME 
	FROM GL_JE_SOURCES_TL 
	WHERE LANGUAGE = USERENV('LANG')
	AND JH.JE_SOURCE = JE_SOURCE_NAME
	) RES_JOURNAL_SOURCE
,(SELECT USER_JE_CATEGORY_NAME 
	FROM GL_JE_CATEGORIES_TL 
	WHERE LANGUAGE = USERENV('LANG')
	AND JH.JE_CATEGORY = JE_CATEGORY_NAME
	) RES_JOURNAL_CATEGORY
,JL.CURRENCY_CODE RES_CURRENCY_CODE
,TO_CHAR(JL.EFFECTIVE_DATE	,'YYYY/MM/DD') RES_JOURNAL_ENTRY_CREATION_DAT
,JB.ACTUAL_FLAG RES_ACTUAL_FLAG
,GCC.SEGMENT1 RES_SEGMENT1
,GCC.SEGMENT2 RES_SEGMENT2
,GCC.SEGMENT3 RES_SEGMENT3
,GCC.SEGMENT4 RES_SEGMENT4
,GCC.SEGMENT5 RES_SEGMENT5
,GCC.SEGMENT6 RES_SEGMENT6
,GCC.SEGMENT7 RES_SEGMENT7
,GCC.SEGMENT8 RES_SEGMENT8
,GCC.SEGMENT9 RES_SEGMENT9
,GCC.SEGMENT10 RES_SEGMENT10
,GCC.SEGMENT11 RES_SEGMENT11
,GCC.SEGMENT12 RES_SEGMENT12
,GCC.SEGMENT13 RES_SEGMENT13
,GCC.SEGMENT14 RES_SEGMENT14
,GCC.SEGMENT15 RES_SEGMENT15
,GCC.SEGMENT16 RES_SEGMENT16
,GCC.SEGMENT17 RES_SEGMENT17
,GCC.SEGMENT18 RES_SEGMENT18
,GCC.SEGMENT19 RES_SEGMENT19
,GCC.SEGMENT20 RES_SEGMENT20
,GCC.SEGMENT21 RES_SEGMENT21
,GCC.SEGMENT22 RES_SEGMENT22
,GCC.SEGMENT23 RES_SEGMENT23
,GCC.SEGMENT24 RES_SEGMENT24
,GCC.SEGMENT25 RES_SEGMENT25
,GCC.SEGMENT26 RES_SEGMENT26
,GCC.SEGMENT27 RES_SEGMENT27
,GCC.SEGMENT28 RES_SEGMENT28
,GCC.SEGMENT29 RES_SEGMENT29
,GCC.SEGMENT30 RES_SEGMENT30
,(CASE
	WHEN NVL(JL.ENTERED_DR,0) = 0 THEN
		'0.00'
	ELSE
		TO_CHAR(JL.ENTERED_DR)
	END) RES_ENTERED_DEBIT_AMOUNT
,(CASE
	WHEN NVL(JL.ENTERED_CR,0) = 0 THEN
		'0.00'
	ELSE
		TO_CHAR(JL.ENTERED_CR)
	END) RES_ENTERED_CREDIT_AMOUNT
,(CASE
	WHEN NVL(JL.ACCOUNTED_DR,0) = 0 THEN
		'0.00'
	ELSE
		TO_CHAR(JL.ACCOUNTED_DR)
	END) RES_CONVERTED_DEBIT_AMOUNT
,(CASE
	WHEN NVL(JL.ACCOUNTED_CR,0) = 0 THEN
		'0.00'
	ELSE
		TO_CHAR(JL.ACCOUNTED_CR)
	END) RES_CONVERTED_CREDIT_AMOUNT
	
/*,(CASE WHEN INSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2)),'.',1,1) = 0 AND TO_CHAR(ROUND(JL.ENTERED_DR,2)) IS NOT NULL 
	THEN TO_CHAR(ROUND(JL.ENTERED_DR,2))||'.00'
	WHEN TO_CHAR(ROUND(JL.ENTERED_DR,2)) IS NULL THEN
		NULL
	ELSE
		(CASE WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2))	,INSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ENTERED_DR,2) ) ) ) ) = 2
		THEN  TO_CHAR(ROUND(JL.ENTERED_DR,2))
		ELSE 
			(CASE
			WHEN ROUND(JL.ENTERED_DR,2) = 0 THEN '0.00'
			ELSE TO_CHAR(ROUND(JL.ENTERED_DR,2))||'0'
		END)
		END)
	END) RES_ENTERED_DEBIT_AMOUNT
,(CASE WHEN INSTR(TO_CHAR(ROUND(JL.ENTERED_CR,2)),'.',1,1) = 0 AND TO_CHAR(ROUND(JL.ENTERED_CR,2)) IS NOT NULL 
	THEN TO_CHAR(ROUND(JL.ENTERED_CR,2))||'.00'
	WHEN TO_CHAR(ROUND(JL.ENTERED_CR,2)) IS NULL THEN
		NULL
	ELSE
		(CASE WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ENTERED_CR,2))	,INSTR(TO_CHAR(ROUND(JL.ENTERED_CR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ENTERED_CR,2) ) ) ) ) = 2
		THEN  TO_CHAR(ROUND(JL.ENTERED_CR,2))
		ELSE 
			(CASE
			WHEN ROUND(JL.ENTERED_CR,2) = 0 THEN '0.00'
			ELSE TO_CHAR(ROUND(JL.ENTERED_CR,2))||'0'
		END)
		END)
	END) RES_ENTERED_CREDIT_AMOUNT
,(CASE WHEN INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)),'.',1,1) = 0 AND TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)) IS NOT NULL 
	THEN TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))||'.00'
	WHEN TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)) IS NULL THEN
		NULL
	ELSE
		(CASE WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))	,INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2) ) ) ) ) = 2
		THEN  TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))
		ELSE 
			(CASE
			WHEN ROUND(JL.ACCOUNTED_DR,2) = 0 THEN '0.00'
			ELSE TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))||'0'
		END)
		END)
END)RES_CONVERTED_DEBIT_AMOUNT
,(CASE WHEN INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)),'.',1,1) = 0 AND TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)) IS NOT NULL 
	THEN TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))||'.00'
	WHEN TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)) IS NULL THEN
		NULL
	ELSE
		(CASE WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))	,INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2) ) ) ) ) = 2
		THEN  TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))
		ELSE 
			(CASE
			WHEN ROUND(JL.ACCOUNTED_CR,2) = 0 THEN '0.00'
			ELSE TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))||'0'
		END)
		END)
END)RES_CONVERTED_CREDIT_AMOUNT*/

/*,(CASE
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2))	,INSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ENTERED_DR,2) ) ) ) ) = 2 THEN
		(CASE WHEN INSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2)),'.',1,1) = 0
			THEN TO_CHAR(ROUND(JL.ENTERED_DR,2))||'.00'
			ELSE TO_CHAR(ROUND(JL.ENTERED_DR,2)) END)
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2)),INSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2)),'.',1,1)+1,LENGTH(TO_CHAR(ROUND(JL.ENTERED_DR,2))))) = 1 THEN
		(CASE
			WHEN ROUND(JL.ENTERED_DR,2) = 0 THEN '0.00'
			WHEN INSTR(TO_CHAR(ROUND(JL.ENTERED_DR,2)),'.',1,1) = 0 THEN TO_CHAR(ROUND(JL.ENTERED_CR,2))||'.00'
			ELSE TO_CHAR(ROUND(JL.ENTERED_DR,2))||'0'
		END)
	WHEN TO_CHAR(ROUND(JL.ENTERED_DR,2)) IS NULL THEN
		NULL
	ELSE
		TO_CHAR(ROUND(JL.ENTERED_DR,2))||'.00'
	END) RES_ENTERED_DEBIT_AMOUNT
,(CASE
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ENTERED_CR,2))	,INSTR(TO_CHAR(ROUND(JL.ENTERED_CR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ENTERED_CR,2) ) ) ) ) = 2 THEN
		TO_CHAR(ROUND(JL.ENTERED_CR,2))
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ENTERED_CR,2)),INSTR(TO_CHAR(ROUND(JL.ENTERED_CR,2)),'.',1,1)+1,LENGTH(TO_CHAR(ROUND(JL.ENTERED_CR,2))))) = 1 THEN
		(CASE
			WHEN ROUND(JL.ENTERED_CR,2) = 0 THEN '0.00'
			ELSE TO_CHAR(ROUND(JL.ENTERED_CR,2))||'0'
		END)
	WHEN TO_CHAR(ROUND(JL.ENTERED_CR,2)) IS NULL THEN
		NULL
	ELSE
		TO_CHAR(ROUND(JL.ENTERED_CR,2))||'.00'
	END) RES_ENTERED_CREDIT_AMOUNT
,(CASE
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))	,INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2) ) ) ) ) = 2 THEN
		TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)),INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)),'.',1,1)+1,LENGTH(TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))))) = 1 THEN
		(CASE
			WHEN ROUND(JL.ACCOUNTED_DR,2) = 0 THEN '0.00'
			ELSE TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))||'0'
		END)
	WHEN TO_CHAR(ROUND(JL.ACCOUNTED_DR,2)) IS NULL THEN
		NULL
	ELSE
		TO_CHAR(ROUND(JL.ACCOUNTED_DR,2))||'.00'
	END) RES_CONVERTED_DEBIT_AMOUNT
,(CASE
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))	,INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)),'.',1,1)+1	,LENGTH(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2) ) ) ) ) = 2 THEN
		TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))
	WHEN LENGTH(SUBSTR(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)),INSTR(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)),'.',1,1)+1,LENGTH(TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))))) = 1 THEN
		(CASE
			WHEN ROUND(JL.ACCOUNTED_CR,2) = 0 THEN '0.00'
			ELSE TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))||'0'
		END)
	WHEN TO_CHAR(ROUND(JL.ACCOUNTED_CR,2)) IS NULL THEN
		NULL
	ELSE
		TO_CHAR(ROUND(JL.ACCOUNTED_CR,2))||'.00'
	END) RES_CONVERTED_CREDIT_AMOUNT*/

,decode(TRIM(substr(JB.NAME,1, decode(instr(JB.NAME,(Select USER_JE_SOURCE_NAME   From GL_JE_SOURCES_VL  Where JH.JE_SOURCE = JE_SOURCE_NAME),1),0,100,instr(JB.NAME,(Select USER_JE_SOURCE_NAME   From GL_JE_SOURCES_VL  Where JH.JE_SOURCE = JE_SOURCE_NAME),1) )  -1  )	),'',''
       ,TRIM(substr(JB.NAME,1, decode(instr(JB.NAME,(Select USER_JE_SOURCE_NAME   From GL_JE_SOURCES_VL  Where JH.JE_SOURCE = JE_SOURCE_NAME),1),0,100,instr(JB.NAME,(Select USER_JE_SOURCE_NAME   From GL_JE_SOURCES_VL  Where JH.JE_SOURCE = JE_SOURCE_NAME),1) )  -1  )	)||'_')	RES_REFERENCE1_BATCH_NAME
,JB.DESCRIPTION RES_REFERENCE2_BATCH_DESCRIPTI
,JL.REFERENCE_3 RES_REFERENCE3
,NVL(decode(substr(JH.NAME,1, instr(JH.NAME,(Select USER_JE_CATEGORY_NAME  From GL_JE_CATEGORIES_VL  Where JH.JE_CATEGORY = JE_CATEGORY_NAME) ,1)  -1  ),'','',substr(JH.NAME,1, instr(JH.NAME,(Select USER_JE_CATEGORY_NAME  From GL_JE_CATEGORIES_VL  Where JH.JE_CATEGORY = JE_CATEGORY_NAME) ,1)  -1  )||JH.CURRENCY_CODE||'_' ), JH.CURRENCY_CODE||'_'	) RES_REFERENCE4_JOURNAL_ENTRY_N
,JH.DESCRIPTION RES_REFERENCE5_JOURNAL_ENTRY_D
,JH.EXTERNAL_REFERENCE RES_REFERENCE6_JOURNAL_ENTRY_R
,JH.ACCRUAL_REV_FLAG RES_REFERENCE7_JOURNAL_ENTRY_R
,(CASE
	WHEN JH.ACCRUAL_REV_FLAG = 'Y' THEN
		JH.ACCRUAL_REV_PERIOD_NAME
	END) RES_REFERENCE8_JOURNAL_ENTRY_R
,JH.ACCRUAL_REV_CHANGE_SIGN_FLAG RES_REFERENCE9_JOURNAL_REVERSA
,REPLACE(JL.DESCRIPTION,chr(10),' ') RES_REFERENCE10_JOURNAL_ENTRY_
,JL.REFERENCE_1 RES_REFERENCE_COLUMN_1
,JL.REFERENCE_2 RES_REFERENCE_COLUMN_2
,JL.REFERENCE_3 RES_REFERENCE_COLUMN_3
,JL.REFERENCE_4 RES_REFERENCE_COLUMN_4
,JL.REFERENCE_5 RES_REFERENCE_COLUMN_5
,JL.REFERENCE_6 RES_REFERENCE_COLUMN_6
,JL.REFERENCE_7 RES_REFERENCE_COLUMN_7
,JL.REFERENCE_8 RES_REFERENCE_COLUMN_8
,JL.REFERENCE_9 RES_REFERENCE_COLUMN_9
,JL.REFERENCE_10 RES_REFERENCE_COLUMN_10
,JL.STAT_AMOUNT RES_STATISTICAL_AMOUNT
,NVL(JH.CURRENCY_CONVERSION_TYPE,JL.CURRENCY_CONVERSION_TYPE)  RES_CURRENCY_CONVERSION_TYPE
,NVL(TO_CHAR(JH.CURRENCY_CONVERSION_DATE,'YYYY/MM/DD'),TO_CHAR(JL.CURRENCY_CONVERSION_DATE,'YYYY/MM/DD')) RES_CURRENCY_CONVERSION_DATE
,NVL(TO_CHAR(JH.CURRENCY_CONVERSION_RATE),TO_CHAR(JL.CURRENCY_CONVERSION_RATE)) RES_CURRENCY_CONVERSION_RATE
,'999' RES_INTERFACE_GROUP_IDENTIFIER
,JL.ATTRIBUTE_CATEGORY RES_CONTEXT_FIELD_FOR_JOURNAL_
,JL.ATTRIBUTE1 RES_ATTRIBUTE1_VALUE_FOR_JOURN
,JL.ATTRIBUTE2 RES_ATTRIBUTE2_VALUE_FOR_JOURN
,JL.ATTRIBUTE3 RES_ATTRIBUTE3_VALUE_FOR_JOURN
,JL.ATTRIBUTE4 RES_ATTRIBUTE4_VALUE_FOR_JOURN
,JL.ATTRIBUTE5 RES_ATTRIBUTE5_VALUE_FOR_JOURN
,JL.ATTRIBUTE6 RES_ATTRIBUTE6_VALUE_FOR_JOURN
,JL.ATTRIBUTE7 RES_ATTRIBUTE7_VALUE_FOR_JOURN
,JL.ATTRIBUTE8 RES_ATTRIBUTE8_VALUE_FOR_JOURN
,JL.ATTRIBUTE9 RES_ATTRIBUTE9_VALUE_FOR_JOURN
,JL.ATTRIBUTE10 RES_ATTRIBUTE10_VALUE_FOR_JOUR
,JL.ATTRIBUTE11 RES_ATTRIBUTE11_VALUE_FOR_JOUR
,JL.ATTRIBUTE12 RES_ATTRIBUTE12_VALUE_FOR_JOUR
,JL.ATTRIBUTE13 RES_ATTRIBUTE13_VALUE_FOR_JOUR
,JL.ATTRIBUTE14 RES_ATTRIBUTE14_VALUE_FOR_JOUR
,JL.ATTRIBUTE15 RES_ATTRIBUTE15_VALUE_FOR_JOUR
,JL.ATTRIBUTE16 RES_ATTRIBUTE16_VALUE_FOR_JOUR
,JL.ATTRIBUTE17 RES_ATTRIBUTE17_VALUE_FOR_JOUR
,JL.ATTRIBUTE18 RES_ATTRIBUTE18_VALUE_FOR_JOUR
,JL.JE_HEADER_ID RES_ATTRIBUTE19_VALUE_FOR_JOUR
,JL.JE_LINE_NUM RES_ATTRIBUTE20_VALUE_FOR_JOUR
,JL.ATTRIBUTE_CATEGORY3 RES_CONTEXT_FIELD_FOR_CAPTURED
,NULL RES_AVERAGE_JOURNAL_FLAG
,JH.ORIGINATING_BAL_SEG_VALUE RES_CLEARING_COMPANY
,(SELECT NAME 
	FROM GL_LEDGERS 
	WHERE LEDGER_ID = JH.LEDGER_ID 
	) RES_LEDGER_NAME
,JH.ENCUMBRANCE_TYPE_ID RES_ENCUMBRANCE_TYPE_ID
,JL.JGZZ_RECON_REF RES_RECONCILIATION_REFERENCE
,JL.PERIOD_NAME RES_PERIOD_NAME
,NULL RES_ADDITIONAL_INFORMATION
,JL.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,JL.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,JL.CREATED_BY  RSC_CREATED_BY
,JL.EFFECTIVE_DATE  RSC_CREATION_DATE
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM Gl_Je_Batches JB
,GL_JE_HEADERS JH
,GL_JE_LINES JL
,gl_code_combinations GCC
,(select RSHIP.TARGET_LEDGER_ID, RSHIP.PRIMARY_LEDGER_ID from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE JB.JE_BATCH_ID = JH.JE_BATCH_ID
AND JH.JE_HEADER_ID = JL.JE_HEADER_ID
and JH.STATUS = 'P'
and JB.ACTUAL_FLAG = 'A'
and JL.CODE_COMBINATION_ID = GCC.CODE_COMBINATION_ID
AND JH.CURRENCY_CODE <> (SELECT CURRENCY_CODE FROM GL_LEDGERS WHERE LEDGER_ID = JH.LEDGER_ID)
AND JH.CURRENCY_CODE <> 'STAT'
AND JH.LEDGER_ID = PGL.TARGET_LEDGER_ID(+)