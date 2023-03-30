/* ****************************************************************************
 * $Revision: 59683 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-11-22 10:55:17 +0700 (Tue, 22 Nov 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Mapping%20Sets%20-%20Cost%20Management%20(Chart%20of%20Accounts%20Mappings).sql $:
 * $Id: Manage Mapping Sets - Cost Management (Chart of Accounts Mappings).sql 59683 2016-11-22 03:55:17Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT PartyPEO.PARTY_NAME RES_PARTY_NAME
,PartyPEO.PARTY_NUMBER RES_PARTY_NUMBER
,SUBSTR(DECODE(NVL(ThirdPartyTaxProfileEO.SUPPLIER_FLAG,''),'Y',' and Supplier','',(SELECT ' and Supplier'
	FROM HZ_PARTY_USG_ASSIGNMENTS hpua
	WHERE hpua.party_id       = ThirdPartyTaxProfileEO.party_id
	AND hpua.party_usage_code = 'SUPPLIER'
	AND TRUNC(SYSDATE) BETWEEN hpua.effective_start_date AND NVL(hpua.effective_end_date,TRUNC(SYSDATE) + 1)
	AND hpua.status_flag = 'A'
	AND rownum           = 1
	)) || DECODE(NVL(ThirdPartyTaxProfileEO.CUSTOMER_FLAG,''),'Y',' and Customer','',(SELECT ' and Customer'
	FROM HZ_PARTY_USG_ASSIGNMENTS hpua
	WHERE hpua.party_id       = ThirdPartyTaxProfileEO.party_id
	AND hpua.party_usage_code = 'CUSTOMER'
	AND TRUNC(SYSDATE) BETWEEN hpua.effective_start_date AND NVL(hpua.effective_end_date,TRUNC(SYSDATE) + 1)
	AND hpua.status_flag = 'A'
	AND rownum           = 1
	)) ||
	(SELECT ' and Bank'
	FROM HZ_PARTY_USG_ASSIGNMENTS hpua
	WHERE hpua.party_id       = ThirdPartyTaxProfileEO.party_id
	AND hpua.party_usage_code = 'BANK'
	AND TRUNC(SYSDATE) BETWEEN hpua.effective_start_date AND NVL(hpua.effective_end_date,TRUNC(SYSDATE) + 1)
	AND hpua.status_flag = 'A'
	AND rownum           = 1
	),6) RES_PARTY_USAGE
,PartyPEO.ADDRESS1||','|| PartyPEO.ADDRESS2||','|| PartyPEO.ADDRESS3||','|| PartyPEO.CITY||','|| PartyPEO.postal_code
	||','||
	(SELECT TerritoriesPEO.TERRITORY_SHORT_NAME
	FROM FND_TERRITORIES_VL TerritoriesPEO
	WHERE PartyPEO.Country = TerritoriesPEO.TERRITORY_CODE
	) RES_ADDRESS
,(SELECT TerritoriesPEO.TERRITORY_SHORT_NAME
	FROM FND_TERRITORIES_VL TerritoriesPEO
	WHERE PartyPEO.Country = TerritoriesPEO.TERRITORY_CODE
	) RES_COUNTRY
,ThirdPartyTaxProfileEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ThirdPartyTaxProfileEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ThirdPartyTaxProfileEO.CREATED_BY RSC_CREATED_BY
,ThirdPartyTaxProfileEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_PARTY_TAX_PROFILE ThirdPartyTaxProfileEO
,HZ_PARTIES PartyPEO
WHERE ThirdPartyTaxProfileEO.PARTY_ID      = PartyPEO.PARTY_ID
AND ThirdPartyTaxProfileEO.PARTY_TYPE_CODE = 'THIRD_PARTY'
ORDER BY PartyPEO.PARTY_NAME