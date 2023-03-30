/* ****************************************************************************
* $Revision: 61006 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2017-02-09 16:56:52 +0700 (Thu, 09 Feb 2017) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/
FINANCIALS/Manage%20Transaction%20Types%20-%20Manage%20Transaction%20Types.sql $:
* $Id: Manage Supplier Registration Value Sets - Manage Value Set.sql 61006 2017-02-09 09:56:52Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

SELECT ValueSetEO.VALUE_SET_CODE AS RES_VALUE_SET_CODE
,ValueSetEO.DESCRIPTION          AS RES_DESCRIPTION
,(SELECT USER_MODULE_NAME
	FROM FND_APPL_TAXONOMY_VL
	WHERE MODULE_ID = ValueSetEO.MODULE_ID
	) AS RES_MODULE
,(SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'FND_VS_VALIDATION_TYPES'
	AND LOOKUP_CODE   = ValueSetEO.VALIDATION_TYPE
	) AS RES_VALIDATION_TYPE
,(SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'FND_VS_VALUE_DATA_TYPES'
	AND LOOKUP_CODE   = ValueSetEO.VALUE_DATA_TYPE
	) AS RES_VALUE_DATA_TYPE
,DECODE(ValueSetEO.VALIDATION_TYPE,'FORMAT',NULL,NVL((SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'YES_NO'
	AND LOOKUP_CODE   = ValueSetEO.SECURITY_ENABLED_FLAG
	),'No'))                                    AS RES_SECURITY_ENABLED
,DECODE(ValueSetEO.VALIDATION_TYPE,'FORMAT',NULL,ValueSetEO.DATA_SECURITY_OBJECT_NAME) AS RES_DATA_SECURITY_RESOURCE_NAM
,DECODE(ValueSetEO.VALIDATION_TYPE,'SUBSET',NULL,(SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'FND_VS_VARCHAR2_SUBTYPES'
	AND LOOKUP_CODE   = ValueSetEO.VALUE_SUBTYPE
	))                         AS RES_VALUE_SUBTYPE
,DECODE(ValueSetEO.VALIDATION_TYPE,'TABLE',NULL,ValueSetEO.MAXIMUM_LENGTH) AS RES_MAXIMUM_LENGTH
,ValueSetEO.PRECISION      AS RES_PRECISION
,ValueSetEO.SCALE          AS RES_SCALE
,(CASE
	WHEN ValueSetEO.VALUE_DATA_TYPE = 'DATE' THEN
		TO_CHAR(TO_DATE(ValueSetEO.MINIMUM_VALUE,'YYYY/MM/DD HH24:MI:SS'),'DD-Mon-YYYY')
	WHEN ValueSetEO.VALUE_DATA_TYPE = 'TIMESTAMP' THEN
		TO_CHAR(TO_DATE(ValueSetEO.MINIMUM_VALUE,'YYYY/MM/DD HH24:MI:SS'),'DD-Mon-YYYY HH24:MI:SS') 
	ELSE
		TO_CHAR(ValueSetEO.MINIMUM_VALUE)
	END) AS RES_MINIMUM_VALUE
,(CASE
	WHEN ValueSetEO.VALUE_DATA_TYPE = 'DATE' THEN
		TO_CHAR(TO_DATE(ValueSetEO.MAXIMUM_VALUE,'YYYY/MM/DD HH24:MI:SS'),'DD-Mon-YYYY')
	WHEN ValueSetEO.VALUE_DATA_TYPE = 'TIMESTAMP' THEN
		TO_CHAR(TO_DATE(ValueSetEO.MAXIMUM_VALUE,'YYYY/MM/DD HH24:MI:SS'),'DD-Mon-YYYY HH24:MI:SS') 
	ELSE
		TO_CHAR(ValueSetEO.MAXIMUM_VALUE)
	END) AS RES_MAXIMUM_VALUE
,DECODE(ValueSetEO.VALUE_SUBTYPE, 'TEXT', NVL((SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'YES_NO'
	AND LOOKUP_CODE   = ValueSetEO.UPPERCASE_ONLY_FLAG
	),'No'),NULL) AS RES_UPPERCASE_ONLY
,DECODE(ValueSetEO.VALUE_SUBTYPE, 'TEXT', NVL((SELECT MEANING
	FROM fnd_lookups
	WHERE LOOKUP_TYPE = 'YES_NO'
	AND LOOKUP_CODE   = ValueSetEO.ZERO_FILL_FLAG
	),'No'),NULL) AS RES_ZERO_FILL
,(SELECT VALUE_SET_CODE
	FROM FND_VS_VALUE_SETS
	WHERE VALUE_SET_ID = ValueSetEO.INDEPENDENT_VALUE_SET_ID
	) AS RES_INDEPENDENT_VALUE_SET_VALU
,(SELECT DESCRIPTION
	FROM FND_VS_VALUE_SETS
	WHERE VALUE_SET_ID = ValueSetEO.INDEPENDENT_VALUE_SET_ID
	)                                                    AS RES_INDEPENDENT_VALUE_SET_DESC
,ValueSetValidationTableEO.FROM_CLAUSE                AS RES_FROM_CLAUSE
,ValueSetValidationTableEO.VALUE_ATTRIBUTES_TBL_ALIAS AS RES_VALUE_ATTRIBUTES_TABLE_ALI
,ValueSetValidationTableEO.VALUE_COLUMN_NAME          AS RES_VALUE_COLUMN_NAME
,ValueSetValidationTableEO.VALUE_COLUMN_TYPE          AS RES_VALUE_COLUMN_TYPE
,ValueSetValidationTableEO.VALUE_COLUMN_LENGTH        AS RES_VALUE_COLUMN_LENGTH
,ValueSetValidationTableEO.DESCRIPTION_COLUMN_NAME    AS RES_DESCRIPTION_COLUMN_NAME
,ValueSetValidationTableEO.DESCRIPTION_COLUMN_TYPE    AS RES_DESCRIPTION_COLUMN_TYPE
,ValueSetValidationTableEO.DESCRIPTION_COLUMN_LENGTH  AS RES_DESCRIPTION_COLUMN_LENGTH
,ValueSetValidationTableEO.ID_COLUMN_NAME             AS RES_ID_COLUMN_NAME
,ValueSetValidationTableEO.ID_COLUMN_TYPE             AS RES_ID_COLUMN_TYPE
,ValueSetValidationTableEO.ID_COLUMN_LENGTH           AS RES_ID_COLUMN_LENGTH
,ValueSetValidationTableEO.ENABLED_FLAG_COLUMN_NAME   AS RES_ENABLED_FLAG_COLUMN_NAME
,ValueSetValidationTableEO.START_DATE_COLUMN_NAME     AS RES_START_DATE_COLUMN_NAME
,ValueSetValidationTableEO.END_DATE_COLUMN_NAME       AS RES_END_DATE_COLUMN_NAME
,ValueSetValidationTableEO.WHERE_CLAUSE               AS RES_WHERE_CLAUSE
,ValueSetValidationTableEO.ORDER_BY_CLAUSE            AS RES_ORDER_BY_CLAUSE
,ValueSetEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ValueSetEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ValueSetEO.CREATED_BY RSC_CREATED_BY
,ValueSetEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_VS_VALUE_SETS ValueSetEO
,FND_VS_VT_TABLE_EXT ValueSetValidationTableEO
WHERE ValueSetEO.VALUE_SET_ID = ValueSetValidationTableEO.VALUE_SET_ID(+)
AND ValueSetEO.MODULE_ID   in   (SELECT rf.child_module_id
	FROM fnd_appl_taxonomy_rf rf
	,fnd_appl_taxonomy at
	WHERE at.module_type = 'APPLICATION'
	AND at.module_key    = 'EGP'
	AND AT.MODULE_ID     = RF.ANCESTOR_MODULE_ID
	)
ORDER BY RES_VALUE_SET_CODE