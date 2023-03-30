/* ****************************************************************************
 * $Revision: 80185 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2023-02-16 16:49:42 +0700 (Thu, 16 Feb 2023) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Mapping%20Sets%20-%20Input%20Sources.sql $:
 * $Id: Manage Mapping Sets - Input Sources.sql 80185 2023-02-16 09:49:42Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT ApplicationPE1.APPLICATION_NAME RES_SUBLEDGER_APPLICATION
,MAPPINGSETEO.name RES_NAME
,MAPPINGSETEO.MAPPING_SET_CODE RES_SHORT_NAME
,DECODE(MAPPINGSETEO.FLEXFIELD_ASSIGN_MODE_CODE,'A','Account combination','S','Segment','Value set') RES_OUTPUT_TYPE
,MAPPINGSETINPUTEO.INPUT_SEQ RES_NUMBER
,(SELECT APPLICATION_NAME
	FROM XLA_SUBLEDGERS_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND APPLICATION_ID = MappingSetInputEO.SOURCE_APPLICATION_ID
	) RES_INPUT_SOURCE_APPLICATION
,'' RES_INPUT_SOURCE_EVENT_CLASS
,SourceEO.NAME RES_INPUT_SOURCE
,VALUESETPEO.VALUE_SET_CODE RES_VALUE_SET
,LOOKUPTYPEEO.MEANING RES_LOOKUP_TYPE
,KeyFlexfieldSegmentLabelPEO.NAME RES_SEGMENT
,(CASE
	WHEN MappingSetInputEO.LAST_UPDATED_BY = 'SEED_DATA_FROM_APPLICATION' THEN
		NVL((SELECT LAST_UPDATED_BY
			FROM XLA_MAPPING_SET_VALUES
			WHERE MAPPING_SET_CODE = MAPPINGSETEO.MAPPING_SET_CODE
			AND APPLICATION_ID = MAPPINGSETEO.APPLICATION_ID
			AND AMB_CONTEXT_CODE = MAPPINGSETEO.AMB_CONTEXT_CODE
			AND LAST_UPDATED_BY != 'SEED_DATA_FROM_APPLICATION'
			AND ROWNUM = 1)
			,NVL((SELECT LAST_UPDATED_BY
				FROM XLA_MAPPING_SET_FLAVORS
				WHERE MAPPING_SET_CODE = MAPPINGSETEO.MAPPING_SET_CODE
				AND APPLICATION_ID = MAPPINGSETEO.APPLICATION_ID
				AND AMB_CONTEXT_CODE = MAPPINGSETEO.AMB_CONTEXT_CODE
				AND LAST_UPDATED_BY != 'SEED_DATA_FROM_APPLICATION'
				AND (DEFAULT_CONSTANT IS NOT NULL OR DEFAULT_CCID IS NOT NULL)
				AND ROWNUM = 1)
				,'SEED_DATA_FROM_APPLICATION'))
	ELSE	
		MappingSetInputEO.LAST_UPDATED_BY
	END) RSC_LAST_UPDATED_BY
,MappingSetInputEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,MappingSetInputEO.CREATED_BY RSC_CREATED_BY
,MappingSetInputEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM XLA_MAPPING_SETS_VL MAPPINGSETEO
,XLA_MAPPING_SET_INPUTS MappingSetInputEO
,XLA_SOURCES_VL SourceEO
,FND_VS_VALUE_SETS ValueSetPEO
,XLA_SUBLEDGERS_VL ApplicationPEO
,XLA_SUBLEDGERS_TL ApplicationPE1
,FND_KF_SEGMENT_LABELS_VL KeyFlexfieldSegmentLabelPEO
,FND_LOOKUP_TYPES_VL LookupTypeEO
WHERE((((((MappingSetInputEO.SOURCE_APPLICATION_ID  = SourceEO.APPLICATION_ID(+))
AND(MappingSetInputEO.SOURCE_CODE                   = SourceEO.SOURCE_CODE(+)))
AND(MappingSetInputEO.SOURCE_TYPE_CODE              = SourceEO.SOURCE_TYPE_CODE(+)))
AND((MappingSetInputEO.LOOKUP_TYPE                  = LookupTypeEO.LOOKUP_TYPE(+))
AND(MappingSetInputEO.VIEW_APPLICATION_ID           = LookupTypeEO.VIEW_APPLICATION_ID(+))))
AND(MappingSetInputEO.VALUE_SET_ID                  = ValueSetPEO.VALUE_SET_ID(+)))
AND(MappingSetInputEO.VIEW_APPLICATION_ID           = ApplicationPEO.APPLICATION_ID(+)))
AND(MappingSetInputEO.FLEX_SEGMENT                  = KeyFlexfieldSegmentLabelPEO.SEGMENT_LABEL_CODE(+)
AND((KeyFlexfieldSegmentLabelPEO.APPLICATION_ID    IS NULL
AND KeyFlexfieldSegmentLabelPEO.KEY_FLEXFIELD_CODE IS NULL)
OR(KeyFlexfieldSegmentLabelPEO.APPLICATION_ID       = 101
AND KEYFLEXFIELDSEGMENTLABELPEO.KEY_FLEXFIELD_CODE  = 'GL#')))
AND MappingSetInputEO.AMB_CONTEXT_CODE              = 'DEFAULT'
AND MAPPINGSETEO.APPLICATION_ID                     = MAPPINGSETINPUTEO.APPLICATION_ID
AND MAPPINGSETEO.MAPPING_SET_CODE                   = MappingSetInputEO.MAPPING_SET_CODE
AND MAPPINGSETEO.APPLICATION_ID = ApplicationPE1.APPLICATION_ID(+)
AND ApplicationPE1.LANGUAGE = USERENV('LANG')
ORDER BY MAPPINGSETEO.name
,MAPPINGSETINPUTEO.INPUT_SEQ