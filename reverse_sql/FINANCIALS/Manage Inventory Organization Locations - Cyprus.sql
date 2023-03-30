/* ****************************************************************************
 * $Revision: 80147 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2023-02-10 17:07:26 +0700 (Fri, 10 Feb 2023) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Inventory%20Organization%20Locations%20-%20Cyprus.sql $:
 * $Id: Manage Inventory Organization Locations - Cyprus.sql 80147 2023-02-10 10:07:26Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=PAY_INSTALLED_LEGISLATIONS
 
SELECT Head.location_name RES_NAME
,Head.INTERNAL_LOCATION_CODE RES_CODE
,Head.SET_NAME RES_LOCATION_SET

,Head.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,Head.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,Head.CREATED_BY RSC_CREATED_BY
,Head.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
, Head.INVENTORY_ORGANIZATION_ID RSC_ORGANIZATION_ID
, NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT LocationDetailTranslationDEO.LOCATION_CODE
	, LocationEO.INTERNAL_LOCATION_CODE
	, LocationDetailDEO.ACTIVE_STATUS
	, SetIdSetPEO.SET_NAME
	, TerritoryPEO.TERRITORY_SHORT_NAME
	, AddressDPEO.TOWN_OR_CITY
	, AddressDPEO.POSTAL_CODE
	, InventoryOrganization.ORGANIZATION_NAME
	, ShippingLocation.LOCATION_CODE AS LOCATION_CODE1
	, LanguagePEO.DESCRIPTION
	, LocationDetailDEO.OFFICE_SITE_FLAG
	, LocationDetailDEO.SHIP_TO_SITE_FLAG
	, LocationDetailDEO.RECEIVING_SITE_FLAG
	, LocationDetailDEO.BILL_TO_SITE_FLAG
	, AddressDPEO.ADDRESS_LINE_1
	, TimezonePEO.NAME
	, AddressDPEO.TIMEZONE_CODE
	, LocationEO.SET_ID
	, LocationDetailDEO.LOCATION_DETAILS_ID
	, LocationDetailTranslationDEO.LANGUAGE
	, LocationEO.LOCATION_ID
	, SetIdSetPEO.SET_ID                               AS SET_ID1
	, LocationDetailTranslationDEO.LOCATION_DETAILS_ID AS LOCATION_DETAILS_ID1
	, LanguagePEO.LANGUAGE_CODE
	, InventoryOrganization.ORGANIZATION_ID
	, LocationEO.LOCATION_IMAGE_URL
	, AddressDPEO.address_line_2
	, AddressDPEO.address_line_3
	, AddressDPEO.region_2
	, LocationDetailDEO.geo_hierarchy_node_id
	, AddressDPEO.COUNTRY
	,(ROWNUM)                      AS MAP_SEQUENCE
	, ShippingLocation.LOCATION_ID AS LOCATION_ID1
	, AddressDPEO.ADDRESS_ID
	, TerritoryPEO.TERRITORY_CODE
	,(AddressDPEO.GEOMETRY.SDO_POINT.X) AS LOC_LONGITUDE
	,(AddressDPEO.GEOMETRY.SDO_POINT.Y) AS LOC_LATITUDE
	, LocationEO.OBJECT_VERSION_NUMBER
	, TimezonePEO.TIMEZONE_CODE AS TIMEZONE_CODE1
	, LocationDetailTranslationDEO.DESCRIPTION DESCRIPTION_LOC
	,ShippingLocation.email_address
	,LocationDetailTranslationDEO.location_code CODE
	,LocationDetailTranslationDEO.location_name
	,ShippingLocation.designated_receiver_id
	,LocationDetailDEO.mainphone_country_code1
	,LocationDetailDEO.mainphone_area_code1
	,LocationDetailDEO.mainphone_subscriber_num1
	,LocationDetailDEO.mainphone_extension1
	,LocationDetailDEO.fax_country_code2
	,LocationDetailDEO.fax_area_code2
	,LocationDetailDEO.fax_subscriber_num2
	,LocationDetailDEO.fax_extension2
	,LocationDetailDEO.otherphone_country_code3
	,LocationDetailDEO.otherphone_area_code3
	,LocationDetailDEO.otherphone_subscriber_num3
	,LocationDetailDEO.otherphone_extension3
	,LocationDetailDEO.ship_to_location_id
	,LocationDetailTranslationDEO.ac_location_code
	,LocationEO.last_updated_by
	,LocationEO.last_update_date
	,LocationEO.CREATED_BY
	,LocationEO.CREATION_DATE
	,LocationDetailDEO.EFFECTIVE_START_DATE
	,LocationDetailDEO.EFFECTIVE_END_DATE
	,LocationDetailDEO.Business_group_id
	,LocationDetailDEO.inventory_organization_id
	,LocationEO.action_occurrence_id
	FROM fusion.PER_LOCATIONS LocationEO
	, fusion.PER_LOCATION_DETAILS_F LocationDetailDEO
	, fusion.PER_LOCATION_DETAILS_F_TL LocationDetailTranslationDEO
	, fusion.PER_LOC_ADDRESS_USAGES_F LocationAddressUsageDEO
	, fusion.FND_LANGUAGES_VL LanguagePEO
	, fusion.INV_ORGANIZATION_DEFINITIONS_V InventoryOrganization
	, fusion.FND_SETID_SETS_VL SetIdSetPEO
	, fusion.HR_LOCATIONS_ALL_F_VL ShippingLocation
	, fusion.PER_ADDRESSES_F AddressDPEO
	, fusion.FND_TERRITORIES_VL TerritoryPEO
	, fusion.FND_TIMEZONES_VL TimezonePEO
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
	AND SYSDATE BETWEEN LocationDetailDEO.EFFECTIVE_START_DATE AND LocationDetailDEO.EFFECTIVE_END_DATE
	) HEAD
,(SELECT AA.location_name
	, CC.location_id
	, CC.EFFECTIVE_START_DATE
	, CC.EFFECTIVE_END_DATE
	,(SELECT INTERNAL_LOCATION_CODE
		FROM PER_LOCATIONS
		WHERE LOCATION_ID = BB.LOCATION_ID) LOCATION_CODE
	FROM fusion.PER_LOCATION_DETAILS_F_TL AA
	,fusion.PER_LOCATION_DETAILS_F BB
	,fusion.PER_LOCATION_DETAILS_F CC
	WHERE AA.location_details_id = BB.location_details_id
	AND BB.location_id           = CC.ship_to_location_id
	AND((CC.EFFECTIVE_START_DATE BETWEEN AA.EFFECTIVE_START_DATE(+) AND AA.EFFECTIVE_END_DATE(+))
	AND(CC.EFFECTIVE_END_DATE BETWEEN AA.EFFECTIVE_START_DATE(+) AND AA.EFFECTIVE_END_DATE(+)))
	AND AA.LANGUAGE = USERENV('LANG')
	) Ship_LOC
WHERE((HEAD.location_id = Ship_LOC.location_id(+))
AND((HEAD.EFFECTIVE_START_DATE BETWEEN Ship_LOC.EFFECTIVE_START_DATE(+) AND Ship_LOC.EFFECTIVE_END_DATE(+))
AND(HEAD.EFFECTIVE_END_DATE BETWEEN Ship_LOC.EFFECTIVE_START_DATE(+) AND Ship_LOC.EFFECTIVE_END_DATE(+))))
AND head.country = 'CY'
ORDER BY RES_NAME
,RES_CODE