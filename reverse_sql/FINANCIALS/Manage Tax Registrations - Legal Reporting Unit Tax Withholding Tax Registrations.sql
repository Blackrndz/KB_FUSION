/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT (SELECT XleEntityProfiles.NAME
	FROM XLE_ENTITY_PROFILES XleEntityProfiles
	,XLE_ETB_PROFILES XleEtbProfiles
	WHERE xleetbprofiles.legal_entity_id          = xleentityprofiles.legal_entity_id
	AND xleentityprofiles.transacting_entity_flag = 'Y'
	AND ZxPartyTaxProfile.PARTY_ID                = XleEtbProfiles.PARTY_ID
	) RES_LEGAL_ENTITY
,(SELECT XleEtbProfiles.Name
	FROM XLE_ETB_PROFILES XleEtbProfiles
	WHERE ZxPartyTaxProfile.PARTY_ID = XleEtbProfiles.PARTY_ID
	) RES_LEGAL_REPORTING_UNIT
--,ZxPartyTaxProfile.REP_REGISTRATION_NUMBER RES_TAX_REGISTRATION_NUMBER
,ZxPartyTaxRegistration.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,ZxPartyTaxRegistration.TAX RES_TAX
,ZxPartyTaxRegistration.TAX_JURISDICTION_CODE RES_TAX_JURISDICTION_CODE
,ZxPartyTaxRegistration.TAX_REGIME_CODE RES_TAX_REGIME_NAME
,ZxPartyTaxRegistration.TAX RES_TAX_NAME
,ZxPartyTaxRegistration.TAX_JURISDICTION_CODE RES_TAX_JURISDICTION_NAME
,(SELECT LookupPEO.MEANING
	FROM FND_LOOKUPS LookupPEO
	WHERE LookupPEO.LOOKUP_TYPE = 'ZX_REGISTRATIONS_TYPE'
	AND LookupPEO.LOOKUP_CODE   = ZxPartyTaxRegistration.REGISTRATION_TYPE_CODE
	) RES_TAX_REGISTRATION_TYPE
,ZxPartyTaxRegistration.REP_PARTY_TAX_NAME RES_COMPANY_REPORTING_NAME
,hz_format_pub.format_address(ZxPartyTaxRegistration.LEGAL_LOCATION_ID,NULL,NULL,'/',NULL,NULL,NULL,NULL)
	RES_LEGAL_REGISTRATION_ADDRESS
,ZxPartyTaxRegistration.VALIDATION_TYPE RES_VALIDATION_TYPE
,(SELECT MEANING	
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ZX_VALIDATION_LEVEL'
	AND LOOKUP_CODE = ZxPartyTaxRegistration.VALIDATION_LEVEL
	) RES_VALIDATION_LEVEL
,(SELECT MEANING	
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ZX_UNIQUENESS_VALIDATION_LVL'
	AND LOOKUP_CODE = ZxPartyTaxRegistration.UNIQUENESS_VALIDATION_LEVEL 
	) RES_DUPLICATE_VALIDATION_LEVEL
,ZxPartyTaxRegistration.REGISTRATION_NUMBER RES_REGISTRATION_NUMBER
,IssuingTaxAuthority.PARTY_NAME RES_ISSUING_TAX_AUTHORITY
,(SELECT LookupPEO.MEANING
	FROM FND_LOOKUPS LookupPEO
	WHERE LookupPEO.LOOKUP_TYPE = 'ZX_REGISTRATIONS_STATUS'
	AND LookupPEO.LOOKUP_CODE   = ZxPartyTaxRegistration.REGISTRATION_STATUS_CODE
	) RES_TAX_REGISTRATION_STATUS
,(SELECT LookupPEO.MEANING
	FROM FND_LOOKUPS LookupPEO
	WHERE LookupPEO.LOOKUP_TYPE = 'ZX_REGISTRATIONS_REASON'
	AND LookupPEO.LOOKUP_CODE   = ZxPartyTaxRegistration.REGISTRATION_REASON_CODE
	) RES_TAX_REGISTRATION_REASON
