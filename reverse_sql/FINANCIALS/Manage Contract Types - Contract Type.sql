/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Contract%20Types%20-%20Contract%20Type.sql $:
 * $Id: Manage Contract Types - Contract Type.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 -- RSC_PREREQUISITE_OBJECTS=OKC_CONTRACT_TYPES_VL
 
SELECT (SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.CONTRACT_CLASS
	AND LOOKUP_TYPE = 'OKC_CONTRACT_CLASS' 
	) 	RES_CLASS
,(SELECT SET_NAME 
	FROM fusion.FND_SETID_SETS_VL 
	WHERE SET_ID =  okcContactTPYEsEO.SET_ID
	) RES_SET
,okcContactTPYEsEO.NAME	RES_NAME
,okcContactTPYEsEO.DESCRIPTION	RES_DESCRIPTION
,okcContactTPYEsEO.CHR_TYPE	RES_CODE
,TO_CHAR(okcContactTPYEsEO.START_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(okcContactTPYEsEO.END_DATE,'DD-Mon-YYYY') RES_END_DATE
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.LINE_CLASS
	AND LOOKUP_TYPE = 'ORA_OKC_LINE_CLASS' 
	)  RES_LINE_CLASS 
,DECODE(okcContactTPYEsEO.ALLOW_LINES_FLAG,'Y','Yes','No')	RES_ALLOW_LINES
,DECODE(okcContactTPYEsEO.PRICE_DURING_BILLING_YN,'Y','Yes','No') RES_ALLOW_PRICING_DURING_BILLI
,DECODE(okcContactTPYEsEO.LINE_AUTONUMBER_ENABLED_FLAG,'Y','Yes','No') RES_ENABLE_AUTOMATIC_LINE_NUMB
,DECODE(okcContactTPYEsEO.SIGNATURE_REQUIRED_FLAG,'Y','Yes','No') RES_REQUIRES_SIGNATURE
,DECODE(okcContactTPYEsEO.CONTRACT_MODIFIER_FLAG,'Y','Yes','No') RES_ENABLE_CONTRACT_MODIFIERS
,okcContactTPYEsEO.PRICING_SYSTEM_CODE RES_PRICING_INTEGRATION
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.INTENT
	AND LOOKUP_TYPE = 'OKC_SETUP_INTENT' 
	)  RES_INTENT 
/*,(CASE
		WHEN (SELECT COUNT(*) FROM OKC_CONTRACT_TYPE_PARTIES 
				WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND OWNER_CONTACT_ROLE = 'BUYER' ) >= 1 
		THEN (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'Y'
						AND EXTERNAL_ROLE_FLAG = 'N')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE')
		ELSE
			 (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'N'
						AND EXTERNAL_ROLE_FLAG = 'Y')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE' )
						END) RES_BUYER_ROLE
,(CASE
		WHEN (SELECT COUNT(*) FROM OKC_CONTRACT_TYPE_PARTIES 
				WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND OWNER_CONTACT_ROLE = 'BUYER' ) >= 1 
		THEN (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'N'
						AND EXTERNAL_ROLE_FLAG = 'Y')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE')
		ELSE
			 (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'Y'
						AND EXTERNAL_ROLE_FLAG = 'N')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE' )
						END) RES_SELLER_ROLE*/

,(CASE
		WHEN okcContactTPYEsEO.INTENT = 'B'
		THEN (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'Y'
						AND EXTERNAL_ROLE_FLAG = 'N')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE')
		ELSE
			 (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'N'
						AND EXTERNAL_ROLE_FLAG = 'Y')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE' )
						END) RES_BUYER_ROLE
,(CASE
		WHEN okcContactTPYEsEO.INTENT = 'B'
		THEN (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'N'
						AND EXTERNAL_ROLE_FLAG = 'Y')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE')
		ELSE
			 (SELECT MEANING FROM FND_LOOKUPS 
				WHERE LOOKUP_CODE = (SELECT PARTY_ROLE_CODE FROM OKC_CONTRACT_TYPE_PARTIES 
					WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID AND INTERNAL_ROLE_FLAG = 'Y'
						AND EXTERNAL_ROLE_FLAG = 'N')
						AND LOOKUP_TYPE = 'OKC_PARTY_ROLE' )
						END) RES_SELLER_ROLE
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = (SELECT OWNER_CONTACT_ROLE 
		FROM OKC_CONTRACT_TYPE_PARTIES 
		WHERE CONTRACT_TYPE_ID = okcContactTPYEsEO.CONTRACT_TYPE_ID 
		AND OWNER_CONTACT_ROLE IS NOT NULL)
	AND LOOKUP_TYPE = 'OKC_PARTY_CONTACT_ROLE' ) RES_CONTRACT_OWNER_ROLE
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.PRIMARY_BUYER_ROLE
	AND LOOKUP_TYPE = 'OKC_PARTY_CONTACT_ROLE' 
	)  RES_BUYER_CONTACT_ROLE
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.REQUESTER_CONTACT_ROLE
	AND LOOKUP_TYPE = 'OKC_PARTY_CONTACT_ROLE' 
	)   RES_REQUESTER_CONTACT_ROLE
,okcContactTPYEsEO.CONTRACT_LAYOUT_TEMPLATE RES_CONTRACT_LAYOUT_TEMPLATE 
,okcContactTPYEsEO.TERMS_LAYOUT_TEMPLATE RES_TERMS_LAYOUT_TEMPLATE 
,DECODE(okcContactTPYEsEO.NOTIFY_BEFORE_EXP_FLAG,'Y','Yes','No') RES_NOTIFY_BEFORE_EXPIRATION 
,TO_CHAR(okcContactTPYEsEO.DAYS_TO_EXPIRATION) RES_DAYS_TO_EXPIRATION 
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.NOTIFY_CONTACT_ROLE
	AND LOOKUP_TYPE = 'OKC_PARTY_CONTACT_ROLE' 
	)   RES_CONTACT_ROLE_TO_BE_NOTIFIE 
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.CONTRACT_NUMB_METHOD
	AND LOOKUP_TYPE = 'OKC_BU_INV_NUMB_METHOD' 
	)   RES_CONTRACT_NUMBERING_METHOD  
,(SELECT MEANING 
	FROM FND_LOOKUPS 
	WHERE LOOKUP_CODE = okcContactTPYEsEO.CONTRACT_NUMB_LEVEL
	AND LOOKUP_TYPE = 'OKC_NUMBERING_LEVEL' 
	)  RES_CONTRACT_NUMBERING_LEVEL  
,(SELECT NAME
	FROM FND_DOC_SEQUENCE_CATEGORIES
	WHERE CODE = okcContactTPYEsEO.CONTRACT_NUMB_SEQ_CAT
	) RES_CONTRACT_SEQUENCE_CATEGORY 
,okcContactTPYEsEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,okcContactTPYEsEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,okcContactTPYEsEO.CREATED_BY RSC_CREATED_BY
,okcContactTPYEsEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM OKC_CONTRACT_TYPES_VL okcContactTPYEsEO
ORDER BY okcContactTPYEsEO.NAME