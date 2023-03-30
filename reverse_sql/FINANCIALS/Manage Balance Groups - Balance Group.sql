/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Balance%20Groups%20-%20Balance%20Group.sql $:
 * $Id: Manage Balance Groups - Balance Group.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT (SELECT NAME FROM PER_LEGISLATIVE_DATA_GROUPS_VL WHERE LEGISLATIVE_DATA_GROUP_ID = payBALGROUPO.LEGISLATIVE_DATA_GROUP_ID) RES_LEGISLATIVE_DATA_GROUP
,payBALGROUPO.GROUP_NAME RES_NAME
,payBALGROUPO.DESCRIPTION RES_DESCRIPTION
,DECODE(payBALGROUPO.GROUP_LEVEL_FLAG,'Y','Organization','Employee') RES_BALANCE_GROUP_LEVEL
,DECODE(payBALGROUPO.BALANCE_CATEGORY_ATT_FLAG,'Y','Yes','No') RES_INCLUDED_BALANCES_RESTRICT
,DECODE(payBALGROUPO.BALANCE_DIMENSION_ATT_FLAG,'Y','Yes','No') RES_INCLUDED_BALANCES_RESTRI_0

,payBALGROUPO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,payBALGROUPO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,payBALGROUPO.CREATED_BY RSC_CREATED_BY
,payBALGROUPO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PAY_BALANCE_GROUPS_VL  payBALGROUPO
ORDER BY RES_LEGISLATIVE_DATA_GROUP,payBALGROUPO.LEGISLATION_CODE,RES_NAME