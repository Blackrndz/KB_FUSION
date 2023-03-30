/* ****************************************************************************
 * $Revision: 59683 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-11-22 10:55:17 +0700 (Tue, 22 Nov 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Mapping%20Sets%20-%20Cost%20Management%20(Chart%20of%20Accounts%20Mappings).sql $:
 * $Id: Manage Mapping Sets - Cost Management (Chart of Accounts Mappings).sql 59683 2016-11-22 03:55:17Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT DISTINCT PartyPEO.PARTY_NAME RES_PARTY_NAME
,PartyPEO.PARTY_NUMBER RES_PARTY_NUMBER
,ClassTypeMeaning.CLASSIFICATION_TYPE_CODE RES_FISCAL_CLASSIFICATION_TYPE
,ClassTypeMeaning.CLASSIFICATION_TYPE_NAME RES_FISCAL_CLASSIFICATION_TY_0
,CodeAssignmentEO.CLASS_CODE RES_FISCAL_CLASSIFICATION_CODE
,ClassCodeMeaning.MEANING RES_FISCAL_CLASSIFICATION_NAME
,TO_CHAR(CodeAssignmentEO.START_DATE_ACTIVE,'DD-Mon-YYYY') RES_START_DATE
,DECODE(EXTRACT(YEAR FROM CodeAssignmentEO.END_DATE_ACTIVE),'4712',NULL,TO_CHAR(CodeAssignmentEO.END_DATE_ACTIVE,'DD-Mon-YYYY')) RES_END_DATE
,CodeAssignmentEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,CodeAssignmentEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,CodeAssignmentEO.CREATED_BY RSC_CREATED_BY
,CodeAssignmentEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM ZX_PARTY_TAX_PROFILE ThirdPartyTaxProfileEO
,HZ_PARTIES PartyPEO
,HZ_CODE_ASSIGNMENTS CodeAssignmentEO
,ZX_FC_TYPES_VL ClassTypeMeaning
,fnd_tree_node node
,fnd_lookup_values_vl ClassCodeMeaning
WHERE ThirdPartyTaxProfileEO.PARTY_ID      = PartyPEO.PARTY_ID
AND ThirdPartyTaxProfileEO.PARTY_TYPE_CODE = 'THIRD_PARTY'
AND ThirdPartyTaxProfileEO.PARTY_TAX_PROFILE_ID = CodeAssignmentEO.OWNER_TABLE_ID
AND CodeAssignmentEO.CLASS_CATEGORY                 = ClassTypeMeaning.OWNER_ID_CHAR
AND ClassTypeMeaning.CLASSIFICATION_TYPE_CATEG_CODE = 'PARTY_FISCAL_CLASS'
AND CodeAssignmentEO.OWNER_TABLE_NAME               = 'ZX_PARTY_TAX_PROFILE'
AND node.tree_code                                  = ClassTypeMeaning.OWNER_ID_CHAR
AND ClassTypeMeaning.classification_type_level_code =(node.depth + 1)
AND CodeAssignmentEO.CLASS_CATEGORY                 = ClassCodeMeaning.LOOKUP_TYPE
AND CodeAssignmentEO.CLASS_CODE                     = ClassCodeMeaning.LOOKUP_CODE
AND CodeAssignmentEO.CLASS_CODE                     = node.PK2_START_VALUE
ORDER BY PartyPEO.PARTY_NAME
,ClassTypeMeaning.CLASSIFICATION_TYPE_CODE