/* ****************************************************************************
* $Revision: 80051 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2023-01-30 19:28:52 +0700 (Mon, 30 Jan 2023) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Calendar%20Events%20-%20Coverage%20Source.sql $:
* $Id: Manage Calendar Events - Coverage Source.sql 80051 2023-01-30 12:28:52Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

/*WITH TREE_PATH AS (SELECT CAL_EVENT_COVERAGE_ID
	--,SUBSTR(SYS_CONNECT_BY_PATH(TREE_NODE_ID,','),1,INSTR(SYS_CONNECT_BY_PATH(TREE_NODE_ID,','),',',-1)-1 ) AS VALUETREE 
	,SYS_CONNECT_BY_PATH(TREE_NODE_ID,',') AS VALUETREE
	FROM PER_CAL_EVENT_COVERAGE A
	WHERE CALENDAR_EVENT_ID = 300000264628114
	START WITH A.PARENT_CAL_EVENT_COVERAGE_ID IS NULL
	CONNECT BY PRIOR A.CAL_EVENT_COVERAGE_ID = A.PARENT_CAL_EVENT_COVERAGE_ID)*/
WITH GEO_TREE AS (SELECT node.TREE_NODE_ID,SYS_CONNECT_BY_PATH(node.TREE_NODE_ID,',') AS VALUETREE
						FROM PER_GEO_TREE_NODE node
						START WITH node.PARENT_TREE_NODE_ID IS NULL
						CONNECT BY PRIOR node.TREE_NODE_ID = node.PARENT_TREE_NODE_ID 
						AND PRIOR node.DATA_SOURCE_ID = node.PARENT_DATA_SOURCE_ID)
,ORG_TREE AS (SELECT node.TREE_NODE_ID,SYS_CONNECT_BY_PATH(node.TREE_NODE_ID,',') AS VALUETREE
						FROM PER_ORG_TREE_NODE node
						START WITH node.PARENT_TREE_NODE_ID IS NULL
						CONNECT BY PRIOR node.TREE_NODE_ID = node.PARENT_TREE_NODE_ID 
						AND PRIOR node.DATA_SOURCE_ID = node.PARENT_DATA_SOURCE_ID)



SELECT calendarEventsE0.NAME RES_NAME
,calendarEventsE0.SHORT_CODE RES_SHORT_CODE
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_1 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_1)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_1 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_1)
	END) RES_PARENT_COVERAGE_1
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_2 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_2)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_2 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_2)
	END) RES_PARENT_COVERAGE_2
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_3 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_3)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_3 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_3)
	END) RES_PARENT_COVERAGE_3
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_4 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_4)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_4 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_4)
	END) RES_PARENT_COVERAGE_4
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_5 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_5)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_5 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_5)
	END) RES_PARENT_COVERAGE_5
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_6 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_6)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_6 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_6)
	END) RES_PARENT_COVERAGE_6
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_7 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_7)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_7 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_7)
	END) RES_PARENT_COVERAGE_7
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_8 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_8)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_8 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_8)
	END) RES_PARENT_COVERAGE_8
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_9 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_9)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_9 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_9)
	END) RES_PARENT_COVERAGE_9
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_10 AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		(SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_10)
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = valTREE.COVERAGE_10 AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = valTREE.COVERAGE_10)
	END) RES_PARENT_COVERAGE_10
