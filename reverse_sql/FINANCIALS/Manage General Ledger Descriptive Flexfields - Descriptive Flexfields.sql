/* ****************************************************************************
* $Revision: 78284 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-13 13:03:20 +0700 (Wed, 13 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20General%20Ledger%20Descriptive%20Flexfields%20-%20Descriptive%20Flexfields.sql $:
* $Id: Manage General Ledger Descriptive Flexfields - Descriptive Flexfields.sql 78284 2022-04-13 06:03:20Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

SELECT DescriptiveFlexfieldEO.NAME                 AS RES_FLEXFIELD_NAME
,DescriptiveFlexfieldEO.DESCRIPTIVE_FLEXFIELD_CODE AS RES_FLEXFIELD_CODE
,DescriptiveFlexfieldEO.DESCRIPTION                AS RES_DESCRIPTION
,DescriptiveFlexfieldEO.DELIMITER                  AS RES_SEGMENT_SEPARATOR
,(SELECT APPLICATION_NAME
	FROM FND_APPLICATION_VL
	WHERE APPLICATION_ID = DescriptiveFlexfieldEO.APPLICATION_ID
	) AS RES_APPLICATION
,(SELECT USER_MODULE_NAME
	FROM FND_APPL_TAXONOMY_VL
	WHERE MODULE_ID = DescriptiveFlexfieldEO.MODULE_ID
	)                                 AS RES_MODULE
,ContextSegment.PROMPT             AS RES_PROMPT
,ContextSegment.SEGMENT_IDENTIFIER AS RES_API_NAME
,(SELECT VALUE_SET_CODE
	FROM FND_VS_VALUE_SETS
	WHERE VALUE_SET_ID = ContextSegment.VALUE_SET_ID
	) AS RES_VALUE_SET
,(SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'FND_DF_SEGMENT_DEFAULT_TYPES'
	AND LOOKUP_CODE   = ContextSegment.DEFAULT_TYPE
	)                               AS RES_DEFAULT_TYPE
,ContextSegment.DEFAULT_VALUE    AS RES_DEFAULT_VALUE
,ContextSegment.DERIVATION_VALUE AS RES_DERIVATION_VALUE
,NVL(
	(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'YES_NO'
	AND lookup_code   = ContextSegment.REQUIRED_FLAG
	),'No')                                                 AS RES_REQUIRED
,DECODE(ContextSegment.DISPLAY_TYPE,'HIDDEN','','Yes') AS RES_DISPLAYED
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES_VL
	WHERE LOOKUP_TYPE = 'FND_DF_SEGMENT_DISPLAY_TYPES'
	AND LOOKUP_CODE = ContextSegment.DISPLAY_TYPE) AS RES_DISPLAY_TYPE
,DECODE(DescriptiveFlexfieldEO.BI_ENABLED_FLAG,'Y',
	(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'YES_NO'
	AND lookup_code   = NVL(ContextSegment.BI_ENABLED_FLAG,'N')
	),NULL) AS RES_BI_ENABLED
,DECODE(DescriptiveFlexfieldEO.BI_ENABLED_FLAG,'Y',(SELECT NAME
	FROM FND_DF_SEGMENT_LABELS_VL
	WHERE DESCRIPTIVE_FLEXFIELD_CODE = ContextSegment.DESCRIPTIVE_FLEXFIELD_CODE
	AND SEGMENT_LABEL_CODE = ContextSegment.BI_EQUALIZATION_TAG
	),NULL) AS RES_BI_LABEL
,ContextSegment.TERMINOLOGY_HELP_TEXT AS RES_DEFINITION_HELP_TEXT
,ContextSegment.IN_FIELD_HELP_TEXT    AS RES_INSTRUCTION_HELP_TEXT
,ContextSegment.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,ContextSegment.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,ContextSegment.CREATED_BY  RSC_CREATED_BY
,ContextSegment.CREATION_DATE  RSC_CREATION_DATE
, null RSC_LEDGER_ID
, null RSC_CHART_OF_ACCOUNTS_ID
, null RSC_BUSINESS_UNIT_ID
, null RSC_LEGAL_ENTITY_ID
, null RSC_ORGANIZATION_ID
, null RSC_BUSINESS_GROUP_ID
, NULL RSC_ENTERPRISE_ID
, NULL RSC_COUNTRY_ID

FROM FND_DF_FLEXFIELDS_VL DescriptiveFlexfieldEO
,FND_DF_SEGMENTS_VL ContextSegment
WHERE DescriptiveFlexfieldEO.FLEXFIELD_TYPE           = 'DFF'
AND DescriptiveFlexfieldEO.APPLICATION_ID             = ContextSegment.APPLICATION_ID
AND DescriptiveFlexfieldEO.DESCRIPTIVE_FLEXFIELD_CODE = ContextSegment.DESCRIPTIVE_FLEXFIELD_CODE
AND DescriptiveFlexfieldEO.APPLICATION_ID             = 101
AND ContextSegment.CONTEXT_CODE = 'Context Data Element'
AND ContextSegment.SEGMENT_CODE = 'Context Segment'
ORDER BY RES_FLEXFIELD_NAME
