/* ****************************************************************************
* $Revision: 61408 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2017-03-14 17:54:24 +0700 (Tue, 14 Mar 2017) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.12/trunk/core/reverse_sql/FINANCIALS/Manage%20Expense%20Report%20Auditing%20Lookup%20Types%20-%20Expense%20Report%20Auditing%20Lookup%20Types.sql $:
* $Id: Manage Expense Report Auditing Lookup Types - Expense Report Auditing Lookup Types.sql 61408 2017-03-14 10:54:24Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

SELECT fndlookups.LOOKUP_TYPE AS RES_LOOKUP_TYPE
,fndlookups.LOOKUP_CODE       AS RES_LOOKUP_CODE
,(SELECT SET_NAME
	FROM FND_SETID_SETS_VL
	WHERE SET_ID = fndlookups.SET_ID
	)                AS RES_REFERENCE_DATA_SET
,fndlookups.DISPLAY_SEQUENCE  AS RES_DISPLAY_SEQUENCE
,NVL((SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'YES_NO'
	AND LOOKUP_CODE   = ENABLED_FLAG
	),'No')                                                   AS RES_ENABLED
,TO_CHAR(fndlookups.START_DATE_ACTIVE,'DD-Mon-YYYY') AS RES_START_DATE
,TO_CHAR(fndlookups.END_DATE_ACTIVE,'DD-Mon-YYYY')   AS RES_END_DATE
,fndlookups.MEANING                                  AS RES_MEANING
,fndlookups.DESCRIPTION                              AS RES_DESCRIPTION
,fndlookups.TAG                                      AS RES_TAG
,fndlookups.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,fndlookups.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,fndlookups.CREATED_BY RSC_CREATED_BY
,fndlookups.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_LOOKUP_VALUES_VL fndlookups
WHERE fndlookups.LOOKUP_TYPE = 'EXM_EMP_MATCH_RULE'
ORDER BY RES_LOOKUP_TYPE