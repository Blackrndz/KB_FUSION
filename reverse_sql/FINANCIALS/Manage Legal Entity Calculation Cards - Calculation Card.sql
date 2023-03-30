/* ****************************************************************************
 * $Revision: 56510 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-07-06 09:21:36 +0700 (Wed, 06 Jul 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Locations%20(United%20States)%20-%20Manage%20Locations.sql $:
 * $Id: Manage Locations (United States) - Manage Locations.sql 56510 2016-07-06 02:21:36Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 
SELECT DISTINCT TaxRptUnitsE0.LE_NAME RES_LEGAL_ENTITY
,TaxRptUnitsE0.LEGAL_ENTITY_IDENTIFIER RES_LEGAL_ENTITY_INDENTIFIER
,(SELECT DISPLAY_NAME
    FROM PAY_DIR_CARD_DEFINITIONS_TL
    WHERE LANGUAGE = USERENV('LANG')
    AND DIR_CARD_DEFINITION_ID = leRptCardsE0.DIR_CARD_DEFINITION_ID
    ) RES_CALCULATION_CARD
,TO_CHAR(SYSDATE,'DD-Mon-YYYY') RES_EFFECTIVE_AS_OF_DATE
,deductionGrpsE0.NAME RES_COMPONENT_GROUPS
,leRptCardsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,leRptCardsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,leRptCardsE0.CREATED_BY RSC_CREATED_BY
,leRptCardsE0.CREATION_DATE RSC_CREATION_DATE
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
    ,lesE0.NAME LE_NAME
	,lesE0.LEGAL_ENTITY_IDENTIFIER
    FROM HR_ORGANIZATION_V orgsE0
    ,XLE_ENTITY_PROFILES lesE0
    WHERE orgsE0.CLASSIFICATION_CODE = 'HCM_PSU'
    AND SYSDATE BETWEEN orgsE0.EFFECTIVE_START_DATE AND orgsE0.EFFECTIVE_END_DATE
    AND orgsE0.LEGAL_ENTITY_ID = lesE0.LEGAL_ENTITY_ID
    ) TaxRptUnitsE0
,PAY_DIR_CARD_COMPONENTS_F cardCompsE0
,PAY_DEDUCTION_GROUPS_VL deductionGrpsE0
WHERE leRptCardsE0.SOURCE_TYPE = 'PSU'
AND SYSDATE BETWEEN leRptCardsE0.EFFECTIVE_START_DATE AND leRptCardsE0.EFFECTIVE_END_DATE
AND leRptCardsE0.SOURCE_ID = TaxRptUnitsE0.ORGANIZATION_ID

AND leRptCardsE0.DIR_CARD_ID = cardCompsE0.DIR_CARD_ID
AND cardCompsE0.DEDUCTION_GROUP_ID = deductionGrpsE0.DEDUCTION_GROUP_ID

ORDER BY TaxRptUnitsE0.LE_NAME,TaxRptUnitsE0.LEGAL_ENTITY_IDENTIFIER,deductionGrpsE0.NAME