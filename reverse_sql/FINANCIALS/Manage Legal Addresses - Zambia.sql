/* ****************************************************************************
 * $Revision: 63805 $:
 * $Author: phermwit.seethong $:
 * $Date: 2017-09-12 15:37:52 +0700 (Tue, 12 Sep 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/trunk/core/reverse_sql/FINANCIALS/Manage%20Legal%20Addresses%20(Thailand)%20-%20Manage%20Legal%20Addresses.sql $:
 * $Id: Manage Legal Addresses (Thailand) - Manage Legal Addresses.sql 63805 2017-09-12 08:37:52Z phermwit.seethong $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


select  QRSLT.TERRITORY_SHORT_NAME RES_COUNTRY
,null RES_LOCATION
,QRSLT.ADDRESS1 RES_ADDRESS_LINE_1
,QRSLT.ADDRESS2  RES_ADDRESS_LINE_2
,QRSLT.ADDRESS3  RES_ADDRESS_LINE_3
,QRSLT.CITY RES_CITY
,QRSLT.STATE RES_STATE
,QRSLT.POSTAL_CODE RES_Postal_Code
,QRSLT.TIMEZONE RES_TIME_ZONE
,QRSLT.LAST_UPDATED_BY   RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE   RSC_LAST_UPDATE_DATE 
,QRSLT.CREATED_BY  RSC_CREATED_BY
,QRSLT.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,legalEntitiesE0.LEGAL_ENTITY_ID RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

from  (select TERRITORYPEO.TERRITORY_SHORT_NAME	
,LOCATIONEO.LOCATION_ID
,hz_format_pub.format_address(p_location_id => LOCATIONEO.LOCATION_ID, p_line_break => ',') Location
,LocationEO.LAST_UPDATE_DATE
,LocationEO.LAST_UPDATED_BY
,LocationEO.CREATION_DATE
,LocationEO.CREATED_BY
,LocationEO.LAST_UPDATE_LOGIN
,LocationEO.REQUEST_ID
,LocationEO.ORIG_SYSTEM_REFERENCE
,LocationEO.COUNTRY
,LocationEO.ADDRESS1
,LocationEO.ADDRESS2
,LocationEO.ADDRESS3
,LocationEO.ADDRESS4
,LocationEO.CITY
,LocationEO.POSTAL_CODE
,LocationEO.STATE
,LocationEO.PROVINCE
,LocationEO.COUNTY
,LocationEO.ADDRESS_STYLE
,LocationEO.VALIDATED_FLAG
,LocationEO.ADDRESS_LINES_PHONETIC
,LocationEO.POSTAL_PLUS4_CODE
,LocationEO.POSITION
,LocationEO.LOCATION_DIRECTIONS
,LocationEO.ADDRESS_EFFECTIVE_DATE
,LocationEO.ADDRESS_EXPIRATION_DATE
,LocationEO.CLLI_CODE
,LocationEO.LOCATION_LANGUAGE AS LANGUAGE
,LocationEO.SHORT_DESCRIPTION
,LocationEO.DESCRIPTION
,LocationEO.SALES_TAX_GEOCODE
,LocationEO.SALES_TAX_INSIDE_CITY_LIMITS
,LocationEO.FA_LOCATION_ID
,LocationEO.OBJECT_VERSION_NUMBER
,LocationEO.CREATED_BY_MODULE
,LocationEO.GEOMETRY_STATUS_CODE
,LocationEO.VALIDATION_STATUS_CODE
,LocationEO.DATE_VALIDATED
,LocationEO.DO_NOT_VALIDATE_FLAG
,LocationEO.COMMENTS
,LocationEO.HOUSE_TYPE
,LocationEO.ADDR_ELEMENT_ATTRIBUTE1
,LocationEO.ADDR_ELEMENT_ATTRIBUTE2
,LocationEO.ADDR_ELEMENT_ATTRIBUTE3
,LocationEO.ADDR_ELEMENT_ATTRIBUTE4
,LocationEO.ADDR_ELEMENT_ATTRIBUTE5
,LocationEO.BUILDING
,LocationEO.FLOOR_NUMBER
,LocationEO.STATUS_FLAG
,LocationEO.INTERNAL_FLAG
,LOCATIONEO.TIMEZONE_CODE
,TimezonePEO.NAME TIMEZONE
,LocationEO.LATITUDE
,LocationEO.LONGITUDE
from HZ_LOCATIONS LOCATIONEO
,FND_TERRITORIES_VL TERRITORYPEO
,FND_TIMEZONES_VL TimezonePEO
where ((LOCATIONEO.COUNTRY   = 'ZM')
and(LOCATIONEO.INTERNAL_FLAG = 'Y'))
and LOCATIONEO.COUNTRY = TERRITORYPEO.TERRITORY_CODE
and LOCATIONEO.TIMEZONE_CODE = TIMEZONEPEO.TIMEZONE_CODE(+)
) QRSLT
,(SELECT XleEntityProfiles.LEGAL_ENTITY_ID
	,PartySitePE0.LOCATION_ID
	FROM XLE_ENTITY_PROFILES XleEntityProfiles
	,HZ_PARTY_SITES PartySitePE0
	WHERE XleEntityProfiles.PARTY_ID = PartySitePE0.PARTY_ID
	) legalEntitiesE0
WHERE QRSLT.LOCATION_ID = legalEntitiesE0.LOCATION_ID(+)
order by  QRSLT.ADDRESS1