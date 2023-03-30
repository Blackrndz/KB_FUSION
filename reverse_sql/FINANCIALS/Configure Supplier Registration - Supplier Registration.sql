/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Configure%20Supplier%20Registration%20-%20Supplier%20Registration.sql $:
 * $Id: Configure Supplier Registration - Supplier Registration.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

select POZLOOKUPPEO.DISPLAYED_FIELD RES_SUPPLIER_PROFILE
,(select MEANING from FND_LOOKUPS LOOKUPPEO where LOOKUP_TYPE = 'ORA_POZ_ENABLED_REQ_HIDDEN' and LOOKUP_CODE = SUPPLIERENTITYCONFIGEO.REG_PROSPECTIVE) RES_SUPPLIER_REGISTRATION_PROS
,(select MEANING from FND_LOOKUPS LOOKUPPEO where LOOKUP_TYPE = 'ORA_POZ_ENABLED_REQ_HIDDEN' and LOOKUP_CODE = SUPPLIERENTITYCONFIGEO.REG_SPEND_AUTH) RES_SUPPLIER_REGISTRATION_SPEN
,SUPPLIERENTITYCONFIGEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,SUPPLIERENTITYCONFIGEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,SUPPLIERENTITYCONFIGEO.CREATED_BY  RSC_CREATED_BY
,SUPPLIERENTITYCONFIGEO.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM POZ_SUPPLIER_ENTITY_CONFIG SupplierEntityConfigEO
,POZ_LOOKUP_CODES PozLookupPEO
WHERE SupplierEntityConfigEO.SUPPLIER_PROFILE_ENTITY = PozLookupPEO.LOOKUP_CODE
and POZLOOKUPPEO.LOOKUP_TYPE                         = 'ORA_POZ_SUPPLIER_ENTITY'
AND SUPPLIERENTITYCONFIGEO.REG_PROSPECTIVE IS NOT NULL
AND SUPPLIERENTITYCONFIGEO.REG_SPEND_AUTH IS NOT NULL
ORDER BY PozLookupPEO.DISPLAY_SEQUENCE