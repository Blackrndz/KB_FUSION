/* ****************************************************************************
 * $Revision:  $:
 * $Author: nasrullah dusenmahamad $:
 * $Date: 2018-07-09 $:
 * $HeadURL: $:
 * $Id: Manage Bank Branch Addresses - Chile - DFF.sql $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10024##RES##HZ_PARTY_SITES
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

SELECT PartyPEO.PARTY_NAME RES_NAME
,PartyPEO.PARTY_NUMBER RES_ORGANIZATION_NUMBER
,DECODE(partySitesE0.IDENTIFYING_ADDRESS_FLAG,'Y','Yes','No')	RES_PRIMARY
,hz_format_pub.format_address(p_location_id => partySitesE0.LOCATION_ID, p_line_break => ',') RES_ADDRESS
,partySitesE0.PARTY_SITE_NUMBER RES_SITE_NUMBER

,partySitesE0.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,partySitesE0.ATTRIBUTE1
,partySitesE0.ATTRIBUTE2
,partySitesE0.ATTRIBUTE3
,partySitesE0.ATTRIBUTE4
,partySitesE0.ATTRIBUTE5
,partySitesE0.ATTRIBUTE6
,partySitesE0.ATTRIBUTE7
,partySitesE0.ATTRIBUTE8
,partySitesE0.ATTRIBUTE9
,partySitesE0.ATTRIBUTE10
,partySitesE0.ATTRIBUTE11
,partySitesE0.ATTRIBUTE12
,partySitesE0.ATTRIBUTE13
,partySitesE0.ATTRIBUTE14
,partySitesE0.ATTRIBUTE15
,partySitesE0.ATTRIBUTE16
,partySitesE0.ATTRIBUTE17
,partySitesE0.ATTRIBUTE18
,partySitesE0.ATTRIBUTE19
,partySitesE0.ATTRIBUTE20
,partySitesE0.ATTRIBUTE21
,partySitesE0.ATTRIBUTE22
,partySitesE0.ATTRIBUTE23
,partySitesE0.ATTRIBUTE24
,partySitesE0.ATTRIBUTE25
,partySitesE0.ATTRIBUTE26
,partySitesE0.ATTRIBUTE27
,partySitesE0.ATTRIBUTE28
,partySitesE0.ATTRIBUTE29
,partySitesE0.ATTRIBUTE30
,partySitesE0.ATTRIBUTE_NUMBER1
,partySitesE0.ATTRIBUTE_NUMBER2
,partySitesE0.ATTRIBUTE_NUMBER3
,partySitesE0.ATTRIBUTE_NUMBER4
,partySitesE0.ATTRIBUTE_NUMBER5
,partySitesE0.ATTRIBUTE_NUMBER6
,partySitesE0.ATTRIBUTE_NUMBER7
,partySitesE0.ATTRIBUTE_NUMBER8
,partySitesE0.ATTRIBUTE_NUMBER9
,partySitesE0.ATTRIBUTE_NUMBER10
,partySitesE0.ATTRIBUTE_NUMBER11
,partySitesE0.ATTRIBUTE_NUMBER12
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE6,'DD-Mon-YYYY') ATTRIBUTE_DATE6
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE7,'DD-Mon-YYYY') ATTRIBUTE_DATE7
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE8,'DD-Mon-YYYY') ATTRIBUTE_DATE8
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE9,'DD-Mon-YYYY') ATTRIBUTE_DATE9
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE10,'DD-Mon-YYYY') ATTRIBUTE_DATE10
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE11,'DD-Mon-YYYY') ATTRIBUTE_DATE11
,TO_CHAR(partySitesE0.ATTRIBUTE_DATE12,'DD-Mon-YYYY') ATTRIBUTE_DATE12

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

FROM HZ_PARTY_SITES partySitesE0
,HZ_ORGANIZATION_PROFILES OrganizationPEO
,HZ_GEOGRAPHIES GeographyPEO
,HZ_PARTIES PartyPEO
,FND_TERRITORIES_VL TerritoryPEO
,HZ_PARTY_USG_ASSIGNMENTS PartyUsageAssignmentPEO
,HZ_LOCATIONS locationsE0
WHERE((PartyUsageAssignmentPEO.PARTY_ID = partypeo.party_id)
AND(PartyUsageAssignmentPEO.party_usage_code = 'LEGAL_AUTHORITY')
AND(locationsE0.location_id(+) = partySitesE0.location_id)
AND(partypeo.party_id = partySitesE0.party_id(+))
AND(partypeo.party_id = organizationpeo.party_id)
AND(organizationpeo.effective_start_date <= sysdate
AND organizationpeo.effective_end_date > sysdate)
AND(geographypeo.geography_code = territorypeo.territory_code(+))
AND(geographypeo.geography_code(+) = locationsE0.country)
AND(geographypeo.geography_type(+) = 'COUNTRY')
--AND partySitesE0.PARTY_SITE_TYPE NOT IN 'ONE_TIME' 
--AND(partySitesE0.IDENTIFYING_ADDRESS_FLAG(+) = 'Y')
AND NVL(partySitesE0.STATUS(+),'A') = 'A'
AND NVL(TRUNC(partySitesE0.START_DATE_ACTIVE(+)),TRUNC(SYSDATE)) <= TRUNC(SYSDATE)
AND NVL(TRUNC(partySitesE0.END_DATE_ACTIVE(+)),TRUNC(SYSDATE) + 1) > TRUNC(SYSDATE)
AND NVL(organizationpeo.STATUS,'A') = 'A'
AND NVL(TRUNC(organizationpeo.EFFECTIVE_START_DATE),TRUNC(SYSDATE)) <= TRUNC(SYSDATE)
AND NVL(TRUNC(organizationpeo.EFFECTIVE_END_DATE),TRUNC(SYSDATE) + 1) > TRUNC(SYSDATE))
AND locationsE0.COUNTRY = 'MU'
and (partySitesE0.ATTRIBUTE_CATEGORY IS NOT NULL OR
partySitesE0.ATTRIBUTE1 IS NOT NULL OR 
partySitesE0.ATTRIBUTE2 IS NOT NULL OR 
partySitesE0.ATTRIBUTE3 IS NOT NULL OR 
partySitesE0.ATTRIBUTE4 IS NOT NULL OR 
partySitesE0.ATTRIBUTE5 IS NOT NULL OR 
partySitesE0.ATTRIBUTE6 IS NOT NULL OR 
partySitesE0.ATTRIBUTE7 IS NOT NULL OR 
partySitesE0.ATTRIBUTE8 IS NOT NULL OR 
partySitesE0.ATTRIBUTE9 IS NOT NULL OR 
partySitesE0.ATTRIBUTE10 IS NOT NULL OR 
partySitesE0.ATTRIBUTE11 IS NOT NULL OR 
partySitesE0.ATTRIBUTE12 IS NOT NULL OR 
partySitesE0.ATTRIBUTE13 IS NOT NULL OR 
partySitesE0.ATTRIBUTE14 IS NOT NULL OR 
partySitesE0.ATTRIBUTE15 IS NOT NULL OR
partySitesE0.ATTRIBUTE16 IS NOT NULL OR 
partySitesE0.ATTRIBUTE17 IS NOT NULL OR 
partySitesE0.ATTRIBUTE18 IS NOT NULL OR 
partySitesE0.ATTRIBUTE19 IS NOT NULL OR 
partySitesE0.ATTRIBUTE20 IS NOT NULL OR
partySitesE0.ATTRIBUTE21 IS NOT NULL OR 
partySitesE0.ATTRIBUTE22 IS NOT NULL OR 
partySitesE0.ATTRIBUTE23 IS NOT NULL OR 
partySitesE0.ATTRIBUTE24 IS NOT NULL OR 
partySitesE0.ATTRIBUTE25 IS NOT NULL OR
partySitesE0.ATTRIBUTE26 IS NOT NULL OR 
partySitesE0.ATTRIBUTE27 IS NOT NULL OR 
partySitesE0.ATTRIBUTE28 IS NOT NULL OR 
partySitesE0.ATTRIBUTE29 IS NOT NULL OR 
partySitesE0.ATTRIBUTE30 IS NOT NULL OR
partySitesE0.ATTRIBUTE_NUMBER1 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER2 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER3 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER4 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER5 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER6 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER7 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER8 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER9 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER10 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER11 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_NUMBER12 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_DATE1 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_DATE2 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_DATE3 IS NOT NULL OR
partySitesE0.ATTRIBUTE_DATE4 IS NOT NULL OR
partySitesE0.ATTRIBUTE_DATE5 IS NOT NULL OR
partySitesE0.ATTRIBUTE_DATE6 IS NOT NULL OR
partySitesE0.ATTRIBUTE_DATE7 IS NOT NULL OR
partySitesE0.ATTRIBUTE_DATE8 IS NOT NULL OR
partySitesE0.ATTRIBUTE_DATE9 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_DATE10 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_DATE11 IS NOT NULL OR 
partySitesE0.ATTRIBUTE_DATE12 IS NOT NULL 
)
ORDER BY PartyPEO.PARTY_NAME
,DECODE(partySitesE0.IDENTIFYING_ADDRESS_FLAG,'Y',1,2)
,hz_format_pub.format_address(p_location_id => partySitesE0.LOCATION_ID, p_line_break => ',')