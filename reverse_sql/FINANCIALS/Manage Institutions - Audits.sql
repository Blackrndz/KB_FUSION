/* ****************************************************************************
 * $Revision: 60928 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-06 17:14:01 +0700 (Mon, 06 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Complete%20Primary%20to%20Secondary%20Ledger%20Mapping%20-%20Journal%20Conversion%20Rules.sql $:
 * $Id: Complete Primary to Secondary Ledger Mapping - Journal Conversion Rules.sql 60928 2017-02-06 10:14:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT gmsINSTITUE0.INSTITUTION_NAME RES_NAME
,fndLOOKUPE0.MEANING RES_TYPES_NAME
,fndLOOKUPE0.DESCRIPTION RES_DESCRIPTION

,gmsINSTITUAUDITE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,gmsINSTITUAUDITE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,gmsINSTITUAUDITE0.CREATED_BY  RSC_CREATED_BY
,gmsINSTITUAUDITE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM GMS_INSTITUTIONS_VL gmsINSTITUE0
,GMS_INSTN_AUDIT_TYPES gmsINSTITUAUDITE0
,FND_LOOKUP_VALUES fndLOOKUPE0

WHERE gmsINSTITUE0.INSTITUTION_ID = gmsINSTITUAUDITE0.INSTITUTION_ID
AND gmsINSTITUAUDITE0.AUDIT_TYPE = fndLOOKUPE0.LOOKUP_CODE
AND LOOKUP_TYPE = 'ORA_GMS_AWARD_AUDIT_TYPE' 
AND LANGUAGE = USERENV('LANG')
ORDER BY gmsINSTITUE0.INSTITUTION_NAME
,fndLOOKUPE0.MEANING
