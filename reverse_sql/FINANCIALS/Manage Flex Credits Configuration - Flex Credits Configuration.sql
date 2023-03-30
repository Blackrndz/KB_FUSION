/* ****************************************************************************
 * $Revision: 54943 $:
 * $Author: paul.wakefield $:
 * $Date: 2016-05-04 13:45:23 +0700 (Wed, 04 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.19/trunk/core/reverse_sql/FINANCIALS/Manage%20Trading%20Community%20Person%20Lookups%20-%20Standard%20Lookup%20Type.sql $:
 * $Id: Manage Trading Community Person Lookups - Standard Lookup Type.sql 54943 2016-05-04 06:45:23Z paul.wakefield $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT benPLEO.NAME RES_PLAN_NAME
,TO_CHAR(benPLEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(benPLEO.EFFECTIVE_END_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPLEO.PL_CD 
	AND LANGUAGE = USERENV('LANG') AND LOOKUP_TYPE = 'BEN_PL'
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_USAGE
,(CASE WHEN benPLEO.ALWS_UNRSTRCTD_ENRT_FLAG = 'Y' 
	THEN 'Unrestricted'
	ELSE 'Life event'
		END) RES_MODE
,benPLTYPEO.NAME RES_PLAN_TYPE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPLEO.PL_STAT_CD 
	AND LANGUAGE = USERENV('LANG') AND LOOKUP_TYPE = 'BEN_STAT'
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_STATUS
,NULL RES_SUMMARY

,benPLEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benPLEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benPLEO.CREATED_BY RSC_CREATED_BY
,benPLEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPLEO.LEGISLATION_CODE RSC_COUNTRY_ID

FROM BEN_PL_F benPLEO
,BEN_PL_TYP_F benPLTYPEO
WHERE benPLEO.PL_TYP_ID = benPLTYPEO.PL_TYP_ID
AND benPLEO.INVK_FLX_CR_PL_FLAG = 'Y'
AND SYSDATE BETWEEN benPLEO.EFFECTIVE_START_DATE AND NVL(benPLEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND SYSDATE BETWEEN benPLTYPEO.EFFECTIVE_START_DATE AND NVL(benPLTYPEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
