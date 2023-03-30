/* ****************************************************************************
 * $Revision: 56510 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-07-06 09:21:36 +0700 (Wed, 06 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Locations%20(United%20States)%20-%20Manage%20Locations.sql $:
 * $Id: Manage Locations (United States) - Manage Locations.sql 56510 2016-07-06 02:21:36Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
/* ****************************************************************************
 * $Revision:  $:
 * $Author: nasrullah.dusenmahamad $:
 * $Date: 2017-04-26 $:
 * $HeadURL:  $:
 * $Id: Manage Account Aliases - Account Aliases - DFF.sql $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
WITH COST_ALLO_ACC AS (
	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT1 SEG_VALUES
	,'SEGMENT1' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION
 
	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT2 SEG_VALUES
	,'SEGMENT2' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT3 SEG_VALUES
	,'SEGMENT3' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT4 SEG_VALUES
	,'SEGMENT4' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT5 SEG_VALUES
	,'SEGMENT5' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT6 SEG_VALUES
	,'SEGMENT6' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT7 SEG_VALUES
	,'SEGMENT7' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT8 SEG_VALUES
	,'SEGMENT8' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT9 SEG_VALUES
	,'SEGMENT9' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT10 SEG_VALUES
	,'SEGMENT10' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION
	
	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT11 SEG_VALUES
	,'SEGMENT11' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION
 
	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT12 SEG_VALUES
	,'SEGMENT12' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT13 SEG_VALUES
	,'SEGMENT13' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT14 SEG_VALUES
	,'SEGMENT14' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT15 SEG_VALUES
	,'SEGMENT15' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT16 SEG_VALUES
	,'SEGMENT16' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT17 SEG_VALUES
	,'SEGMENT17' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT18 SEG_VALUES
	,'SEGMENT18' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT19 SEG_VALUES
	,'SEGMENT19' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT20 SEG_VALUES
	,'SEGMENT20' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION
	
	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT21 SEG_VALUES
	,'SEGMENT21' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION
 
	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT22 SEG_VALUES
	,'SEGMENT22' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT23 SEG_VALUES
	,'SEGMENT23' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT24 SEG_VALUES
	,'SEGMENT24' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT25 SEG_VALUES
	,'SEGMENT25' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT26 SEG_VALUES
	,'SEGMENT26' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT27 SEG_VALUES
	,'SEGMENT27' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT28 SEG_VALUES
	,'SEGMENT28' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT29 SEG_VALUES
	,'SEGMENT29' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	
	UNION

	SELECT COST_ALLOCATION_RECORD_ID
	,ID_FLEX_NUM
	,SEGMENT30 SEG_VALUES
	,'SEGMENT30' SEG_ID
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM PAY_COST_ALLOC_ACCOUNTS
	WHERE SOURCE_SUB_TYPE = 'BAL'
	)


SELECT RES_PRIMARY_CLASSIFICATION
,RES_ELEMENT_NAME
,RES_PROMPT_ACCOUNT RES_FIELD_NAME
,RES_ACCOUNT RES_FIELD_VALUE
,RSC_LAST_UPDATED_BY
,RSC_LAST_UPDATE_DATE
,RSC_CREATED_BY
,RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM 
(SELECT DISTINCT 
(SELECT CLASSIFICATION_NAME FROM PAY_ELE_CLASSIFICATIONS_VL 
			WHERE CLASSIFICATION_ID = elementsTYPE0.CLASSIFICATION_ID) RES_PRIMARY_CLASSIFICATION
,(SELECT ELEMENT_NAME
    FROM PAY_ELEMENT_TYPES_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND ELEMENT_TYPE_ID = elementsE0.ELEMENT_TYPE_ID
    ) RES_ELEMENT_NAME
,fndIDFLEXE0.FORM_LEFT_PROMPT RES_PROMPT_ACCOUNT
,payCostalloaccE0.SEG_VALUES RES_ACCOUNT
,fndIDFLEXE0.SEGMENT_NUM
,costElesE0.EFFECTIVE_START_DATE

,payCostalloaccE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,payCostalloaccE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,payCostalloaccE0.CREATED_BY RSC_CREATED_BY
,payCostalloaccE0.CREATION_DATE RSC_CREATION_DATE

FROM PAY_COST_INFO_F costElesE0
,PAY_ELEMENT_LINKS_F elementsE0
,COST_ALLO_ACC payCostalloaccE0
,FND_ID_FLEX_SEGMENTS_VL fndIDFLEXE0
,(SELECT *
    FROM PAY_COST_ALLOCATIONS_F
    WHERE SOURCE_TYPE = 'EL'
    ) costLinksE0
,PAY_ELEMENT_TYPES_VL elementsTYPE0

WHERE costElesE0.SOURCE_TYPE = 'EL'
AND costElesE0.SOURCE_ID = elementsE0.ELEMENT_LINK_ID
AND costElesE0.SOURCE_ID = costLinksE0.SOURCE_ID
AND costElesE0.EFFECTIVE_START_DATE = costLinksE0.EFFECTIVE_START_DATE
AND costElesE0.EFFECTIVE_END_DATE = costLinksE0.EFFECTIVE_END_DATE
AND elementsE0.ELEMENT_TYPE_ID = elementsTYPE0.ELEMENT_TYPE_ID(+)
AND costLinksE0.COST_ALLOCATION_RECORD_ID = payCostalloaccE0.COST_ALLOCATION_RECORD_ID
AND payCostalloaccE0.ID_FLEX_NUM = fndIDFLEXE0.ID_FLEX_NUM
AND fndIDFLEXE0.APPLICATION_COLUMN_NAME = payCostalloaccE0.SEG_ID
ORDER BY RES_PRIMARY_CLASSIFICATION,RES_ELEMENT_NAME,costElesE0.EFFECTIVE_START_DATE,fndIDFLEXE0.SEGMENT_NUM)

 


