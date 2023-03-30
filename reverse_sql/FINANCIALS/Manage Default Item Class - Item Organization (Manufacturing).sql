/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Default%20Item%20Class%20-%20Item%20Organization%20(Manufacturing).sql $:
 * $Id: Manage Default Item Class - Item Organization (Manufacturing).sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 
SELECT ItemClassPEO.ITEM_CLASS_CODE RES_INTERNAL_NAME
,ItemVersionEO.TEMPLATE_NAME RES_NAME
,(SELECT ORGANIZATION_CODE
	FROM INV_ORG_PARAMETERS
	WHERE ORGANIZATION_ID = ItemVersionEO.ORGANIZATION_ID
	) RES_ORGANIZATION
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EGP_BOM_ITEM_TYPE'
	AND LOOKUP_CODE = ItemVersionEO.BOM_ITEM_TYPE
	) RES_STRUCTURE_ITEM_TYPE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EGP_CONFIG_ORG'
	AND LOOKUP_CODE = ItemVersionEO.CONFIG_ORGS
	) RES_CREATE_CONFIGURED_ITEM
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EGP_CONFIG_MODEL'
	AND LOOKUP_CODE = ItemVersionEO.CONFIG_MODEL_TYPE
	) RES_CONFIGURATOR_MODEL_TYPE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EGP_BOM_EFFEC_CONTROL'
	AND LOOKUP_CODE = ItemVersionEO.EFFECTIVITY_CONTROL
	) RES_EFFECTIVITY_CONTROL
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EGP_CONFIG_MATCH'
	AND LOOKUP_CODE = ItemVersionEO.CONFIG_MATCH
	) RES_MATCH_CONFIGURATION
,BASE_ITEM_ID RES_BASE_MODEL -- Not found in Internal
,DECODE(ItemVersionEO.AUTO_CREATED_CONFIG_FLAG,'Y','Yes','N','No') RES_AUTOCREATED_CONFIGURATION
,DECODE(ItemVersionEO.PICK_COMPONENTS_FLAG,'Y','Yes','N','No') RES_PICK_COMPONENTS
,DECODE(ItemVersionEO.REPLENISH_TO_ORDER_FLAG,'Y','Yes','N','No') RES_ASSEMBLE_TO_ORDER
,DECODE(ItemVersionEO.COSTING_ENABLED_FLAG,'Y','Yes','N','No') RES_COSTING_ENABLED
,DECODE(ItemVersionEO.DEFAULT_INCLUDE_IN_ROLLUP_FLAG,'Y','Yes','N','No') RES_INCLUDE_IN_ROLLUP
,ItemVersionEO.STD_LOT_SIZE RES_STANDARD_LOT_SIZE
,DECODE(ItemVersionEO.INVENTORY_ASSET_FLAG,'Y','Yes','N','No') RES_INVENTORY_ASSET_VALUE
,DECODE(ItemVersionEO.BUILD_IN_WIP_FLAG,'Y','Yes','N','No') RES_BUILD_IN_WIP
,DECODE(ItemVersionEO.CONTRACT_MANUFACTURING,'Y','Yes','N','No') RES_CONTRACT_MANUFACTURING
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EGP_WIP_SUP_TYPE'
	AND LOOKUP_CODE = ItemVersionEO.WIP_SUPPLY_TYPE
	) RES_SUPPLY_TYPE
,WIP_SUPPLY_SUBINVENTORY RES_SUPPLY_LOCATOR -- Not found in Internal
,WIP_SUPPLY_LOCATOR_ID RES_SUPPLY_SUBINVENTORY -- Not found in Internal
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'EGP_OVER_TOLTYPE'
	AND LOOKUP_CODE = ItemVersionEO.OVERCOMPLETION_TOLERANCE_TYPE
	) RES_TOLERANCE_TYPE
