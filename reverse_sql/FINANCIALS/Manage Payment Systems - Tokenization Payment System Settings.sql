/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2017-04-25 $:
 * $HeadURL: $:
 * $Id: Manage Lot Grades - Lot Grades.sql  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 

SELECT PaymentSystemsE0.NAME RES_PAYMENT_SYSTEM_NAME
,PaymentSystemSRE0.ACCOUNT_OPTION_NAME RES_NAME
,PaymentSystemSRE0.ACCOUNT_OPTION_CODE RES_CODE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE LOOKUP_TYPE = 'IBY_PARAMETER_TYPES'
	AND LOOKUP_CODE = PaymentSystemSRE0.ACCOUNT_OPTION_DATATYPE
	) RES_DATA_TYPE
,DECODE(PaymentSystemSRE0.SECURED_FLAG,'Y','Yes','No') RES_SECURED
,(CASE
	WHEN VAL_SEC_SEGMENT_ID IS NOT NULL THEN
		NULL
		-- Cannot find the solution to devry the password from table IBY_SECURITY_SEGMENTS.
	ELSE 
		DECODE(PaymentSystemTokenE0.ACCOUNT_OPTION_VALUE						
			,'LOP_STD','Sample Payment Name-Value Pair'
			,'CYS_HOP','CyberSource Secure Acceptance Web'
			,'CYS_SOP','CyberSource Slient Order Post'
			,PaymentSystemTokenE0.ACCOUNT_OPTION_VALUE)
	END) RES_VALUE
,PaymentSystemTokenE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,PaymentSystemTokenE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,PaymentSystemTokenE0.CREATED_BY RSC_CREATED_BY
,PaymentSystemTokenE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM IBY_BEPINFO PaymentSystemsE0
,IBY_BEP_ACCT_OPT_NAME_VL PaymentSystemSRE0
,IBY_BEP_ACCT_OPT_VALS PaymentSystemTokenE0
WHERE PaymentSystemsE0.BEPID = PaymentSystemSRE0.BEPID
AND PaymentSystemSRE0.TOKEN_PROFILE_FLAG = 'Y'
AND PaymentSystemSRE0.ACCOUNT_OPTION_CODE = PaymentSystemTokenE0.ACCOUNT_OPTION_CODE
AND PaymentSystemSRE0.BEPID = PaymentSystemTokenE0.BEPID
ORDER BY PaymentSystemsE0.NAME
,RES_NAME