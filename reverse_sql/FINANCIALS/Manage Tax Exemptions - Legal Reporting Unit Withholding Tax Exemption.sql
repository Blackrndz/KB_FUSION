/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT (SELECT XleEtbProfiles.Name
	FROM XLE_ETB_PROFILES XleEtbProfiles
	WHERE ZxPartyTaxProfile.PARTY_ID = XleEtbProfiles.PARTY_ID
	) RES_LEGAL_REPORTING_UNIT
,(SELECT XleEntityProfiles.NAME
	FROM XLE_ENTITY_PROFILES XleEntityProfiles
	,XLE_ETB_PROFILES XleEtbProfiles
	WHERE xleetbprofiles.legal_entity_id          = xleentityprofiles.legal_entity_id
	AND xleentityprofiles.transacting_entity_flag = 'Y'
	AND ZxPartyTaxProfile.PARTY_ID                = XleEtbProfiles.PARTY_ID
	) RES_LEGAL_ENTITY
,ZxExemptions.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,ZFPOMV.PARTY_NAME RES_CONFIGURATION_OWNER
,ZxExemptions.TAX RES_TAX
,ZxExemptions.TAX_STATUS_CODE RES_TAX_STATUS_CODE
,ZxExemptions.TAX_RATE_CODE RES_TAX_RATE_CODE
,JurisdictionEO.TAX_JURISDICTION_CODE RES_TAX_JURISDICTION_CODE
,OOD.ORGANIZATION_CODE RES_ORGANIZATION
,ItemVL.ITEM_NUMBER RES_ITEM
,TO_CHAR(ZxExemptions.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(ZxExemptions.EFFECTIVE_TO,'DD-Mon-YYYY') RES_END_DATE
,RegimesVL.TAX_REGIME_NAME RES_TAX_REGIME_NAME
,(SELECT tax_full_name
	FROM zx_taxes_vl taxes
	WHERE taxes.tax_regime_code = ZxExemptions.tax_regime_code
	AND taxes.tax               = ZxExemptions.tax
	AND rownum                  = 1
	) RES_TAX_NAME
,(SELECT tax_status_name
	FROM zx_status_vl status
	WHERE status.tax_regime_code = ZxExemptions.tax_regime_code
	AND status.tax               = ZxExemptions.tax
	AND status.tax_status_code   = ZxExemptions.tax_status_code
	AND rownum                   = 1
	) RES_TAX_STATUS_NAME
,(SELECT tax_rate_name
	FROM zx_rates_vl rates
	WHERE rates.tax_regime_code = ZxExemptions.tax_regime_code
	AND rates.tax               = ZxExemptions.tax
	AND rates.tax_status_code   = ZxExemptions.tax_status_code
	AND rates.tax_rate_code     = ZxExemptions.tax_rate_code
	AND rownum                  = 1
	) RES_TAX_RATE_NAME
,JurisTL.TAX_JURISDICTION_NAME RES_TAX_JURISDICTION_NAME
,OOD.ORGANIZATION_NAME RES_INVENTORY_ORGANIZATION
,ItemVL.DESCRIPTION RES_ITEM_DESCRIPTION
,ZxExemptions.EXEMPT_CERTIFICATE_NUMBER RES_CERTIFICATE_NUMBER
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ZX_EXEMPTION_TYPE'
	AND LOOKUP_CODE   = ZxExemptions.EXEMPTION_TYPE_CODE
	) RES_EXEMPTION_RATE_TYPE
,ZxExemptions.RATE_MODIFIER RES_EXEMPTION_PERCENTAGE
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ZX_EXEMPTION_STATUS'
	AND LOOKUP_CODE   = ZxExemptions.EXEMPTION_STATUS_CODE
	) RES_EXEMPT_STATUS
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ZX_EXEMPTION_REASON_CODE'
	AND LOOKUP_CODE   = ZxExemptions.EXEMPT_REASON_CODE
	) RES_EXEMPT_REASON
,IssTaxAuthorities.PARTY_NAME RES_ISSUING_TAX_AUTHORITY
,ZxExemptions.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ZxExemptions.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ZxExemptions.CREATED_BY RSC_CREATED_BY
,ZxExemptions.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,(SELECT xleentityprofiles.legal_entity_id
	FROM XLE_ENTITY_PROFILES XleEntityProfiles
	,XLE_ETB_PROFILES XleEtbProfiles
	WHERE xleetbprofiles.legal_entity_id          = xleentityprofiles.legal_entity_id
	AND xleentityprofiles.transacting_entity_flag = 'Y'
	AND ZxPartyTaxProfile.PARTY_ID                = XleEtbProfiles.PARTY_ID
	) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_EXEMPTIONS ZxExemptions
,ZX_FIRST_PARTY_ORGS_MOAC_V ZFPOMV
,ZX_JURISDICTIONS_B JurisdictionEO
,HZ_PARTIES IssTaxAuthorities
,ZX_PARTY_TAX_PROFILE PTPIssTaxAuth
,INV_ORGANIZATION_DEFINITIONS_V OOD
,EGP_SYSTEM_ITEMS_VL ItemVL
,zx_regimes_vl RegimesVL
,zx_jurisdictions_vl JurisTL
,ZX_PARTY_TAX_PROFILE ZxPartyTaxProfile
WHERE ZFPOMV.PARTY_TAX_PROFILE_ID         = ZxExemptions.CONTENT_OWNER_ID
AND ZxExemptions.PARTY_TAX_PROFILE_ID     = ZxPartyTaxProfile.PARTY_TAX_PROFILE_ID
AND ZxExemptions.TAX_JURISDICTION_ID      = JurisdictionEO.TAX_JURISDICTION_ID (+)
AND ZxExemptions.ISSUING_TAX_AUTHORITY_ID = PTPIssTaxAuth.PARTY_TAX_PROFILE_ID (+)
AND PTPIssTaxAuth.PARTY_ID                = IssTaxAuthorities.PARTY_ID (+)
AND ZxExemptions.INVENTORY_ORG_ID         = OOD.ORGANIZATION_ID (+)
AND ZxExemptions.PRODUCT_ID               = ItemVL.INVENTORY_ITEM_ID (+)
AND ZxExemptions.INVENTORY_ORG_ID         = ItemVL.ORGANIZATION_ID (+)
AND JurisdictionEO.TAX_JURISDICTION_ID    = JurisTL.TAX_JURISDICTION_ID (+)
AND ZxExemptions.TAX_REGIME_CODE          = RegimesVL.TAX_REGIME_CODE (+)
AND ZxExemptions.RECORD_TYPE_CODE        IN('USER_DEFINED','MIGRATED')
AND REGIME_TYPE_FLAG                      = 'W'
AND ZxPartyTaxProfile.PARTY_TYPE_CODE     = 'LEGAL_ESTABLISHMENT'
ORDER BY RES_LEGAL_REPORTING_UNIT
,RES_TAX_REGIME_CODE