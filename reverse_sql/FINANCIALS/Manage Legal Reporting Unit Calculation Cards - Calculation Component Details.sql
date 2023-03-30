/* ****************************************************************************
 * $Revision: 56510 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-07-06 09:21:36 +0700 (Wed, 06 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Locations%20(United%20States)%20-%20Manage%20Locations.sql $:
 * $Id: Manage Locations (United States) - Manage Locations.sql 56510 2016-07-06 02:21:36Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 
-- VALUE_SET_LOGIC_TO_APPLY_FIELDS=CAL_COMP_DTL_DTL

SELECT DISTINCT TaxRptUnitsE0.LE_NAME RES_LEGAL_ENTITY
,TaxRptUnitsE0.ETB_NAME RES_LEGAL_REPORTING_UNIT
,TaxRptUnitsE0.LEGAL_ENTITY_IDENTIFIER RES_LEGAL_ENTITY_INDENTIFIER
,(SELECT DISPLAY_NAME
    FROM PAY_DIR_CARD_DEFINITIONS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND DIR_CARD_DEFINITION_ID = leRptCardsE0.DIR_CARD_DEFINITION_ID
    ) RES_CALCULATION_CARD
,deductionGrpsE0.NAME RES_COMPONENT_GROUPS
,calCompDtlsE0.COMPONENT_NAME RES_CALCULATION_COMPONENT
,(CASE
	WHEN deductionGrpsE0.NAME = 'Regional' THEN
		CONCAT(addressE0.STATE_NAME,CONCAT(DECODE(';'||addressE0.COUNTRY_NAME,';',NULL,';'||addressE0.COUNTRY_NAME),DECODE(';'||addressE0.CITY_NAME,';',NULL,';'||addressE0.CITY_NAME)))
    ELSE
        cardCompsE0.CONTEXT_VALUE1
    END) RES_REFERENCE
,(SELECT NAME
    FROM FND_DF_CONTEXTS_VL
    WHERE DESCRIPTIVE_FLEXFIELD_CODE = 'Deduction Developer DF'
    AND CONTEXT_CODE = detailsE0.DIR_INFORMATION_CATEGORY
    ) RES_CALCULATION_COMPONENT_DETA
,TO_CHAR(calCompDtlsE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(calCompDtlsE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE

,(SELECT DECODE(detailsE0.DIR_INFORMATION_CHAR1,NULL,NULL,vs.VALUE_SET_CODE||'###R4C###'||detailsE0.DIR_INFORMATION_CHAR1)
    FROM FND_DF_SEGMENTS_VL seg
    ,FND_VS_VALUE_SETS vs
    WHERE seg.VALUE_SET_ID = vs.VALUE_SET_ID
    AND seg.DESCRIPTIVE_FLEXFIELD_CODE = 'Deduction Developer DF'
    AND seg.CONTEXT_CODE = detailsE0.DIR_INFORMATION_CATEGORY
    --AND = detailsE0.DIR_INFORMATION_CHAR1
    AND seg.COLUMN_NAME = 'DIR_INFORMATION_CHAR1'
    ) RES_SELF_ADJUSTMENT_METHOD
,calCompDtlsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,calCompDtlsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,calCompDtlsE0.CREATED_BY RSC_CREATED_BY
,calCompDtlsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


    
FROM PAY_DIR_CARDS_F leRptCardsE0
,(SELECT orgsE0.ORGANIZATION_ID
    ,etbsE0.NAME ETB_NAME
    ,lesE0.NAME LE_NAME
	,lesE0.LEGAL_ENTITY_IDENTIFIER
    FROM HR_ORGANIZATION_V orgsE0
    ,XLE_ETB_PROFILES etbsE0
    ,XLE_ENTITY_PROFILES lesE0
    WHERE orgsE0.CLASSIFICATION_CODE = 'HCM_TRU'
    AND SYSDATE BETWEEN orgsE0.EFFECTIVE_START_DATE AND orgsE0.EFFECTIVE_END_DATE
    AND orgsE0.ESTABLISHMENT_ID= etbsE0.ESTABLISHMENT_ID
    AND etbsE0.LEGAL_ENTITY_ID = lesE0.LEGAL_ENTITY_ID
    ) TaxRptUnitsE0
,(SELECT DIR_CARD_COMP_ID
	,(SELECT MEANING FROM FND_LOOKUP_VALUES 
			WHERE LANGUAGE = USERENV('LANG')
            AND LOOKUP_TYPE = 'ORA_HRX_US_ORG_COMMON_STATE'
			AND LOOKUP_CODE = cardcomE0.CONTEXT_VALUE1) STATE_NAME
	,(SELECT GEOGRAPHY_NAME FROM PAY_GEOGRAPHY_INTERFACE WHERE AREA3 IS NULL
			AND AREA1 = cardcomE0.CONTEXT_VALUE1 AND AREA2 = cardcomE0.CONTEXT_VALUE2
			AND SYSDATE BETWEEN START_DATE AND NVL(END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))) COUNTRY_NAME
	,(SELECT GEOGRAPHY_NAME FROM PAY_GEOGRAPHY_INTERFACE WHERE AREA3 = cardcomE0.CONTEXT_VALUE3
			AND AREA1 = cardcomE0.CONTEXT_VALUE1 AND AREA2 = cardcomE0.CONTEXT_VALUE2 AND ROWNUM = 1
			AND SYSDATE BETWEEN START_DATE AND NVL(END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))) CITY_NAME
	FROM PAY_DIR_CARD_COMPONENTS_F cardcomE0
	,PAY_DEDUCTION_GROUPS_VL deducGrpsE0
	WHERE deducGrpsE0.NAME = 'Regional'
	AND cardcomE0.DEDUCTION_GROUP_ID = deducGrpsE0.DEDUCTION_GROUP_ID
	) addressE0
,PAY_DIR_CARD_COMPONENTS_F cardCompsE0
,PAY_DEDUCTION_GROUPS_VL deductionGrpsE0
,PAY_DIR_CARD_COMP_DEFS_VL calCompDtlsE0
,PAY_DIR_COMP_DETAILS_F detailsE0
WHERE leRptCardsE0.SOURCE_TYPE = 'TRU'
AND SYSDATE BETWEEN leRptCardsE0.EFFECTIVE_START_DATE AND leRptCardsE0.EFFECTIVE_END_DATE
AND leRptCardsE0.SOURCE_ID = TaxRptUnitsE0.ORGANIZATION_ID
AND cardCompsE0.DIR_CARD_COMP_ID = addressE0.DIR_CARD_COMP_ID(+)
AND leRptCardsE0.DIR_CARD_ID = cardCompsE0.DIR_CARD_ID
AND cardCompsE0.DEDUCTION_GROUP_ID = deductionGrpsE0.DEDUCTION_GROUP_ID

AND cardCompsE0.DIR_CARD_COMP_DEF_ID = calCompDtlsE0.DIR_CARD_COMP_DEF_ID
AND cardCompsE0.DIR_CARD_COMP_ID = detailsE0.DIR_CARD_COMP_ID

ORDER BY 1,2,3,4
