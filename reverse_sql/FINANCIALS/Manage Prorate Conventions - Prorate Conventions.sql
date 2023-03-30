/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Prorate%20Conventions%20-%20Prorate%20Conventions.sql $:
 * $Id: Manage Prorate Conventions - Prorate Conventions.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT 
ProrateConventionTypeEO.PRORATE_CONVENTION_CODE RES_NAME
,ProrateConventionTypeEO.DESCRIPTION RES_DESCRIPTION
,SETIDSETSEO.SET_NAME RES_REFERENCE_DATA_SET
,PRORATECONVENTIONTYPEEO.FISCAL_YEAR_NAME RES_FISCAL_YEAR_NAME
,decode(ProrateConventionTypeEO.DEPR_WHEN_ACQUIRED_FLAG,'YES','Yes','No') RES_DEPRECIATE_WHEN_PLACED_IN_
,ProrateConventionTypeEO.LAST_UPDATED_BY as RSC_LAST_UPDATED_BY
,ProrateConventionTypeEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE
  ,ProrateConventionTypeEO.CREATED_BY  RSC_CREATED_BY
  ,ProrateConventionTypeEO.CREATION_DATE  RSC_CREATION_DATE
  ,null RSC_LEDGER_ID
  ,null RSC_CHART_OF_ACCOUNTS_ID
  ,null RSC_BUSINESS_UNIT_ID
  ,null RSC_LEGAL_ENTITY_ID
  ,null RSC_ORGANIZATION_ID
  ,null RSC_BUSINESS_GROUP_ID
  ,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

from FA_CONVENTION_TYPES PRORATECONVENTIONTYPEEO
,FND_SETID_SETS_VL SETIDSETSEO
where   PRORATECONVENTIONTYPEEO.SET_ID                    = SETIDSETSEO.SET_ID(+)
ORDER BY ProrateConventionTypeEO.PRORATE_CONVENTION_CODE
,ProrateConventionTypeEO.FISCAL_YEAR_NAME