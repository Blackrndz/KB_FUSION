/* ****************************************************************************
 * $Revision: 68671 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2018-09-13 11:43:50 +0700 (Thu, 13 Sep 2018) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.19/trunk/core/reverse_sql/FINANCIALS/Manage%20Organization%20Trees%20-%20Tree%20Version%20Specify%20Nodes%20(Values%20from%20referenced%20hierarchy).sql $:
 * $Id: Manage Organization Trees - Tree Version Specify Nodes (Values from referenced hierarchy).sql 68671 2018-09-13 04:43:50Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 
SELECT RES_TREE_NAME
,RES_TREE_CODE
,RES_TREE_STRUCTURE_CODE
,RES_NAME
,'Values from referenced hierarchy'		RES_TREE_NODE_TYPE
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE1 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_1
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE2 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_2
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE3 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_3
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE4 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_4
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE5 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_5
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE6 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_6
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE7 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_7
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE8 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_8
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE9 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_9
,(SELECT NAME||' '||POSITION_CODE||' '||TO_CHAR(EFFECTIVE_START_DATE,'YYYY-MM-DD') FROM HR_ALL_POSITIONS_F_VL a WHERE POSITION_ID  = RES_PARENT_DISPLAY_CODE10 AND ( cutOff.EFFECTIVE_END_DATE BETWEEN a.EFFECTIVE_START_DATE AND a.EFFECTIVE_END_DATE)) AS RES_PARENT_NODE_NAME_10
,RES_REFERENCED_TREE
,RES_REFERENCED_TREE_VERSION_ID
,RES_REFERENCED_TREE_VERSION
,RSC_LAST_UPDATED_BY
,RSC_LAST_UPDATE_DATE
,RSC_CREATED_BY
,RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM (SELECT cutinOff.*
	,ROW_NUMBER() OVER (PARTITION BY  RES_TREE_NAME ,RES_TREE_CODE ,RES_TREE_STRUCTURE_CODE,RES_NAME,RES_REFERENCED_TREE_VERSION,RES_PARENT_DISPLAY_CODE1,RES_PARENT_DISPLAY_CODE2
						,RES_PARENT_DISPLAY_CODE3,RES_PARENT_DISPLAY_CODE4,RES_PARENT_DISPLAY_CODE5
						,RES_PARENT_DISPLAY_CODE6,RES_PARENT_DISPLAY_CODE7,RES_PARENT_DISPLAY_CODE8,RES_PARENT_DISPLAY_CODE9,RES_PARENT_DISPLAY_CODE10
					   ORDER BY RSC_LAST_UPDATE_DATE  
					   ) AS RES_SEQUENCE_NUMBER /* PD don't need duplicate record */
	
	FROM (SELECT FndTreeVLEO.TREE_NAME								RES_TREE_NAME
		,FndTreeVLEO.TREE_CODE											RES_TREE_CODE
		,FndTreeVLEO.TREE_STRUCTURE_CODE								RES_TREE_STRUCTURE_CODE
		,FndTreeVersionEO.TREE_VERSION_NAME								RES_NAME
		,'Values from referenced hierarchy'                             RES_TREE_NODE_TYPE																                                                                                       
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,1)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,2)-4)  RES_PARENT_DISPLAY_CODE1
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,2)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,3) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,2)-3) RES_PARENT_DISPLAY_CODE2
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,3)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,4) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,3)-3) RES_PARENT_DISPLAY_CODE3
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,4)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,5) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,4)-3) RES_PARENT_DISPLAY_CODE4
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,5)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,6) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,5)-3) RES_PARENT_DISPLAY_CODE5
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,6)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,7) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,6)-3) RES_PARENT_DISPLAY_CODE6
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,7)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,8) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,7)-3) RES_PARENT_DISPLAY_CODE7
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,8)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,9) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,8)-3) RES_PARENT_DISPLAY_CODE8
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,9)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,10) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,9)-3) RES_PARENT_DISPLAY_CODE9
		,SUBSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,10)+3,INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,11) - INSTR(SYS_CONNECT_BY_PATH(NODE.PK1_START_VALUE,'###'),'###',1,10)-3) RES_PARENT_DISPLAY_CODE10
		,FndTreeVLEO.TREE_NAME										   RES_REFERENCED_TREE
		,REFERENCE_TREE_VERSION_ID									   RES_REFERENCED_TREE_VERSION_ID
		,(SELECT  FndTreeVersionEO.TREE_VERSION_NAME 
			FROM FND_TREE_VERSION_VL FndTreeVersionEO
			WHERE FndTreeVersionEO.TREE_VERSION_ID = NODE.REFERENCE_TREE_VERSION_ID 
			) RES_REFERENCED_TREE_VERSION
		,NODE.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
		,NODE.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
		,NODE.CREATED_BY RSC_CREATED_BY
		,NODE.CREATION_DATE RSC_CREATION_DATE
		,FndTreeVersionEO.EFFECTIVE_END_DATE
		,NODE.PK1_START_VALUE	  
		FROM PER_POS_TREE_NODE NODE
		,FND_TREE_VERSION_VL FndTreeVersionEO
		,FND_TREE_VL FndTreeVLEO
		WHERE NODE.TREE_STRUCTURE_CODE = 'PER_POS_TREE_STRUCTURE'
		AND NODE.TREE_CODE = FndTreeVLEO.TREE_CODE
		AND NODE.TREE_STRUCTURE_CODE = FndTreeVLEO.TREE_STRUCTURE_CODE
		AND NODE.TREE_CODE = FndTreeVersionEO.TREE_CODE
		AND NODE.TREE_VERSION_ID = FndTreeVersionEO.TREE_VERSION_ID
		AND NODE.DEPTH <= 10
		AND NODE.PK1_START_VALUE IS NULL
		START WITH NVL(NODE.PARENT_TREE_NODE_ID,'1') = '1'
		CONNECT BY PRIOR NODE.TREE_NODE_ID = NODE.PARENT_TREE_NODE_ID
		--AND NODE.DATA_SOURCE_ID = NODE.PARENT_DATA_SOURCE_ID
		) cutinOff

	) cutOff
WHERE RES_SEQUENCE_NUMBER = 1
ORDER BY RES_TREE_NAME
,RES_PARENT_NODE_NAME_2 NULLS FIRST
,RES_PARENT_NODE_NAME_3 NULLS FIRST
,RES_PARENT_NODE_NAME_4 NULLS FIRST
,RES_PARENT_NODE_NAME_5 NULLS FIRST
,RES_PARENT_NODE_NAME_6 NULLS FIRST
,RES_PARENT_NODE_NAME_7 NULLS FIRST
,RES_PARENT_NODE_NAME_8 NULLS FIRST
,RES_PARENT_NODE_NAME_9 NULLS FIRST
,RES_PARENT_NODE_NAME_10 NULLS FIRST