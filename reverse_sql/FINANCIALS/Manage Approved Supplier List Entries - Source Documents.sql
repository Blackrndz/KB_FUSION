/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Approved%20Supplier%20List%20Entries%20-%20Source%20Documents.sql $:
 * $Id: Manage Approved Supplier List Entries - Source Documents.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT BusinessUnitUsagePEO.BU_NAME RES_PROCUREMENT_BU
,(CASE WHEN poAPPROVEDSUPPEO.USING_ORGANIZATION_ID = '-1'
	THEN 'Global'
	ELSE 'Ship-to Organization' END ) RES_SCOPE
,(CASE WHEN poAPPROVEDSUPPEO.USING_ORGANIZATION_ID != '-1'
	THEN (SELECT NAME FROM HR_ORGANIZATION_V WHERE  ORGANIZATION_ID = poAPPROVEDSUPPEO.USING_ORGANIZATION_ID
			AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) END) RES_SHIP_TO_ORGANIZATION
,(CASE WHEN poAPPROVEDSUPPEO.ITEM_ID IS NOT NULL
	THEN (SELECT ITEM_NUMBER FROM EGP_SYSTEM_ITEMS_VL WHERE poAPPROVEDSUPPEO.ITEM_ID = INVENTORY_ITEM_ID
				AND poAPPROVEDSUPPEO.OWNING_ORGANIZATION_ID = ORGANIZATION_ID)
	ELSE (SELECT CATEGORY_NAME FROM EGP_CATEGORIES_VL WHERE poAPPROVEDSUPPEO.CATEGORY_ID = CATEGORY_ID) END) RES_ITEM
,(CASE WHEN poAPPROVEDSUPPEO.CATEGORY_ID IS NOT NULL
	THEN (SELECT CATEGORY_NAME FROM EGP_CATEGORIES_VL WHERE poAPPROVEDSUPPEO.CATEGORY_ID = CATEGORY_ID)
	ELSE NULL END) RES_CATEGORY_NAME
,(SELECT PARTY_NAME FROM HZ_PARTIES WHERE PARTY_ID = pozSUPEO.PARTY_ID) RES_SUPPLIER
,(SELECT VENDOR_SITE_CODE FROM POZ_SUPPLIER_SITES_ALL_M  WHERE VENDOR_SITE_ID = poAPPROVEDSUPPEO.VENDOR_SITE_ID ) RES_SUPPLIER_SITE
,(CASE WHEN poASLATTEO.USING_ORGANIZATION_ID = '-1'
	THEN 'Global'
	ELSE 'Ship-to Organization' END) RES_ATTRIBUTES_SCOPE
,(SELECT NAME FROM HR_ORGANIZATION_V WHERE  ORGANIZATION_ID = poASLATTEO.USING_ORGANIZATION_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_ATTRIBUTES_SHIP_TO_ORGANIZ
	,(SELECT DISPLAY_NAME
	FROM PO_DOC_STYLE_LINES_TL
	WHERE STYLE_ID = poHEADALLEO.STYLE_ID
	AND DOCUMENT_SUBTYPE = poASLDOCEO.DOCUMENT_TYPE_CODE
	AND LANGUAGE = USERENV('LANG')
	) RES_TYPE
,poHEADALLEO.SEGMENT1 RES_AGREEMENT
,(SELECT LINE_NUM
	FROM PO_LINES_ALL
	WHERE PO_LINE_ID = poASLDOCEO.DOCUMENT_LINE_ID
	) RES_AGREEMENT_LINE
,poHEADALLEO.DOCUMENT_STATUS RES_AGREEMENT_STATUS
,TO_CHAR(poHEADALLEO.START_DATE,'DD-Mon-YYYY') RES_AGREEMENT_START_DATE
,TO_CHAR(poHEADALLEO.END_DATE,'DD-Mon-YYYY') RES_AGREEMENT_END_DATE
	
,poASLATTEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,poASLATTEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,poASLATTEO.CREATED_BY RSC_CREATED_BY
,poASLATTEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,poAPPROVEDSUPPEO.PRC_BU_ID RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PO_APPROVED_SUPPLIER_LIST poAPPROVEDSUPPEO
,FUN_BU_USAGES_V BusinessUnitUsagePEO
--,EGP_SYSTEM_ITEMS_VL egpSYSITEMEO
,POZ_SUPPLIERS pozSUPEO
,PO_ASL_ATTRIBUTES poASLATTEO
,PO_ASL_DOCUMENTS poASLDOCEO
,PO_HEADERS_ALL poHEADALLEO
WHERE poAPPROVEDSUPPEO.PRC_BU_ID               = BusinessUnitUsagePEO.BUSINESS_UNIT_ID
AND poAPPROVEDSUPPEO.ASL_ID					   = poASLATTEO.ASL_ID
AND poASLATTEO.ASL_ID 						   = poASLDOCEO.ASL_ID
AND poASLATTEO.ASL_ATTRIBUTES_ID 			   = poASLDOCEO.ASL_ATTRIBUTES_ID
AND poASLDOCEO.DOCUMENT_HEADER_ID 			   = poHEADALLEO.PO_HEADER_ID(+)
AND BusinessUnitUsagePEO.MODULE_ID             = 110
AND BusinessUnitUsagePEO.MODULE_KEY            = 'PROCUREMENT_BF'
AND poAPPROVEDSUPPEO.VENDOR_ID = pozSUPEO.VENDOR_ID(+)
ORDER BY 1,2,3,4,5