/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=PAY_ORG_PAY_METHODS_F

SELECT leGrpsE0.NAME RES_LEGISLATIVE_DATA_GROUP
,(SELECT PARTY_NAME
    FROM HZ_PARTIES
    WHERE PARTY_ID = PartyPayMethodsE0.ORGANIZATION_ID
    ) RES_THIRD_PARTY_NAME
,(SELECT ORG_PAYMENT_METHOD_NAME 
	FROM PAY_ORG_PAY_METHODS_TL
    WHERE LANGUAGE = USERENV('LANG')
	AND ORG_PAYMENT_METHOD_ID = PartyPayMethodsE0.ORG_PAYMENT_METHOD_ID
	) RES_ORGANIZATION_PAYMENT_METHO
,(SELECT TO_CHAR(EFFECTIVE_END_DATE,'DD-Mon-YYYY')
	FROM PAY_ORG_PAY_METHODS_F
	WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND ORG_PAYMENT_METHOD_ID = PartyPayMethodsE0.PARENT_ORG_PAY_METHOD_ID
	) RES_ORGANIZATION_PAYMENT_MET_0
,TO_CHAR(PartyPayMethodsE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT PAYMENT_TYPE_NAME
    FROM PAY_PAYMENT_TYPES_VL
    WHERE /*LANGUAGE = USERENV('LANG')
    AND*/ BASE_PAYMENT_TYPE_ID = PartyPayMethodsE0.PAYMENT_TYPE_ID
	AND LEGISLATION_CODE = leGrpsE0.LEGISLATION_CODE
    ) RES_PAYMENT_TYPE
,PartyPayMethodsE0.CURRENCY_CODE RES_CURRENCY
,DECODE(PartyPayMethodsE0.ROLLUP_PAYMENT_FLAG,'Y','Yes','No') RES_EXCLUDE_FROM_THIRD_PARTY_P
,DECODE(PartyPayMethodsE0.PAYMENT_REFERENCE_FLAG,'Y','Yes','No') RES_SEPARATE_WORKER_PAYMENTS_B
,(SELECT DEFINITION_NAME
    FROM PAY_TIME_DEFINITIONS
    WHERE TIME_DEFINITION_ID = PartyPayMethodsE0.TIME_DEFINITION_ID
    ) RES_TIME_DEFINITION
,PartyPayMethodsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,PartyPayMethodsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,PartyPayMethodsE0.CREATED_BY RSC_CREATED_BY
,PartyPayMethodsE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PAY_ORG_PAY_METHODS_F PartyPayMethodsE0
,PER_LEGISLATIVE_DATA_GROUPS_VL leGrpsE0
WHERE SYSDATE BETWEEN PartyPayMethodsE0.EFFECTIVE_START_DATE AND PartyPayMethodsE0.EFFECTIVE_END_DATE
AND PartyPayMethodsE0.THIRD_PARTY_FLAG = 'Y'
AND PartyPayMethodsE0.LEGISLATIVE_DATA_GROUP_ID = leGrpsE0.LEGISLATIVE_DATA_GROUP_ID
ORDER BY 1,2