,(CASE WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = calendarEventscoverE0.TREE_NODE_ID AND PK2_START_VALUE IS NOT NULL) 
	THEN 
		NVL((SELECT LOOKUP_CODE||' '||MEANING 
			FROM FND_LOOKUP_VALUES fndLOOK
			,PER_GEO_TREE_NODE perGEO 
			WHERE LANGUAGE = USERENV('LANG') 
			AND fndLOOK.LOOKUP_TYPE = perGEO.PK2_START_VALUE 
			AND fndLOOK.LOOKUP_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = calendarEventscoverE0.TREE_NODE_ID)
		,(SELECT PK1_START_VALUE||' '||PK2_START_VALUE 
			FROM PER_GEO_TREE_NODE perGEO 
			WHERE perGEO.TREE_NODE_ID = calendarEventscoverE0.TREE_NODE_ID))
	WHEN EXISTS (SELECT 1 FROM PER_GEO_TREE_NODE WHERE TREE_NODE_ID = calendarEventscoverE0.TREE_NODE_ID AND PK2_START_VALUE IS NULL)
	THEN 
		(SELECT GEOGRAPHY_CODE||' '||GEOGRAPHY_NAME 
			FROM HZ_GEOGRAPHIES hzGEO
			,PER_GEO_TREE_NODE perGEO 
			WHERE hzGEO.CREATED_BY_MODULE = 'HZ_GEO_HIERARCHY'
			AND hzGEO.GEOGRAPHY_CODE = perGEO.PK1_START_VALUE 
			AND perGEO.TREE_NODE_ID = calendarEventscoverE0.TREE_NODE_ID)
	END) RES_COVERAGE
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
   WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'PER_CAL_COVERAGE_SCOPES'
    AND LOOKUP_CODE = calendarEventscoverE0.COVERAGE_FLAG
    ) RES_USAGE
,calendarEventscoverE0.OVERRIDE_NAME RES_OVERRIDE_NAME
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
   WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'PER_CAL_EVENT_CATEGORY'
    AND LOOKUP_CODE = calendarEventscoverE0.OVERRIDE_CATEGORY
    ) RES_OVERRIDE_CATEGORY
,calendarEventscoverE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,calendarEventscoverE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,calendarEventscoverE0.CREATED_BY RSC_CREATED_BY
,calendarEventscoverE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
FROM PER_CALENDAR_EVENTS_VL calendarEventsE0
,PER_CAL_EVENT_COVERAGE calendarEventscoverE0
,(SELECT TREE_NODE_ID
	,SUBSTR(VALUETREE||','||',',INSTR(VALUETREE||',',',',1,1)+1,INSTR(VALUETREE||',',',',1,2)-(INSTR(VALUETREE||',',',',1,1)+1)) COVERAGE_1
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+1,INSTR(VALUETREE||',',',',1,3)-(INSTR(VALUETREE||',',',',1,2)+1)) COVERAGE_2
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+2,INSTR(VALUETREE||',',',',1,4)-(INSTR(VALUETREE||',',',',1,2)+2)) COVERAGE_3
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+3,INSTR(VALUETREE||',',',',1,5)-(INSTR(VALUETREE||',',',',1,2)+3)) COVERAGE_4
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+4,INSTR(VALUETREE||',',',',1,6)-(INSTR(VALUETREE||',',',',1,2)+4)) COVERAGE_5
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+5,INSTR(VALUETREE||',',',',1,7)-(INSTR(VALUETREE||',',',',1,2)+5)) COVERAGE_6
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+6,INSTR(VALUETREE||',',',',1,8)-(INSTR(VALUETREE||',',',',1,2)+6)) COVERAGE_7
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+7,INSTR(VALUETREE||',',',',1,9)-(INSTR(VALUETREE||',',',',1,2)+7)) COVERAGE_8
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+8,INSTR(VALUETREE||',',',',1,10)-(INSTR(VALUETREE||',',',',1,2)+8)) COVERAGE_9
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+9,INSTR(VALUETREE||',',',',1,11)-(INSTR(VALUETREE||',',',',1,2)+9)) COVERAGE_10
	FROM GEO_TREE) valTREE
WHERE calendarEventsE0.CALENDAR_EVENT_ID = calendarEventscoverE0.CALENDAR_EVENT_ID 
AND calendarEventscoverE0.TREE_NODE_ID = valTREE.TREE_NODE_ID
AND calendarEventsE0.TREE_STRUCTURE_CODE = 'PER_GEO_TREE_STRUCTURE'

UNION

