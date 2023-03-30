/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-07-09 $:
 * $HeadURL:$:
 * $Id: Manage Bank Branch Addresses - Nigeria.sql $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT xleENTITYPROFILES.NAME RES_LEGAL_ENTITY_NAME
,xleENTITYPROFILES.LEGAL_ENTITY_IDENTIFIER RES_LEGAL_ENTITY_IDENTIFIER
,hzPATIESE0.PARTY_NAME RES_CONTACT_NAME
,hzORGCONTACTE0.CONTACT_NUMBER RES_CONTACT_NUMBER
,DECODE(partySitesE0.IDENTIFYING_ADDRESS_FLAG,'Y','Yes','No')	RES_PRIMARY
,hz_format_pub.format_address(p_location_id => partySitesE0.LOCATION_ID, p_line_break => ',') RES_ADDRESS
,partySitesE0.PARTY_SITE_NUMBER RES_SITE_NUMBER
,partySitesE0.MAILSTOP	RES_MAIL_STOP
,(select TERRITORYPEO.TERRITORY_SHORT_NAME	
  from FND_TERRITORIES_VL TERRITORYPEO
  where TERRITORYPEO.TERRITORY_CODE =   locationsE0.COUNTRY )	RES_COUNTRY
,locationsE0.ADDRESS1	RES_ADDRESS_LINE_1
,locationsE0.ADDRESS2	RES_ADDRESS_LINE_2
,locationsE0.ADDRESS3	RES_ADDRESS_LINE_3
,locationsE0.CITY		RES_CITY
,locationsE0.STATE		RES_STATE
,locationsE0.POSTAL_CODE	RES_POSTAL_CODE
,(SELECT NAME FROM FND_TIMEZONES_VL WHERE TIMEZONE_CODE = locationsE0.TIMEZONE_CODE) RES_TIME_ZONE
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

FROM FUSION.XLE_ENTITY_PROFILES xleENTITYPROFILES 
,HZ_RELATIONSHIPS hzRELATIONE0 
,HZ_ORG_CONTACTS hzORGCONTACTE0
,HZ_PARTIES hzPATIESE0
,HZ_PARTY_SITES partySitesE0
,HZ_LOCATIONS locationsE0

WHERE xleENTITYPROFILES.PARTY_ID = hzRELATIONE0.OBJECT_ID
AND hzRELATIONE0.RELATIONSHIP_ID = hzORGCONTACTE0.PARTY_RELATIONSHIP_ID
AND hzRELATIONE0.SUBJECT_ID = hzPATIESE0.PARTY_ID
AND hzPATIESE0.PARTY_ID = partySitesE0.PARTY_ID
AND partySitesE0.STATUS = 'A'
AND partySitesE0.LOCATION_ID = locationsE0.LOCATION_ID
AND locationsE0.COUNTRY = 'NG'
ORDER BY xleENTITYPROFILES.NAME,hzPATIESE0.PARTY_NAME
,DECODE(partySitesE0.IDENTIFYING_ADDRESS_FLAG,'Y',1,2)
,hz_format_pub.format_address(p_location_id => partySitesE0.LOCATION_ID, p_line_break => ',')