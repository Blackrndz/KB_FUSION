/* ****************************************************************************
* $Revision: 80146 $:
* $Author: tanawat.wongjan $:
* $Date: 2023-02-10 17:05:41 +0700 (Fri, 10 Feb 2023) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/
FINANCIALS/Manage%20Locations%20(United%20States)%20-%20Manage%20Locations.sql $:
* $Id: Manage Locations - Puerto Rico Details - DFF.sql 80146 2023-02-10 10:05:41Z tanawat.wongjan $:
* ****************************************************************************
* Description:
* ************************************************************************** */
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=800##RES##PER_LOCATIONS_DF
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE
-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

SELECT Head.location_name RES_NAME
,HEAD.INTERNAL_LOCATION_CODE RES_CODE
,HEAD.SET_NAME RES_LOCATION_SET
,TO_CHAR(HEAD.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,HEAD.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,HEAD.ATTRIBUTE1
,HEAD.ATTRIBUTE2
,HEAD.ATTRIBUTE3
,HEAD.ATTRIBUTE4
,HEAD.ATTRIBUTE5
,HEAD.ATTRIBUTE6
,HEAD.ATTRIBUTE7
,HEAD.ATTRIBUTE8
,HEAD.ATTRIBUTE9
,HEAD.ATTRIBUTE10
,HEAD.ATTRIBUTE11
,HEAD.ATTRIBUTE12
,HEAD.ATTRIBUTE13
,HEAD.ATTRIBUTE14
,HEAD.ATTRIBUTE15
,HEAD.ATTRIBUTE16
,HEAD.ATTRIBUTE17
,HEAD.ATTRIBUTE18
,HEAD.ATTRIBUTE19
,HEAD.ATTRIBUTE20
,HEAD.ATTRIBUTE21
,HEAD.ATTRIBUTE22
,HEAD.ATTRIBUTE23
,HEAD.ATTRIBUTE24
,HEAD.ATTRIBUTE25
,HEAD.ATTRIBUTE26
,HEAD.ATTRIBUTE27
,HEAD.ATTRIBUTE28
,HEAD.ATTRIBUTE29
,HEAD.ATTRIBUTE30
,HEAD.ATTRIBUTE_NUMBER1
,HEAD.ATTRIBUTE_NUMBER2
,HEAD.ATTRIBUTE_NUMBER3
,HEAD.ATTRIBUTE_NUMBER4
,HEAD.ATTRIBUTE_NUMBER5
,HEAD.ATTRIBUTE_NUMBER6
,HEAD.ATTRIBUTE_NUMBER7
,HEAD.ATTRIBUTE_NUMBER8
,HEAD.ATTRIBUTE_NUMBER9
,HEAD.ATTRIBUTE_NUMBER10
,HEAD.ATTRIBUTE_NUMBER11
,HEAD.ATTRIBUTE_NUMBER12
,HEAD.ATTRIBUTE_NUMBER13
,HEAD.ATTRIBUTE_NUMBER14
,HEAD.ATTRIBUTE_NUMBER15
,HEAD.ATTRIBUTE_NUMBER16
,HEAD.ATTRIBUTE_NUMBER17
,HEAD.ATTRIBUTE_NUMBER18
,HEAD.ATTRIBUTE_NUMBER19
,HEAD.ATTRIBUTE_NUMBER20
, TO_CHAR(HEAD.ATTRIBUTE_DATE1, 'DD-Mon-YYYY') ATTRIBUTE_DATE1
, TO_CHAR(HEAD.ATTRIBUTE_DATE2, 'DD-Mon-YYYY') ATTRIBUTE_DATE2
, TO_CHAR(HEAD.ATTRIBUTE_DATE3, 'DD-Mon-YYYY') ATTRIBUTE_DATE3
, TO_CHAR(HEAD.ATTRIBUTE_DATE4, 'DD-Mon-YYYY') ATTRIBUTE_DATE4
, TO_CHAR(HEAD.ATTRIBUTE_DATE5, 'DD-Mon-YYYY') ATTRIBUTE_DATE5
, TO_CHAR(HEAD.ATTRIBUTE_DATE6, 'DD-Mon-YYYY') ATTRIBUTE_DATE6
, TO_CHAR(HEAD.ATTRIBUTE_DATE7, 'DD-Mon-YYYY') ATTRIBUTE_DATE7
, TO_CHAR(HEAD.ATTRIBUTE_DATE8, 'DD-Mon-YYYY') ATTRIBUTE_DATE8
, TO_CHAR(HEAD.ATTRIBUTE_DATE9, 'DD-Mon-YYYY') ATTRIBUTE_DATE9
, TO_CHAR(HEAD.ATTRIBUTE_DATE10, 'DD-Mon-YYYY') ATTRIBUTE_DATE10
, TO_CHAR(HEAD.ATTRIBUTE_DATE11, 'DD-Mon-YYYY') ATTRIBUTE_DATE11
, TO_CHAR(HEAD.ATTRIBUTE_DATE12, 'DD-Mon-YYYY') ATTRIBUTE_DATE12
, TO_CHAR(HEAD.ATTRIBUTE_DATE13, 'DD-Mon-YYYY') ATTRIBUTE_DATE13
, TO_CHAR(HEAD.ATTRIBUTE_DATE14, 'DD-Mon-YYYY') ATTRIBUTE_DATE14
, TO_CHAR(HEAD.ATTRIBUTE_DATE15, 'DD-Mon-YYYY') ATTRIBUTE_DATE15
,Head.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,Head.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,Head.CREATED_BY RSC_CREATED_BY
,Head.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
, NULL RSC_ORGANIZATION_ID
, NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT LocationEO.INTERNAL_LOCATION_CODE
	,LocationEO.LOCATION_ID
	,AddressDPEO.COUNTRY
	,SetIdSetPEO.SET_NAME
	--,LocationDetailTranslationDEO.location_code CODE
	,LocationDetailTranslationDEO.location_name
	, LocationDetailDEO.INVENTORY_ORGANIZATION_ID
	,LocationDetailDEO.ATTRIBUTE_CATEGORY
	,LocationDetailDEO.ATTRIBUTE1
	,LocationDetailDEO.ATTRIBUTE2
	,LocationDetailDEO.ATTRIBUTE3
	,LocationDetailDEO.ATTRIBUTE4
	,LocationDetailDEO.ATTRIBUTE5
	,LocationDetailDEO.ATTRIBUTE6
	,LocationDetailDEO.ATTRIBUTE7
	,LocationDetailDEO.ATTRIBUTE8
	,LocationDetailDEO.ATTRIBUTE9
	,LocationDetailDEO.ATTRIBUTE10
	,LocationDetailDEO.ATTRIBUTE11
	,LocationDetailDEO.ATTRIBUTE12
	,LocationDetailDEO.ATTRIBUTE13
	,LocationDetailDEO.ATTRIBUTE14
	,LocationDetailDEO.ATTRIBUTE15
	,LocationDetailDEO.ATTRIBUTE16
	,LocationDetailDEO.ATTRIBUTE17
	,LocationDetailDEO.ATTRIBUTE18
	,LocationDetailDEO.ATTRIBUTE19
	,LocationDetailDEO.ATTRIBUTE20
	,LocationDetailDEO.ATTRIBUTE21
	,LocationDetailDEO.ATTRIBUTE22
	,LocationDetailDEO.ATTRIBUTE23
	,LocationDetailDEO.ATTRIBUTE24
	,LocationDetailDEO.ATTRIBUTE25
	,LocationDetailDEO.ATTRIBUTE26
	,LocationDetailDEO.ATTRIBUTE27
	,LocationDetailDEO.ATTRIBUTE28
	,LocationDetailDEO.ATTRIBUTE29
	,LocationDetailDEO.ATTRIBUTE30
	,LocationDetailDEO.ATTRIBUTE_NUMBER1
	,LocationDetailDEO.ATTRIBUTE_NUMBER2
	,LocationDetailDEO.ATTRIBUTE_NUMBER3
	,LocationDetailDEO.ATTRIBUTE_NUMBER4
	,LocationDetailDEO.ATTRIBUTE_NUMBER5
	,LocationDetailDEO.ATTRIBUTE_NUMBER6
	,LocationDetailDEO.ATTRIBUTE_NUMBER7
	,LocationDetailDEO.ATTRIBUTE_NUMBER8
	,LocationDetailDEO.ATTRIBUTE_NUMBER9
	,LocationDetailDEO.ATTRIBUTE_NUMBER10
	,LocationDetailDEO.ATTRIBUTE_NUMBER11
	,LocationDetailDEO.ATTRIBUTE_NUMBER12
	,LocationDetailDEO.ATTRIBUTE_NUMBER13
	,LocationDetailDEO.ATTRIBUTE_NUMBER14
	,LocationDetailDEO.ATTRIBUTE_NUMBER15
	,LocationDetailDEO.ATTRIBUTE_NUMBER16
	,LocationDetailDEO.ATTRIBUTE_NUMBER17
	,LocationDetailDEO.ATTRIBUTE_NUMBER18
	,LocationDetailDEO.ATTRIBUTE_NUMBER19
	,LocationDetailDEO.ATTRIBUTE_NUMBER20
	,LocationDetailDEO.ATTRIBUTE_DATE1
	,LocationDetailDEO.ATTRIBUTE_DATE2
	,LocationDetailDEO.ATTRIBUTE_DATE3
	,LocationDetailDEO.ATTRIBUTE_DATE4
	,LocationDetailDEO.ATTRIBUTE_DATE5
	,LocationDetailDEO.ATTRIBUTE_DATE6
	,LocationDetailDEO.ATTRIBUTE_DATE7
	,LocationDetailDEO.ATTRIBUTE_DATE8
	,LocationDetailDEO.ATTRIBUTE_DATE9
	,LocationDetailDEO.ATTRIBUTE_DATE10
	,LocationDetailDEO.ATTRIBUTE_DATE11
	,LocationDetailDEO.ATTRIBUTE_DATE12
	,LocationDetailDEO.ATTRIBUTE_DATE13
	,LocationDetailDEO.ATTRIBUTE_DATE14
	,LocationDetailDEO.ATTRIBUTE_DATE15
	,LocationDetailDEO.last_updated_by
	,LocationDetailDEO.last_update_date
	,LocationDetailDEO.CREATED_BY
	,LocationDetailDEO.CREATION_DATE
	,LocationDetailDEO.EFFECTIVE_START_DATE
	,LocationDetailDEO.EFFECTIVE_END_DATE
	,LocationDetailDEO.Business_group_id
	FROM fusion.PER_LOCATIONS LocationEO
	,fusion.PER_LOCATION_DETAILS_F LocationDetailDEO
	,fusion.PER_LOCATION_DETAILS_F_TL LocationDetailTranslationDEO
	,fusion.PER_LOC_ADDRESS_USAGES_F LocationAddressUsageDEO
	,fusion.FND_LANGUAGES_VL LanguagePEO
	,fusion.INV_ORGANIZATION_DEFINITIONS_V InventoryOrganization
	,fusion.FND_SETID_SETS_VL SetIdSetPEO
	,fusion.HR_LOCATIONS_ALL_F_VL ShippingLocation
	,fusion.PER_ADDRESSES_F AddressDPEO
	,fusion.FND_TERRITORIES_VL TerritoryPEO
	,fusion.FND_TIMEZONES_VL TimezonePEO
	WHERE(((((((((((LocationEO.LOCATION_ID           = LocationDetailDEO.LOCATION_ID)
	AND((LocationDetailDEO.LOCATION_DETAILS_ID       = LocationDetailTranslationDEO.LOCATION_DETAILS_ID)
	AND(LocationDetailDEO.EFFECTIVE_START_DATE       = LocationDetailTranslationDEO.EFFECTIVE_START_DATE)))
	AND(LocationDetailTranslationDEO.LANGUAGE        = userenv('LANG')))
	AND(LocationEO.LOCATION_ID                       = LocationAddressUsageDEO.LOCATION_ID))
	AND(LanguagePEO.LANGUAGE_CODE (+)                = LocationDetailDEO.OFFICIAL_LANGUAGE_CODE))
	AND(LocationDetailDEO.INVENTORY_ORGANIZATION_ID  = InventoryOrganization.ORGANIZATION_ID(+)))
	AND(LocationEO.SET_ID                            = SetIdSetPEO.SET_ID))
	AND((LocationAddressUsageDEO.ADDRESS_USAGE_TYPE  = 'MAIN')
	AND(LocationAddressUsageDEO.EFFECTIVE_START_DATE = LocationDetailDEO.EFFECTIVE_START_DATE)))
	AND((LocationDetailDEO.SHIP_TO_LOCATION_ID       = ShippingLocation.LOCATION_ID)
	AND(LocationDetailDEO.EFFECTIVE_START_DATE BETWEEN ShippingLocation.EFFECTIVE_START_DATE AND
		ShippingLocation.EFFECTIVE_END_DATE)))
	AND((LocationDetailDEO.MAIN_ADDRESS_ID     = AddressDPEO.ADDRESS_ID)
	AND(LocationDetailDEO.EFFECTIVE_START_DATE = AddressDPEO.EFFECTIVE_START_DATE)))
	AND(TerritoryPEO.TERRITORY_CODE            = AddressDPEO.COUNTRY))
	AND(AddressDPEO.TIMEZONE_CODE              = TimezonePEO.TIMEZONE_CODE(+))
	--AND SYSDATE BETWEEN LocationDetailDEO.EFFECTIVE_START_DATE AND LocationDetailDEO.EFFECTIVE_END_DATE
	AND AddressDPEO.country               = 'PR'
	) HEAD
