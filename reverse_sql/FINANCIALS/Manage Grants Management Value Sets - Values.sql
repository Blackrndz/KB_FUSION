/* ****************************************************************************
* $Revision: 61316 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2017-03-08 15:32:26 +0700 (Wed, 08 Mar 2017) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/
FINANCIALS/Manage%20SCM%20Common%20Value%20Sets%20-%20Manage%20SCM%20Common%20Value%20Sets.sql $:
* $Id: Manage SCM Common Value Sets - Manage SCM Common Value Sets.sql 55804 2016-06-09 04:17:45Z wuttipong.thongvises
$:
* ****************************************************************************
* Description:
* ************************************************************************** */

SELECT ValueSetPEO.VALUE_SET_CODE RES_VALUE_SET_CODE
,DECODE(ValueSetPEO.VALUE_DATA_TYPE,'VARCHAR2',ValueSetValuePEO.VALUE,'NUMBER',ValueSetValuePEO.VALUE_NUMBER,'DATE',
	TO_CHAR(ValueSetValuePEO.VALUE_DATE,'DD-Mon-YYYY'),'TIMESTAMP',TO_CHAR(ValueSetValuePEO.VALUE_TIMESTAMP,
	'DD-Mon-YYYY HH24:MI:SS'))        AS RES_VALUE
,ValueSetValuePEO.TRANSLATED_VALUE RES_TRANSLATED_VALUE
,ValueSetValuePEO.DESCRIPTION RES_DESCRIPTION
,NVL((SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'YES_NO'
	AND lookup_code   = ValueSetValuePEO.ENABLED_FLAG
	),'No') RES_ENABLED
,TO_CHAR(ValueSetValuePEO.START_DATE_ACTIVE,'DD-Mon-YYYY') RES_START_DATE
,TO_CHAR(ValueSetValuePEO.END_DATE_ACTIVE,'DD-Mon-YYYY') RES_END_DATE
,DECODE(ValueSetPEO.VALUE_DATA_TYPE,'VARCHAR2',ValueSetValuePEO.INDEPENDENT_VALUE,'NUMBER',
	ValueSetValuePEO.INDEPENDENT_VALUE_NUMBER,'DATE',TO_CHAR(ValueSetValuePEO.INDEPENDENT_VALUE_DATE,'DD-Mon-YYYY'),
	'TIMESTAMP',TO_CHAR(ValueSetValuePEO.INDEPENDENT_VALUE_TIMESTAMP,'DD-Mon-YYYY HH24:MI:SS')) AS RES_INDEPENDENT_VALUE
,ValueSetValuePEO.SORT_ORDER RES_SORT_ORDER
,ValueSetValuePEO.ATTRIBUTE1 RES_FUND_TYPE
,ValueSetValuePEO.ATTRIBUTE2 RES_FUND_PURPOSE
,DECODE(ValueSetValuePEO.SUMMARY_FLAG,'Y','Yes','N','No') RES_SUMMARY
,(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'YES_NO'
	AND lookup_code   = ValueSetValuePEO.FLEX_VALUE_ATTRIBUTE1
	) RES_ALLOW_POSTING
,(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'YES_NO'
	AND lookup_code   = ValueSetValuePEO.FLEX_VALUE_ATTRIBUTE2
	) RES_ALLOW_BUDGETING
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE lookup_type = 'ACCOUNT_TYPE'
	AND lookup_code   = ValueSetValuePEO.FLEX_VALUE_ATTRIBUTE3
	) RES_ACCOUNT_TYPE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE lookup_type = 'GL_CONTROL_ACCOUNT_SOURCES'
	AND lookup_code   = ValueSetValuePEO.FLEX_VALUE_ATTRIBUTE4
	) RES_THIRD_PARTY_CONTROL_ACCOUN
,(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'YES_NO'
	AND lookup_code   = ValueSetValuePEO.FLEX_VALUE_ATTRIBUTE5
	) RES_RECONCILE
,(SELECT MEANING
	FROM FND_LOOKUPS
	WHERE lookup_type = 'FINANCIAL_CATEGORY'
	AND lookup_code   = ValueSetValuePEO.FLEX_VALUE_ATTRIBUTE6
	) RES_FINANCIAL_CATEGORY
,ValueSetValuePEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ValueSetValuePEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ValueSetValuePEO.CREATED_BY RSC_CREATED_BY
,ValueSetValuePEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_VS_VALUES_VL ValueSetValuePEO
,FND_VS_VALUE_SETS ValueSetPEO
WHERE ValueSetValuePEO.VALUE_SET_ID = ValueSetPEO.VALUE_SET_ID
AND ValueSetPEO.MODULE_ID          IN
	(SELECT rf.child_module_id
	FROM fnd_appl_taxonomy_rf rf
	,fnd_appl_taxonomy at
	Where At.Module_Type = 'APPLICATION'
	AND at.module_key    = 'GMS'
	AND AT.MODULE_ID     = RF.ANCESTOR_MODULE_ID
	)
ORDER BY RES_VALUE_SET_CODE
,RES_VALUE