SELECT calendarEventsE0.NAME RES_NAME
,calendarEventsE0.SHORT_CODE RES_SHORT_CODE
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_1) RES_PARENT_COVERAGE_1
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_2) RES_PARENT_COVERAGE_2
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_3) RES_PARENT_COVERAGE_3
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_4) RES_PARENT_COVERAGE_4
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_5) RES_PARENT_COVERAGE_5
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_6) RES_PARENT_COVERAGE_6
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_7) RES_PARENT_COVERAGE_7
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_8) RES_PARENT_COVERAGE_8
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_9) RES_PARENT_COVERAGE_9
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = valTREE.COVERAGE_10) RES_PARENT_COVERAGE_10
,(SELECT NAME 
			FROM HR_ORGANIZATION_UNITS hrORG
			,PER_ORG_TREE_NODE perORG 
			WHERE hrORG.ORGANIZATION_ID = perORG.PK1_START_VALUE 
			AND perORG.TREE_NODE_ID = calendarEventscoverE0.TREE_NODE_ID) RES_COVERAGE
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
   WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'PER_CAL_COVERAGE_SCOPES'
    AND LOOKUP_CODE = calendarEventscoverE0.COVERAGE_FLAG
    ) RES_USAGE
,calendarEventscoverE0.OVERRIDE_NAME RES_OVERRIDE_NAME
,(SELECT MEANING
    FROM FND_LOOKUP_VALUES
   WHERE LANGUAGE = USERENV('LANG')
    AND LOOKUP_TYPE = 'PER_CAL_EVENT_CATEGORY'
    AND LOOKUP_CODE = calendarEventscoverE0.OVERRIDE_CATEGORY
    ) RES_OVERRIDE_CATEGORY
,calendarEventscoverE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,calendarEventscoverE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,calendarEventscoverE0.CREATED_BY RSC_CREATED_BY
,calendarEventscoverE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
FROM PER_CALENDAR_EVENTS_VL calendarEventsE0
,PER_CAL_EVENT_COVERAGE calendarEventscoverE0
,(SELECT TREE_NODE_ID
	,SUBSTR(VALUETREE||','||',',INSTR(VALUETREE||',',',',1,1)+1,INSTR(VALUETREE||',',',',1,2)-(INSTR(VALUETREE||',',',',1,1)+1)) COVERAGE_1
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+1,INSTR(VALUETREE||',',',',1,3)-(INSTR(VALUETREE||',',',',1,2)+1)) COVERAGE_2
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+2,INSTR(VALUETREE||',',',',1,4)-(INSTR(VALUETREE||',',',',1,2)+2)) COVERAGE_3
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+3,INSTR(VALUETREE||',',',',1,5)-(INSTR(VALUETREE||',',',',1,2)+3)) COVERAGE_4
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+4,INSTR(VALUETREE||',',',',1,6)-(INSTR(VALUETREE||',',',',1,2)+4)) COVERAGE_5
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+5,INSTR(VALUETREE||',',',',1,7)-(INSTR(VALUETREE||',',',',1,2)+5)) COVERAGE_6
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+6,INSTR(VALUETREE||',',',',1,8)-(INSTR(VALUETREE||',',',',1,2)+6)) COVERAGE_7
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+7,INSTR(VALUETREE||',',',',1,9)-(INSTR(VALUETREE||',',',',1,2)+7)) COVERAGE_8
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+8,INSTR(VALUETREE||',',',',1,10)-(INSTR(VALUETREE||',',',',1,2)+8)) COVERAGE_9
	,SUBSTR(VALUETREE||',',INSTR(VALUETREE||',',',',1,2)+9,INSTR(VALUETREE||',',',',1,11)-(INSTR(VALUETREE||',',',',1,2)+9)) COVERAGE_10
	FROM ORG_TREE) valTREE
WHERE calendarEventsE0.CALENDAR_EVENT_ID = calendarEventscoverE0.CALENDAR_EVENT_ID 
AND calendarEventscoverE0.TREE_NODE_ID = valTREE.TREE_NODE_ID
AND calendarEventsE0.TREE_STRUCTURE_CODE = 'PER_ORG_TREE_STRUCTURE'

ORDER BY 1
,2