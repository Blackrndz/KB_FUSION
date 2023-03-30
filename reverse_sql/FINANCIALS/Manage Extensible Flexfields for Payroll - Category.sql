/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Extensible%20Flexfields%20for%20Payroll%20-%20Category.sql $:
 * $Id: Manage Extensible Flexfields for Payroll - Category.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT flexfieldsE0.NAME RES_FLEXFIELD_NAME
,flexfieldsE0.DESCRIPTIVE_FLEXFIELD_CODE RES_FLEXFIELD_CODE
,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,1)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,2)-4) RES_PARENT_DISPLAY_CODE1
,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,2)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,3) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,2)-3) RES_PARENT_DISPLAY_CODE2
,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,3)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,4) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,3)-3) RES_PARENT_DISPLAY_CODE3
,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,4)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,5) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,4)-3) RES_PARENT_DISPLAY_CODE4
,SUBSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,5)+3,INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,6) - INSTR(SYS_CONNECT_BY_PATH(categoriesE0.CATEGORY_CODE,'###'),'###',1,5)-3) RES_PARENT_DISPLAY_CODE5
,categoriesE0.NAME RES_DISPLAY_NAME
,categoriesE0.CATEGORY_CODE RES_DISPLAY_CODE
,DECODE(categoriesE0.ENABLED_FLAG,'Y','Yes','No') RES_ENABLED
,categoriesE0.DESCRIPTION RES_DESCRIPTION
,categoriesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,categoriesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,categoriesE0.CREATED_BY RSC_CREATED_BY
,categoriesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_DF_FLEXFIELDS_VL flexfieldsE0
,FND_EF_CATEGORIES_VL categoriesE0
WHERE flexfieldsE0.FLEXFIELD_TYPE = 'EFF'
AND flexfieldsE0.APPLICATION_ID = 801
AND flexfieldsE0.CATEGORY_HIERARCHY_LABEL = categoriesE0.HIERARCHY_LABEL
START WITH NVL(categoriesE0.PARENT_CATEGORY_CODE,'1') = '1'
CONNECT BY PRIOR categoriesE0.CATEGORY_CODE = categoriesE0.PARENT_CATEGORY_CODE