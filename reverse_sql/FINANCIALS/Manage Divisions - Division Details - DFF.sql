/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Divisions%20-%20Division%20Details%20-%20DFF.sql $:
* $Id: Manage Divisions - Division Details - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=800##RES##PER_ORGANIZATION_UNIT_DFF
-- DFF_ATTRIBUTES=ATTRIBUTE,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE
-- IMPORTANT:
--  - the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for attributes fields.

SELECT TO_CHAR(OrganizationUnitDEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY')  AS RES_EFFECTIVE_START_DATE
	,(SELECT DISTINCT name
	FROM HR_ORGANIZATION_UNITS_F_TL
	WHERE ORGANIZATION_ID    = OrganizationUnitDEO.ORGANIZATION_ID
	AND EFFECTIVE_START_DATE = OrganizationUnitDEO.EFFECTIVE_START_DATE
	AND EFFECTIVE_END_DATE   = OrganizationUnitDEO.EFFECTIVE_END_DATE
	) RES_NAME
,(
	CASE
		WHEN EXISTS
			(SELECT NULL
				FROM HR_ORG_UNIT_CLASSIFICATIONS_F OrgUnitClassificationDEO2
				WHERE OrgUnitClassificationDEO2.CLASSIFICATION_CODE != 'HCM_DIVISION'
				AND OrganizationUnitDEO.ORGANIZATION_ID              = OrgUnitClassificationDEO2.ORGANIZATION_ID
				AND EXISTS
					(SELECT NULL
					FROM HR_ORG_UNIT_CLASSIFICATIONS_F OrgUnitClassificationDEO3
					WHERE OrgUnitClassificationDEO3.CLASSIFICATION_CODE = 'HCM_DIVISION'
					AND OrgUnitClassificationDEO2.ORGANIZATION_ID       = OrgUnitClassificationDEO3.ORGANIZATION_ID
					AND OrgUnitClassificationDEO3.creation_date         > orgUnitClassificationDEO2.creation_date
				)		
			)
		THEN
			(SELECT CLASSIFICATION_NAME
			FROM HR_ORG_UNIT_CLASSIFICATIONS_F OrgUnitClassificationDEO2
			,HR_ORG_CLASSIFICATIONS_VL OrgClassificationEO2
			WHERE OrgUnitClassificationDEO2.CLASSIFICATION_CODE != 'HCM_DIVISION'
			AND OrgUnitClassificationDEO2.CLASSIFICATION_CODE    = OrgClassificationEO2.CLASSIFICATION_CODE
			AND OrganizationUnitDEO.ORGANIZATION_ID              = OrgUnitClassificationDEO2.ORGANIZATION_ID
			AND rownum                                          <= 1
			)
		ELSE NULL
	END) AS RES_CLASSIFICATION	
,OrganizationUnitDEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,OrganizationUnitDEO.ATTRIBUTE1
,OrganizationUnitDEO.ATTRIBUTE2
,OrganizationUnitDEO.ATTRIBUTE3
,OrganizationUnitDEO.ATTRIBUTE4
,OrganizationUnitDEO.ATTRIBUTE5
,OrganizationUnitDEO.ATTRIBUTE6
,OrganizationUnitDEO.ATTRIBUTE7
,OrganizationUnitDEO.ATTRIBUTE8
,OrganizationUnitDEO.ATTRIBUTE9
,OrganizationUnitDEO.ATTRIBUTE10
,OrganizationUnitDEO.ATTRIBUTE11
,OrganizationUnitDEO.ATTRIBUTE12
,OrganizationUnitDEO.ATTRIBUTE13
,OrganizationUnitDEO.ATTRIBUTE14
,OrganizationUnitDEO.ATTRIBUTE15
,OrganizationUnitDEO.ATTRIBUTE16
,OrganizationUnitDEO.ATTRIBUTE17
,OrganizationUnitDEO.ATTRIBUTE18
,OrganizationUnitDEO.ATTRIBUTE19
,OrganizationUnitDEO.ATTRIBUTE20
,OrganizationUnitDEO.ATTRIBUTE21
,OrganizationUnitDEO.ATTRIBUTE22
,OrganizationUnitDEO.ATTRIBUTE23
,OrganizationUnitDEO.ATTRIBUTE24
,OrganizationUnitDEO.ATTRIBUTE25
,OrganizationUnitDEO.ATTRIBUTE26
,OrganizationUnitDEO.ATTRIBUTE27
,OrganizationUnitDEO.ATTRIBUTE28
,OrganizationUnitDEO.ATTRIBUTE29
,OrganizationUnitDEO.ATTRIBUTE30
,OrganizationUnitDEO.ATTRIBUTE_NUMBER1
,OrganizationUnitDEO.ATTRIBUTE_NUMBER2
,OrganizationUnitDEO.ATTRIBUTE_NUMBER3
,OrganizationUnitDEO.ATTRIBUTE_NUMBER4
,OrganizationUnitDEO.ATTRIBUTE_NUMBER5
,OrganizationUnitDEO.ATTRIBUTE_NUMBER6
,OrganizationUnitDEO.ATTRIBUTE_NUMBER7
,OrganizationUnitDEO.ATTRIBUTE_NUMBER8
,OrganizationUnitDEO.ATTRIBUTE_NUMBER9
,OrganizationUnitDEO.ATTRIBUTE_NUMBER10
,OrganizationUnitDEO.ATTRIBUTE_NUMBER11
,OrganizationUnitDEO.ATTRIBUTE_NUMBER12
,OrganizationUnitDEO.ATTRIBUTE_NUMBER13
,OrganizationUnitDEO.ATTRIBUTE_NUMBER14
,OrganizationUnitDEO.ATTRIBUTE_NUMBER15
,OrganizationUnitDEO.ATTRIBUTE_NUMBER16
,OrganizationUnitDEO.ATTRIBUTE_NUMBER17
,OrganizationUnitDEO.ATTRIBUTE_NUMBER18
,OrganizationUnitDEO.ATTRIBUTE_NUMBER19
,OrganizationUnitDEO.ATTRIBUTE_NUMBER20
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE1, 'DD-Mon-YYYY') ATTRIBUTE_DATE1
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE2, 'DD-Mon-YYYY') ATTRIBUTE_DATE2
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE3, 'DD-Mon-YYYY') ATTRIBUTE_DATE3
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE4, 'DD-Mon-YYYY') ATTRIBUTE_DATE4
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE5, 'DD-Mon-YYYY') ATTRIBUTE_DATE5
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE6, 'DD-Mon-YYYY') ATTRIBUTE_DATE6
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE7, 'DD-Mon-YYYY') ATTRIBUTE_DATE7
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE8, 'DD-Mon-YYYY') ATTRIBUTE_DATE8
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE9, 'DD-Mon-YYYY') ATTRIBUTE_DATE9
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE10, 'DD-Mon-YYYY') ATTRIBUTE_DATE10
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE11, 'DD-Mon-YYYY') ATTRIBUTE_DATE11
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE12, 'DD-Mon-YYYY') ATTRIBUTE_DATE12
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE13, 'DD-Mon-YYYY') ATTRIBUTE_DATE13
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE14, 'DD-Mon-YYYY') ATTRIBUTE_DATE14
, TO_CHAR(OrganizationUnitDEO.ATTRIBUTE_DATE15, 'DD-Mon-YYYY') ATTRIBUTE_DATE15
,OrganizationUnitDEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,OrganizationUnitDEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,OrganizationUnitDEO.CREATED_BY RSC_CREATED_BY
,OrganizationUnitDEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,OrganizationUnitDEO.BUSINESS_GROUP_ID RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HR_ALL_ORGANIZATION_UNITS_F OrganizationUnitDEO
,HR_ORG_UNIT_CLASSIFICATIONS_F OrgUnitClassificationDEO
,HR_ORG_CLASSIFICATIONS_VL OrgClassificationEO
,HR_ORGANIZATION_UNITS_F_TL OrganizationUnitTranslationD1
WHERE OrganizationUnitDEO.ORGANIZATION_ID        = OrgUnitClassificationDEO.ORGANIZATION_ID
AND OrgUnitClassificationDEO.CLASSIFICATION_CODE = OrgClassificationEO.CLASSIFICATION_CODE
AND OrganizationUnitDEO.ORGANIZATION_ID          = OrganizationUnitTranslationD1.ORGANIZATION_ID
AND OrganizationUnitTranslationD1.Language       = sys_context('USERENV','LANG')
AND OrganizationUnitDEO.EFFECTIVE_START_DATE     = OrganizationUnitTranslationD1.EFFECTIVE_START_DATE
AND OrganizationUnitDEO.EFFECTIVE_END_DATE       = OrganizationUnitTranslationD1.EFFECTIVE_END_DATE
AND OrgClassificationEO.CLASSIFICATION_CODE      = 'HCM_DIVISION'
and (OrganizationUnitDEO.ATTRIBUTE_CATEGORY IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE1            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE2            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE3            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE4            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE5            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE6            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE7            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE8            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE9            IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE10           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE11           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE12           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE13           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE14           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE15           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE16           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE17           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE18           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE19           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE20           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE21           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE22           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE23           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE24           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE25           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE26           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE27           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE28           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE29           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE30           IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER1     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER2     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER3     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER4     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER5     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER6     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER7     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER8     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER9     IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER10    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER11    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER12    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER13    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER14    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER15    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER16    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER17    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER18    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER19    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_NUMBER20    IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE1       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE2       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE3       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE4       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE5       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE6       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE7       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE8       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE9       IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE10      IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE11      IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE12      IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE13      IS NOT NULL
OR OrganizationUnitDEO.ATTRIBUTE_DATE14      IS NOT NULL
OR ORGANIZATIONUNITDEO.ATTRIBUTE_DATE15      IS NOT NULL)
ORDER BY RES_NAME 
,OrganizationUnitDEO.EFFECTIVE_START_DATE