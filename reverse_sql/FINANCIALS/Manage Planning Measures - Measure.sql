/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=MSC_MEASURES_VL

WITH ASSIGN_WORKAREA AS (
	SELECT 1 ID, 'Demand Management' WORK_AREA FROM DUAL

	UNION
	SELECT 2 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 3 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 3 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 4 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 5 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 5 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 6 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 6 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 7 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 7 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 7 ID, 'Supply Planning' WORK_AREA FROM DUAL
	
	UNION
	SELECT 128 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 129 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 129 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 130 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 130 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 131 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 131 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 131 ID, 'Supply Planning' WORK_AREA FROM DUAL
	
	UNION
	SELECT 132 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 132 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 133 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 133 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 133 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 134 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 134 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 134 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 135 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 135 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 135 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 135 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 257 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 257 ID, 'Replenishment Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 258 ID, 'Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 258 ID, 'Replenishment Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 259 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 259 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 259 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 260 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 260 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 261 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 261 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 261 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 262 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 262 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 262 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 263 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 263 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 263 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 263 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 384 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 384 ID, 'Replenishment Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 385 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 385 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 385 ID, 'Replenishment Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 386 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 386 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 386 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 387 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 387 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 387 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 387 ID, 'Supply Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 388 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 388 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 388 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 389 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 389 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 389 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 389 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL

	UNION
	SELECT 390 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 390 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 390 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 390 ID, 'Supply Planning' WORK_AREA FROM DUAL --> MAIN

	UNION
	SELECT 391 ID, 'Demand Management' WORK_AREA FROM DUAL
	UNION
	SELECT 391 ID, 'Demand and Supply Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 391 ID, 'Replenishment Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 391 ID, 'Sales and Operations Planning' WORK_AREA FROM DUAL
	UNION
	SELECT 391 ID, 'Supply Planning' WORK_AREA FROM DUAL)
 
SELECT MeasuresE0.NAME RES_MEASURE
,MeasuresE0.DESCRIPTION RES_DESCRIPTION
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_MSC_MEASURE_DATA_TYPE'
	AND LOOKUP_CODE = MeasuresE0.DATA_TYPE
	) RES_DATA_TYPE
,(SELECT WORK_AREA
	FROM ASSIGN_WORKAREA
	WHERE ID = MeasuresE0.RELEVANT_PLAN_TYPE
	AND ROWNUM =1
	) RES_ENABLE_IN_WORK_AREA
,NVL((SELECT 'Yes'
	FROM MSC_MEASURE_GROUP_ASSIGN
	WHERE GROUP_ID = (SELECT GROUP_ID FROM MSC_MEASURE_GROUPS_VL WHERE NAME = 'Common Measures')
	AND MEASURE_ID = MeasuresE0.MEASURE_ID
	),'No') RES_INCLUDE_MEASURE_IN_THE_COM
,DECODE(MeasuresE0.EDITABLE,'1','Yes','No') RES_ALLOW_EDITING
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_MSC_MEASURE_DATA_TYPE'
	AND LOOKUP_CODE = MeasuresE0.EDIT_RANGE
	) RES_EDIT_RANGE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_MSC_MEASURE_AGGR_ORDER'
	AND LOOKUP_CODE = MeasuresE0.AGGR_ORDER
	) RES_CALCULATION_ORDER
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_MSC_MEASURE_AGGR_FUNC'
	AND LOOKUP_CODE = MeasuresE0.AGGR_METHOD_TIME
	) RES_TIME_DIMENSION
,(SELECT NAME
	FROM MSC_MEASURES_TL
	WHERE MEASURE_ID = MeasuresE0.WEIGHTED_BY
	AND LANGUAGE = USERENV('LANG')
	) RES_WEIGHTED_BY
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_MSC_MEASURE_AGGR_FUNC'
	AND LOOKUP_CODE = MeasuresE0.AGGR_METHOD_OTHER
	) RES_OTHER_DIMENSIONS
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'ORA_MSC_MEASURE_DISAGGR_FUNC'
	AND LOOKUP_CODE = MeasuresE0.DISAGGR_METHOD_TIME
	) RES_DISAGGREGATION_TYPE
,(SELECT NAME
	FROM MSC_MEASURES_TL
	WHERE MEASURE_ID = MeasuresE0.DISAGGR_BASIS_TIME
	AND LANGUAGE = USERENV('LANG')
	) RES_DISAGGREGATION_BASIS
,(SELECT NAME
	FROM MSC_MEASURES_TL
	WHERE MEASURE_ID = MeasuresE0.SEC_BASIS 
	AND LANGUAGE = USERENV('LANG')
	) RES_SECONDARY_BASIS
,MeasuresE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,MeasuresE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,MeasuresE0.CREATED_BY  RSC_CREATED_BY
,MeasuresE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM MSC_MEASURES_VL MeasuresE0
ORDER BY 1