/* ****************************************************************************
 * $Revision: 56131 $:
 * $Author: nasrullah.dusenmahamad $:
 * $Date: 2017-09-21  $:
 * $HeadURL:  $:
 * $Id: Manage Account Hierarchies - Tree Version Specify Nodes (Specific value) $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT FndTreeEO.TREE_NAME RES_TREE_NAME
,FndTreeEO.TREE_CODE RES_TREE_CODE
,FndTreeEO.TREE_STRUCTURE_CODE RES_TREE_STRUCTURE_CODE
,FndTreeVersionEO.TREE_VERSION_NAME RES_NAME
,'Specific value' RES_TREE_NODE_TYPE
,(SELECT DATA_SOURCE_NAME 
	FROM FND_TS_DATA_SOURCE_VL
	WHERE DATA_SOURCE_ID = FndTreeNodeEO.DATA_SOURCE_ID
	AND TREE_STRUCTURE_CODE = FndTreeVersionEO.TREE_STRUCTURE_CODE
	) RES_DATA_SOURCE
,(SELECT FndLableVlE0.LABEL_NAME
	FROM FND_TREE_LABEL FndTreeLabelE0
	,FND_LABEL_VL FndLableVlE0
	WHERE FndTreeLabelE0.TREE_STRUCTURE_CODE = FndLableVlE0.TREE_STRUCTURE_CODE
	AND FndTreeLabelE0.DATA_SOURCE_ID = FndLableVlE0.DATA_SOURCE_ID
	AND FndTreeLabelE0.LABEL_PK3_VALUE = FndLableVlE0.LABEL_ID
	AND FndTreeNodeEO.TREE_STRUCTURE_CODE = FndLableVlE0.TREE_STRUCTURE_CODE
	AND FndTreeNodeEO.TREE_CODE = FndTreeLabelE0.TREE_CODE
	AND FndTreeNodeEO.TREE_LABEL_ID = FndTreeLabelE0.TREE_LABEL_ID
	) RES_LABEL

,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,1)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,2)-4) RES_PARENT_NODE_NAME_1
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,2)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,3) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,2)-3) RES_PARENT_NODE_NAME_2
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,3)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,4) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,3)-3) RES_PARENT_NODE_NAME_3
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,4)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,5) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,4)-3) RES_PARENT_NODE_NAME_4
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,5)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,6) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,5)-3) RES_PARENT_NODE_NAME_5
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,6)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,7) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,6)-3) RES_PARENT_NODE_NAME_6
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,7)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,8) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,7)-3) RES_PARENT_NODE_NAME_7
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,8)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,9) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,8)-3) RES_PARENT_NODE_NAME_8
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,9)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,10) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,9)-3) RES_PARENT_NODE_NAME_9
,SUBSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,10)+3,INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,11) - INSTR(SYS_CONNECT_BY_PATH(FndTreeNodeEO.PK1_START_VALUE,'###'),'###',1,10)-3) RES_PARENT_NODE_NAME_10

,FndTreeNodeEO.PK1_START_VALUE RES_NODE_NAME_VALUE
,(SELECT ValueSetValuesE0.DESCRIPTION
	FROM FND_VS_VALUE_SETS ValueSetsE0
	,FND_VS_VALUES_VL ValueSetValuesE0
	WHERE ValueSetsE0.VALUE_SET_ID = ValueSetValuesE0.VALUE_SET_ID
	AND ValueSetValuesE0.VALUE = FndTreeNodeEO.PK1_START_VALUE
	AND ValueSetsE0.VALUE_SET_CODE = FndTreeNodeEO.PK2_START_VALUE
	) RES_NODE_DESCRIPTION
,FndTreeNodeEO.LAST_UPDATED_BY   RSC_LAST_UPDATED_BY
,FndTreeNodeEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,FndTreeNodeEO.CREATED_BY RSC_CREATED_BY
,FndTreeNodeEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_TREE_VL FndTreeEO
,FND_TREE_VERSION_VL FndTreeVersionEO
,FND_TREE_NODE FndTreeNodeEO
WHERE FndTreeEO.Tree_code = FndTreeVersionEO.tree_code
AND FndTreeVersionEO.TREE_STRUCTURE_CODE = 'GL_ACCT_FLEX'
AND FndTreeVersionEO.TREE_STRUCTURE_CODE = FndTreeNodeEO.TREE_STRUCTURE_CODE
AND FndTreeVersionEO.TREE_VERSION_ID = FndTreeNodeEO.TREE_VERSION_ID
and LEVEL <= 10
and (CHILD_COUNT = 0  OR (CHILD_COUNT > 0 and LEVEL <= 10 )   )
START WITH NVL(FndTreeNodeEO.PARENT_TREE_NODE_ID,'1') = '1'
CONNECT BY PRIOR FndTreeNodeEO.TREE_NODE_ID = FndTreeNodeEO.PARENT_TREE_NODE_ID
AND PRIOR FndTreeNodeEO.DATA_SOURCE_ID = FndTreeNodeEO.PARENT_DATA_SOURCE_ID
ORDER BY FNDTREEEO.TREE_NAME
,FndTreeVersionEO.TREE_VERSION_NAME
,RES_PARENT_NODE_NAME_1 NULLS FIRST,RES_PARENT_NODE_NAME_2 NULLS FIRST
,RES_PARENT_NODE_NAME_3 NULLS FIRST,RES_PARENT_NODE_NAME_4 NULLS FIRST
,RES_PARENT_NODE_NAME_5 NULLS FIRST,RES_PARENT_NODE_NAME_6 NULLS FIRST
,RES_PARENT_NODE_NAME_7 NULLS FIRST,RES_PARENT_NODE_NAME_8 NULLS FIRST
,RES_PARENT_NODE_NAME_9 NULLS FIRST,RES_PARENT_NODE_NAME_10 NULLS FIRST