/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Employment%20Extensible%20Flexfields%20-%20Pages.sql $:
 * $Id: Manage Employment Extensible Flexfields - Pages.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT QTSLR.RES_FLEXFIELD_NAME
,QTSLR.DESCRIPTIVE_FLEXFIELD_CODE RES_FLEXFIELD_CODE
,QTSLR.RES_PARENT_DISPLAY_CODE1
,QTSLR.RES_PARENT_DISPLAY_CODE2
,QTSLR.RES_PARENT_DISPLAY_CODE3
,QTSLR.RES_PARENT_DISPLAY_CODE4
,QTSLR.RES_PARENT_DISPLAY_CODE5
,QTSLR.RES_CATEGORY_DISPLAY_NAME
,QTSLR.RES_CATEGORY_DISPLAY_CODE
,pagesE0.SEQUENCE_NUMBER RES_SEQUENCE
,pagesE0.NAME RES_DISPLAY_NAME
,pagesE0.PAGE_CODE RES_DISPLAY_CODE
,pagesE0.DESCRIPTION RES_DESCRIPTION
,pagesE0.INSTRUCTION_HELP_TEXT RES_INSTRUCTION_HELP_TEXT
,(SELECT NAME
	FROM FND_DF_FLEX_USAGES_VL
	WHERE DESCRIPTIVE_FLEXFIELD_CODE = QTSLR.DESCRIPTIVE_FLEXFIELD_CODE
	AND APPLICATION_ID = QTSLR.APPLICATION_ID
	AND FLEXFIELD_USAGE_CODE = pagesE0.FLEXFIELD_USAGE_CODE
	) RES_USAGE
,pagesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,pagesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,pagesE0.CREATED_BY RSC_CREATED_BY
,pagesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM (SELECT flexfieldsE0.NAME RES_FLEXFIELD_NAME
	,flexfieldsE0.DESCRIPTIVE_FLEXFIELD_CODE 
	,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,1)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,2)-4) RES_PARENT_DISPLAY_CODE1
	,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,2)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,3) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,2)-3) RES_PARENT_DISPLAY_CODE2
	,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,3)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,4) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,3)-3) RES_PARENT_DISPLAY_CODE3
	,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,4)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,5) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,4)-3) RES_PARENT_DISPLAY_CODE4
	,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,5)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,6) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,5)-3) RES_PARENT_DISPLAY_CODE5
	,categoriesE0.NAME RES_CATEGORY_DISPLAY_NAME
	,categoriesE0.CATEGORY_CODE RES_CATEGORY_DISPLAY_CODE
	,flexfieldsE0.APPLICATION_ID
	,categoriesE0.CATEGORY_CODE
	FROM FND_DF_FLEXFIELDS_VL flexfieldsE0
	,FND_EF_CATEGORIES_VL categoriesE0
	WHERE flexfieldsE0.FLEXFIELD_TYPE = 'EFF'
	AND flexfieldsE0.APPLICATION_ID = 800
	AND flexfieldsE0.DESCRIPTIVE_FLEXFIELD_CODE IN
	(SELECT BoAttributeValuesEO.BO_ATTRIBUTE_VALUE
	FROM ASK_BO_ATTRIBUTE_VALUES BOATTRIBUTEVALUESEO
	WHERE(BOATTRIBUTEVALUESEO.BO_ATTRIBUTE_SHORT_NAME = 'extensibleFlexfieldCode'
	AND BoAttributeValuesEO.TASK_ID                   =
		(SELECT task_id
		FROM ASK_TASKS_VL
		WHERE TASK_SHORT_NAME = 'ORA_PER_MANAGE_EMPLOYMENT_EXTENSIBLE_FLEXFIELDS'))
		)
	AND flexfieldsE0.CATEGORY_HIERARCHY_LABEL = categoriesE0.HIERARCHY_LABEL
	START WITH NVL(categoriesE0.PARENT_CATEGORY_CODE,'1') = '1'
	CONNECT BY PRIOR categoriesE0.CATEGORY_CODE = categoriesE0.PARENT_CATEGORY_CODE
	) QTSLR
,FND_EF_UI_PAGES_VL pagesE0
WHERE QTSLR.APPLICATION_ID = pagesE0.APPLICATION_ID
AND QTSLR.DESCRIPTIVE_FLEXFIELD_CODE = pagesE0.DESCRIPTIVE_FLEXFIELD_CODE
AND QTSLR.CATEGORY_CODE = pagesE0.CATEGORY_CODE