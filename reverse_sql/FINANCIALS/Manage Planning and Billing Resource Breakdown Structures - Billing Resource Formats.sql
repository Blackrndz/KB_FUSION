/* ****************************************************************************
 * $Revision: 61016 $:
 * $Author: nasrullah.dusenmahamad $:
 * $Date: 2017-02-10 11:47:39 +0700 (Fri, 10 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Transaction%20Sources%20-%20Manage%20Transaction%20Sources.sql $:
 * $Id: Manage Transaction Sources - Manage Transaction Sources.sql 61016 2017-02-10 04:47:39Z nasrullah.dusenmahamad $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


WITH FORMATE0 AS (SELECT RES_FORMAT_ID
	,NAME
	,(CASE 
		WHEN formatsE0.FORMAT_LEVEL != 1 THEN
			(SELECT NAME
				FROM PJF_RES_FORMATS_VL
				WHERE FORMAT_TOKEN = SUBSTR(formatsE0.FORMAT_TOKEN,1,3))
		END) PARENT1
	,(CASE 
		WHEN formatsE0.FORMAT_LEVEL != 2 THEN
			(SELECT NAME
				FROM PJF_RES_FORMATS_VL
				WHERE FORMAT_TOKEN = SUBSTR(formatsE0.FORMAT_TOKEN,5,3))
		END) PARENT2
	,(CASE 
		WHEN formatsE0.FORMAT_LEVEL != 3 THEN
			(SELECT NAME
				FROM PJF_RES_FORMATS_VL
				WHERE FORMAT_TOKEN = SUBSTR(formatsE0.FORMAT_TOKEN,9,3))
		END) PARENT3
	,(CASE 
		WHEN formatsE0.FORMAT_LEVEL != 4 THEN
			(SELECT NAME
				FROM PJF_RES_FORMATS_VL
				WHERE FORMAT_TOKEN = SUBSTR(formatsE0.FORMAT_TOKEN,13,3))
		END) PARENT4
	,(SELECT NAME
		FROM PJF_RES_FORMATS_VL
		WHERE FORMAT_TOKEN = SUBSTR(formatsE0.FORMAT_TOKEN,LENGTH(formatsE0.FORMAT_TOKEN)-2,3)
		) RES_FORMAT
	FROM PJF_RES_FORMATS_VL formatsE0
	)

SELECT resourcesE0.NAME RES_NAME
,PARENT1 RES_PARENT_RESOURCE_FORMAT_1
,PARENT2 RES_PARENT_RESOURCE_FORMAT_2
,PARENT3 RES_PARENT_RESOURCE_FORMAT_3
,PARENT4 RES_PARENT_RESOURCE_FORMAT_4
,RES_FORMAT RES_RESOURCE_FORMAT
,resFormatsE0.NAME RES_FULL_FORMAT
,'Yes' RES_INCLUDE
,planResFormatsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,planResFormatsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,planResFormatsE0.CREATED_BY RSC_CREATED_BY
,planResFormatsE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,resourcesE0.PROJECT_UNIT_ID RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PJF_RBS_HEADERS_VL resourcesE0
,PJF_RBS_VERSIONS_B resVersionsE0
,PJF_PLAN_RBS_FORMATS planResFormatsE0
,FORMATE0 resFormatsE0
WHERE resourcesE0.RBS_TYPE = 'BILLING'
AND resourcesE0.PROJECT_ID IS NULL
AND resourcesE0.RBS_HEADER_ID = resVersionsE0.RBS_HEADER_ID
AND resVersionsE0.RBS_VERSION_ID = planResFormatsE0.RBS_VERSION_ID
AND planResFormatsE0.RES_FORMAT_ID = resFormatsE0.RES_FORMAT_ID
ORDER BY resourcesE0.NAME
,(CASE	
	WHEN PARENT1 IS NULL THEN '1'
	ELSE PARENT1 END)
,(CASE	
	WHEN PARENT2 IS NULL THEN '1'
	ELSE PARENT2 END)
,(CASE	
	WHEN PARENT3 IS NULL THEN '1'
	ELSE PARENT3 END)
,(CASE	
	WHEN PARENT4 IS NULL THEN '1'
	ELSE PARENT4 END)
,RES_FORMAT