/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=HWM_TM_ATRB_FLDS_VL

SELECT customTimesE0.DISPLAY_NAME RES_DISPLAY_NAME
,customTimesE0.NAME RES_NAME
,customTimesE0.DESCRIPTION RES_DESCRIPTION
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'ORA_HWM_ATTR_CLASS'
    AND LOOKUP_CODE = customTimesE0.CLASS
    ) RES_CLASSIFICATION
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'ORA_HWM_ATTR_TYPE'
    AND LOOKUP_CODE = customTimesE0.ATTRIBUTE_TYPE
    ) RES_DATA_TYPE
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'ORA_HWM_UOM'
    AND LOOKUP_CODE = customTimesE0.BASE_UNIT
    ) RES_UNIT_OF_MEASURE
,(SELECT DISPLAY_NAME
    FROM HWM_DATA_SOURCE_USAGES dsUsage
    ,HWM_DATA_SOURCES_VL dsE0
    WHERE dsE0.DATA_SOURCE_ID = dsUsage.DATA_SOURCE_ID
    AND dsUsage.USAGE_TYPE = 'USER'
    AND dsUsage.TM_ATRB_FLD_ID = customTimesE0.TM_ATRB_FLD_ID
	AND dsUsage.DEFAULT_FLAG = 'Y'
    ) RES_DEFAULT_FILTERED_DATA_SOUR
,(SELECT DISPLAY_NAME
    FROM HWM_DATA_SOURCE_USAGES dsUsage
    ,HWM_DATA_SOURCES_VL dsE0
    WHERE dsE0.DATA_SOURCE_ID = dsUsage.DATA_SOURCE_ID
	AND dsUsage.USAGE_TYPE = 'ADMIN'
    AND dsUsage.TM_ATRB_FLD_ID = customTimesE0.TM_ATRB_FLD_ID
	AND dsUsage.DEFAULT_FLAG = 'Y'
    ) RES_DEFAULT_UNFILTERED_DATA_SO
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'ORA_HWM_ATTR_CATEGORY'
    AND LOOKUP_CODE = customTimesE0.ATTRIBUTE_CATEGORY
	) RES_ATTRIBUTE_CATEGORY
,customTimesE0.VALUE_LOCATION RES_VALUE_LOCATION
,customTimesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,customTimesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,customTimesE0.CREATED_BY RSC_CREATED_BY
,customTimesE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,customTimesE0.ENTERPRISE_ID RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HWM_TM_ATRB_FLDS_VL customTimesE0
WHERE customTimesE0.ATTRIBUTE_GROUP = 'CUSTOM'
AND customTimesE0.PARENT_TM_ATRB_FLD_ID IS NULL
ORDER BY customTimesE0.DISPLAY_NAME