/* ****************************************************************************
 * $Revision: 54841 $:
 * $Author: dhara.pithadiya $:
 * $Date: 2016-04-29 15:18:22 +0700 (Fri, 29 Apr 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Asset%20Locations%20-%20Asset%20Locations.sql $:
 * $Id: Manage Asset Locations - Asset Locations.sql 54841 2016-04-29 08:18:22Z dhara.pithadiya $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT flexfieldsE0.NAME RES_FLEXFIELD_NAME
,flexfieldsE0.DESCRIPTIVE_FLEXFIELD_CODE RES_FLEXFIELD_CODE
,contextsE0.NAME RES_DISPLAY_NAME
,contextsE0.CONTEXT_CODE RES_CONTEXT_CODE
,segmentsE0.SEQUENCE_NUMBER RES_SEQUENCE
,segmentsE0.NAME RES_SEGMENT_NAME
,segmentsE0.SEGMENT_CODE RES_SEGMENT_CODE
,segmentsE0.SEGMENT_IDENTIFIER RES_API_NAME
,segmentsE0.DESCRIPTION RES_DESCRIPTION
,DECODE(segmentsE0.ENABLED_FLAG,'Y','Yes','No') RES_ENABLED
,(CASE
	WHEN contextsE0.MULTIROW_FLAG = 'Y' THEN
		DECODE(segmentsE0.MULTIROW_UNIQUE_KEY_FLAG,'Y','Yes','No')
	END) RES_UNIQUE_KEY
,DECODE(
	(SELECT DISTINCT ColumnE0.COLUMN_TYPE 
	FROM FND_DF_TABLE_USAGES TableUsage
	,FND_FF_COLUMN_USAGES ColumnUsageE0
	,FND_DF_FLEX_USAGES_VL DescriptiveFlexfieldUsageEO
	,FND_TABLES TableE0
	,FND_COLUMNS ColumnE0 
	WHERE TableUsage.TABLE_USAGE_CODE = ColumnUsageE0.TABLE_USAGE_CODE
	AND TableE0.TABLE_ID                                        = ColumnE0.TABLE_ID
	AND TableE0.TABLE_NAME                                      = ColumnUsageE0.TABLE_NAME
	AND ColumnE0.COLUMN_NAME                                    = ColumnUsageE0.COLUMN_NAME
	AND TableUsage.DESCRIPTIVE_FLEXFIELD_CODE                   = DescriptiveFlexfieldUsageEO.DESCRIPTIVE_FLEXFIELD_CODE
	AND TableUsage.FLEXFIELD_USAGE_CODE                         = DescriptiveFlexfieldUsageEO.FLEXFIELD_USAGE_CODE
	AND DescriptiveFlexfieldUsageEO.USAGE_TYPE                  = 'D'
	AND TableUsage.DESCRIPTIVE_FLEXFIELD_CODE                   = segmentsE0.DESCRIPTIVE_FLEXFIELD_CODE
	AND ColumnUsageE0.COLUMN_NAME                               = segmentsE0.COLUMN_NAME
	),'V','Character','D','Date','N','Number','TIMESTAMP','Date Time') RES_DATA_TYPE
,segmentsE0.COLUMN_NAME RES_TABLE_COLUMN
,DECODE(segmentsE0.INDEXED_FLAG,'Y','Yes','No') RES_INDEXED
,valueSetsE0.VALUE_SET_CODE RES_VALUE_SET
,valueSetsE0.DESCRIPTION RES_VALUE_SET_DESCRIPTION
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'FND_FF_SEGMENT_RANGE_TYPES'
	AND LOOKUP_CODE   = segmentsE0.RANGE_TYPE
	) RES_RANGE_TYPE
,DECODE(segmentsE0.REQUIRED_FLAG,'Y','Yes','No') RES_REQUIRED
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'FND_DF_SEGMENT_DEFAULT_TYPES'
	AND LOOKUP_CODE   = segmentsE0.DEFAULT_TYPE
	) RES_DEFAULT_TYPE
,segmentsE0.DEFAULT_VALUE RES_DEFAULT_VALUE
,segmentsE0.PROMPT RES_PROMPT
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'FND_DF_SEGMENT_DISPLAY_TYPES'
	AND LOOKUP_CODE   = segmentsE0.DISPLAY_TYPE
	) RES_DISPLAY_TYPE
,segmentsE0.DISPLAY_WIDTH RES_DISPLAY_SIZE
,segmentsE0.DISPLAY_HEIGHT RES_DISPLAY_HEIGHT
,DECODE(segmentsE0.READ_ONLY_FLAG,'Y','Yes','No') RES_READ_ONLY
,segmentsE0.CHECKBOX_CHECKED_VALUE RES_CHECKED_VALUE
,segmentsE0.CHECKBOX_UNCHECKED_VALUE RES_UNCHECKED_VALUE
,segmentsE0.TERMINOLOGY_HELP_TEXT RES_DEFINITION_HELP_TEXT
,segmentsE0.IN_FIELD_HELP_TEXT RES_INSTRUCTION_HELP_TEXT
,DECODE(segmentsE0.BI_ENABLED_FLAG,'Y','Yes','No') RES_BI_ENABLED
,segmentsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,segmentsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,segmentsE0.CREATED_BY RSC_CREATED_BY
,segmentsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_DF_FLEXFIELDS_VL flexfieldsE0
,FND_DF_CONTEXTS_VL contextsE0
,FND_DF_SEGMENTS_VL segmentsE0
,FND_VS_VALUE_SETS valueSetsE0
WHERE flexfieldsE0.FLEXFIELD_TYPE = 'EFF'
AND flexfieldsE0.APPLICATION_ID = 10008
AND flexfieldsE0.DESCRIPTIVE_FLEXFIELD_CODE = contextsE0.DESCRIPTIVE_FLEXFIELD_CODE
AND flexfieldsE0.APPLICATION_ID = contextsE0.APPLICATION_ID
AND contextsE0.DESCRIPTIVE_FLEXFIELD_CODE = segmentsE0.DESCRIPTIVE_FLEXFIELD_CODE
AND contextsE0.APPLICATION_ID = segmentsE0.APPLICATION_ID
AND contextsE0.CONTEXT_CODE = segmentsE0.CONTEXT_CODE
AND segmentsE0.VALUE_SET_ID = valueSetsE0.VALUE_SET_ID(+)
ORDER BY flexfieldsE0.NAME
,contextsE0.NAME
,segmentsE0.SEQUENCE_NUMBER