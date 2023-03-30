/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20AutoInvoice%20Grouping%20Rules%20-%20AutoInvoice%20Grouping%20Rules.sql $:
 * $Id: Manage AutoInvoice Grouping Rules - AutoInvoice Grouping Rules.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT DISTINCT RaGroupingRules.NAME RES_NAME
  , RaGroupingRules.DESCRIPTION      RES_DESCRIPTION
  , (
        SELECT name
        FROM RA_LINE_ORDERING_RULES RaLineOrderingRules
        WHERE RaLineOrderingRules.ORDERING_RULE_ID = RaGroupingRules.ORDERING_RULE_ID )    RES_LINE_ORDERING_RULE
  , TO_CHAR(RaGroupingRules.START_DATE,'DD-Mon-YYYY')                                      RES_FROM_DATE
  , TO_CHAR(RaGroupingRules.END_DATE,'DD-Mon-YYYY')                                        RES_TO_DATE
  , RaGroupingRules.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
  , RaGroupingRules.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
  , RaGroupingRules.CREATED_BY  RSC_CREATED_BY
  , RaGroupingRules.CREATION_DATE  RSC_CREATION_DATE
  , null RSC_LEDGER_ID
  , null RSC_CHART_OF_ACCOUNTS_ID
  , null RSC_BUSINESS_UNIT_ID
  , null RSC_LEGAL_ENTITY_ID
  , null RSC_ORGANIZATION_ID
  , null RSC_BUSINESS_GROUP_ID
  , NULL RSC_ENTERPRISE_ID
, NULL RSC_COUNTRY_ID

FROM RA_GROUPING_RULES RaGroupingRules
  , RA_GROUPING_TRX_TYPES Detail
  , RA_GROUP_BYS RaGroupBys
WHERE RaGroupingRules.grouping_rule_id = detail.grouping_rule_id(+)
    AND Detail.GROUPING_TRX_TYPE_ID    = RaGroupBys.GROUPING_TRX_TYPE_ID(+)