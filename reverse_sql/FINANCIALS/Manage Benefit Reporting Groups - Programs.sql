/* ****************************************************************************
 * $Revision: 78239 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 22:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Reporting%20Groups%20-%20Programs.sql $:
 * $Id: Manage Benefit Reporting Groups - Programs.sql 78239 2022-04-07 15:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT benRPTGGRPEO.NAME RES_NAME
,(SELECT NAME 
	FROM BEN_PGM_F 
	WHERE PGM_ID = benPOPLRPTGEO.PGM_ID
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
	) RES_PROGRAM_NAME
,TO_CHAR(benPOPLRPTGEO.EFFECTIVE_START_DATE,'DD-MM-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(benPOPLRPTGEO.EFFECTIVE_END_DATE,'DD-MM-YYYY') RES_EFFECTIVE_END_DATE
,benPOPLRPTGEO.LAST_UPDATED_BY 			RSC_LAST_UPDATED_BY
,benPOPLRPTGEO.LAST_UPDATE_DATE 			RSC_LAST_UPDATE_DATE
,benPOPLRPTGEO.CREATED_BY 				RSC_CREATED_BY
,benPOPLRPTGEO.CREATION_DATE 			RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benRPTGGRPEO.LEGISLATION_CODE RSC_COUNTRY_ID
FROM BEN_RPTG_GRP_VL benRPTGGRPEO
,BEN_POPL_RPTG_GRP_F benPOPLRPTGEO
WHERE benRPTGGRPEO.RPTG_GRP_ID = benPOPLRPTGEO.RPTG_GRP_ID 
AND benPOPLRPTGEO.COMP_OBJ_TYPE = 'PGM'
AND SYSDATE BETWEEN benPOPLRPTGEO.EFFECTIVE_START_DATE AND NVL(benPOPLRPTGEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))