,ItemVersionEO.OVERCOMPLETION_TOLERANCE_VALUE RES_TOLERANCE_VALUE
,ItemVersionEO.INVENTORY_CARRY_PENALTY RES_INVENTORY_CARRY
,ItemVersionEO.OPERATION_SLACK_PENALTY RES_OPERATION_SLACK
,DECODE(ItemVersionEO.RECIPE_ENABLED_FLAG,'Y','Yes','N','No') RES_RECIPE_ENABLED
,DECODE(ItemVersionEO.PROCESS_QUALITY_ENABLED_FLAG,'Y','Yes','N','No') RES_PROCESS_QUALITY_ENABLED
,DECODE(ItemVersionEO.PROCESS_COSTING_ENABLED_FLAG,'Y','Yes','N','No') RES_PROCESS_COSTING_ENABLED
,DECODE(ItemVersionEO.PROCESS_EXECUTION_ENABLED_FLAG,'Y','Yes','N','No') RES_PROCESS_EXECUTION_ENABLED
,PROCESS_SUPPLY_SUBINVENTORY RES_PROCESS_SUPPLY_SUBINVENTOR -- Not found in Internal
,PROCESS_SUPPLY_LOCATOR_ID RES_PROCESS_SUPPLY_LOCATOR -- Not found in Internal
,PROCESS_YIELD_SUBINVENTORY RES_PROCESS_YIELD_SUBINVENTORY -- Not found in Internal
,PROCESS_YIELD_LOCATOR_ID RES_PROCESS_YIELD_LOCATOR -- Not found in Internal
,DECODE(ItemVersionEO.HAZARDOUS_MATERIAL_FLAG,'Y','Yes','N','No') RES_HAZARDOUS_MATERIAL
,ItemVersionEO.CAS_NUMBER RES_CAS_NUMBER
,ItemVersionEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ItemVersionEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ItemVersionEO.CREATED_BY RSC_CREATED_BY
,ItemVersionEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,ItemVersionEO.ORGANIZATION_ID RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM EGP_ITEM_CLASSES_VL ItemClassPEO
,EGP_SYSTEM_ITEMS_V ItemVersionEO
WHERE ItemClassPEO.PARENT_ITEM_CLASS_ID NOT IN (SELECT ITEM_CLASS_ID FROM EGP_ITEM_CLASSES_VL)
AND ItemVersionEO.TEMPLATE_NAME IS NOT NULL
AND ItemClassPEO.ITEM_CLASS_ID = ItemVersionEO.ITEM_CATALOG_GROUP_ID
AND(ItemVersionEO.BOM_ITEM_TYPE IS NOT NULL
OR ItemVersionEO.CONFIG_ORGS IS NOT NULL
OR ItemVersionEO.CONFIG_MODEL_TYPE IS NOT NULL
OR ItemVersionEO.EFFECTIVITY_CONTROL IS NOT NULL
OR ItemVersionEO.CONFIG_MATCH IS NOT NULL
OR BASE_ITEM_ID IS NOT NULL
OR ItemVersionEO.AUTO_CREATED_CONFIG_FLAG IS NOT NULL
OR ItemVersionEO.PICK_COMPONENTS_FLAG IS NOT NULL
OR ItemVersionEO.REPLENISH_TO_ORDER_FLAG IS NOT NULL
OR ItemVersionEO.COSTING_ENABLED_FLAG IS NOT NULL
OR ItemVersionEO.DEFAULT_INCLUDE_IN_ROLLUP_FLAG IS NOT NULL
OR ItemVersionEO.STD_LOT_SIZE IS NOT NULL
OR ItemVersionEO.INVENTORY_ASSET_FLAG IS NOT NULL
OR ItemVersionEO.BUILD_IN_WIP_FLAG IS NOT NULL
OR ItemVersionEO.CONTRACT_MANUFACTURING IS NOT NULL
OR ItemVersionEO.WIP_SUPPLY_TYPE IS NOT NULL
OR WIP_SUPPLY_SUBINVENTORY IS NOT NULL
OR WIP_SUPPLY_LOCATOR_ID IS NOT NULL
OR ItemVersionEO.OVERCOMPLETION_TOLERANCE_TYPE IS NOT NULL
OR ItemVersionEO.OVERCOMPLETION_TOLERANCE_VALUE IS NOT NULL
OR ItemVersionEO.INVENTORY_CARRY_PENALTY IS NOT NULL
OR ItemVersionEO.OPERATION_SLACK_PENALTY IS NOT NULL
OR ItemVersionEO.RECIPE_ENABLED_FLAG IS NOT NULL
OR ItemVersionEO.PROCESS_QUALITY_ENABLED_FLAG IS NOT NULL
OR ItemVersionEO.PROCESS_COSTING_ENABLED_FLAG IS NOT NULL
OR ItemVersionEO.PROCESS_EXECUTION_ENABLED_FLAG IS NOT NULL
OR PROCESS_SUPPLY_SUBINVENTORY IS NOT NULL
OR PROCESS_SUPPLY_LOCATOR_ID IS NOT NULL
OR PROCESS_YIELD_SUBINVENTORY IS NOT NULL
OR PROCESS_YIELD_LOCATOR_ID IS NOT NULL
OR ItemVersionEO.HAZARDOUS_MATERIAL_FLAG IS NOT NULL
OR ItemVersionEO.CAS_NUMBER IS NOT NULL
)
ORDER BY ItemClassPEO.ITEM_CLASS_CODE
,ItemVersionEO.TEMPLATE_NAME
,3