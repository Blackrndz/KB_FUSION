/* ****************************************************************************
 * $Revision: 78239 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 22:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Absence%20Categories%20-%20Associated%20Types.sql $:
 * $Id: Manage Absence Categories - Associated Types.sql 78239 2022-04-07 15:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT ancABSENCECATEO.NAME RES_NAME
,(SELECT TERRITORY_SHORT_NAME 
	FROM FND_TERRITORIES_VL 
	WHERE TERRITORY_CODE = ancABSENCECATEO.LEGISLATION_CODE
	) RES_LEGISLATION
,ancABSENCETPYEVLEO.NAME RES_ABSENCE_TYPE
--,ancABSENCETPYEVLEO.NAME||' '||(SELECT TERRITORY_SHORT_NAME FROM FND_TERRITORIES_VL WHERE TERRITORY_CODE = ancABSENCETPYEVLEO.LEGISLATION_CODE) RES_ABSENCE_TYPE
,(SELECT MEANING 
	FROM FND_LOOKUP_VALUES 
	WHERE LOOKUP_CODE = ancABSENCETPYEO.STATUS
	AND LOOKUP_TYPE = 'ANC_SETUP_OBJ_STATUS' 
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_STATUS
,TO_CHAR(ancABSENCETPYEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,DECODE(TO_CHAR(ancABSENCETPYEO.EFFECTIVE_END_DATE,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(ancABSENCETPYEO.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_EFFECTIVE_END_DATE
,ancABSENCETPYEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ancABSENCETPYEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ancABSENCETPYEO.CREATED_BY RSC_CREATED_BY
,ancABSENCETPYEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,ancABSENCECATEO.LEGISLATION_CODE RSC_COUNTRY_ID
FROM ANC_ABSENCE_CATEGORIES_VL ancABSENCECATEO
,ANC_ABSENCE_TYPE_CATE_F ancABSENCETPYEO
,ANC_ABSENCE_TYPES_VL ancABSENCETPYEVLEO
WHERE ancABSENCECATEO.ABSENCE_CATEGORY_ID = ancABSENCETPYEO.ABSENCE_CATEGORY_ID
AND ancABSENCETPYEVLEO.ABSENCE_TYPE_ID = ancABSENCETPYEO.ABSENCE_TYPE_ID
AND SYSDATE BETWEEN ancABSENCECATEO.EFFECTIVE_START_DATE AND NVL(ancABSENCECATEO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN ancABSENCETPYEO.EFFECTIVE_START_DATE AND NVL(ancABSENCETPYEO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN ancABSENCETPYEVLEO.EFFECTIVE_START_DATE AND NVL(ancABSENCETPYEVLEO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND ancABSENCECATEO.LANGUAGE = USERENV('LANG')
ORDER BY ancABSENCECATEO.NAME