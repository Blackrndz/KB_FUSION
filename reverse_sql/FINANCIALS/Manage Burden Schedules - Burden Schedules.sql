/* ****************************************************************************
 * $Revision: 49069 $:
 * $Author: Pisan.Jariyasettachok $:
 * $Date: 2015-09-01 17:23:38 +0700 (Tue, 01 Sep 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Facility%20Shifts%20-%20Manage%20Shifts.sql $:
 * $Id: Manage Facility Shifts - Manage Shifts.sql 49069 2015-09-01 10:23:38Z Pisan.Jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 
SELECT bSchedulsE0.IND_SCH_NAME RES_NAME
,bSchedulsE0.DESCRIPTION RES_DESCRIPTION
,DECODE(bSchedulsE0.RECOST_TXN_FLAG,'Y','Yes','No') RES_RECALCULATION_REQUIRED
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'PJF_IND_RATE_SCHEDULE_TYPE'
	AND LOOKUP_CODE = bSchedulsE0.IND_RATE_SCHEDULE_TYPE 
	) RES_TYPE
,bSchedulsE0.IND_STRUCTURE_NAME RES_DEFAULT_BURDEN_STRUCTURE
,(SELECT TREE_NAME
	FROM FND_TREE_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND TREE_CODE = bSchedulsE0.TREE_CODE
	AND TREE_STRUCTURE_CODE = bSchedulsE0.TREE_STRUCTURE_CODE
	) RES_DEFAULT_ORGANIZATION_HIERA
,(SELECT TREE_VERSION_NAME
	FROM FND_TREE_VERSION_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND TREE_CODE = bSchedulsE0.TREE_CODE
	AND TREE_STRUCTURE_CODE = bSchedulsE0.TREE_STRUCTURE_CODE
	AND TREE_VERSION_ID = bSchedulsE0.TREE_VERSION_ID
	) RES_HIERARCHY_VERSION
,(SELECT NAME
	FROM HR_ALL_ORGANIZATION_UNITS
	WHERE ORGANIZATION_ID = bSchedulsE0.START_ORGANIZATION_ID 
	) RES_HIERARCHY_START_ORGANIZATI
,TO_CHAR(bSchedulsE0.START_DATE_ACTIVE,'DD-Mon-YYYY') RES_FROM_DATE
,TO_CHAR(bSchedulsE0.END_DATE_ACTIVE,'DD-Mon-YYYY') RES_TO_DATE
,bSchedulsE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,bSchedulsE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,bSchedulsE0.CREATED_BY  RSC_CREATED_BY
,bSchedulsE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PJF_IND_RATE_SCH_VL bSchedulsE0
ORDER BY bSchedulsE0.IND_SCH_NAME