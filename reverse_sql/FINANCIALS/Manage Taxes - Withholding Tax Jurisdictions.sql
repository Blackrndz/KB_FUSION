/* ****************************************************************************
 * $Revision: 53782 $:
 * $Author: nasrullah.dusenmahamad $:
 * $Date: 2016-03-31 18:00:16 +0700 (Tue, 22 Mar 2016) $:
 * $HeadURL: $:
 * $Id: Manage Applications Core Value Sets - Manage Applications Core Value Sets.sql 53782 2016-03-22 11:00:16Z nasrullah.dusenmahamad $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
/*Cannot find condition for RES_PARENT_GEOGRAPHY_TYPE and RES_PARENT_GEOGRAPHY_NAME on 25-10-2016*/
 

SELECT HEAD.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,HEAD.PARTY_NAME RES_CONFIGURATION_OWNER
,HEAD.TAX RES_TAX
,HEAD.TAX_FULL_NAME RES_TAX_NAME
,Detail.TAX_JURISDICTION_CODE RES_TAX_JURISDICTION_CODE
,Detail.NAME RES_TAX_JURISDICTION_NAME
,(SELECT HzGeographies.GEOGRAPHY_NAME
	FROM HZ_GEOGRAPHIES HzGeographies
	WHERE HzGeographies.geography_id = Detail.ZONE_GEOGRAPHY_ID
	) RES_GEOGRAPHY_NAME
,TO_CHAR(Detail.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(Detail.EFFECTIVE_TO,'DD-Mon-YYYY') RES_END_DATE
,DECODE(Detail.DEFAULT_JURISDICTION_FLAG,'Y','Yes','No') RES_SET_AS_DEFAULT_JURISDICTIO
,TO_CHAR(Detail.DEFAULT_FLG_EFFECTIVE_FROM,'DD-Mon-YYYY') RES_DEFAULT_START_DATE
,TO_CHAR(Detail.DEFAULT_FLG_EFFECTIVE_TO,'DD-Mon-YYYY') RES_DEFAULT_END_DATE
,NULL RES_PARENT_GEOGRAPHY_TYPE
,NULL RES_PARENT_GEOGRAPHY_NAME
,Detail.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,Detail.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,Detail.CREATED_BY RSC_CREATED_BY
,Detail.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,(CASE 
	WHEN HEAD.PARTY_TYPE_CODE = 'OU' THEN	
		HEAD.BU_ID
	ELSE
		NULL
	END) RSC_BUSINESS_UNIT_ID
,(CASE 
	WHEN HEAD.PARTY_TYPE_CODE = 'FIRST_PARTY' THEN	
		HEAD.LEGAL_ENTITY_ID
	ELSE
		NULL
	END) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT TaxTLEO.TAX_REGIME_CODE
	,ZFPOMV.PARTY_NAME
	,ZFPOMV.PARTY_TYPE_CODE
	,ZFPOMV.BU_ID
	,ZFPOMV.LEGAL_ENTITY_ID
	,TaxTLEO.TAX
	,TaxTLEO.TAX_FULL_NAME
	FROM ZX_TAXES_VL TaxTLEO
	,ZX_FIRST_PARTY_ORGS_MOAC_V ZFPOMV
	,ZX_REGIMES_VL RegimeTLEO
	WHERE ZFPOMV.PARTY_TAX_PROFILE_ID                = TaxTLEO.CONTENT_OWNER_ID
	AND RegimeTLEO.TAX_REGIME_CODE                   = TaxTLEO.TAX_REGIME_CODE
	AND NVL(RegimeTLEO.REGIME_TYPE_FLAG,'I')         <> 'I'
	) HEAD
,(SELECT TAX_JURISDICTION_CODE
	,(SELECT TAX_JURISDICTION_NAME
		FROM ZX_JURISDICTIONS_TL
		WHERE tax_jurisdiction_id = BBB.TAX_JURISDICTION_ID
		AND LANGUAGE = USERENV('LANG')
		) NAME
	,EFFECTIVE_FROM
	,EFFECTIVE_TO
	,ZONE_GEOGRAPHY_ID
	,DEFAULT_FLG_EFFECTIVE_FROM
	,DEFAULT_FLG_EFFECTIVE_TO
	,DEFAULT_JURISDICTION_FLAG
	,TAX_REGIME_CODE
	,TAX
	,CREATED_BY
	,CREATION_DATE
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	FROM ZX_JURISDICTIONS_B BBB
	) Detail
WHERE Head.TAX_REGIME_CODE = Detail.TAX_REGIME_CODE
AND Head.TAX               = Detail.TAX
ORDER BY Head.TAX_REGIME_CODE
,Head.TAX