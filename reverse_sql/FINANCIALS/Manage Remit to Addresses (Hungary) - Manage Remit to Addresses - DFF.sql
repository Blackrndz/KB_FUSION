 /* ****************************************************************************
 * $Revision: 48884 $:
 * $Author: dhara.pithadiya $:
 * $Date: 2015-08-18 14:24:02 +0700 (Tue, 18 Aug 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Transaction%20Types%20-%20Manage%20Transaction%20Types.sql $:
 * $Id: Manage Transaction Types - Manage Transaction Types.sql 48884 2015-08-18 07:24:02Z dhara.pithadiya $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=10024##RES##HZ_LOCATIONS
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.
 
SELECT 'Country' RES_SEARCH
,(SELECT TERRITORY_SHORT_NAME 
	FROM FND_TERRITORIES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND TERRITORY_CODE =  loc.country
	) RES_NAME
, remitToLocs.location_id RES_SITE_NUMBER
,(SELECT SET_NAME
	FROM fusion.FND_SETID_SETS_VL
	WHERE SET_ID = remitToLocs.SET_ID
	) RES_REMIT_TO_ADDRESS_SET
,(SELECT TERRITORY_SHORT_NAME 
	FROM FND_TERRITORIES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND TERRITORY_CODE =  loc.country
	) RES_COUNTRY
, loc.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
, loc.ATTRIBUTE1
, loc.ATTRIBUTE2
, loc.ATTRIBUTE3
, loc.ATTRIBUTE4
, loc.ATTRIBUTE5
, loc.ATTRIBUTE6
, loc.ATTRIBUTE7
, loc.ATTRIBUTE8
, loc.ATTRIBUTE9
, loc.ATTRIBUTE10
, loc.ATTRIBUTE11
, loc.ATTRIBUTE12
, loc.ATTRIBUTE13
, loc.ATTRIBUTE14
, loc.ATTRIBUTE15
, loc.ATTRIBUTE16
, loc.ATTRIBUTE17
, loc.ATTRIBUTE18
, loc.ATTRIBUTE19
, loc.ATTRIBUTE20
, loc.ATTRIBUTE21
, loc.ATTRIBUTE22
, loc.ATTRIBUTE23
, loc.ATTRIBUTE24
, loc.ATTRIBUTE25
, loc.ATTRIBUTE26
, loc.ATTRIBUTE27
, loc.ATTRIBUTE28
, loc.ATTRIBUTE29
, loc.ATTRIBUTE30
, loc.ATTRIBUTE_NUMBER1
, loc.ATTRIBUTE_NUMBER2
, loc.ATTRIBUTE_NUMBER3
, loc.ATTRIBUTE_NUMBER4
, loc.ATTRIBUTE_NUMBER5
, loc.ATTRIBUTE_NUMBER6
, loc.ATTRIBUTE_NUMBER8
, loc.ATTRIBUTE_NUMBER9
, loc.ATTRIBUTE_NUMBER10
, loc.ATTRIBUTE_NUMBER11
, loc.ATTRIBUTE_NUMBER12
, TO_CHAR(loc.ATTRIBUTE_DATE1, 'DD-Mon-YYYY') ATTRIBUTE_DATE1
, TO_CHAR(loc.ATTRIBUTE_DATE2, 'DD-Mon-YYYY') ATTRIBUTE_DATE2
, TO_CHAR(loc.ATTRIBUTE_DATE3, 'DD-Mon-YYYY') ATTRIBUTE_DATE3
, TO_CHAR(loc.ATTRIBUTE_DATE4, 'DD-Mon-YYYY') ATTRIBUTE_DATE4
, TO_CHAR(loc.ATTRIBUTE_DATE5, 'DD-Mon-YYYY') ATTRIBUTE_DATE5
, TO_CHAR(loc.ATTRIBUTE_DATE6, 'DD-Mon-YYYY') ATTRIBUTE_DATE6
, TO_CHAR(loc.ATTRIBUTE_DATE7, 'DD-Mon-YYYY') ATTRIBUTE_DATE7
, TO_CHAR(loc.ATTRIBUTE_DATE8, 'DD-Mon-YYYY') ATTRIBUTE_DATE8
, TO_CHAR(loc.ATTRIBUTE_DATE9, 'DD-Mon-YYYY') ATTRIBUTE_DATE9
, TO_CHAR(loc.ATTRIBUTE_DATE10, 'DD-Mon-YYYY') ATTRIBUTE_DATE10
, TO_CHAR(loc.ATTRIBUTE_DATE11, 'DD-Mon-YYYY') ATTRIBUTE_DATE11
, TO_CHAR(loc.ATTRIBUTE_DATE12, 'DD-Mon-YYYY') ATTRIBUTE_DATE12
, loc.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
, loc.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
, loc.CREATED_BY RSC_CREATED_BY
, loc.CREATION_DATE RSC_CREATION_DATE
, NULL RSC_LEDGER_ID
, NULL RSC_CHART_OF_ACCOUNTS_ID
, NULL RSC_BUSINESS_UNIT_ID
, NULL RSC_LEGAL_ENTITY_ID
, NULL RSC_ORGANIZATION_ID
, NULL RSC_BUSINESS_GROUP_ID
, NULL RSC_ENTERPRISE_ID
, NULL RSC_COUNTRY_ID

FROM ar_remit_to_locs_all remitToLocs
, hz_locations loc
WHERE(loc.ATTRIBUTE_CATEGORY IS NOT NULL
OR loc.ATTRIBUTE1            IS NOT NULL
OR loc.ATTRIBUTE2            IS NOT NULL
OR loc.ATTRIBUTE3            IS NOT NULL
OR loc.ATTRIBUTE4            IS NOT NULL
OR loc.ATTRIBUTE5            IS NOT NULL
OR loc.ATTRIBUTE6            IS NOT NULL
OR loc.ATTRIBUTE7            IS NOT NULL
OR loc.ATTRIBUTE8            IS NOT NULL
OR loc.ATTRIBUTE9            IS NOT NULL
OR loc.ATTRIBUTE10           IS NOT NULL
OR loc.ATTRIBUTE11           IS NOT NULL
OR loc.ATTRIBUTE12           IS NOT NULL
OR loc.ATTRIBUTE13           IS NOT NULL
OR loc.ATTRIBUTE14           IS NOT NULL
OR loc.ATTRIBUTE15           IS NOT NULL
OR loc.ATTRIBUTE16           IS NOT NULL
OR loc.ATTRIBUTE17           IS NOT NULL
OR loc.ATTRIBUTE18           IS NOT NULL
OR loc.ATTRIBUTE19           IS NOT NULL
OR loc.ATTRIBUTE20           IS NOT NULL
OR loc.ATTRIBUTE21           IS NOT NULL
OR loc.ATTRIBUTE22           IS NOT NULL
OR loc.ATTRIBUTE23           IS NOT NULL
OR loc.ATTRIBUTE24           IS NOT NULL
OR loc.ATTRIBUTE25           IS NOT NULL
OR loc.ATTRIBUTE26           IS NOT NULL
OR loc.ATTRIBUTE27           IS NOT NULL
OR loc.ATTRIBUTE28           IS NOT NULL
OR loc.ATTRIBUTE29           IS NOT NULL
OR loc.ATTRIBUTE30           IS NOT NULL
OR loc.ATTRIBUTE_NUMBER1     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER2     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER3     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER4     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER5     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER6     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER7     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER8     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER9     IS NOT NULL
OR loc.ATTRIBUTE_NUMBER10    IS NOT NULL
OR loc.ATTRIBUTE_NUMBER11    IS NOT NULL
OR loc.ATTRIBUTE_NUMBER12    IS NOT NULL
OR loc.ATTRIBUTE_DATE1       IS NOT NULL
OR loc.ATTRIBUTE_DATE2       IS NOT NULL
OR loc.ATTRIBUTE_DATE3       IS NOT NULL
OR loc.ATTRIBUTE_DATE4       IS NOT NULL
OR loc.ATTRIBUTE_DATE5       IS NOT NULL
OR loc.ATTRIBUTE_DATE6       IS NOT NULL
OR loc.ATTRIBUTE_DATE7       IS NOT NULL
OR loc.ATTRIBUTE_DATE8       IS NOT NULL
OR loc.ATTRIBUTE_DATE9       IS NOT NULL
OR loc.ATTRIBUTE_DATE10      IS NOT NULL
OR loc.ATTRIBUTE_DATE11      IS NOT NULL
OR loc.ATTRIBUTE_DATE12      IS NOT NULL)
AND remitToLocs.location_id   = loc.location_id
AND loc.country                    = 'HU'
ORDER BY 1,2