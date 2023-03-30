/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2017-04-26 $:
 * $HeadURL: $:
 * $Id: Manage Account Aliases - Account Aliases.sql  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- FIELD_TO_APPLY_FUNCTION=RES_ACCOUNT/GET_CODE_COMBINATION 

-- syntax: APPLICATION_ID##RES##KFF_CODE
-- KFF_LOGIC_TO_APPLY=401##RES##MDSP
-- KFF_PREFIX_ALIAS=RES_NAME
-- KFF_COLUMN_NAME=SEGMENT

-- IMPORTANT: 
-- - the order of segments must start from 1 to ...

SELECT OrgOrganizationDefinitionsPE.ORGANIZATION_CODE RES_ORGANIZATION
,AccountAliasEO.SEGMENT1 RES_NAME_1
,AccountAliasEO.SEGMENT2 RES_NAME_2
,AccountAliasEO.SEGMENT3 RES_NAME_3
,AccountAliasEO.SEGMENT4 RES_NAME_4
,AccountAliasEO.SEGMENT5 RES_NAME_5
,AccountAliasEO.SEGMENT6 RES_NAME_6
,AccountAliasEO.SEGMENT7 RES_NAME_7
,AccountAliasEO.SEGMENT8 RES_NAME_8
,AccountAliasEO.SEGMENT9 RES_NAME_9
,AccountAliasEO.SEGMENT10 RES_NAME_10
,AccountAliasEO.SEGMENT11 RES_NAME_11
,AccountAliasEO.SEGMENT12 RES_NAME_12
,AccountAliasEO.SEGMENT13 RES_NAME_13
,AccountAliasEO.SEGMENT14 RES_NAME_14
,AccountAliasEO.SEGMENT15 RES_NAME_15
,AccountAliasEO.SEGMENT16 RES_NAME_16
,AccountAliasEO.SEGMENT17 RES_NAME_17
,AccountAliasEO.SEGMENT18 RES_NAME_18
,AccountAliasEO.SEGMENT19 RES_NAME_19
,AccountAliasEO.SEGMENT20 RES_NAME_20
,AccountAliasEO.DESCRIPTION RES_DESCRIPTION
,AccountAliasEO.DISTRIBUTION_ACCOUNT RES_ACCOUNT
,TO_CHAR(AccountAliasEO.ENABLE_DATE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(AccountAliasEO.DISABLE_DATE,'DD-Mon-YYYY') RES_END_DATE
,AccountAliasEO.STRUCTURE_INSTANCE_NUMBER RSC_EXTRA_COLUMN1
,AccountAliasEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,AccountAliasEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,AccountAliasEO.CREATED_BY RSC_CREATED_BY
,AccountAliasEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,AccountAliasEO.ORGANIZATION_ID RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM INV_GENERIC_DISPOSITIONS AccountAliasEO
,INV_ORGANIZATION_DEFINITIONS_V OrgOrganizationDefinitionsPE
WHERE AccountAliasEO.ORGANIZATION_ID = OrgOrganizationDefinitionsPE.ORGANIZATION_ID
ORDER BY OrgOrganizationDefinitionsPE.ORGANIZATION_CODE