WHERE(HEAD.ATTRIBUTE_CATEGORY IS NOT NULL
OR HEAD.ATTRIBUTE1            IS NOT NULL
OR HEAD.ATTRIBUTE2            IS NOT NULL
OR HEAD.ATTRIBUTE3            IS NOT NULL
OR HEAD.ATTRIBUTE4            IS NOT NULL
OR HEAD.ATTRIBUTE5            IS NOT NULL
OR HEAD.ATTRIBUTE6            IS NOT NULL
OR HEAD.ATTRIBUTE7            IS NOT NULL
OR HEAD.ATTRIBUTE8            IS NOT NULL
OR HEAD.ATTRIBUTE9            IS NOT NULL
OR HEAD.ATTRIBUTE10           IS NOT NULL
OR HEAD.ATTRIBUTE11           IS NOT NULL
OR HEAD.ATTRIBUTE12           IS NOT NULL
OR HEAD.ATTRIBUTE13           IS NOT NULL
OR HEAD.ATTRIBUTE14           IS NOT NULL
OR HEAD.ATTRIBUTE15           IS NOT NULL
OR HEAD.ATTRIBUTE16           IS NOT NULL
OR HEAD.ATTRIBUTE17           IS NOT NULL
OR HEAD.ATTRIBUTE18           IS NOT NULL
OR HEAD.ATTRIBUTE19           IS NOT NULL
OR HEAD.ATTRIBUTE20           IS NOT NULL
OR HEAD.ATTRIBUTE21           IS NOT NULL
OR HEAD.ATTRIBUTE22           IS NOT NULL
OR HEAD.ATTRIBUTE23           IS NOT NULL
OR HEAD.ATTRIBUTE24           IS NOT NULL
OR HEAD.ATTRIBUTE25           IS NOT NULL
OR HEAD.ATTRIBUTE26           IS NOT NULL
OR HEAD.ATTRIBUTE27           IS NOT NULL
OR HEAD.ATTRIBUTE28           IS NOT NULL
OR HEAD.ATTRIBUTE29           IS NOT NULL
OR HEAD.ATTRIBUTE30           IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER1     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER2     IS NOT NULL

OR HEAD.ATTRIBUTE_NUMBER3     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER4     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER5     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER6     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER7     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER8     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER9     IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER10    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER11    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER12    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER13    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER14    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER15    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER16    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER17    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER18    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER19    IS NOT NULL
OR HEAD.ATTRIBUTE_NUMBER20    IS NOT NULL
OR HEAD.ATTRIBUTE_DATE1       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE2       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE3       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE4       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE5       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE6       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE7       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE8       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE9       IS NOT NULL
OR HEAD.ATTRIBUTE_DATE10      IS NOT NULL
OR HEAD.ATTRIBUTE_DATE11      IS NOT NULL
OR HEAD.ATTRIBUTE_DATE12      IS NOT NULL
OR HEAD.ATTRIBUTE_DATE13      IS NOT NULL
OR HEAD.ATTRIBUTE_DATE14      IS NOT NULL
OR HEAD.ATTRIBUTE_DATE15      IS NOT NULL)
ORDER BY Head.location_name 
,HEAD.INTERNAL_LOCATION_CODE
,HEAD.EFFECTIVE_START_DATE