/* ****************************************************************************
 * $Revision: 78239 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 22:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Reporting%20Groups%20-%20Regulatory%20Body.sql $:
 * $Id: Manage Benefit Reporting Groups - Regulatory Body.sql 78239 2022-04-07 15:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT benRPTGGRPEO.NAME RES_NAME
,benPLREGYBODYEO.REGY_PL_NAME RES_REGULATORY_NAME
,(SELECT NAME 
	FROM HR_ORGANIZATION_V 
	WHERE ORGANIZATION_ID = benPLREGYBODYEO.ORGANIZATION_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
	) RES_REGULATORY_BODY
,TO_CHAR(benPLREGYBODYEO.APRVD_TRMN_DT,'DD-MM-YYYY') RES_PLAN_VALIDITY_END_DATE
,TO_CHAR(benPLREGYBODYEO.QUALD_DT,'DD-MM-YYYY') RES_PLAN_QUALIFIED_DATE
,TO_CHAR(benPLREGYBODYEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(benPLREGYBODYEO.EFFECTIVE_END_DATE,'DD-MM-YYYY') RES_EFFECTIVE_END_DATE
,benPLREGYBODYEO.LAST_UPDATED_BY 			RSC_LAST_UPDATED_BY
,benPLREGYBODYEO.LAST_UPDATE_DATE 			RSC_LAST_UPDATE_DATE
,benPLREGYBODYEO.CREATED_BY 				RSC_CREATED_BY
,benPLREGYBODYEO.CREATION_DATE 			RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benRPTGGRPEO.LEGISLATION_CODE RSC_COUNTRY_ID
FROM BEN_RPTG_GRP_VL benRPTGGRPEO
,BEN_PL_REGY_BOD_F benPLREGYBODYEO
WHERE benRPTGGRPEO.RPTG_GRP_ID = benPLREGYBODYEO.RPTG_GRP_ID 
AND SYSDATE BETWEEN benPLREGYBODYEO.EFFECTIVE_START_DATE AND NVL(benPLREGYBODYEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))