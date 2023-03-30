/* ****************************************************************************
 * $Revision: 55346 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-05-23 14:11:43 +0700 (Mon, 23 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Chart%20of%20Accounts%20Value%20Set%20Values%20-%20Manage%20Values.sql $:
 * $Id: Manage Chart of Accounts Value Set Values - Manage Values.sql 55346 2016-05-23 07:11:43Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=0##RES##FND_VS_VALUES_B
--  DFF_ATTRIBUTES=ATTRIBUTE
-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.

SELECT HEAD.VALUE_SET_CODE RES_VALUE_SET_CODE
,DECODE(HEAD.VALUE_DATA_TYPE, 'DATE', TO_CHAR(Detail.VALUE_DATE, 'DD-Mon-YYYY'), 'TIMESTAMP', TO_CHAR(Detail.VALUE_TIMESTAMP, 'DD-Mon-YYYY HH24:MI:SS'), TO_CHAR(Detail.VALUE)) RES_VALUE 
/*,(CASE
	WHEN Detail.INDEPENDENT_VALUE_DATE IS NOT NULL THEN
		TO_CHAR(Detail.INDEPENDENT_VALUE_DATE, 'DD-Mon-YYYY')
	WHEN Detail.INDEPENDENT_VALUE_TIMESTAMP IS NOT NULL THEN
		TO_CHAR(Detail.INDEPENDENT_VALUE_TIMESTAMP, 'DD-Mon-YYYY HH24:MI:SS')
	ELSE
		Detail.INDEPENDENT_VALUE
	END) RES_INDEPENDENT_VALUE*/
,Detail.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,Detail.ATTRIBUTE1
,Detail.ATTRIBUTE2
,Detail.ATTRIBUTE3
,Detail.ATTRIBUTE4
,Detail.ATTRIBUTE5
,Detail.ATTRIBUTE6
,Detail.ATTRIBUTE7
,Detail.ATTRIBUTE8
,Detail.ATTRIBUTE9
,Detail.ATTRIBUTE10
,Detail.ATTRIBUTE11
,Detail.ATTRIBUTE12
,Detail.ATTRIBUTE13
,Detail.ATTRIBUTE14
,Detail.ATTRIBUTE15
,Detail.ATTRIBUTE16
,Detail.ATTRIBUTE17
,Detail.ATTRIBUTE18
,Detail.ATTRIBUTE19
,Detail.ATTRIBUTE20
,Detail.ATTRIBUTE21
,Detail.ATTRIBUTE22
,Detail.ATTRIBUTE23
,Detail.ATTRIBUTE24
,Detail.ATTRIBUTE25
,Detail.ATTRIBUTE26
,Detail.ATTRIBUTE27
,Detail.ATTRIBUTE28
,Detail.ATTRIBUTE29
,Detail.ATTRIBUTE30
,Detail.ATTRIBUTE31
,Detail.ATTRIBUTE32
,Detail.ATTRIBUTE33
,Detail.ATTRIBUTE34
,Detail.ATTRIBUTE35
,Detail.ATTRIBUTE36
,Detail.ATTRIBUTE37
,Detail.ATTRIBUTE38
,Detail.ATTRIBUTE39
,Detail.ATTRIBUTE40
,Detail.ATTRIBUTE41
,Detail.ATTRIBUTE42
,Detail.ATTRIBUTE43
,Detail.ATTRIBUTE44
,Detail.ATTRIBUTE45
,Detail.ATTRIBUTE46
,Detail.ATTRIBUTE47
,Detail.ATTRIBUTE48
,Detail.ATTRIBUTE49
,Detail.ATTRIBUTE50
,Detail.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,Detail.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,Detail.CREATED_BY RSC_CREATED_BY
,Detail.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT ValueSetEO.VALUE_SET_CODE
	,ValueSetEO.VALUE_SET_ID
	,ValueSetEO.VALUE_DATA_TYPE
	FROM FND_VS_VALUE_SETS ValueSetEO
	,FND_APPL_TAXONOMY_VL ApplTaxonomyPEO
	,FND_LOOKUPS ValidationTypeLookupPEO
	,FND_LOOKUPS ValueDataTypeLookupPEO
	WHERE ValueSetEO.MODULE_ID     = ApplTaxonomyPEO.MODULE_ID
	AND ValueSetEO.VALIDATION_TYPE = ValidationTypeLookupPEO.LOOKUP_CODE
	AND ValueSetEO.VALUE_DATA_TYPE = ValueDataTypeLookupPEO.LOOKUP_CODE
	AND(ValueSetEO.module_id      IN
		(SELECT rf.child_module_id
		FROM fnd_appl_taxonomy_rf rf
		INNER JOIN fnd_appl_taxonomy t
		ON rf.ancestor_module_id = t.module_id
		WHERE t.module_type      = 'PRODUCT_LINE'
		AND t.module_key         = 'Oracle Fusion'
		))
	AND(((ValueSetEO.VALUE_SET_CODE NOT LIKE('%' ||'$FLEX$'|| '%'))
	AND(ValidationTypeLookupPEO.LOOKUP_TYPE = 'FND_VS_VALIDATION_TYPES')
	AND(ValueDataTypeLookupPEO.LOOKUP_TYPE  = 'FND_VS_VALUE_DATA_TYPES')))
	) HEAD
