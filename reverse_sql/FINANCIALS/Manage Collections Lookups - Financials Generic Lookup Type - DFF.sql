/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Position%20Lookups%20-%20Lookup%20Codes%20-%20DFF.sql $:
 * $Id: Manage Position Lookups - Lookup Codes - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
  
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=0##RES##FND_LOOKUP_VALUES_B
-- DFF_ATTRIBUTES=ATTRIBUTE

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

SELECT LookupTypeEO.LOOKUP_TYPE RES_LOOKUP_TYPE
,LOOKUPEO.LOOKUP_CODE RES_LOOKUP_CODE
,SetIdSetPEO.SET_NAME RES_REFERENCE_DATA_SET
,LOOKUPEO.DISPLAY_SEQUENCE RES_DISPLAY_SEQUENCE
,LOOKUPEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,LOOKUPEO.ATTRIBUTE1 
,LOOKUPEO.ATTRIBUTE2
,LOOKUPEO.ATTRIBUTE3
,LOOKUPEO.ATTRIBUTE4
,LOOKUPEO.ATTRIBUTE5
,LOOKUPEO.ATTRIBUTE6
,LOOKUPEO.ATTRIBUTE7
,LOOKUPEO.ATTRIBUTE8
,LOOKUPEO.ATTRIBUTE9
,LOOKUPEO.ATTRIBUTE10
,LOOKUPEO.ATTRIBUTE11
,LOOKUPEO.ATTRIBUTE12
,LOOKUPEO.ATTRIBUTE13
,LOOKUPEO.ATTRIBUTE14
,LOOKUPEO.ATTRIBUTE15
,LOOKUPEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,LOOKUPEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,LOOKUPEO.CREATED_BY RSC_CREATED_BY
,LOOKUPEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_LOOKUP_TYPES_VL LookupTypeEO
,FND_LOOKUP_VALUES_VL LOOKUPEO
,FND_SETID_SETS_VL SetIdSetPEO 
WHERE LOOKUPTYPEEO.LOOKUP_TYPE  = LOOKUPEO.LOOKUP_TYPE
AND LOOKUPEO.set_id  = SetIdSetPEO.set_id
AND (LookupTypeEO.MODULE_ID    IN
	(SELECT rf.child_module_id
	FROM fnd_appl_taxonomy_rf rf
	,fnd_appl_taxonomy at
	WHERE at.module_type = 'APPLICATION'
	AND at.module_key    = 'IEX'
	AND at.module_id     = rf.ancestor_module_id
	))
AND (LOOKUPEO.ATTRIBUTE_CATEGORY IS NOT NULL OR
LOOKUPEO.ATTRIBUTE1 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE2 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE3 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE4 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE5 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE6 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE7 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE8 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE9 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE10 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE11 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE12 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE13 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE14 IS NOT NULL OR 
LOOKUPEO.ATTRIBUTE15 IS NOT NULL)
ORDER BY LOOKUPTYPEEO.LOOKUP_TYPE
,LOOKUPEO.LOOKUP_CODE
,LookupEO.DISPLAY_SEQUENCE