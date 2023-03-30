/* ****************************************************************************
 * $Revision: 59683 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-11-22 10:55:17 +0700 (Tue, 22 Nov 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Mapping%20Sets%20-%20Cost%20Management%20(Chart%20of%20Accounts%20Mappings).sql $:
 * $Id: Manage Mapping Sets - Cost Management (Chart of Accounts Mappings).sql 59683 2016-11-22 03:55:17Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT XleEntityProfiles.NAME RES_LEGAL_ENTITY
,ZxReportingTypesVl.REPORTING_TYPE_CODE RES_TAX_REPORTING_TYPE_CODE
,DatatypeLookups.MEANING RES_DATA_TYPE
,(
	CASE
		WHEN ZxReportingTypesVl.REPORTING_TYPE_DATATYPE_CODE = 'TEXT'
		THEN TaxReportingCodeAssociationE0.REPORTING_CODE_CHAR_VALUE
		WHEN ZxReportingTypesVl.REPORTING_TYPE_DATATYPE_CODE = 'DATE'
		THEN TO_CHAR(TaxReportingCodeAssociationE0.REPORTING_CODE_DATE_VALUE,'DD-Mon-YYYY')
		WHEN ZxReportingTypesVl.REPORTING_TYPE_DATATYPE_CODE = 'NUMERIC_VALUE'
		THEN TO_CHAR(TaxReportingCodeAssociationE0.REPORTING_CODE_NUM_VALUE)
	END) RES_TAX_REPORTING_CODE
,ZxReportingCodesVl.REPORTING_CODE_NAME RES_DESCRIPTION
,TO_CHAR(TaxReportingCodeAssociationE0.EFFECTIVE_FROM,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(TaxReportingCodeAssociationE0.EFFECTIVE_TO,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE
,TaxReportingCodeAssociationE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,TaxReportingCodeAssociationE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,TaxReportingCodeAssociationE0.CREATED_BY RSC_CREATED_BY
,TaxReportingCodeAssociationE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,XleEntityProfiles.LEGAL_ENTITY_ID RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM XLE_REGISTRATIONS XleRegistrations
,XLE_ENTITY_PROFILES XleEntityProfiles
,ZX_PARTY_TAX_PROFILE LegalEntityTaxProfileEO
,XLE_LOCATIONS_V LocationDPEO
,ZX_REPORT_CODES_ASSOC TaxReportingCodeAssociationE0
,ZX_REPORTING_TYPES_VL ZxReportingTypesVl
,ZX_REPORTING_CODES_VL ZxReportingCodesVl
,FND_LOOKUPS DatatypeLookups
WHERE XleEntityProfiles.legal_entity_id             = XleRegistrations.source_id
AND XleRegistrations.source_table                   = 'XLE_ENTITY_PROFILES'
AND XleRegistrations.identifying_flag               = 'Y'
AND XleEntityProfiles.PARTY_ID                      = LegalEntityTaxProfileEO.PARTY_ID
AND xleregistrations.location_id                    = locationdpeo.location_id
AND LegalEntityTaxProfileEO.PARTY_TAX_PROFILE_ID    = TaxReportingCodeAssociationE0.ENTITY_ID
AND TaxReportingCodeAssociationE0.REPORTING_TYPE_ID = ZxReportingTypesVl.REPORTING_TYPE_ID
AND TaxReportingCodeAssociationE0.REPORTING_CODE_ID = ZxReportingCodesVl.REPORTING_CODE_ID(+)
AND DatatypeLookups.LOOKUP_TYPE                     = 'ZX_REPORTING_DATA'
AND DatatypeLookups.LOOKUP_CODE                     = ZxReportingTypesVl.REPORTING_TYPE_DATATYPE_CODE
ORDER BY UPPER(XleEntityProfiles.NAME)
,ZxReportingTypesVl.REPORTING_TYPE_CODE
,RES_TAX_REPORTING_CODE
,TaxReportingCodeAssociationE0.EFFECTIVE_FROM