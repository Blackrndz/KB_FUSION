/* ****************************************************************************
 * $Revision: 58428 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-09-23 18:27:01 +0700 (Fri, 23 Sep 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/customized/In%20Develop/reverse_sql/Manage%20Units%20of%20Measure%20Profiles%20-%20Profile%20Values.sql $:
 * $Id: Manage Units of Measure Profiles - Profile Values.sql 58428 2016-09-23 11:27:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- STRICTLY_BATCH_SEQ = RES_INTERFACE_DISTRIBUTION_KEY

SELECT PoDistributionsE0.PO_DISTRIBUTION_ID RES_INTERFACE_DISTRIBUTION_KEY
,PoDistributionsE0.LINE_LOCATION_ID RES_INTERFACE_LINE_LOCATION_KE
,PoDistributionsE0.DISTRIBUTION_NUM RES_DISTRIBUTION
,(SELECT LOCATION_NAME
	FROM PER_LOCATION_DETAILS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LOCATION_DETAILS_ID = PoDistributionsE0.DELIVER_TO_LOCATION_ID
	) RES_DELIVER_TO_LOCATION
,(SELECT DISPLAY_NAME
	FROM PER_PERSON_NAMES_F
	WHERE PERSON_ID = PoDistributionsE0.DELIVER_TO_PERSON_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND NAME_TYPE = 'GLOBAL'
	) RES_REQUESTER
,PoDistributionsE0.DESTINATION_SUBINVENTORY RES_SUBINVENTORY
,PoDistributionsE0.AMOUNT_BILLED RES_AMOUNT
,PoDistributionsE0.QUANTITY_BILLED RES_QUANTITY
,AccountsE0.SEGMENT1 RES_CHARGE_ACCOUNT_SEGMENT1
,AccountsE0.SEGMENT2 RES_CHARGE_ACCOUNT_SEGMENT2
,AccountsE0.SEGMENT3 RES_CHARGE_ACCOUNT_SEGMENT3
,AccountsE0.SEGMENT4 RES_CHARGE_ACCOUNT_SEGMENT4
,AccountsE0.SEGMENT5 RES_CHARGE_ACCOUNT_SEGMENT5
,AccountsE0.SEGMENT6 RES_CHARGE_ACCOUNT_SEGMENT6
,AccountsE0.SEGMENT7 RES_CHARGE_ACCOUNT_SEGMENT7
,AccountsE0.SEGMENT8 RES_CHARGE_ACCOUNT_SEGMENT8
,AccountsE0.SEGMENT9 RES_CHARGE_ACCOUNT_SEGMENT9
,AccountsE0.SEGMENT10 RES_CHARGE_ACCOUNT_SEGMENT10
,AccountsE0.SEGMENT11 RES_CHARGE_ACCOUNT_SEGMENT11
,AccountsE0.SEGMENT12 RES_CHARGE_ACCOUNT_SEGMENT12
,AccountsE0.SEGMENT13 RES_CHARGE_ACCOUNT_SEGMENT13
,AccountsE0.SEGMENT14 RES_CHARGE_ACCOUNT_SEGMENT14
,AccountsE0.SEGMENT15 RES_CHARGE_ACCOUNT_SEGMENT15
,AccountsE0.SEGMENT16 RES_CHARGE_ACCOUNT_SEGMENT16
,AccountsE0.SEGMENT17 RES_CHARGE_ACCOUNT_SEGMENT17
,AccountsE0.SEGMENT18 RES_CHARGE_ACCOUNT_SEGMENT18
,AccountsE0.SEGMENT19 RES_CHARGE_ACCOUNT_SEGMENT19
,AccountsE0.SEGMENT20 RES_CHARGE_ACCOUNT_SEGMENT20
,AccountsE0.SEGMENT21 RES_CHARGE_ACCOUNT_SEGMENT21
,AccountsE0.SEGMENT22 RES_CHARGE_ACCOUNT_SEGMENT22
,AccountsE0.SEGMENT23 RES_CHARGE_ACCOUNT_SEGMENT23
,AccountsE0.SEGMENT24 RES_CHARGE_ACCOUNT_SEGMENT24
,AccountsE0.SEGMENT25 RES_CHARGE_ACCOUNT_SEGMENT25
,AccountsE0.SEGMENT26 RES_CHARGE_ACCOUNT_SEGMENT26
,AccountsE0.SEGMENT27 RES_CHARGE_ACCOUNT_SEGMENT27
,AccountsE0.SEGMENT28 RES_CHARGE_ACCOUNT_SEGMENT28
,AccountsE0.SEGMENT29 RES_CHARGE_ACCOUNT_SEGMENT29
,AccountsE0.SEGMENT30 RES_CHARGE_ACCOUNT_SEGMENT30
,PoDistributionsE0.DESTINATION_CONTEXT RES_DESTINATION_CONTEXT
,(SELECT SEGMENT1
	FROM PJF_PROJECTS_ALL_B
	WHERE PROJECT_ID = PoDistributionsE0.PJC_PROJECT_ID
	) RES_PROJECT_NUMBER
,(SELECT ELEMENT_NUMBER
	FROM PJF_PROJ_ELEMENTS_B
	WHERE PROJECT_ID = PoDistributionsE0.PJC_PROJECT_ID
	AND PROJ_ELEMENT_ID = PoDistributionsE0.PJC_TASK_ID 
	) RES_TASK_NUMBER
,TO_CHAR(PoDistributionsE0.PJC_EXPENDITURE_ITEM_DATE,'YYYY/MM/DD') RES_EXPENDITURE_ITEM_DATE
,(SELECT EXPENDITURE_TYPE_NAME
	FROM PJF_EXP_TYPES_TL
	WHERE EXPENDITURE_TYPE_ID = PoDistributionsE0.PJC_EXPENDITURE_TYPE_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_EXPENDITURE
,(SELECT NAME
    FROM HR_ORGANIZATION_UNITS_F_TL
    WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
    AND ORGANIZATION_ID = PoDistributionsE0.PJC_ORGANIZATION_ID
	) RES_EXPENDITURE_ORGANIZATION 
,PoDistributionsE0.PJC_BILLABLE_FLAG RES_BILLABLE
,PoDistributionsE0.PJC_CAPITALIZABLE_FLAG RES_CAPITALIZABLE
,(SELECT NAME
	FROM PJF_WORK_TYPES_TL
	WHERE WORK_TYPE_ID = PoDistributionsE0.PJC_WORK_TYPE_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_WORK_TYPE
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE1 RES_PJC_RESERVED_ATTRIBUTE1
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE2 RES_PJC_RESERVED_ATTRIBUTE2
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE3 RES_PJC_RESERVED_ATTRIBUTE3
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE4 RES_PJC_RESERVED_ATTRIBUTE4
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE5 RES_PJC_RESERVED_ATTRIBUTE5
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE6 RES_PJC_RESERVED_ATTRIBUTE6
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE7 RES_PJC_RESERVED_ATTRIBUTE7
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE8 RES_PJC_RESERVED_ATTRIBUTE8
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE9 RES_PJC_RESERVED_ATTRIBUTE9
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE10 RES_PJC_RESERVED_ATTRIBUTE10
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE1 RES_PJC_USER_DEF_ATTRIBUTE1
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE2 RES_PJC_USER_DEF_ATTRIBUTE2
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE3 RES_PJC_USER_DEF_ATTRIBUTE3
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE4 RES_PJC_USER_DEF_ATTRIBUTE4
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE5 RES_PJC_USER_DEF_ATTRIBUTE5
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE6 RES_PJC_USER_DEF_ATTRIBUTE6
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE7 RES_PJC_USER_DEF_ATTRIBUTE7
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE8 RES_PJC_USER_DEF_ATTRIBUTE8
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE9 RES_PJC_USER_DEF_ATTRIBUTE9
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE10 RES_PJC_USER_DEF_ATTRIBUTE10
,PoDistributionsE0.RATE RES_RATE
,TO_CHAR(PoDistributionsE0.RATE_DATE,'YYYY/MM/DD') RES_RATE_DATE
,PoDistributionsE0.ATTRIBUTE_CATEGORY RES_ATTRIBUTE_CATEGORY
,PoDistributionsE0.ATTRIBUTE1 RES_ATTRIBUTE1
,PoDistributionsE0.ATTRIBUTE2 RES_ATTRIBUTE2
,PoDistributionsE0.ATTRIBUTE3 RES_ATTRIBUTE3
,PoDistributionsE0.ATTRIBUTE4 RES_ATTRIBUTE4
,PoDistributionsE0.ATTRIBUTE5 RES_ATTRIBUTE5
,PoDistributionsE0.ATTRIBUTE6 RES_ATTRIBUTE6
,PoDistributionsE0.ATTRIBUTE7 RES_ATTRIBUTE7
,PoDistributionsE0.ATTRIBUTE8 RES_ATTRIBUTE8
,PoDistributionsE0.ATTRIBUTE9 RES_ATTRIBUTE9
,PoDistributionsE0.ATTRIBUTE10 RES_ATTRIBUTE10
,PoDistributionsE0.ATTRIBUTE11 RES_ATTRIBUTE11
,PoDistributionsE0.ATTRIBUTE12 RES_ATTRIBUTE12
,PoDistributionsE0.ATTRIBUTE13 RES_ATTRIBUTE13
,PoDistributionsE0.ATTRIBUTE14 RES_ATTRIBUTE14
,PoDistributionsE0.ATTRIBUTE15 RES_ATTRIBUTE15
,PoDistributionsE0.ATTRIBUTE16 RES_ATTRIBUTE16
,PoDistributionsE0.ATTRIBUTE17 RES_ATTRIBUTE17
,PoDistributionsE0.ATTRIBUTE18 RES_ATTRIBUTE18
,PoDistributionsE0.ATTRIBUTE19 RES_ATTRIBUTE19
,PoDistributionsE0.ATTRIBUTE20 RES_ATTRIBUTE20
,PoDistributionsE0.ATTRIBUTE_DATE1 RES_ATTRIBUTE_DATE1
,PoDistributionsE0.ATTRIBUTE_DATE2 RES_ATTRIBUTE_DATE2
,PoDistributionsE0.ATTRIBUTE_DATE3 RES_ATTRIBUTE_DATE3
,PoDistributionsE0.ATTRIBUTE_DATE4 RES_ATTRIBUTE_DATE4
,PoDistributionsE0.ATTRIBUTE_DATE5 RES_ATTRIBUTE_DATE5
,PoDistributionsE0.ATTRIBUTE_DATE6 RES_ATTRIBUTE_DATE6
,PoDistributionsE0.ATTRIBUTE_DATE7 RES_ATTRIBUTE_DATE7
,PoDistributionsE0.ATTRIBUTE_DATE8 RES_ATTRIBUTE_DATE8
,PoDistributionsE0.ATTRIBUTE_DATE9 RES_ATTRIBUTE_DATE9
,PoDistributionsE0.ATTRIBUTE_DATE10 RES_ATTRIBUTE_DATE10
,PoDistributionsE0.ATTRIBUTE_NUMBER1 RES_ATTRIBUTE_NUMBER1
,PoDistributionsE0.ATTRIBUTE_NUMBER2 RES_ATTRIBUTE_NUMBER2
,PoDistributionsE0.ATTRIBUTE_NUMBER3 RES_ATTRIBUTE_NUMBER3
,PoDistributionsE0.ATTRIBUTE_NUMBER4 RES_ATTRIBUTE_NUMBER4
,PoDistributionsE0.ATTRIBUTE_NUMBER5 RES_ATTRIBUTE_NUMBER5
,PoDistributionsE0.ATTRIBUTE_NUMBER6 RES_ATTRIBUTE_NUMBER6
,PoDistributionsE0.ATTRIBUTE_NUMBER7 RES_ATTRIBUTE_NUMBER7
,PoDistributionsE0.ATTRIBUTE_NUMBER8 RES_ATTRIBUTE_NUMBER8
,PoDistributionsE0.ATTRIBUTE_NUMBER9 RES_ATTRIBUTE_NUMBER9
,PoDistributionsE0.ATTRIBUTE_NUMBER10 RES_ATTRIBUTE_NUMBER10
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP1 RES_ATTRIBUTE_TIMESTAMP1
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP2 RES_ATTRIBUTE_TIMESTAMP2
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP3 RES_ATTRIBUTE_TIMESTAMP3
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP4 RES_ATTRIBUTE_TIMESTAMP4
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP5 RES_ATTRIBUTE_TIMESTAMP5
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP6 RES_ATTRIBUTE_TIMESTAMP6
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP7 RES_ATTRIBUTE_TIMESTAMP7
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP8 RES_ATTRIBUTE_TIMESTAMP8
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP9 RES_ATTRIBUTE_TIMESTAMP9
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP10 RES_ATTRIBUTE_TIMESTAMP10
,(SELECT EMAIL_ADDRESS 
	FROM PER_EMAIL_ADDRESSES
	WHERE PERSON_ID = PoDistributionsE0.DELIVER_TO_PERSON_ID
	AND SYSDATE BETWEEN DATE_FROM AND DATE_TO
	) RES_REQUESTER_E_MAIL
,TO_CHAR(PoDistributionsE0.BUDGET_DATE,'YYYY/MM/DD') RES_BUDGET_DATE
,PoDistributionsE0.PJC_CONTRACT_ID RES_CONTRACT_NUMBER
,'' RES_FUNDING_SOURCE
,PoDistributionsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,PoDistributionsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,PoDistributionsE0.CREATED_BY RSC_CREATED_BY
,PoDistributionsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,PoHeadersE0.PRC_BU_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PO_HEADERS_ALL PoHeadersE0
,PO_LINES_ALL PoLinesE0
,PO_LINE_LOCATIONS_ALL PoLocationsE0
,PO_DISTRIBUTIONS_ALL PoDistributionsE0
,GL_CODE_COMBINATIONS AccountsE0
WHERE PoHeadersE0.PO_HEADER_ID = PoLinesE0.PO_HEADER_ID
AND PoLinesE0.PO_HEADER_ID = PoLocationsE0.PO_HEADER_ID
AND PoLinesE0.PO_LINE_ID = PoLocationsE0.PO_LINE_ID
AND PoLocationsE0.LINE_LOCATION_ID = PoDistributionsE0.LINE_LOCATION_ID
AND PoDistributionsE0.CODE_COMBINATION_ID = AccountsE0.CODE_COMBINATION_ID(+)
--AND PoLinesE0.LINE_STATUS = 'OPEN'
AND NVL(PoHeadersE0.APPROVED_FLAG,'N') != 'Y'
AND PoHeadersE0.TYPE_LOOKUP_CODE = 'STANDARD' --Only PO
AND PoHeadersE0.DOCUMENT_STATUS = 'INCOMPLETE' --PO Header status

UNION

SELECT PoDistributionsE0.PO_DISTRIBUTION_ID RES_INTERFACE_DISTRIBUTION_KEY
,PoDistributionsE0.LINE_LOCATION_ID RES_INTERFACE_LINE_LOCATION_KE
,PoDistributionsE0.DISTRIBUTION_NUM RES_DISTRIBUTION
,(SELECT LOCATION_NAME
	FROM PER_LOCATION_DETAILS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LOCATION_DETAILS_ID = PoDistributionsE0.DELIVER_TO_LOCATION_ID
	) RES_DELIVER_TO_LOCATION
,(SELECT DISPLAY_NAME
	FROM PER_PERSON_NAMES_F
	WHERE PERSON_ID = PoDistributionsE0.DELIVER_TO_PERSON_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND NAME_TYPE = 'GLOBAL'
	) RES_REQUESTER
,PoDistributionsE0.DESTINATION_SUBINVENTORY RES_SUBINVENTORY
,(SELECT PoLocationsE0.AMOUNT - NVL(SUM(invLines.AMOUNT),0) 
	FROM AP_INVOICES_ALL inv
	,AP_INVOICE_LINES_ALL invLines
	WHERE inv.INVOICE_ID = invLines.INVOICE_ID
	AND invLines.LINE_TYPE_LOOKUP_CODE != 'TAX'
	AND invLines.PO_HEADER_ID = PoHeadersE0.PO_HEADER_ID
	AND invLines.PO_LINE_ID = PoLinesE0.PO_LINE_ID
	AND invLines.PO_LINE_LOCATION_ID = PoLocationsE0.LINE_LOCATION_ID
	) RES_AMOUNT
,PoDistributionsE0.QUANTITY_BILLED RES_QUANTITY
,AccountsE0.SEGMENT1 RES_CHARGE_ACCOUNT_SEGMENT1
,AccountsE0.SEGMENT2 RES_CHARGE_ACCOUNT_SEGMENT2
,AccountsE0.SEGMENT3 RES_CHARGE_ACCOUNT_SEGMENT3
,AccountsE0.SEGMENT4 RES_CHARGE_ACCOUNT_SEGMENT4
,AccountsE0.SEGMENT5 RES_CHARGE_ACCOUNT_SEGMENT5
,AccountsE0.SEGMENT6 RES_CHARGE_ACCOUNT_SEGMENT6
,AccountsE0.SEGMENT7 RES_CHARGE_ACCOUNT_SEGMENT7
,AccountsE0.SEGMENT8 RES_CHARGE_ACCOUNT_SEGMENT8
,AccountsE0.SEGMENT9 RES_CHARGE_ACCOUNT_SEGMENT9
,AccountsE0.SEGMENT10 RES_CHARGE_ACCOUNT_SEGMENT10
,AccountsE0.SEGMENT11 RES_CHARGE_ACCOUNT_SEGMENT11
,AccountsE0.SEGMENT12 RES_CHARGE_ACCOUNT_SEGMENT12
,AccountsE0.SEGMENT13 RES_CHARGE_ACCOUNT_SEGMENT13
,AccountsE0.SEGMENT14 RES_CHARGE_ACCOUNT_SEGMENT14
,AccountsE0.SEGMENT15 RES_CHARGE_ACCOUNT_SEGMENT15
,AccountsE0.SEGMENT16 RES_CHARGE_ACCOUNT_SEGMENT16
,AccountsE0.SEGMENT17 RES_CHARGE_ACCOUNT_SEGMENT17
,AccountsE0.SEGMENT18 RES_CHARGE_ACCOUNT_SEGMENT18
,AccountsE0.SEGMENT19 RES_CHARGE_ACCOUNT_SEGMENT19
,AccountsE0.SEGMENT20 RES_CHARGE_ACCOUNT_SEGMENT20
,AccountsE0.SEGMENT21 RES_CHARGE_ACCOUNT_SEGMENT21
,AccountsE0.SEGMENT22 RES_CHARGE_ACCOUNT_SEGMENT22
,AccountsE0.SEGMENT23 RES_CHARGE_ACCOUNT_SEGMENT23
,AccountsE0.SEGMENT24 RES_CHARGE_ACCOUNT_SEGMENT24
,AccountsE0.SEGMENT25 RES_CHARGE_ACCOUNT_SEGMENT25
,AccountsE0.SEGMENT26 RES_CHARGE_ACCOUNT_SEGMENT26
,AccountsE0.SEGMENT27 RES_CHARGE_ACCOUNT_SEGMENT27
,AccountsE0.SEGMENT28 RES_CHARGE_ACCOUNT_SEGMENT28
,AccountsE0.SEGMENT29 RES_CHARGE_ACCOUNT_SEGMENT29
,AccountsE0.SEGMENT30 RES_CHARGE_ACCOUNT_SEGMENT30
,PoDistributionsE0.DESTINATION_CONTEXT RES_DESTINATION_CONTEXT
,(SELECT SEGMENT1
	FROM PJF_PROJECTS_ALL_B
	WHERE PROJECT_ID = PoDistributionsE0.PJC_PROJECT_ID
	) RES_PROJECT_NUMBER
,(SELECT ELEMENT_NUMBER
	FROM PJF_PROJ_ELEMENTS_B
	WHERE PROJECT_ID = PoDistributionsE0.PJC_PROJECT_ID
	AND PROJ_ELEMENT_ID = PoDistributionsE0.PJC_TASK_ID 
	) RES_TASK_NUMBER
,TO_CHAR(PoDistributionsE0.PJC_EXPENDITURE_ITEM_DATE,'YYYY/MM/DD') RES_EXPENDITURE_ITEM_DATE
,(SELECT EXPENDITURE_TYPE_NAME
	FROM PJF_EXP_TYPES_TL
	WHERE EXPENDITURE_TYPE_ID = PoDistributionsE0.PJC_EXPENDITURE_TYPE_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_EXPENDITURE
,(SELECT NAME
    FROM HR_ORGANIZATION_UNITS_F_TL
    WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
    AND ORGANIZATION_ID = PoDistributionsE0.PJC_ORGANIZATION_ID
	) RES_EXPENDITURE_ORGANIZATION 
,PoDistributionsE0.PJC_BILLABLE_FLAG RES_BILLABLE
,PoDistributionsE0.PJC_CAPITALIZABLE_FLAG RES_CAPITALIZABLE
,(SELECT NAME
	FROM PJF_WORK_TYPES_TL
	WHERE WORK_TYPE_ID = PoDistributionsE0.PJC_WORK_TYPE_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_WORK_TYPE
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE1 RES_PJC_RESERVED_ATTRIBUTE1
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE2 RES_PJC_RESERVED_ATTRIBUTE2
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE3 RES_PJC_RESERVED_ATTRIBUTE3
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE4 RES_PJC_RESERVED_ATTRIBUTE4
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE5 RES_PJC_RESERVED_ATTRIBUTE5
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE6 RES_PJC_RESERVED_ATTRIBUTE6
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE7 RES_PJC_RESERVED_ATTRIBUTE7
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE8 RES_PJC_RESERVED_ATTRIBUTE8
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE9 RES_PJC_RESERVED_ATTRIBUTE9
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE10 RES_PJC_RESERVED_ATTRIBUTE10
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE1 RES_PJC_USER_DEF_ATTRIBUTE1
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE2 RES_PJC_USER_DEF_ATTRIBUTE2
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE3 RES_PJC_USER_DEF_ATTRIBUTE3
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE4 RES_PJC_USER_DEF_ATTRIBUTE4
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE5 RES_PJC_USER_DEF_ATTRIBUTE5
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE6 RES_PJC_USER_DEF_ATTRIBUTE6
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE7 RES_PJC_USER_DEF_ATTRIBUTE7
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE8 RES_PJC_USER_DEF_ATTRIBUTE8
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE9 RES_PJC_USER_DEF_ATTRIBUTE9
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE10 RES_PJC_USER_DEF_ATTRIBUTE10
,PoDistributionsE0.RATE RES_RATE
,TO_CHAR(PoDistributionsE0.RATE_DATE,'YYYY/MM/DD') RES_RATE_DATE
,PoDistributionsE0.ATTRIBUTE_CATEGORY RES_ATTRIBUTE_CATEGORY
,PoDistributionsE0.ATTRIBUTE1 RES_ATTRIBUTE1
,PoDistributionsE0.ATTRIBUTE2 RES_ATTRIBUTE2
,PoDistributionsE0.ATTRIBUTE3 RES_ATTRIBUTE3
,PoDistributionsE0.ATTRIBUTE4 RES_ATTRIBUTE4
,PoDistributionsE0.ATTRIBUTE5 RES_ATTRIBUTE5
,PoDistributionsE0.ATTRIBUTE6 RES_ATTRIBUTE6
,PoDistributionsE0.ATTRIBUTE7 RES_ATTRIBUTE7
,PoDistributionsE0.ATTRIBUTE8 RES_ATTRIBUTE8
,PoDistributionsE0.ATTRIBUTE9 RES_ATTRIBUTE9
,PoDistributionsE0.ATTRIBUTE10 RES_ATTRIBUTE10
,PoDistributionsE0.ATTRIBUTE11 RES_ATTRIBUTE11
,PoDistributionsE0.ATTRIBUTE12 RES_ATTRIBUTE12
,PoDistributionsE0.ATTRIBUTE13 RES_ATTRIBUTE13
,PoDistributionsE0.ATTRIBUTE14 RES_ATTRIBUTE14
,PoDistributionsE0.ATTRIBUTE15 RES_ATTRIBUTE15
,PoDistributionsE0.ATTRIBUTE16 RES_ATTRIBUTE16
,PoDistributionsE0.ATTRIBUTE17 RES_ATTRIBUTE17
,PoDistributionsE0.ATTRIBUTE18 RES_ATTRIBUTE18
,PoDistributionsE0.ATTRIBUTE19 RES_ATTRIBUTE19
,PoDistributionsE0.ATTRIBUTE20 RES_ATTRIBUTE20
,PoDistributionsE0.ATTRIBUTE_DATE1 RES_ATTRIBUTE_DATE1
,PoDistributionsE0.ATTRIBUTE_DATE2 RES_ATTRIBUTE_DATE2
,PoDistributionsE0.ATTRIBUTE_DATE3 RES_ATTRIBUTE_DATE3
,PoDistributionsE0.ATTRIBUTE_DATE4 RES_ATTRIBUTE_DATE4
,PoDistributionsE0.ATTRIBUTE_DATE5 RES_ATTRIBUTE_DATE5
,PoDistributionsE0.ATTRIBUTE_DATE6 RES_ATTRIBUTE_DATE6
,PoDistributionsE0.ATTRIBUTE_DATE7 RES_ATTRIBUTE_DATE7
,PoDistributionsE0.ATTRIBUTE_DATE8 RES_ATTRIBUTE_DATE8
,PoDistributionsE0.ATTRIBUTE_DATE9 RES_ATTRIBUTE_DATE9
,PoDistributionsE0.ATTRIBUTE_DATE10 RES_ATTRIBUTE_DATE10
,PoDistributionsE0.ATTRIBUTE_NUMBER1 RES_ATTRIBUTE_NUMBER1
,PoDistributionsE0.ATTRIBUTE_NUMBER2 RES_ATTRIBUTE_NUMBER2
,PoDistributionsE0.ATTRIBUTE_NUMBER3 RES_ATTRIBUTE_NUMBER3
,PoDistributionsE0.ATTRIBUTE_NUMBER4 RES_ATTRIBUTE_NUMBER4
,PoDistributionsE0.ATTRIBUTE_NUMBER5 RES_ATTRIBUTE_NUMBER5
,PoDistributionsE0.ATTRIBUTE_NUMBER6 RES_ATTRIBUTE_NUMBER6
,PoDistributionsE0.ATTRIBUTE_NUMBER7 RES_ATTRIBUTE_NUMBER7
,PoDistributionsE0.ATTRIBUTE_NUMBER8 RES_ATTRIBUTE_NUMBER8
,PoDistributionsE0.ATTRIBUTE_NUMBER9 RES_ATTRIBUTE_NUMBER9
,PoDistributionsE0.ATTRIBUTE_NUMBER10 RES_ATTRIBUTE_NUMBER10
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP1 RES_ATTRIBUTE_TIMESTAMP1
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP2 RES_ATTRIBUTE_TIMESTAMP2
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP3 RES_ATTRIBUTE_TIMESTAMP3
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP4 RES_ATTRIBUTE_TIMESTAMP4
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP5 RES_ATTRIBUTE_TIMESTAMP5
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP6 RES_ATTRIBUTE_TIMESTAMP6
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP7 RES_ATTRIBUTE_TIMESTAMP7
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP8 RES_ATTRIBUTE_TIMESTAMP8
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP9 RES_ATTRIBUTE_TIMESTAMP9
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP10 RES_ATTRIBUTE_TIMESTAMP10
,(SELECT EMAIL_ADDRESS 
	FROM PER_EMAIL_ADDRESSES
	WHERE PERSON_ID = PoDistributionsE0.DELIVER_TO_PERSON_ID
	AND SYSDATE BETWEEN DATE_FROM AND DATE_TO
	) RES_REQUESTER_E_MAIL
,TO_CHAR(PoDistributionsE0.BUDGET_DATE,'YYYY/MM/DD') RES_BUDGET_DATE
,PoDistributionsE0.PJC_CONTRACT_ID RES_CONTRACT_NUMBER
,'' RES_FUNDING_SOURCE
,PoDistributionsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,PoDistributionsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,PoDistributionsE0.CREATED_BY RSC_CREATED_BY
,PoDistributionsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,PoHeadersE0.PRC_BU_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PO_HEADERS_ALL PoHeadersE0
,PO_LINES_ALL PoLinesE0
,PO_LINE_LOCATIONS_ALL PoLocationsE0
,PO_DISTRIBUTIONS_ALL PoDistributionsE0
,GL_CODE_COMBINATIONS AccountsE0
WHERE PoHeadersE0.PO_HEADER_ID = PoLinesE0.PO_HEADER_ID
AND PoLinesE0.PO_HEADER_ID = PoLocationsE0.PO_HEADER_ID
AND PoLinesE0.PO_LINE_ID = PoLocationsE0.PO_LINE_ID
AND PoLocationsE0.LINE_LOCATION_ID = PoDistributionsE0.LINE_LOCATION_ID
AND PoDistributionsE0.CODE_COMBINATION_ID = AccountsE0.CODE_COMBINATION_ID(+)
--AND PoLinesE0.LINE_STATUS = 'OPEN'
AND NVL(PoHeadersE0.APPROVED_FLAG,'N') != 'Y'
AND PoHeadersE0.TYPE_LOOKUP_CODE = 'STANDARD' --Only PO
AND PoHeadersE0.DOCUMENT_STATUS = 'INCOMPLETE' --PO Header status
AND PoLocationsE0.DESTINATION_TYPE_CODE = 'EXPENSE'

AND (SELECT PoLinesE0.AMOUNT - NVL(SUM(invLines.AMOUNT),0) 
	FROM AP_INVOICES_ALL inv
	,AP_INVOICE_LINES_ALL invLines
	WHERE inv.INVOICE_ID = invLines.INVOICE_ID
	AND invLines.LINE_TYPE_LOOKUP_CODE != 'TAX'
	AND invLines.PO_HEADER_ID = PoHeadersE0.PO_HEADER_ID
	AND invLines.PO_LINE_ID = PoLinesE0.PO_LINE_ID
	AND invLines.PO_LINE_LOCATION_ID = PoLocationsE0.LINE_LOCATION_ID
	) > 0

UNION

SELECT PoDistributionsE0.PO_DISTRIBUTION_ID RES_INTERFACE_DISTRIBUTION_KEY
,PoDistributionsE0.LINE_LOCATION_ID RES_INTERFACE_LINE_LOCATION_KE
,PoDistributionsE0.DISTRIBUTION_NUM RES_DISTRIBUTION
,(SELECT LOCATION_NAME
	FROM PER_LOCATION_DETAILS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LOCATION_DETAILS_ID = PoDistributionsE0.DELIVER_TO_LOCATION_ID
	) RES_DELIVER_TO_LOCATION
,(SELECT DISPLAY_NAME
	FROM PER_PERSON_NAMES_F
	WHERE PERSON_ID = PoDistributionsE0.DELIVER_TO_PERSON_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND NAME_TYPE = 'GLOBAL'
	) RES_REQUESTER
,PoDistributionsE0.DESTINATION_SUBINVENTORY RES_SUBINVENTORY
,(SELECT PoLocationsE0.AMOUNT - NVL(SUM(invLines.AMOUNT),0) 
	FROM AP_INVOICES_ALL inv
	,AP_INVOICE_LINES_ALL invLines
	WHERE inv.INVOICE_ID = invLines.INVOICE_ID
	AND invLines.LINE_TYPE_LOOKUP_CODE != 'TAX'
	AND invLines.PO_HEADER_ID = PoHeadersE0.PO_HEADER_ID
	AND invLines.PO_LINE_ID = PoLinesE0.PO_LINE_ID
	AND invLines.PO_LINE_LOCATION_ID = PoLocationsE0.LINE_LOCATION_ID
	) RES_AMOUNT
,PoDistributionsE0.QUANTITY_BILLED RES_QUANTITY
,AccountsE0.SEGMENT1 RES_CHARGE_ACCOUNT_SEGMENT1
,AccountsE0.SEGMENT2 RES_CHARGE_ACCOUNT_SEGMENT2
,AccountsE0.SEGMENT3 RES_CHARGE_ACCOUNT_SEGMENT3
,AccountsE0.SEGMENT4 RES_CHARGE_ACCOUNT_SEGMENT4
,AccountsE0.SEGMENT5 RES_CHARGE_ACCOUNT_SEGMENT5
,AccountsE0.SEGMENT6 RES_CHARGE_ACCOUNT_SEGMENT6
,AccountsE0.SEGMENT7 RES_CHARGE_ACCOUNT_SEGMENT7
,AccountsE0.SEGMENT8 RES_CHARGE_ACCOUNT_SEGMENT8
,AccountsE0.SEGMENT9 RES_CHARGE_ACCOUNT_SEGMENT9
,AccountsE0.SEGMENT10 RES_CHARGE_ACCOUNT_SEGMENT10
,AccountsE0.SEGMENT11 RES_CHARGE_ACCOUNT_SEGMENT11
,AccountsE0.SEGMENT12 RES_CHARGE_ACCOUNT_SEGMENT12
,AccountsE0.SEGMENT13 RES_CHARGE_ACCOUNT_SEGMENT13
,AccountsE0.SEGMENT14 RES_CHARGE_ACCOUNT_SEGMENT14
,AccountsE0.SEGMENT15 RES_CHARGE_ACCOUNT_SEGMENT15
,AccountsE0.SEGMENT16 RES_CHARGE_ACCOUNT_SEGMENT16
,AccountsE0.SEGMENT17 RES_CHARGE_ACCOUNT_SEGMENT17
,AccountsE0.SEGMENT18 RES_CHARGE_ACCOUNT_SEGMENT18
,AccountsE0.SEGMENT19 RES_CHARGE_ACCOUNT_SEGMENT19
,AccountsE0.SEGMENT20 RES_CHARGE_ACCOUNT_SEGMENT20
,AccountsE0.SEGMENT21 RES_CHARGE_ACCOUNT_SEGMENT21
,AccountsE0.SEGMENT22 RES_CHARGE_ACCOUNT_SEGMENT22
,AccountsE0.SEGMENT23 RES_CHARGE_ACCOUNT_SEGMENT23
,AccountsE0.SEGMENT24 RES_CHARGE_ACCOUNT_SEGMENT24
,AccountsE0.SEGMENT25 RES_CHARGE_ACCOUNT_SEGMENT25
,AccountsE0.SEGMENT26 RES_CHARGE_ACCOUNT_SEGMENT26
,AccountsE0.SEGMENT27 RES_CHARGE_ACCOUNT_SEGMENT27
,AccountsE0.SEGMENT28 RES_CHARGE_ACCOUNT_SEGMENT28
,AccountsE0.SEGMENT29 RES_CHARGE_ACCOUNT_SEGMENT29
,AccountsE0.SEGMENT30 RES_CHARGE_ACCOUNT_SEGMENT30
,PoDistributionsE0.DESTINATION_CONTEXT RES_DESTINATION_CONTEXT
,(SELECT SEGMENT1
	FROM PJF_PROJECTS_ALL_B
	WHERE PROJECT_ID = PoDistributionsE0.PJC_PROJECT_ID
	) RES_PROJECT_NUMBER
,(SELECT ELEMENT_NUMBER
	FROM PJF_PROJ_ELEMENTS_B
	WHERE PROJECT_ID = PoDistributionsE0.PJC_PROJECT_ID
	AND PROJ_ELEMENT_ID = PoDistributionsE0.PJC_TASK_ID 
	) RES_TASK_NUMBER
,TO_CHAR(PoDistributionsE0.PJC_EXPENDITURE_ITEM_DATE,'YYYY/MM/DD') RES_EXPENDITURE_ITEM_DATE
,(SELECT EXPENDITURE_TYPE_NAME
	FROM PJF_EXP_TYPES_TL
	WHERE EXPENDITURE_TYPE_ID = PoDistributionsE0.PJC_EXPENDITURE_TYPE_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_EXPENDITURE
,(SELECT NAME
    FROM HR_ORGANIZATION_UNITS_F_TL
    WHERE LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
    AND ORGANIZATION_ID = PoDistributionsE0.PJC_ORGANIZATION_ID
	) RES_EXPENDITURE_ORGANIZATION 
,PoDistributionsE0.PJC_BILLABLE_FLAG RES_BILLABLE
,PoDistributionsE0.PJC_CAPITALIZABLE_FLAG RES_CAPITALIZABLE
,(SELECT NAME
	FROM PJF_WORK_TYPES_TL
	WHERE WORK_TYPE_ID = PoDistributionsE0.PJC_WORK_TYPE_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_WORK_TYPE
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE1 RES_PJC_RESERVED_ATTRIBUTE1
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE2 RES_PJC_RESERVED_ATTRIBUTE2
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE3 RES_PJC_RESERVED_ATTRIBUTE3
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE4 RES_PJC_RESERVED_ATTRIBUTE4
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE5 RES_PJC_RESERVED_ATTRIBUTE5
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE6 RES_PJC_RESERVED_ATTRIBUTE6
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE7 RES_PJC_RESERVED_ATTRIBUTE7
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE8 RES_PJC_RESERVED_ATTRIBUTE8
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE9 RES_PJC_RESERVED_ATTRIBUTE9
,PoDistributionsE0.PJC_RESERVED_ATTRIBUTE10 RES_PJC_RESERVED_ATTRIBUTE10
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE1 RES_PJC_USER_DEF_ATTRIBUTE1
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE2 RES_PJC_USER_DEF_ATTRIBUTE2
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE3 RES_PJC_USER_DEF_ATTRIBUTE3
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE4 RES_PJC_USER_DEF_ATTRIBUTE4
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE5 RES_PJC_USER_DEF_ATTRIBUTE5
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE6 RES_PJC_USER_DEF_ATTRIBUTE6
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE7 RES_PJC_USER_DEF_ATTRIBUTE7
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE8 RES_PJC_USER_DEF_ATTRIBUTE8
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE9 RES_PJC_USER_DEF_ATTRIBUTE9
,PoDistributionsE0.PJC_USER_DEF_ATTRIBUTE10 RES_PJC_USER_DEF_ATTRIBUTE10
,PoDistributionsE0.RATE RES_RATE
,TO_CHAR(PoDistributionsE0.RATE_DATE,'YYYY/MM/DD') RES_RATE_DATE
,PoDistributionsE0.ATTRIBUTE_CATEGORY RES_ATTRIBUTE_CATEGORY
,PoDistributionsE0.ATTRIBUTE1 RES_ATTRIBUTE1
,PoDistributionsE0.ATTRIBUTE2 RES_ATTRIBUTE2
,PoDistributionsE0.ATTRIBUTE3 RES_ATTRIBUTE3
,PoDistributionsE0.ATTRIBUTE4 RES_ATTRIBUTE4
,PoDistributionsE0.ATTRIBUTE5 RES_ATTRIBUTE5
,PoDistributionsE0.ATTRIBUTE6 RES_ATTRIBUTE6
,PoDistributionsE0.ATTRIBUTE7 RES_ATTRIBUTE7
,PoDistributionsE0.ATTRIBUTE8 RES_ATTRIBUTE8
,PoDistributionsE0.ATTRIBUTE9 RES_ATTRIBUTE9
,PoDistributionsE0.ATTRIBUTE10 RES_ATTRIBUTE10
,PoDistributionsE0.ATTRIBUTE11 RES_ATTRIBUTE11
,PoDistributionsE0.ATTRIBUTE12 RES_ATTRIBUTE12
,PoDistributionsE0.ATTRIBUTE13 RES_ATTRIBUTE13
,PoDistributionsE0.ATTRIBUTE14 RES_ATTRIBUTE14
,PoDistributionsE0.ATTRIBUTE15 RES_ATTRIBUTE15
,PoDistributionsE0.ATTRIBUTE16 RES_ATTRIBUTE16
,PoDistributionsE0.ATTRIBUTE17 RES_ATTRIBUTE17
,PoDistributionsE0.ATTRIBUTE18 RES_ATTRIBUTE18
,PoDistributionsE0.ATTRIBUTE19 RES_ATTRIBUTE19
,PoDistributionsE0.ATTRIBUTE20 RES_ATTRIBUTE20
,PoDistributionsE0.ATTRIBUTE_DATE1 RES_ATTRIBUTE_DATE1
,PoDistributionsE0.ATTRIBUTE_DATE2 RES_ATTRIBUTE_DATE2
,PoDistributionsE0.ATTRIBUTE_DATE3 RES_ATTRIBUTE_DATE3
,PoDistributionsE0.ATTRIBUTE_DATE4 RES_ATTRIBUTE_DATE4
,PoDistributionsE0.ATTRIBUTE_DATE5 RES_ATTRIBUTE_DATE5
,PoDistributionsE0.ATTRIBUTE_DATE6 RES_ATTRIBUTE_DATE6
,PoDistributionsE0.ATTRIBUTE_DATE7 RES_ATTRIBUTE_DATE7
,PoDistributionsE0.ATTRIBUTE_DATE8 RES_ATTRIBUTE_DATE8
,PoDistributionsE0.ATTRIBUTE_DATE9 RES_ATTRIBUTE_DATE9
,PoDistributionsE0.ATTRIBUTE_DATE10 RES_ATTRIBUTE_DATE10
,PoDistributionsE0.ATTRIBUTE_NUMBER1 RES_ATTRIBUTE_NUMBER1
,PoDistributionsE0.ATTRIBUTE_NUMBER2 RES_ATTRIBUTE_NUMBER2
,PoDistributionsE0.ATTRIBUTE_NUMBER3 RES_ATTRIBUTE_NUMBER3
,PoDistributionsE0.ATTRIBUTE_NUMBER4 RES_ATTRIBUTE_NUMBER4
,PoDistributionsE0.ATTRIBUTE_NUMBER5 RES_ATTRIBUTE_NUMBER5
,PoDistributionsE0.ATTRIBUTE_NUMBER6 RES_ATTRIBUTE_NUMBER6
,PoDistributionsE0.ATTRIBUTE_NUMBER7 RES_ATTRIBUTE_NUMBER7
,PoDistributionsE0.ATTRIBUTE_NUMBER8 RES_ATTRIBUTE_NUMBER8
,PoDistributionsE0.ATTRIBUTE_NUMBER9 RES_ATTRIBUTE_NUMBER9
,PoDistributionsE0.ATTRIBUTE_NUMBER10 RES_ATTRIBUTE_NUMBER10
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP1 RES_ATTRIBUTE_TIMESTAMP1
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP2 RES_ATTRIBUTE_TIMESTAMP2
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP3 RES_ATTRIBUTE_TIMESTAMP3
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP4 RES_ATTRIBUTE_TIMESTAMP4
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP5 RES_ATTRIBUTE_TIMESTAMP5
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP6 RES_ATTRIBUTE_TIMESTAMP6
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP7 RES_ATTRIBUTE_TIMESTAMP7
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP8 RES_ATTRIBUTE_TIMESTAMP8
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP9 RES_ATTRIBUTE_TIMESTAMP9
,PoDistributionsE0.ATTRIBUTE_TIMESTAMP10 RES_ATTRIBUTE_TIMESTAMP10
,(SELECT EMAIL_ADDRESS 
	FROM PER_EMAIL_ADDRESSES
	WHERE PERSON_ID = PoDistributionsE0.DELIVER_TO_PERSON_ID
	AND SYSDATE BETWEEN DATE_FROM AND DATE_TO
	) RES_REQUESTER_E_MAIL
,TO_CHAR(PoDistributionsE0.BUDGET_DATE,'YYYY/MM/DD') RES_BUDGET_DATE
,PoDistributionsE0.PJC_CONTRACT_ID RES_CONTRACT_NUMBER
,'' RES_FUNDING_SOURCE
,PoDistributionsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,PoDistributionsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,PoDistributionsE0.CREATED_BY RSC_CREATED_BY
,PoDistributionsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,PoHeadersE0.PRC_BU_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PO_HEADERS_ALL PoHeadersE0
,PO_LINES_ALL PoLinesE0
,PO_LINE_LOCATIONS_ALL PoLocationsE0
,PO_DISTRIBUTIONS_ALL PoDistributionsE0
,GL_CODE_COMBINATIONS AccountsE0
WHERE PoHeadersE0.PO_HEADER_ID = PoLinesE0.PO_HEADER_ID
AND PoLinesE0.PO_HEADER_ID = PoLocationsE0.PO_HEADER_ID
AND PoLinesE0.PO_LINE_ID = PoLocationsE0.PO_LINE_ID
AND PoLocationsE0.LINE_LOCATION_ID = PoDistributionsE0.LINE_LOCATION_ID
AND PoDistributionsE0.CODE_COMBINATION_ID = AccountsE0.CODE_COMBINATION_ID(+)
--AND PoLinesE0.LINE_STATUS = 'OPEN'
AND NVL(PoHeadersE0.APPROVED_FLAG,'N') != 'Y'
AND PoHeadersE0.TYPE_LOOKUP_CODE = 'STANDARD' --Only PO
AND PoHeadersE0.DOCUMENT_STATUS = 'INCOMPLETE' --PO Header status
AND PoLocationsE0.DESTINATION_TYPE_CODE = 'EXPENSE'

AND NOT EXISTS (SELECT 1
	FROM AP_INVOICES_ALL inv
	,AP_INVOICE_LINES_ALL invLines
	WHERE inv.INVOICE_ID = invLines.INVOICE_ID
	AND invLines.LINE_TYPE_LOOKUP_CODE != 'TAX'
	AND invLines.PO_HEADER_ID = PoHeadersE0.PO_HEADER_ID
	AND invLines.PO_LINE_ID = PoLinesE0.PO_LINE_ID
	AND invLines.PO_LINE_LOCATION_ID = PoLocationsE0.LINE_LOCATION_ID
	)
AND (PoLocationsE0.QUANTITY - PoLocationsE0.QUANTITY_BILLED) IS NULL

	
ORDER BY 2