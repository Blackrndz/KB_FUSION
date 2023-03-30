/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-06-22 $:
 * $HeadURL:$:
 * $Id: Manage Bank Branch Addresses - United Kingdom.sql $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT hzPATIESE0.PARTY_NAME RES_PARTY_NAME
,partySitesE0.PARTY_SITE_NUMBER RES_SITE_NUMBER
,DECODE(partySitesE0.IDENTIFYING_ADDRESS_FLAG,'Y','Yes','No')	RES_PRIMARY
,hz_format_pub.format_address(p_location_id => partySitesE0.LOCATION_ID, p_line_break => ',') RES_ADDRESS
,(select TERRITORYPEO.TERRITORY_SHORT_NAME	
  from FND_TERRITORIES_VL TERRITORYPEO
  where TERRITORYPEO.TERRITORY_CODE =   locationsE0.COUNTRY ) RES_COUNTRY
,locationsE0.ADDRESS1	RES_ADDRESS_LINE_1
,locationsE0.ADDRESS2	RES_ADDRESS_LINE_2
,locationsE0.ADDRESS3	RES_ADDRESS_LINE_3
,partySitesE0.MAILSTOP	RES_MAIL_STOP
,locationsE0.CITY			RES_CITY_OR_TOWN
,locationsE0.COUNTY	RES_COUNTY
,locationsE0.POSTAL_CODE	RES_POSTCODE
,DECODE(partySitesE0.PARTY_SITE_TYPE,NULL,'No','Yes')	RES_ONE_TIME_ADDRESS
,TO_CHAR(partySitesE0.START_DATE_ACTIVE,'DD-Mon-YYYY') 	RES_FROM_DATE
,TO_CHAR(partySitesE0.END_DATE_ACTIVE,'DD-Mon-YYYY') 	RES_TO_DATE

,partySitesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,partySitesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,partySitesE0.CREATED_BY RSC_CREATED_BY
,partySitesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HZ_PARTIES hzPATIESE0
,HZ_PARTY_USG_ASSIGNMENTS hzPARTYUSEASSE0
,HZ_PARTY_SITES partySitesE0
,HZ_LOCATIONS locationsE0

WHERE hzPATIESE0.PARTY_ID = hzPARTYUSEASSE0.PARTY_ID 
AND hzPARTYUSEASSE0.PARTY_ID = partySitesE0.PARTY_ID
AND partySitesE0.LOCATION_ID = locationsE0.LOCATION_ID
AND partySitesE0.STATUS = 'A'
AND hzPARTYUSEASSE0.PARTY_USAGE_CODE IN ('PAYMENT_ISSUING_AUTHORITY','PENSION_PROVIDER','PROFESSIONAL_BODY','BARGAINING_ASSOCIATION','DISABILITY_ORGANIZATION','EXTERNAL_PAYEE')
AND locationsE0.COUNTRY = 'GB'
ORDER BY hzPATIESE0.PARTY_NAME,partySitesE0.PARTY_SITE_NUMBER
,DECODE(partySitesE0.IDENTIFYING_ADDRESS_FLAG,'Y',1,2)
,hz_format_pub.format_address(p_location_id => partySitesE0.LOCATION_ID, p_line_break => ',')