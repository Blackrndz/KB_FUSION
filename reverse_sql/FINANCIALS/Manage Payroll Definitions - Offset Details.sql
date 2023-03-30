/* ****************************************************************************
* $Revision: 55345 $:
* $Author: wuttipong.thongvises $:
* $Date: 2016-05-23 12:42:33 +0700 (Mon, 23 May 2016) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/
FINANCIALS/Manage%20Server%20Configurations%20-%20Manage%20Data%20Quality%20Server%20Configurations.sql $:
* $Id: Manage Server Configurations - Manage Data Quality Server Configurations.sql 55345 2016-05-23 05:42:33Z
wuttipong.thongvises $:
* ****************************************************************************
* Description:
* ************************************************************************** */

WITH PAYTMP AS (

SELECT PAYROLL_ID
,'Date Paid' PAY_DATE
,PAYDATE_FALLS PAY_FALL
,PAYDATE_BASE_WRT PAY_TYPE
,PAYDATE_OFFSET PAY_OFFSET
,PAYDATE_BASE_DATE PAY_BASE
FROM PAY_ALL_PAYROLLS_F
WHERE FIXED_DATE = 'N'

UNION

SELECT PAYROLL_ID
,'Date Earned' PAY_DATE
,EARN_FALLS PAY_FALL
,EARN_BASE_WRT PAY_TYPE
,EARN_OFFSET PAY_OFFSET
,EARN_BASE_DATE PAY_BASE
FROM PAY_ALL_PAYROLLS_F
WHERE FIXED_DATE = 'N'

UNION

SELECT PAYROLL_ID
,'Payroll Run Date' PAY_DATE
,PROCESS_FALLS PAY_FALL
,PROCESS_BASE_WRT PAY_TYPE
,PROCESS_OFFSET PAY_OFFSET
,PROCESS_BASE_DATE PAY_BASE
FROM PAY_ALL_PAYROLLS_F
WHERE FIXED_DATE = 'N'

UNION

SELECT PAYROLL_ID
,'Planned Submission Date' PAY_DATE
,PROCESS_SUB_FALLS PAY_FALL
,PROCESS_SUB_WRT PAY_TYPE
,PROCESS_SUB_OFFSET PAY_OFFSET
,PROCESS_SUB_BASE_DATE PAY_BASE
FROM PAY_ALL_PAYROLLS_F
WHERE FIXED_DATE = 'N'

UNION

SELECT PAYROLL_ID
,'Payslip Availability Date' PAY_DATE
,PAYSLIP_FALLS PAY_FALL
,PAYSLIP_BASE_WRT PAY_TYPE
,PAYSLIP_OFFSET PAY_OFFSET
,PAYSLIP_BASE_DATE PAY_BASE
FROM PAY_ALL_PAYROLLS_F
WHERE FIXED_DATE = 'N'

)

SELECT payALLPREO.PAYROLL_NAME RES_NAME
,PAY_DATE RES_DATE
,PAY_FALL RES_FALLS
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = PAYTMP.PAY_TYPE
	AND LOOKUP_TYPE =  'PAY_BASE_OFFSET' AND LANGUAGE = USERENV('LANG') 
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_DAY_TYPE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = PAYTMP.PAY_OFFSET
	AND LOOKUP_TYPE =  'PAY_DATE_OFFSET' AND LANGUAGE = USERENV('LANG') 
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_OFFSET
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = PAYTMP.PAY_BASE
	AND LOOKUP_TYPE =  'PAY_BASE_DATE' AND LANGUAGE = USERENV('LANG') 
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_BASE_DATE

,payALLPREO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,payALLPREO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,payALLPREO.CREATED_BY  RSC_CREATED_BY
,payALLPREO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PAY_ALL_PAYROLLS_F payALLPREO
,PAYTMP
WHERE payALLPREO.PAYROLL_ID = PAYTMP.PAYROLL_ID
ORDER BY payALLPREO.PAYROLL_NAME,payALLPREO.EFFECTIVE_START_DATE,PAY_DATE