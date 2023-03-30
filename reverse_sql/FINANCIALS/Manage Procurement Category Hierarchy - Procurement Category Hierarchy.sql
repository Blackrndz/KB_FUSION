/* ****************************************************************************
 * $Revision: 78335 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-04-19 17:37:18 +0700 (Tue, 19 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Procurement%20Category%20Hierarchy%20-%20Procurement%20Category%20Hierarchy.sql $:
 * $Id: Manage Procurement Category Hierarchy - Procurement Category Hierarchy.sql 78335 2022-04-19 10:37:18Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT (SELECT DECODE(CATEGORY_NAME,'POR_CATEGORY_HIERARCHY_ROOT','Root Category',CATEGORY_NAME) 
		FROM POR_BROWSE_CATEGORIES_VL WHERE CATEGORY_ID = cutOFF.PK1) RES_PROCUREMENT_CATEGORY_NAME_ 
,(SELECT DECODE(CATEGORY_NAME,'POR_CATEGORY_HIERARCHY_ROOT','Root Category',CATEGORY_NAME) 
	FROM POR_BROWSE_CATEGORIES_VL WHERE CATEGORY_ID = cutOFF.PK2 ) RES_PROCUREMENT_CATEGORY_NAM_0
,(SELECT DECODE(CATEGORY_NAME,'POR_CATEGORY_HIERARCHY_ROOT','Root Category',CATEGORY_NAME) 
	FROM POR_BROWSE_CATEGORIES_VL WHERE CATEGORY_ID = cutOFF.PK3 ) RES_PROCUREMENT_CATEGORY_NAM_1
,(SELECT DECODE(CATEGORY_NAME,'POR_CATEGORY_HIERARCHY_ROOT','Root Category',CATEGORY_NAME) 
	FROM POR_BROWSE_CATEGORIES_VL WHERE CATEGORY_ID = cutOFF.PK4 ) RES_PROCUREMENT_CATEGORY_NAM_2
,(SELECT DECODE(CATEGORY_NAME,'POR_CATEGORY_HIERARCHY_ROOT','Root Category',CATEGORY_NAME) 
	FROM POR_BROWSE_CATEGORIES_VL WHERE CATEGORY_ID = cutOFF.PK5 ) RES_PROCUREMENT_CATEGORY_NAM_3
,DECODE(BrowseCategoryEO.CATEGORY_NAME,'POR_CATEGORY_HIERARCHY_ROOT','Root Category',BrowseCategoryEO.CATEGORY_NAME) RES_PROCUREMENT_CATEGORY_NAME
,BrowseCategoryEO.CATEGORY_DESCRIPTION RES_DESCRIPTION
,BrowseCategoryEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,BrowseCategoryEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,BrowseCategoryEO.CREATED_BY RSC_CREATED_BY
,BrowseCategoryEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM (SELECT DISTINCT
SUBSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,1)+3,INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,2)-4)  PK1
,SUBSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,2)+3,INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,3) - INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,2)-3) PK2
,SUBSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,3)+3,INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,4) - INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,3)-3) PK3
,SUBSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,4)+3,INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,5) - INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,4)-3) PK4
,SUBSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,5)+3,INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,6) - INSTR(SYS_CONNECT_BY_PATH(BrowseCategoryTreeEO.PARENT_CATEGORY_ID,'###'),'###',1,5)-3) PK5
,LEVEL AS a
,BrowseCategoryTreeEO.PARENT_CATEGORY_ID
--,BrowseCategoryTreeEO.CHILD_CATEGORY_ID CHILD_CATEGORY_ID
FROM POR_BROWSE_TREES BrowseCategoryTreeEO
START WITH BrowseCategoryTreeEO.PARENT_CATEGORY_ID = '2'
CONNECT BY PRIOR BrowseCategoryTreeEO.CHILD_CATEGORY_ID = BrowseCategoryTreeEO.PARENT_CATEGORY_ID) cutOFF
,POR_BROWSE_CATEGORIES_VL BrowseCategoryEO
WHERE PARENT_CATEGORY_ID NOT IN (SELECT CATEGORY_ID FROM POR_BROWSE_CATEGORIES_VL WHERE CATEGORY_NAME ='POR_CATEGORY_HIERARCHY_ROOT')
AND cutoFF.PARENT_CATEGORY_ID = BrowseCategoryEO.CATEGORY_ID(+)
ORDER BY cutOFF.a,RES_PROCUREMENT_CATEGORY_NAME