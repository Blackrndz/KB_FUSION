/* ****************************************************************************
 * $Revision: 78239 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 22:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Absence%20Types%20-%20Approval%20and%20Processing%20Rules.sql $:
 * $Id: Manage Absence Types - Approval and Processing Rules.sql 78239 2022-04-07 15:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=ANC_ABSENCE_TYPES_VL

SELECT DISTINCT ancABSENTYPEEO.NAME RES_NAME
,(SELECT TERRITORY_SHORT_NAME 
	FROM FND_TERRITORIES_TL 
	WHERE LANGUAGE = USERENV('LANG')
	AND TERRITORY_CODE = ancABSENTYPEEO.LEGISLATION_CODE
	) RES_LEGISLATION
,(SELECT NAME 
	FROM PER_LEGISLATIVE_DATA_GROUPS_TL 
	WHERE LANGUAGE = USERENV('LANG')
	AND LEGISLATIVE_DATA_GROUP_ID = ancABSENTYPEEO.LEGISLATIVE_DATA_GROUP_ID
	) RES_LEGISLATIVE_DATA_GROUP
,TO_CHAR(ancABSENTYPEEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = ancABSTYPREUSEO.ABSENCE_USAGE_CD
	AND LOOKUP_TYPE = 'ANC_ABSENCE_USAGES' 
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_USAGE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = ancABSTYPREUSEO.ABSENCE_FIELD_TYPE
	AND LOOKUP_TYPE = 'ANC_ABS_USAGE_TYPES' 
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_USAGE_TYPE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = ancABSTYPREUSEO.EMP_USAGE_CD
	AND LOOKUP_TYPE = ancABSTYPREUSEO.EMP_LOOKUP_TYPE 
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_EMPLOYEE_SELF_SERVICE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = ancABSTYPREUSEO.MGR_USAGE_CD 
	AND LOOKUP_TYPE = ancABSTYPREUSEO.MGR_LOOKUP_TYPE 
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_MANAGER_SELF_SERVICE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = ancABSTYPREUSEO.ADMIN_USAGE_CD 
	AND LOOKUP_TYPE = ancABSTYPREUSEO.ADMIN_LOOKUP_TYPE 
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_ADMINISTRATIVE_TRANSACTION
,ancABSTYPREUSEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ancABSTYPREUSEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ancABSTYPREUSEO.CREATED_BY RSC_CREATED_BY
,ancABSTYPREUSEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,ancABSENTYPEEO.LEGISLATION_CODE RSC_COUNTRY_ID

FROM ANC_ABSENCE_TYPES_VL ancABSENTYPEEO
,ANC_ABSENCE_TYPE_REGIONS_F ancABSENCETYPREO
,ANC_ABS_TYPE_RGN_USAGES_F ancABSTYPREUSEO
WHERE ancABSENTYPEEO.ABSENCE_TYPE_ID = ancABSENCETYPREO.ABSENCE_TYPE_ID
AND ancABSENCETYPREO.ABSENCE_TYPE_REGION_ID = ancABSTYPREUSEO.ABSENCE_TYPE_REGION_ID
AND ancABSENCETYPREO.ABSENCE_REGION_CD = 'PROCESSING'
AND NVL(ancABSENTYPEEO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD')) BETWEEN ancABSENCETYPREO.EFFECTIVE_START_DATE AND NVL(ancABSENCETYPREO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND NVL(ancABSENCETYPREO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD')) BETWEEN ancABSTYPREUSEO.EFFECTIVE_START_DATE AND NVL(ancABSTYPREUSEO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY ancABSENTYPEEO.NAME,4,5