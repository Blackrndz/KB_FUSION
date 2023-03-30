/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Receivables%20Payment%20Terms%20-%20Payment%20Terms.sql $:
 * $Id: Manage Receivables Payment Terms - Payment Terms.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 


SELECT distinct QRSLT.SETNAME RES_PAYMENT_TERMS_SET,
QRSLT.NAME RES_NAME,
QRSLT.DESCRIPTION RES_DESCRIPTION,
DECODE(QRSLT.PARTIAL_DISCOUNT_FLAG,'Y','Yes','No') RES_ALLOW_DISCOUNT_ON_PARTIAL_,
DECODE(QRSLT.PREPAYMENT_FLAG,'Y','Yes','No') RES_PREPAYMENT,
DECODE(QRSLT.CREDIT_CHECK_FLAG,'Y','Yes','No') RES_CREDIT_CHECK,
QRSLT.BILLING_CYCLE RES_BILLING_CYCLE,
QRSLT.BASE_AMOUNT RES_BASE_AMOUNT,
DECODE(QRSLT.CALC_DISCOUNT_ON_LINES_FLAG,NULL,NULL,(FUSION.ARPT_SQL_FUNC_UTIL.GET_LOOKUP_MEANING('DISCOUNT_BASIS',QRSLT.CALC_DISCOUNT_ON_LINES_FLAG))) RES_DISCOUNT_BASIS,
DECODE(QRSLT.DISCOUNT_BASIS_DATE_TYPE,NULL,NULL,(FUSION.ARPT_SQL_FUNC_UTIL.GET_LOOKUP_MEANING('ORA_AR_DISCOUNT_BASIS_DATE',QRSLT.DISCOUNT_BASIS_DATE_TYPE))) RES_DISCOUNT_BASIS_DATE,
TO_CHAR(QRSLT.START_DATE_ACTIVE,'DD-Mon-YYYY') RES_FROM_DATE,
TO_CHAR(QRSLT.END_DATE_ACTIVE,'DD-Mon-YYYY') RES_TO_DATE,
QRSLT.PRINTING_LEAD_DAYS RES_PRINT_LEAD_DAYS,
DECODE(QRSLT.FIRST_INSTALLMENT_CODE,NULL,NULL,(FUSION.arpt_sql_func_util.get_lookup_meaning('INSTALLMENT_OPTION',QRSLT.FIRST_INSTALLMENT_CODE))) RES_INSTALLMENT_OPTION
,QRSLT.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,QRSLT.CREATED_BY  RSC_CREATED_BY
,QRSLT.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

from  (SELECT
  RaTermsVl.NAME,
  RaTermsVl.TERM_ID,
  RATERMSVL.DESCRIPTION,
  (SELECT SET_NAME FROM FUSION.FND_SETID_SETS_VL WHERE SET_ID = RaTermsVl.SET_ID
  ) AS SETNAME,
  RaTermsVl.LAST_UPDATE_DATE,
  RaTermsVl.LAST_UPDATED_BY,  
  RaTermsVl.CREATED_BY,
  RaTermsVl.CREATION_DATE,
  RaTermsVl.LAST_UPDATE_LOGIN,
  RaTermsVl.CREDIT_CHECK_FLAG,
  RaTermsVl.DUE_CUTOFF_DAY,
  RaTermsVl.PARTIAL_DISCOUNT_FLAG,
  RATERMSVL.CALC_DISCOUNT_ON_LINES_FLAG,
  RATERMSVL.DISCOUNT_BASIS_DATE_TYPE ,  
  RaTermsVl.PRINTING_LEAD_DAYS,
  RaTermsVl.START_DATE_ACTIVE,
  RaTermsVl.END_DATE_ACTIVE,
  RaTermsVl.ATTRIBUTE_CATEGORY,
  RaTermsVl.ATTRIBUTE1,
  RaTermsVl.ATTRIBUTE2,
  RaTermsVl.ATTRIBUTE3,
  RaTermsVl.ATTRIBUTE4,
  RaTermsVl.ATTRIBUTE5,
  RaTermsVl.ATTRIBUTE6,
  RaTermsVl.ATTRIBUTE7,
  RaTermsVl.ATTRIBUTE8,
  RaTermsVl.ATTRIBUTE9,
  RaTermsVl.ATTRIBUTE10,
  RaTermsVl.BASE_AMOUNT,
  RaTermsVl.FIRST_INSTALLMENT_CODE,
  RaTermsVl.IN_USE,
  RaTermsVl.ATTRIBUTE11,
  RaTermsVl.ATTRIBUTE12,
  RaTermsVl.ATTRIBUTE13,
  RaTermsVl.ATTRIBUTE14,
  RaTermsVl.ATTRIBUTE15,
  RaTermsVl.PREPAYMENT_FLAG,
  RATERMSVL.BILLING_CYCLE_ID,
  (select CYCLE_NAME from FUSION.ar_cons_bill_cycles_vl cb where cb.BILLING_CYCLE_ID = RATERMSVL.BILLING_CYCLE_ID) BILLING_CYCLE,
  RATERMSVL.SET_ID,
  (SELECT SET_NAME FROM FUSION.FND_SETID_SETS_VL WHERE SET_ID = RaTermsVl.SET_ID
  ) as SETNAME1,
  (SELECT DESCRIPTION FROM FUSION.FND_SETID_SETS_VL WHERE SET_ID = RaTermsVl.SET_ID
  ) as DESCRIPTION1
FROM FUSION.RA_TERMS_VL RATERMSVL
) QRSLT ,
FUSION.RA_TERMS_LINES RATERMSLINES ,
FUSION.RA_TERMS_LINES_DISCOUNTS RATERMSLINESDISCOUNTS
WHERE QRSLT.TERM_ID = RATERMSLINES.TERM_ID(+) 
AND QRSLT.SET_ID = RATERMSLINES.SET_ID(+)
and RATERMSLINES.TERM_ID    =  RATERMSLINESDISCOUNTS.TERM_ID(+)
AND RATERMSLINES.SET_ID       = RATERMSLINESDISCOUNTS.SET_ID(+) 
order by QRSLT.name