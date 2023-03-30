/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2017-08-09  $:
 * $HeadURL:  $:
 * $Id: Manage Sourcing Rules - Sourcing Rule $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT benPGMEO.NAME RES_PROGRAM_NAME
,TO_CHAR(benPGMEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,TO_CHAR(benPGMEO.EFFECTIVE_END_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_END_DATE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPGMEO.PGM_TYP_CD
	AND LOOKUP_TYPE = 'BEN_PGM_TYP' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE  AND NVL(END_DATE_ACTIVE,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_PROGRAM_TYPE
,benPGMEO.PGM_DESC RES_DESCRIPTION
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPGMEO.PGM_STAT_CD
	AND LOOKUP_TYPE = 'BEN_STAT' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE  AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_STATUS
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPGMEO.ENRT_INFO_RT_FREQ_CD
	AND LOOKUP_TYPE = 'BEN_ENRT_INFO_RT_FREQ' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE  AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_COMMUNICATED_RATE_FREQUENC
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPGMEO.ACTY_REF_PERD_CD
	AND LOOKUP_TYPE = 'BEN_ACTY_REF_PERD' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE  AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_DEFINED_RATE_FREQUENCY
,'Legal Entity' RES_RATE_LEVEL
,(SELECT NAME FROM FND_CURRENCIES_VL WHERE CURRENCY_CODE = benPGMEO.PGM_UOM) RES_DEFAULT_PROGRAM_CURRENCY
,DECODE(benPGMEO.GLOBAL_FLAG,'Y','Yes','No') RES_GLOBAL_PROGRAM
,DECODE(benPGMEO.ALWS_UNRSTRCTD_ENRT_FLAG,'Y','Yes','No') RES_ENABLE_UNRESTRICTED_ENROLL
,benPGMEO.SHORT_NAME RES_SHORT_NAME
,benPGMEO.SHORT_CODE RES_SHORT_CODE
,benPGMEO.IVR_IDENT RES_INTERACTIVE_VOICE_RESPONSE
,benPGMEO.URL_REF_NAME RES_WEB_ADDRESS
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPGMEO.POE_LVL_CD
	AND LOOKUP_TYPE = 'BEN_POE_LVL' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE  AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_ENROLLMENT_PERIOD_LEVEL
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPGMEO.DPNT_DSGN_LVL_CD
	AND LOOKUP_TYPE = 'BEN_DPNT_DSGN_LVL' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE  AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_DEPENDENT_DESIGNATION_LEVE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = benPGMEO.PGM_GRP_CD
	AND LOOKUP_TYPE = 'BEN_PGM_GRP' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE  AND NVL(END_DATE_ACTIVE ,TO_DATE('31-12-4712','DD-MM-YYYY'))) RES_PROGRAM_GROUP


,benPGMEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,benPGMEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,benPGMEO.CREATED_BY RSC_CREATED_BY
,benPGMEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,benPGMEO.LEGISLATION_CODE RSC_COUNTRY_ID

FROM BEN_PGM_F benPGMEO
ORDER BY benPGMEO.NAME,benPGMEO.EFFECTIVE_START_DATE
