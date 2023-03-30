/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT elementsE0.ELEMENT_NAME RES_ELEMENT_NAME
,legislativeDataGrpsE0.NAME RES_LEGISLATIVE_DATA_GROUP
,(SELECT CLASSIFICATION_NAME
    FROM PAY_ELE_CLASSIFICATIONS_VL
	WHERE BASE_CLASSIFICATION_ID = elementsE0.CLASSIFICATION_ID
	AND LEGISLATION_CODE = legislativeDataGrpsE0.LEGISLATION_CODE
	AND SYSDATE BETWEEN DATE_FROM AND NVL(DATE_TO,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_PRIMARY_CLASSIFICATION
,(SELECT CLASSIFICATION_NAME
    FROM PAY_ELE_CLASSIFICATIONS_VL
    WHERE BASE_CLASSIFICATION_ID = elementsE0.SECONDARY_CLASSIFICATION_ID
	AND LEGISLATION_CODE = legislativeDataGrpsE0.LEGISLATION_CODE
	AND SYSDATE BETWEEN DATE_FROM AND NVL(DATE_TO,TO_DATE('4712-12-31','YYYY-MM-DD'))
    ) RES_SECONDARY_CLASSIFICATION
,TO_CHAR(elementsE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT DEFINITION_NAME
    FROM PAY_TIME_DEFINITIONS
    WHERE TIME_DEFINITION_ID = timespanE0.START_TIME_DEF_ID) RES_FROM_DATE
,(SELECT DEFINITION_NAME
    FROM PAY_TIME_DEFINITIONS
    WHERE TIME_DEFINITION_ID = timespanE0.END_TIME_DEF_ID)  RES_TO_DATE
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
    WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'PAY_RETRO_ADJUSTMENT_TYPE'
    AND LOOKUP_CODE = elespanuseE0.ADJUSTMENT_TYPE
    ) RES_ADJUSTMENT_TYPE
,(SELECT ELEMENT_NAME 
	FROM PAY_ELEMENT_TYPES_TL 
	WHERE LANGUAGE = USERENV('LANG')
	AND ELEMENT_TYPE_ID = elespanuseE0.RETRO_ELEMENT_TYPE_ID
	) RES_TARGET_ELEMENT
,elespanuseE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,elespanuseE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,elespanuseE0.CREATED_BY RSC_CREATED_BY
,elespanuseE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,legislativeDataGrpsE0.LEGISLATION_CODE RSC_COUNTRY_ID

FROM PAY_ELEMENT_TYPES_VL elementsE0
,PAY_RETRO_COMP_USAGES retrouseE0
,PAY_ELEMENT_SPAN_USAGES elespanuseE0
,PAY_TIME_SPANS timespanE0
,(SELECT NAME
    ,LEGISLATIVE_DATA_GROUP_ID
	,LEGISLATION_CODE
    FROM PER_LEGISLATIVE_DATA_GROUPS_VL
    )legislativeDataGrpsE0
WHERE elementsE0.LEGISLATIVE_DATA_GROUP_ID = legislativeDataGrpsE0.LEGISLATIVE_DATA_GROUP_ID
AND elementsE0.ELEMENT_TYPE_ID = retrouseE0.CREATOR_ID
AND retrouseE0.RETRO_COMPONENT_USAGE_ID = elespanuseE0.RETRO_COMPONENT_USAGE_ID
AND elespanuseE0.TIME_SPAN_ID  = timespanE0.TIME_SPAN_ID 
--AND autoE0.EFFECTIVE_START_DATE = elementsE0.EFFECTIVE_START_DATE
--AND SYSDATE BETWEEN autoE0.EFFECTIVE_START_DATE AND NVL(autoE0.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
--AND SYSDATE BETWEEN elementsE0.EFFECTIVE_START_DATE AND NVL(elementsE0.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY elementsE0.ELEMENT_NAME