,(SELECT ValueSetValueEO.VALUE_SET_ID
	,ValueSetValueEO.VALUE
	,ValueSetValueEO.VALUE_DATE
	,ValueSetValueEO.VALUE_TIMESTAMP
	,ValueSetValueEO.TRANSLATED_VALUE
	,ValueSetValueEO.DESCRIPTION
	,ValueSetValueEO.ENABLED_FLAG
	,ValueSetValueEO.START_DATE_ACTIVE
	,ValueSetValueEO.END_DATE_ACTIVE
	,ValueSetValueEO.INDEPENDENT_VALUE
	,ValueSetValueEO.INDEPENDENT_VALUE_DATE
	,ValueSetValueEO.INDEPENDENT_VALUE_TIMESTAMP
	,ValueSetValueEO.SORT_ORDER
	,ValueSetValueEO.SUMMARY_FLAG
	,ValueSetValueEO.FLEX_VALUE_ATTRIBUTE1
	,ValueSetValueEO.FLEX_VALUE_ATTRIBUTE2
	,ValueSetValueEO.FLEX_VALUE_ATTRIBUTE3
	,ValueSetValueEO.FLEX_VALUE_ATTRIBUTE4
	,ValueSetValueEO.FLEX_VALUE_ATTRIBUTE5
	,ValueSetValueEO.FLEX_VALUE_ATTRIBUTE6
	,ValueSetValueEO.ATTRIBUTE_CATEGORY
	,ValueSetValueEO.ATTRIBUTE1
	,ValueSetValueEO.ATTRIBUTE2
	,ValueSetValueEO.ATTRIBUTE3
	,ValueSetValueEO.ATTRIBUTE4
	,ValueSetValueEO.ATTRIBUTE5
	,ValueSetValueEO.ATTRIBUTE6
	,ValueSetValueEO.ATTRIBUTE7
	,ValueSetValueEO.ATTRIBUTE8
	,ValueSetValueEO.ATTRIBUTE9
	,ValueSetValueEO.ATTRIBUTE10
	,ValueSetValueEO.ATTRIBUTE11
	,ValueSetValueEO.ATTRIBUTE12
	,ValueSetValueEO.ATTRIBUTE13
	,ValueSetValueEO.ATTRIBUTE14
	,ValueSetValueEO.ATTRIBUTE15
	,ValueSetValueEO.ATTRIBUTE16
	,ValueSetValueEO.ATTRIBUTE17
	,ValueSetValueEO.ATTRIBUTE18
	,ValueSetValueEO.ATTRIBUTE19
	,ValueSetValueEO.ATTRIBUTE20
	,ValueSetValueEO.ATTRIBUTE21
	,ValueSetValueEO.ATTRIBUTE22
	,ValueSetValueEO.ATTRIBUTE23
	,ValueSetValueEO.ATTRIBUTE24
	,ValueSetValueEO.ATTRIBUTE25
	,ValueSetValueEO.ATTRIBUTE26
	,ValueSetValueEO.ATTRIBUTE27
	,ValueSetValueEO.ATTRIBUTE28
	,ValueSetValueEO.ATTRIBUTE29
	,ValueSetValueEO.ATTRIBUTE30
	,ValueSetValueEO.ATTRIBUTE31
	,ValueSetValueEO.ATTRIBUTE32
	,ValueSetValueEO.ATTRIBUTE33
	,ValueSetValueEO.ATTRIBUTE34
	,ValueSetValueEO.ATTRIBUTE35
	,ValueSetValueEO.ATTRIBUTE36
	,ValueSetValueEO.ATTRIBUTE37
	,ValueSetValueEO.ATTRIBUTE38
	,ValueSetValueEO.ATTRIBUTE39
	,ValueSetValueEO.ATTRIBUTE40
	,ValueSetValueEO.ATTRIBUTE41
	,ValueSetValueEO.ATTRIBUTE42
	,ValueSetValueEO.ATTRIBUTE43
	,ValueSetValueEO.ATTRIBUTE44
	,ValueSetValueEO.ATTRIBUTE45
	,ValueSetValueEO.ATTRIBUTE46
	,ValueSetValueEO.ATTRIBUTE47
	,ValueSetValueEO.ATTRIBUTE48
	,ValueSetValueEO.ATTRIBUTE49
	,ValueSetValueEO.ATTRIBUTE50
	,ValueSetValueEO.LAST_UPDATED_BY
	,ValueSetValueEO.LAST_UPDATE_DATE
	,ValueSetValueEO.CREATED_BY
	,ValueSetValueEO.CREATION_DATE
	FROM FND_VS_VALUES_VL ValueSetValueEO
	) Detail
