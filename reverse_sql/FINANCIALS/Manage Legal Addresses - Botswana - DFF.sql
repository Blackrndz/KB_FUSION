/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2017-10-16  $:
 * $HeadURL: $:
 * $Id: Manage Legal Addresses - Botswana - DFF.sql $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10024##RES##HZ_LOCATIONS
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ADDR_ELEMENT_ATTRIBUTE

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

select TERRITORYPEO.TERRITORY_SHORT_NAME RES_COUNTRY
,null RES_LOCATION
,LOCATIONEO.ADDRESS1 RES_ADDRESS_LINE_1
,LOCATIONEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,LOCATIONEO.ATTRIBUTE1
,LOCATIONEO.ATTRIBUTE2
,LOCATIONEO.ATTRIBUTE3
,LOCATIONEO.ATTRIBUTE4
,LOCATIONEO.ATTRIBUTE5
,LOCATIONEO.ATTRIBUTE6
,LOCATIONEO.ATTRIBUTE7
,LOCATIONEO.ATTRIBUTE8
,LOCATIONEO.ATTRIBUTE9
,LOCATIONEO.ATTRIBUTE10
,LOCATIONEO.ATTRIBUTE11
,LOCATIONEO.ATTRIBUTE12
,LOCATIONEO.ATTRIBUTE13
,LOCATIONEO.ATTRIBUTE14
,LOCATIONEO.ATTRIBUTE15
,LOCATIONEO.ATTRIBUTE16
,LOCATIONEO.ATTRIBUTE17
,LOCATIONEO.ATTRIBUTE18
,LOCATIONEO.ATTRIBUTE19
,LOCATIONEO.ATTRIBUTE20
,LOCATIONEO.ATTRIBUTE21
,LOCATIONEO.ATTRIBUTE22
,LOCATIONEO.ATTRIBUTE23
,LOCATIONEO.ATTRIBUTE24
,LOCATIONEO.ATTRIBUTE25
,LOCATIONEO.ATTRIBUTE26
,LOCATIONEO.ATTRIBUTE27
,LOCATIONEO.ATTRIBUTE28
,LOCATIONEO.ATTRIBUTE29
,LOCATIONEO.ATTRIBUTE30
,LOCATIONEO.ATTRIBUTE_NUMBER1
,LOCATIONEO.ATTRIBUTE_NUMBER2
,LOCATIONEO.ATTRIBUTE_NUMBER3
,LOCATIONEO.ATTRIBUTE_NUMBER4
,LOCATIONEO.ATTRIBUTE_NUMBER5
,LOCATIONEO.ATTRIBUTE_NUMBER6
,LOCATIONEO.ATTRIBUTE_NUMBER7
,LOCATIONEO.ATTRIBUTE_NUMBER8
,LOCATIONEO.ATTRIBUTE_NUMBER9
,LOCATIONEO.ATTRIBUTE_NUMBER10
,LOCATIONEO.ATTRIBUTE_NUMBER11
,LOCATIONEO.ATTRIBUTE_NUMBER12
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE6,'DD-Mon-YYYY') ATTRIBUTE_DATE6
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE7,'DD-Mon-YYYY') ATTRIBUTE_DATE7
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE8,'DD-Mon-YYYY') ATTRIBUTE_DATE8
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE9,'DD-Mon-YYYY') ATTRIBUTE_DATE9
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE10,'DD-Mon-YYYY') ATTRIBUTE_DATE10
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE11,'DD-Mon-YYYY') ATTRIBUTE_DATE11
,TO_CHAR(LOCATIONEO.ATTRIBUTE_DATE12,'DD-Mon-YYYY') ATTRIBUTE_DATE12
,LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE1
,LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE2
,LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE3
,LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE4
,LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE5
,LOCATIONEO.LAST_UPDATED_BY  as RSC_LAST_UPDATED_BY
,LOCATIONEO.LAST_UPDATE_DATE  AS RSC_LAST_UPDATE_DATE
,LOCATIONEO.CREATED_BY  RSC_CREATED_BY
,LOCATIONEO.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,legalEntitiesE0.LEGAL_ENTITY_ID RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
 
FROM HZ_LOCATIONS LOCATIONEO
,FND_TERRITORIES_VL TERRITORYPEO
,(SELECT XleEntityProfiles.LEGAL_ENTITY_ID
	,PartySitePE0.LOCATION_ID
	FROM XLE_ENTITY_PROFILES XleEntityProfiles
	,HZ_PARTY_SITES PartySitePE0
	WHERE XleEntityProfiles.PARTY_ID = PartySitePE0.PARTY_ID
	) legalEntitiesE0
where (LOCATIONEO.ATTRIBUTE_CATEGORY IS NOT NULL OR
LOCATIONEO.ATTRIBUTE1 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE2 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE3 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE4 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE5 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE6 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE7 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE8 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE9 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE10 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE11 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE12 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE13 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE14 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE15 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE16 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE17 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE18 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE19 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE20 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE21 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE22 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE23 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE24 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE25 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE26 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE27 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE28 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE29 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE30 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE_NUMBER1 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER2 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER3 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER4 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER5 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER6 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER7 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER8 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER9 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER10 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER11 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_NUMBER12 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_DATE1 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_DATE2 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_DATE3 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE_DATE4 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE_DATE5 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE_DATE6 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE_DATE7 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE_DATE8 IS NOT NULL OR
LOCATIONEO.ATTRIBUTE_DATE9 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_DATE10 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_DATE11 IS NOT NULL OR 
LOCATIONEO.ATTRIBUTE_DATE12 IS NOT NULL OR 
LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE1 IS NOT NULL OR 
LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE2 IS NOT NULL OR 
LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE3 IS NOT NULL OR 
LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE4 IS NOT NULL OR 
LOCATIONEO.ADDR_ELEMENT_ATTRIBUTE5 IS NOT NULL 
)
 AND ((LOCATIONEO.COUNTRY   = 'BW')
and (LOCATIONEO.INTERNAL_FLAG = 'Y'))
and LOCATIONEO.COUNTRY = TERRITORYPEO.TERRITORY_CODE
AND LOCATIONEO.LOCATION_ID = legalEntitiesE0.LOCATION_ID(+)
ORDER BY RES_LOCATION