/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Benefit%20Service%20Areas%20-%20Add%20Postal%20Code%20Range.sql $:
 * $Id: Manage Benefit Service Areas - Add Postal Code Range.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT  benSVCAREAEO.NAME  RES_NAME
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benSVCAREAEO.ORG_UNIT_PRDCT
	AND LOOKUP_TYPE = 'BEN_PRDCT' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_SERVICE_TYPE
,TO_CHAR(benSVCAREAEO.START_DATE,'DD-MM-YYYY')  RES_SERVICE_AREA_START_DATE
,TO_CHAR(benPSTLZIPRNGEO.FROM_VALUE,'999') RES_FROM_VALUE
,TO_CHAR(benPSTLZIPRNGEO.TO_VALUE,'999') RES_TO_VALUE
,TO_CHAR(benSVCAREAPSTLZIPEO.START_DATE,'DD-MM-YYYY') RES_START_DATE
,TO_CHAR(benSVCAREAPSTLZIPEO.END_DATE,'DD-MM-YYYY') RES_END_DATE

,benSVCAREAPSTLZIPEO.LAST_UPDATED_BY 			RSC_LAST_UPDATED_BY
,benSVCAREAPSTLZIPEO.LAST_UPDATE_DATE 			RSC_LAST_UPDATE_DATE
,benSVCAREAPSTLZIPEO.CREATED_BY 				RSC_CREATED_BY
,benSVCAREAPSTLZIPEO.CREATION_DATE 			RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM BEN_SVC_AREA benSVCAREAEO
,BEN_SVC_AREA_PSTL_ZIP_RNG benSVCAREAPSTLZIPEO
,BEN_PSTL_ZIP_RNG benPSTLZIPRNGEO
WHERE benSVCAREAEO.SVC_AREA_ID = benSVCAREAPSTLZIPEO.SVC_AREA_ID
AND benSVCAREAPSTLZIPEO.PSTL_ZIP_RNG_ID = benPSTLZIPRNGEO.PSTL_ZIP_RNG_ID
AND SYSDATE BETWEEN benSVCAREAEO.START_DATE AND NVL(benSVCAREAEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN benSVCAREAPSTLZIPEO.START_DATE AND NVL(benSVCAREAPSTLZIPEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
AND SYSDATE BETWEEN benPSTLZIPRNGEO.START_DATE AND NVL(benPSTLZIPRNGEO.END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))