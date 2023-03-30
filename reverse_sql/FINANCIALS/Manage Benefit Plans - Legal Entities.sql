/* ****************************************************************************
 * $Revision: 79015 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-07-15 12:15:17 +0700 (Fri, 15 Jul 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Plans%20-%20Legal%20Entities.sql $:
 * $Id: Manage Benefit Plans - Legal Entities.sql 79015 2022-07-15 05:15:17Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 
SELECT benPlansE0.NAME RES_PLAN_NAME
,TO_CHAR(benPlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY')  RES_EFFECTIVE_START_DATE
,(SELECT NAME
    FROM HR_ORGANIZATION_UNITS
    WHERE SYSDATE BETWEEN DATE_FROM AND DATE_TO
    AND ORGANIZATION_ID = lesE0.LEGAL_ENTITY_ID
    ) RES_LEGAL_EMPLOYER
,TO_CHAR(lesE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_LEGAL_ENTITIES_START_DATE
,DECODE(TO_CHAR(lesE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY'),'31-12-4712',NULL,TO_CHAR(lesE0.EFFECTIVE_END_DATE,'DD-Mon-YYYY')) RES_LEGAL_ENTITIES_END_DATE
/*,(SELECT NAME
    FROM BEN_PL_TYP_F
    WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
    AND PL_TYP_ID = benPlansE0.PL_TYP_ID
    ) RES_PLAN_TYPE*/
,lesE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,lesE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,lesE0.CREATED_BY  RSC_CREATED_BY
,lesE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPlansE0.LEGISLATION_CODE RSC_COUNTRY_ID

FROM BEN_PL_F benPlansE0
,(SELECT NAME
	,PL_TYP_ID
    FROM BEN_PL_TYP_F
    WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	AND OPT_TYP_CD != 'FLXCR'
	) planTypesE0
,(SELECT MAPPING_TABLE_PK_ID
	,LEGAL_ENTITY_ID
	,EFFECTIVE_START_DATE
	,EFFECTIVE_END_DATE
	,LAST_UPDATED_BY
	,LAST_UPDATE_DATE
	,CREATED_BY
	,CREATION_DATE
	FROM BEN_LE_RESOLUTIONS_F 
	WHERE MAPPING_TABLE_NAME = 'BEN_PL_F'
	AND MAPPING_COLUMN_NAME = 'PL_ID'
	) lesE0
WHERE SYSDATE BETWEEN benPlansE0.EFFECTIVE_START_DATE AND benPlansE0.EFFECTIVE_END_DATE
AND benPlansE0.PL_TYP_ID = planTypesE0.PL_TYP_ID
AND benPlansE0.PL_ID = lesE0.MAPPING_TABLE_PK_ID
ORDER BY benPlansE0.NAME
,benPlansE0.EFFECTIVE_START_DATE,lesE0.EFFECTIVE_START_DATE