,TO_CHAR(ZxPartyTaxRegistration.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(ZxPartyTaxRegistration.EFFECTIVE_TO,'DD-Mon-YYYY') RES_END_DATE
,(SELECT meaning
	FROM FND_LOOKUPS
	WHERE lookup_type = 'ZX_REGISTRATIONS_SOURCE'
	AND lookup_code   = ZxPartyTaxRegistration.REGISTRATION_SOURCE_CODE
	) RES_SOURCE
,zxpartytaxregistration.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,zxpartytaxregistration.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,zxpartytaxregistration.CREATED_BY RSC_CREATED_BY
,zxpartytaxregistration.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,(SELECT LEGAL_ENTITY_ID
	FROM XLE_ETB_PROFILES
	WHERE PARTY_ID = ZxPartyTaxProfile.PARTY_ID
	) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_PARTY_TAX_PROFILE ZxPartyTaxProfile
,ZX_REGISTRATIONS ZxPartyTaxRegistration
,(SELECT ZxPartyTaxProfile.PARTY_TAX_PROFILE_ID
	,PTY.PARTY_NAME
	FROM ZX_PARTY_TAX_PROFILE ZxPartyTaxProfile
	,HZ_PARTIES PTY
	,FND_LOOKUPS Lkup
	WHERE ZxPartyTaxProfile.PARTY_TYPE_CODE = 'TAX_AUTHORITY'
	AND ZxPartyTaxProfile.PARTY_ID          = PTY.PARTY_ID
	AND Lkup.LOOKUP_TYPE                    = 'ZX_AUTH_CLASSIF'
	AND Lkup.LOOKUP_CODE                    =(DECODE(ZxPartyTaxProfile.COLLECTING_AUTHORITY_FLAG,'Y','C') || DECODE(
		ZxPartyTaxProfile.REPORTING_AUTHORITY_FLAG,'Y','R'))
	) IssuingTaxAuthority
,(SELECT ZxPartyTaxProfile.PARTY_TAX_PROFILE_ID
	,PTY.PARTY_NAME
	FROM ZX_PARTY_TAX_PROFILE ZxPartyTaxProfile
	,HZ_PARTIES PTY
	,FND_LOOKUPS Lkup
	WHERE ZxPartyTaxProfile.PARTY_TYPE_CODE = 'TAX_AUTHORITY'
	AND ZxPartyTaxProfile.PARTY_ID          = PTY.PARTY_ID
	AND Lkup.LOOKUP_TYPE                    = 'ZX_AUTH_CLASSIF'
	AND Lkup.LOOKUP_CODE                    =(DECODE(ZxPartyTaxProfile.COLLECTING_AUTHORITY_FLAG,'Y','C') || DECODE(
		ZxPartyTaxProfile.REPORTING_AUTHORITY_FLAG,'Y','R'))
	) ReportingTaxAuthority
,(SELECT ZxPartyTaxProfile.PARTY_TAX_PROFILE_ID
	,PTY.PARTY_NAME
	FROM ZX_PARTY_TAX_PROFILE ZxPartyTaxProfile
	,HZ_PARTIES PTY
	,FND_LOOKUPS Lkup
	WHERE ZxPartyTaxProfile.PARTY_TYPE_CODE = 'TAX_AUTHORITY'
	AND ZxPartyTaxProfile.PARTY_ID          = PTY.PARTY_ID
	AND Lkup.LOOKUP_TYPE                    = 'ZX_AUTH_CLASSIF'
	AND Lkup.LOOKUP_CODE                    =(DECODE(ZxPartyTaxProfile.COLLECTING_AUTHORITY_FLAG,'Y','C') || DECODE(
		ZxPartyTaxProfile.REPORTING_AUTHORITY_FLAG,'Y','R'))
	) CollectingTaxAuthority
WHERE(((UPPER(((
	CASE
		WHEN ZxPartyTaxProfile.PARTY_TYPE_CODE = 'LEGAL_ESTABLISHMENT'
		THEN
			(SELECT XleEntityProfiles.NAME
			FROM XLE_ENTITY_PROFILES XleEntityProfiles
			,XLE_ETB_PROFILES XleEtbProfiles
			WHERE xleetbprofiles.legal_entity_id          = xleentityprofiles.legal_entity_id
			AND xleentityprofiles.transacting_entity_flag = 'Y'
			AND ZxPartyTaxProfile.PARTY_ID                = XleEtbProfiles.PARTY_ID
			)
	END))) LIKE '%')))
AND ZxPartyTaxProfile.PARTY_TAX_PROFILE_ID       = ZxPartyTaxRegistration.PARTY_TAX_PROFILE_ID
AND zxpartytaxregistration.TAX_AUTHORITY_ID      = IssuingTaxAuthority.PARTY_TAX_PROFILE_ID(+)
AND zxpartytaxregistration.REP_TAX_AUTHORITY_ID  = ReportingTaxAuthority.PARTY_TAX_PROFILE_ID(+)
AND zxpartytaxregistration.COLL_TAX_AUTHORITY_ID = CollectingTaxAuthority.PARTY_TAX_PROFILE_ID(+)
AND(((((SELECT NVL(ZxRegimesVl.Regime_type_flag,'I')
	FROM ZX_REGIMES_VL ZxRegimesVl
	WHERE ZxPartyTaxRegistration.TAX_REGIME_CODE = ZxRegimesVl.TAX_REGIME_CODE
	AND rownum                                   = 1)) = 'W')))
ORDER BY RES_LEGAL_REPORTING_UNIT
,RES_TAX_REGIME_CODE