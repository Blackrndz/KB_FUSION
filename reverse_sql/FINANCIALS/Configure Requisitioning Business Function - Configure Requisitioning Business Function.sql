/* ****************************************************************************
 * $Revision: 55346 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-05-23 14:11:43 +0700 (Mon, 23 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Chart%20of%20Accounts%20Value%20Set%20Values%20-%20Manage%20Values.sql $:
 * $Id: Manage Chart of Accounts Value Set Values - Manage Values.sql 55346 2016-05-23 07:11:43Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=POR_REQ_BU_OPTIONS_ALL
 
SELECT BusinessUnitPEO.BU_NAME RES_REQUISITIONING_BU
,(SELECT NAME
	FROM HR_ORGANIZATION_V  
	WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND CLASSIFICATION_CODE = 'INV'
	AND ORGANIZATION_ID = ReqBuOptionEO.INV_ORG_ID
	) RES_DEFAULT_DELIVER_TO_ORGANIZ
,PurchasingLineTypePEO.LINE_TYPE RES_LINE_TYPE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES_VL 
	WHERE LOOKUP_TYPE = 'POR_IMPORT_GRP_BY_CODE' 
	AND LOOKUP_CODE = ReqBuOptionEO.REQIMPORT_GROUP_BY_CODE
	) RES_GROUP_REQUISITION_IMPORT_B
,DECODE(ReqBuOptionEO.ALLOW_ONETIME_ADDR_FLAG,'Y','Yes','No') RES_ALLOW_ONE_TIME_ADDRESSES
,(CASE
	WHEN ReqBuOptionEO.ALLOW_ONETIME_ADDR_FLAG = 'Y' THEN
		OneTimeLocationDPEO.LOCATION_NAME
	END) RES_ONE_TIME_LOCATION_NAME
,(CASE
	WHEN ReqBuOptionEO.ALLOW_ONETIME_ADDR_FLAG = 'Y' THEN
		OneTimeLocationDPEO.INTERNAL_LOCATION_CODE
	END) RES_ONE_TIME_LOCATION_CODE
,DECODE(ReqBuOptionEO.REAPPROVAL_REQUIRED_FLAG,'Y','Yes','No') RES_REAPPROVAL_REQUIRED_FOR_CH
,DECODE(ReqBuOptionEO.CREATE_ORDERS_FLAG,'Y','Yes','No') RES_CREATE_ORDERS_IMMEDIATELY_
,DECODE(ReqBuOptionEO.APPR_REQUIRED_BUYER_MOD_FLAG,'Y','Yes','No') RES_APPROVAL_REQUIRED_FOR_BUYE
,DECODE(ReqBuOptionEO.ENABLE_APPROVER_OVERRIDE_FLAG,'Y','Yes','No') RES_ENABLE_APPROVER_OVERRIDE
,DECODE(ReqBuOptionEO.SUPPLY_AVAIL_ENABLED_FLAG,'Y','Yes','No') RES_ENABLE_SUPPLY_AVAILABILITY
,(select NAME 
	from FND_DF_CONTEXTS_VL
	WHERE DESCRIPTIVE_FLEXFIELD_CODE = 'POR_REQUISITION_HEADERS'
	AND CONTEXT_CODE = ReqBuOptionEO.REQ_HEADER_DFF_CONTEXT_CODE
	) RES_HEADER_LEVEL
,(select NAME 
	from FND_DF_CONTEXTS_VL
	WHERE DESCRIPTIVE_FLEXFIELD_CODE = 'POR_REQUISITION_LINES'
	AND CONTEXT_CODE = ReqBuOptionEO.REQ_LINE_DFF_CONTEXT_CODE
	) RES_LINE_LEVEL
,(select NAME 
	from FND_DF_CONTEXTS_VL
	WHERE DESCRIPTIVE_FLEXFIELD_CODE = 'POR_REQ_DISTRIBUTIONS'
	AND CONTEXT_CODE = ReqBuOptionEO.REQ_DIST_DFF_CONTEXT_CODE
	) RES_DISTRIBUTION_LEVEL
,(SELECT BU_NAME
	FROM FUN_ALL_BUSINESS_UNITS_V
	WHERE BU_ID = ReqBuOptionEO.PRC_BU_ID
	) RES_DEFAULT_PROCUREMENT_BU
,ReqBuOptionEO.PRICE_CHANGE_PERCENT_TOLERANCE RES_PRICE_CHANGE_TOLERANCE_PER
,ReqBuOptionEO.PRICE_CHANGE_AMOUNT_TOLERANCE RES_PRICE_CHANGE_TOLERANCE_AMO
,LocationDPEO.LOCATION_NAME RES_SHIP_TO_LOCATION_NAME
,LocationDPEO.INTERNAL_LOCATION_CODE RES_SHIP_TO_LOCATION_CODE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES_VL 
	WHERE LOOKUP_TYPE = 'POR_CANCEL_BACKING_REQ' 
	AND LOOKUP_CODE = ReqBuOptionEO.CANCEL_BACKING_REQ_CODE
	) RES_CANCEL_UNFULFILLED_DEMAND
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES_VL 
	WHERE LOOKUP_TYPE = 'POR_MULTIPLE_LE_ON_ORDER' 
	AND LOOKUP_CODE = ReqBuOptionEO.MULTIPLE_LEGAL_ENTITIES
	) RES_MULTIPLE_LEGAL_ENTITIES_ON
,DECODE(ReqBuOptionEO.UOM_CONVERSION_FLAG,'Y','Yes','No') RES_ALLOW_REQUISITION_TO_AGREE
,ReqBuOptionEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,ReqBuOptionEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,ReqBuOptionEO.CREATED_BY  RSC_CREATED_BY
,ReqBuOptionEO.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,ReqBuOptionEO.REQ_BU_ID RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
 
FROM POR_REQ_BU_OPTIONS_ALL ReqBuOptionEO
,FUN_ALL_BUSINESS_UNITS_V BusinessUnitPEO
,HR_LOCATIONS_ALL_F_VL LocationDPEO
,HR_LOCATIONS_ALL_F_VL OneTimeLocationDPEO
,PO_LINE_TYPES_VL PurchasingLineTypePEO
WHERE((ReqBuOptionEO.REQ_BU_ID            = BusinessUnitPEO.BU_ID)
AND(ReqBuOptionEO.SHIP_TO_LOCATION_ID  = LocationDPEO.LOCATION_ID(+)))
AND(ReqBuOptionEO.ONE_TIME_LOCATION_ID = OneTimeLocationDPEO.LOCATION_ID(+))
AND(SYSDATE BETWEEN LocationDPEO.EFFECTIVE_START_DATE(+) AND LocationDPEO.EFFECTIVE_END_DATE(+))
AND(SYSDATE BETWEEN OneTimeLocationDPEO.EFFECTIVE_START_DATE(+) AND
	OneTimeLocationDPEO.EFFECTIVE_END_DATE(+))
AND ReqBuOptionEO.LINE_TYPE_ID          = PurchasingLineTypePEO.LINE_TYPE_ID(+)