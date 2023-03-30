/* ****************************************************************************
 * $Revision: 61060 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-17 09:40:24 +0700 (Fri, 17 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Application%20Tax%20Options%20-%20Application%20Tax%20Options.sql $:
 * $Id: Manage Application Tax Options - Application Tax Options.sql 61060 2017-02-17 02:40:24Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT DECODE(ZxRulesVl.SERVICE_TYPE_CODE,'DET_APPLICABLE_TAXES','Tax Applicability Rules','DET_PLACE_OF_SUPPLY',
	'Place of Supply Rules','DET_DIRECT_RATE','Direct Tax Rate Rules','DET_RECOVERY_RATE','Recovery Rate Rules',
	'DET_TAXABLE_BASIS','Taxable Basis Rules','CALCULATE_TAX_AMOUNTS','Tax Calculation Rules','DET_TAX_RATE',
	'Tax Rate Rules','DET_TAX_REGISTRATION','Tax Registration Rules','DET_TAX_STATUS','Tax Status Rules',
	'DET_DIRECT_RATE_ENF_ACCT','Account-Based Direct Tax Rate Rules','DET_DIRECT_RATE_STCC',
	'Tax Classification-Based Direct Tax Rate Rules') RES_TAX_RULE_TYPE
,ZFPOMV.PARTY_NAME RES_CONFIGURATION_OWNER
,ZxRulesVl.TAX_RULE_CODE RES_RULE_CODE
,ZxRulesVl.TAX_RULE_NAME RES_RULE_NAME
,ZxRulesVl.TAX_REGIME_CODE RES_TAX_REGIME_CODE
,TO_CHAR(ZxRulesVl.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(ZxRulesVl.EFFECTIVE_TO,'DD-Mon-YYYY') RES_END_DATE
,ZxRulesVl.TAX RES_TAX
,ZxRulesVl.TAX_LAW_REF_CODE RES_TAX_LAW_REFERENCE
,ZxRulesVl.TAX_LAW_REF_DESC RES_DESCRIPTION
,ZxRulesVl.RECOVERY_TYPE_CODE RES_RECOVERY_TYPE_CODE
,ZxRulesVl.TAX_STATUS_CODE RES_TAX_STATUS_CODE
,NVL(
	(SELECT e.NAME
	FROM zx_evnt_cls_mappings b
	,fnd_application_vl cf
	,XLA_EVENT_CLASSES_VL e
	WHERE cf.application_id      = b.application_id
	AND b.EVENT_CLASS_CODE       = e.EVENT_CLASS_CODE
	AND b.ENTITY_CODE            = e.ENTITY_CODE
	AND b.APPLICATION_ID         = e.APPLICATION_ID
	AND b.EVENT_CLASS_MAPPING_ID = ZxRulesVl.EVENT_CLASS_MAPPING_ID
	AND ROWNUM                  <= 1
	),(SELECT d.TAX_EVENT_CLASS_NAME
	FROM zx_event_classes_vl d
	WHERE d.TAX_event_class_code = ZxRulesVl.TAX_EVENT_CLASS_CODE
	AND ROWNUM                  <= 1
	)) RES_EVENT_CLASS
,DECODE(ZxRulesVl.GEOGRAPHY_ID,NULL,'No','Yes') RES_SET_AS_GEOGRAPHY_SPECIFIC_
,FndLocation.MEANING RES_LOCATION_TYPE
,(SELECT GEOGRAPHY_NAME
	FROM HZ_GEOGRAPHIES
	WHERE GEOGRAPHY_ID = GeoHiererchy.PARENT_ID
	) RES_PARENT_GEOGRAPHY_TYPE
,(
	CASE
		WHEN GeoHiererchy.PARENT_ID IS NOT NULL
		THEN
			(SELECT ParentGeography.GEOGRAPHY_NAME
			FROM HZ_GEOGRAPHIES ParentGeography
			WHERE GeoHiererchy.PARENT_ID = ParentGeography.GEOGRAPHY_ID
			)
		ELSE NULL
	END) RES_PARENT_GEOGRAPHY_NAME
,(SELECT GEOGRAPHY_NAME
	FROM HZ_GEOGRAPHIES
	WHERE GEOGRAPHY_ID = ZxRulesVl.GEOGRAPHY_ID
	) RES_GEOGRAPHY_TYPE
,Geography.GEOGRAPHY_NAME RES_GEOGRAPHY_NAME
,ZxRulesVl.DET_FACTOR_TEMPL_CODE RES_TAX_DETERMINING_FACTOR_SET
,ZxDetFactorTemplVl.DET_FACTOR_TEMPL_NAME RES_TAX_DETERMINING_FACTOR_S_0
,(SELECT NAME
	FROM GL_LEDGERS
	WHERE LEDGER_ID = ZxDetFactorTemplVl.LEDGER_ID
	) RES_TAX_DETERMINING_FACTOR_S_1
,ZxRulesVl.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ZxRulesVl.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ZxRulesVl.CREATED_BY RSC_CREATED_BY
,ZxRulesVl.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,(CASE
	WHEN ZFPOMV.PARTY_TYPE_CODE = 'OU' THEN
		ZFPOMV.BU_ID
	END) RSC_BUSINESS_UNIT_ID
,(CASE
	WHEN ZFPOMV.PARTY_TYPE_CODE = 'FIRST_PARTY' THEN
		ZFPOMV.LEGAL_ENTITY_ID
	END) RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_RULES_VL ZxRulesVl
,ZX_FIRST_PARTY_ORGS_MOAC_V ZFPOMV
,ZX_REGIMES_VL ZxRegimesVl
,HZ_HIERARCHY_NODES GeoHiererchy
,HZ_GEOGRAPHIES Geography
,FND_LOOKUPS FndLocation
,ZX_DET_FACTOR_TEMPL_VL ZxDetFactorTemplVl
WHERE ZxRegimesVl.TAX_REGIME_CODE         = ZxRulesVl.TAX_REGIME_CODE
AND ZxRulesVl.CONTENT_OWNER_ID            = ZFPOMV.PARTY_TAX_PROFILE_ID
AND NVL(ZxRegimesVl.REGIME_TYPE_FLAG,'I') = 'I'
AND ZxRulesVl.SERVICE_TYPE_CODE NOT      IN('DET_DIRECT_RATE_ENF_ACCT','DET_DIRECT_RATE_STCC','DET_TAX_BOX')
AND FndLocation.LOOKUP_TYPE(+)            = 'ZX_PLACE_OF_SUPPLY_TYPE'
AND ZxRulesVl.DETERMINING_FACTOR_CQ_CODE  = FndLocation.LOOKUP_CODE(+)
AND GeoHiererchy.LEVEL_NUMBER(+)          = 1
AND GeoHiererchy.HIERARCHY_TYPE(+)        = 'MASTER_REF'
AND ZxRulesVl.GEOGRAPHY_ID                = GeoHiererchy.CHILD_ID(+)
AND ZxRulesVl.GEOGRAPHY_TYPE              = GeoHiererchy.CHILD_OBJECT_TYPE(+)
AND ZxRulesVl.GEOGRAPHY_ID                = Geography.GEOGRAPHY_ID(+)
AND ZxRulesVl.DET_FACTOR_TEMPL_CODE       = ZxDetFactorTemplVl.DET_FACTOR_TEMPL_CODE(+)
ORDER BY 1,2,3