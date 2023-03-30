/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Set%20Enabled%20Lookups%20-%20Set%20Enabled%20Lookups.sql $:
 * $Id: Manage Set Enabled Lookups - Set Enabled Lookups.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT LOOKUP_TYPE AS RES_LOOKUP_TYPE
,(SELECT VISIBLE_GROUP_NAME
	FROM FND_SETID_REFERENCE_GROUPS_VL
	WHERE REFERENCE_GROUP_NAME = LookupTypeEO.REFERENCE_GROUP_NAME
	)           AS RES_REFERENCE_GROUP_NAME
,MEANING     AS RES_MEANING
,DESCRIPTION AS RES_DESCRIPTION
,(SELECT USER_MODULE_NAME
	FROM FND_APPL_TAXONOMY_VL
	WHERE MODULE_ID = LookupTypeEO.MODULE_ID
	) AS RES_MODULE
,(SELECT MEANING
	FROM fnd_lookups
	WHERE lookup_type = 'LOOKUP_CUSTOMIZATION_LEVEL'
	AND lookup_code   = LookupTypeEO.CUSTOMIZATION_LEVEL
	) AS RES_CUSTOMIZATION_LEVEL
,LookupTypeEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,LookupTypeEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,LookupTypeEO.CREATED_BY RSC_CREATED_BY
,LookupTypeEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_LOOKUP_TYPES_VL LookupTypeEO
WHERE LookupTypeEO.VIEW_APPLICATION_ID = '2'
ORDER BY RES_LOOKUP_TYPE
