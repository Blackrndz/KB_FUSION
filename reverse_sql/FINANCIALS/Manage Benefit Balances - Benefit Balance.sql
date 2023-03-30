/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT TO_CHAR(benBalancesE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,DECODE(TO_CHAR(benBalancesE0.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(benBalancesE0.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_EFFECTIVE_END_DATE
,benBalancesE0.NAME RES_BENEFIT_BALANCE
,benBalancesE0.BNFTS_BAL_DESC RES_DESCRIPTION
,(SELECT NAME
   FROM HR_ORGANIZATION_V
   WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
   AND CLASSIFICATION_CODE = 'HCM_LEMP'
   AND ORGANIZATION_ID = benBalancesE0.LEGAL_ENTITY_ID
   ) RES_LEGAL_EMPLOYER
,(SELECT NAME
   FROM FND_CURRENCIES_VL
   WHERE CURRENCY_CODE = benBalancesE0.UOM
   ) RES_CURRENCY
,(SELECT MEANING
   FROM FND_LOOKUP_VALUES
   WHERE LANGUAGE = USERENV('LANG')
   AND LOOKUP_TYPE = 'BEN_NNMNTRY_UOM'
   AND LOOKUP_CODE = benBalancesE0.NNMNTRY_UOM
   ) RES_NONMONETARY_UNITS
,(SELECT MEANING
   FROM FND_LOOKUP_VALUES
   WHERE LANGUAGE = USERENV('LANG')
   AND LOOKUP_TYPE = 'BEN_BNFTS_BAL_USG'
   AND LOOKUP_CODE = benBalancesE0.BNFTS_BAL_USG_CD
   ) RES_BALANCE_USAGE
,benBalancesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benBalancesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benBalancesE0.CREATED_BY RSC_CREATED_BY
,benBalancesE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,benBalancesE0.BUSINESS_GROUP_ID RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
 
FROM BEN_BNFTS_BAL_F benBalancesE0
WHERE SYSDATE BETWEEN benBalancesE0.EFFECTIVE_START_DATE AND benBalancesE0.EFFECTIVE_END_DATE
ORDER BY benBalancesE0.NAME
,benBalancesE0.EFFECTIVE_START_DATE