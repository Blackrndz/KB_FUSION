/* ****************************************************************************
 * $Revision: 79803 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-12-09 15:39:48 +0700 (Fri, 09 Dec 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Establish%20Enterprise%20Structures%20(Finland)%20-%20Manage%20Enterprise%20Configuration.sql $:
 * $Id: Establish Enterprise Structures (Finland) - Manage Enterprise Configuration.sql 79803 2022-12-09 08:39:48Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

  SELECT ConfigurationsEO.NAME AS RES_NAME,
  ConfigurationsEO.DESCRIPTION AS RES_DESCRIPTION,
  DECODE(ConfigurationsEO.STATUS,'AVAILABLE','No','Yes') AS RES_LOAD_ENTERPRISE_CONFIGURAT,
  EnterpriseEO.NAME AS RES_ENTERPRISE_NAME,
  EnterpriseEO.SHORT_NAME AS RES_SHORT_NAME,
  (SELECT INDUSTRY_NAME
	FROM FND_INDUSTRIES_TL
	WHERE INDUSTRY_CODE = EnterpriseEO.PRIMARY_INDUSTRY
	AND LANGUAGE = USERENV('LANG')
	) AS RES_PRIMARY_INDUSTRY,
  (SELECT TERRITORY_SHORT_NAME FROM fusion.FND_TERRITORIES_VL WHERE TERRITORY_CODE = HrwLocationsEO.COUNTRY_CODE) AS RES_HEADQUARTERS_COUNTRY,
  LegalEntityEO.NAME AS RES_LEGAL_NAME,
  LegalEntityEO.LEGAL_ENTITY_IDENTIFIER AS RES_LEGAL_ENTITY_IDENTIFIER,
  LegalEntityEO.LEGAL_ENTITY_REG_NUMBER AS RES_LEGAL_ENTITY_REGISTRATION_,
  LegalEntityEO.LEGAL_REPORTING_UNIT_NUM AS RES_LEGAL_REPORTING_UNIT_REGIS,
  'Create New Address' AS RES_LEGAL_ADDRESS,
   HrwLocationsEO.LOCATION_CODE AS RES_LOCATION_NAME,
  HrwLocationsEO.DESCRIPTION AS RES_LOCATION_DESCRIPTION,
  HrwLocationsEO.ADDRESS_LINE1 RES_STREET_NAME,
  HrwLocationsEO.ADDRESS_LINE1 AS RES_ADDRESS_LINE_1,
  HrwLocationsEO.ADDRESS_LINE2 AS RES_ADDRESS_LINE_2,
  HrwLocationsEO.ADDRESS_LINE3 AS RES_ADDRESS_LINE_3,
  HrwLocationsEO.TOWN_OR_CITY AS RES_CITY,
  HrwLocationsEO.POSTAL_CODE AS RES_POSTAL_CODE,
  HrwLocationsEO.ADDL_ADDRESS_ATTRIBUTE1 RES_POST_OFFICE
  ,ConfigurationsEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
  ,ConfigurationsEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
  ,ConfigurationsEO.CREATED_BY  RSC_CREATED_BY
  ,ConfigurationsEO.CREATION_DATE  RSC_CREATION_DATE
  ,null RSC_LEDGER_ID
  ,null RSC_CHART_OF_ACCOUNTS_ID
  ,null RSC_BUSINESS_UNIT_ID
  ,null RSC_LEGAL_ENTITY_ID
  ,null RSC_ORGANIZATION_ID
  ,null RSC_BUSINESS_GROUP_ID
  ,ConfigurationsEO.ENTERPRISE_ID RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM fusion.HRW_CONFIGURATIONS ConfigurationsEO,
     fusion.HRW_ENTERPRISES EnterpriseEO,
	 fusion.HRW_LEGAL_ENTITIES LegalEntityEO,
	 fusion.HRW_LOCATIONS HrwLocationsEO
WHERE ConfigurationsEO.CONFIGURATION_ID = EnterpriseEO.CONFIGURATION_ID
AND ConfigurationsEO.CONFIGURATION_ID = LegalEntityEO.CONFIGURATION_ID
AND ConfigurationsEO.CONFIGURATION_ID = HrwLocationsEO.CONFIGURATION_ID
AND LegalEntityEO.LOCATION_ID = HrwLocationsEO.LOCATION_ID
AND LegalEntityEO.ULTIMATE_HOLDING_COMPANY = 'Y'
AND LegalEntityEO.COUNTRY_CODE = 'FI'
ORDER BY ConfigurationsEO.NAME