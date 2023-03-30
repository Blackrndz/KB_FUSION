/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2017-04-24 $:
 * $HeadURL: $:
 * $Id: Manage Interorganization Parameters - Interorganization Parameters.sql  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
--RSC_PREREQUISITE_OBJECTS=INV_INTERORG_PARAMETERS
 
SELECT (SELECT AA.ORGANIZATION_CODE
	FROM INV_ORGANIZATION_DEFINITIONS_V AA
	WHERE AA.ORGANIZATION_ID = iop.FROM_ORGANIZATION_ID
	) RES_FROM_ORGANIZATION
,(SELECT AA.ORGANIZATION_CODE
	FROM INV_ORGANIZATION_DEFINITIONS_V AA
	WHERE AA.ORGANIZATION_ID = iop.TO_ORGANIZATION_ID
	) RES_TO_ORGANIZATION
,iop.TO_ORGANIZATION_DISTANCE RES_DISTANCE
,(SELECT UnitOfMeasurePEO.UNIT_OF_MEASURE
	FROM INV_UNITS_OF_MEASURE_VL UnitOfMeasurePEO
	WHERE UnitOfMeasurePEO.UOM_CODE = iop.DISTANCE_UOM_CODE
	) RES_UOM
,DECODE(iop.TRANSFER_ORDER_REQUIRED,'Y','Yes','No') RES_TRANSFER_ORDER_REQUIRED
,DECODE(iop.INTRANSIT_TYPE,2,'In transit','Direct') RES_INVENTORY_DESTINATION_TRAN
,DECODE(iop.ROUTING_HEADER_ID,1,'Standard',2,'Inspection',3,'Direct') RES_INVENTORY_DESTINATION_RECE
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = iop.FILL_KILL_INV_TO_LOOKUP
	AND LOOKUP_TYPE = 'ORA_INV_TO_FILLKILL_OPTIONS'
	) RES_INVENTORY_DESTINATION_CANC
,DECODE(iop.MANUAL_RECEIPT_EXPENSE,'Y','Yes','No') RES_EXPENSE_DESTINATION_RECEIP
,DECODE(iop.EXPENSE_DEST_RECEIPT_ROUTING,1,'Standard',2,'Inspection',3,'Direct') RES_EXPENSE_DESTINATION_RECE_0
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = iop.FILL_KILL_EXP_TO_LOOKUP
	AND LOOKUP_TYPE = 'ORA_INV_TO_FILLKILL_OPTIONS'
	) RES_EXPENSE_DESTINATION_CANCEL
,iop.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,iop.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,iop.CREATED_BY RSC_CREATED_BY
,iop.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM INV_INTERORG_PARAMETERS iop
ORDER BY iop.FROM_ORGANIZATION_ID 