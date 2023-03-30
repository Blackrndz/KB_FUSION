/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT DECODE(NVL(regime.REGIME_TYPE_FLAG,'I'),'I','Transaction Tax','W','Withholding Tax') RES_SEARCH_FOR
,ExceptionEO.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,FPO.PARTY_NAME RES_CONFIGURATION_OWNER
,ExceptionEO.TAX RES_TAX
,ExceptionEO.TAX_STATUS_CODE RES_TAX_STATUS_CODE
,ExceptionEO.TAX_RATE_CODE RES_TAX_RATE_CODE
,ExceClassLkup.MEANING RES_EXCEPTION_TYPE
,OOD.ORGANIZATION_NAME RES_INVENTORY_ORGANIZATION
,CASE
		WHEN ExceptionEO.inventory_org_id IS NOT NULL
		THEN
			(SELECT DISTINCT mtl.ITEM_NUMBER
			FROM EGP_SYSTEM_ITEMS_VL mtl
			WHERE ExceptionEO.PRODUCT_ID = MTL.INVENTORY_ITEM_ID
			)
		ELSE NULL
	END RES_ITEM
,ExceptionEO.CLASSIFICATION_TYPE_CODE RES_PRODUCT_FISCAL_CLASSIFICAT
,ExceptionEO.CLASSIFICATION_CODE RES_PRODUCT_FISCAL_CLASSIFIC_0
,JurisdictionEO.TAX_JURISDICTION_CODE RES_TAX_JURISDICTION_CODE
,DECODE(ExceptionEO.EXCEPTION_REASON_CODE,'CERTIFICATE','Certificate','Certificate of File','Certificate on file',
	'OTHER','Other','SPECIAL','Special') RES_EXCEPTION_REASON
,ExceptionEO.PRECEDENCE_LEVEL RES_PRECEDENCE_LEVEL
,ExceptionEO.EFFECTIVE_FROM RES_START_DATE
,ExceptionEO.EFFECTIVE_TO RES_END_DATE
,DECODE(ExceptionEO.EXCEPTION_TYPE_CODE,'DISCOUNT','Discount or surcharge','SPECIAL_RATE','Special rate')
	RES_EXCEPTION_RATE_TYPE
,DECODE(ExceptionEO.EXCEPTION_TYPE_CODE,'DISCOUNT',ExceptionEO.RATE_MODIFIER,'') RES_DISCOUNT_OR_SURCHARGE_PERC
,DECODE(ExceptionEO.EXCEPTION_TYPE_CODE,'SPECIAL_RATE',ExceptionEO.RATE_MODIFIER,'') RES_SPECIAL_RATE_PERCENTAGE
,ExceptionEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ExceptionEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ExceptionEO.CREATED_BY RSC_CREATED_BY
,ExceptionEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,(CASE
	WHEN FPO.PARTY_TYPE_CODE = 'OU' THEN
		FPO.BU_ID
	END) RSC_BUSINESS_UNIT_ID
,(CASE
	WHEN FPO.PARTY_TYPE_CODE = 'FIRST_PARTY' THEN
		FPO.LEGAL_ENTITY_ID
	END) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_MCO_EXCEPTIONS ExceptionEO
,ZX_JURISDICTIONS_B JurisdictionEO
,ZX_FIRST_PARTY_ORGS_MOAC_V FPO
,INV_ORGANIZATION_DEFINITIONS_V OOD
,FND_LOOKUP_VALUES_VL ExceClassLkup
,ZX_REGIMES_B regime
WHERE ExceptionEO.TAX_JURISDICTION_ID = JurisdictionEO.TAX_JURISDICTION_ID (+)
AND ExceptionEO.INVENTORY_ORG_ID      = OOD.ORGANIZATION_ID (+)
AND ExceptionEO.CONTENT_OWNER_ID      = FPO.PARTY_TAX_PROFILE_ID
AND ExceptionEO.EXCEPTION_CLASS_CODE  = ExceClassLkup.LOOKUP_CODE(+)
AND ExceClassLkup.lookup_type         = 'ZX_EXCEPTION_CLASS'
AND ExceptionEO.INVENTORY_ORG_ID      = OOD.ORGANIZATION_ID (+)
AND ExceptionEO.TAX_REGIME_CODE       = regime.TAX_REGIME_CODE

AND NVL(regime.REGIME_TYPE_FLAG,'I') = 'I'

ORDER BY RES_SEARCH_FOR
,RES_TAX_REGIME_CODE