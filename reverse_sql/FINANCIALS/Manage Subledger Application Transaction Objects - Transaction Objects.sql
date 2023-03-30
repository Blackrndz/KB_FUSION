/* ****************************************************************************
* $Revision: 59117 $:
* $Author: nasrullah.dusenmahamad $:
* $Date: 2016-10-21 11:10:58 +0700 (Fri, 21 Oct 2016) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Key%20Flexfields%20-%20Segment%20Labels.sql $:
* $Id: Manage Key Flexfields - Segment Labels.sql 59117 2016-10-21 04:10:58Z nasrullah.dusenmahamad $:
* ****************************************************************************
* Description:
* ************************************************************************** */


SELECT (SELECT APPLICATION_NAME
	FROM FND_APPLICATION_VL
	WHERE APPLICATION_ID = TransactionObjsE0.APPLICATION_ID
	) RES_SUBLEDGER_APPLICATION
,(SELECT NAME 
	FROM XLA_EVENT_CLASSES_TL
	WHERE EVENT_CLASS_CODE = TransactionObjsE0.EVENT_CLASS_CODE
	AND APPLICATION_ID = TransactionObjsE0.APPLICATION_ID
	AND LANGUAGE = USERENV('LANG')
	) RES_EVENT_CLASS
,TransactionObjsE0.OBJECT_NAME RES_OBJECT_NAME
,(SELECT MEANING 
	FROM XLA_LOOKUPS
	WHERE LOOKUP_TYPE = 'XLA_EXTRACT_OBJECT_TYPE'
	AND LOOKUP_CODE = TransactionObjsE0.OBJECT_TYPE_CODE
	) RES_OBJECT_TYPE
,DECODE(TransactionObjsE0.ALWAYS_POPULATED_FLAG,'Y','Yes','No') RES_ALWAYS_POPULATED
,TransactionObjsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,TransactionObjsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,TransactionObjsE0.CREATED_BY RSC_CREATED_BY
,TransactionObjsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM XLA_EXTRACT_OBJECTS TransactionObjsE0
ORDER BY 1,2,3