WHERE Head.VALUE_SET_ID        = Detail.VALUE_SET_ID
AND(Detail.ATTRIBUTE_CATEGORY IS NOT NULL
OR Detail.ATTRIBUTE1          IS NOT NULL
OR Detail.ATTRIBUTE2          IS NOT NULL
OR Detail.ATTRIBUTE3          IS NOT NULL
OR Detail.ATTRIBUTE4          IS NOT NULL
OR Detail.ATTRIBUTE5          IS NOT NULL
OR Detail.ATTRIBUTE6          IS NOT NULL
OR Detail.ATTRIBUTE7          IS NOT NULL
OR Detail.ATTRIBUTE8          IS NOT NULL
OR Detail.ATTRIBUTE9          IS NOT NULL
OR Detail.ATTRIBUTE10         IS NOT NULL
OR Detail.ATTRIBUTE11         IS NOT NULL
OR Detail.ATTRIBUTE12         IS NOT NULL
OR Detail.ATTRIBUTE13         IS NOT NULL
OR Detail.ATTRIBUTE14         IS NOT NULL
OR Detail.ATTRIBUTE15         IS NOT NULL
OR Detail.ATTRIBUTE16         IS NOT NULL
OR Detail.ATTRIBUTE17         IS NOT NULL
OR Detail.ATTRIBUTE18         IS NOT NULL
OR Detail.ATTRIBUTE19         IS NOT NULL
OR Detail.ATTRIBUTE20         IS NOT NULL
OR Detail.ATTRIBUTE21         IS NOT NULL
OR Detail.ATTRIBUTE22         IS NOT NULL
OR Detail.ATTRIBUTE23         IS NOT NULL
OR Detail.ATTRIBUTE24         IS NOT NULL
OR Detail.ATTRIBUTE25         IS NOT NULL
OR Detail.ATTRIBUTE26         IS NOT NULL
OR Detail.ATTRIBUTE27         IS NOT NULL
OR Detail.ATTRIBUTE28         IS NOT NULL
OR Detail.ATTRIBUTE29         IS NOT NULL
OR Detail.ATTRIBUTE30         IS NOT NULL
OR Detail.ATTRIBUTE31         IS NOT NULL
OR Detail.ATTRIBUTE32         IS NOT NULL
OR Detail.ATTRIBUTE33         IS NOT NULL
OR Detail.ATTRIBUTE34         IS NOT NULL
OR Detail.ATTRIBUTE35         IS NOT NULL
OR Detail.ATTRIBUTE36         IS NOT NULL
OR Detail.ATTRIBUTE37         IS NOT NULL
OR Detail.ATTRIBUTE38         IS NOT NULL
OR Detail.ATTRIBUTE39         IS NOT NULL
OR Detail.ATTRIBUTE40         IS NOT NULL
OR Detail.ATTRIBUTE41         IS NOT NULL
OR Detail.ATTRIBUTE42         IS NOT NULL
OR Detail.ATTRIBUTE43         IS NOT NULL
OR Detail.ATTRIBUTE44         IS NOT NULL
OR Detail.ATTRIBUTE45         IS NOT NULL
OR Detail.ATTRIBUTE46         IS NOT NULL
OR Detail.ATTRIBUTE47         IS NOT NULL
OR Detail.ATTRIBUTE48         IS NOT NULL
OR Detail.ATTRIBUTE49         IS NOT NULL
OR Detail.ATTRIBUTE50         IS NOT NULL)
ORDER BY Head.VALUE_SET_CODE
,RES_VALUE