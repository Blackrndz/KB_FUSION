/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Project%20Costing%20Value%20Sets%20-%20Values%20-%20DFF.sql $:
* $Id: Manage Project Costing Value Sets - Values - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=0##RES##FND_VS_VALUES_B
-- DFF_ATTRIBUTES=ATTRIBUTE

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

SELECT ValueSetPEO.VALUE_SET_CODE AS RES_VALUE_SET_CODE
,DECODE(ValueSetPEO.VALUE_DATA_TYPE,'VARCHAR2',ValueSetValuePEO.VALUE,'NUMBER',ValueSetValuePEO.VALUE_NUMBER,'DATE'
,ValueSetValuePEO.VALUE_DATE,'TIMESTAMP',ValueSetValuePEO.VALUE_TIMESTAMP) AS RES_VALUE
,DECODE(ValueSetPEO.VALUE_DATA_TYPE,'VARCHAR2',ValueSetValuePEO.INDEPENDENT_VALUE,'NUMBER',
	ValueSetValuePEO.INDEPENDENT_VALUE_NUMBER,'DATE',ValueSetValuePEO.INDEPENDENT_VALUE_DATE,'TIMESTAMP',
	ValueSetValuePEO.INDEPENDENT_VALUE_TIMESTAMP) AS RES_INDEPENDENT_VALUE
,ValueSetValuePEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,ValueSetValuePEO.ATTRIBUTE1 
,ValueSetValuePEO.ATTRIBUTE2
,ValueSetValuePEO.ATTRIBUTE3
,ValueSetValuePEO.ATTRIBUTE4
,ValueSetValuePEO.ATTRIBUTE5
,ValueSetValuePEO.ATTRIBUTE6
,ValueSetValuePEO.ATTRIBUTE7
,ValueSetValuePEO.ATTRIBUTE8
,ValueSetValuePEO.ATTRIBUTE9
,ValueSetValuePEO.ATTRIBUTE10
,ValueSetValuePEO.ATTRIBUTE11
,ValueSetValuePEO.ATTRIBUTE12
,ValueSetValuePEO.ATTRIBUTE13
,ValueSetValuePEO.ATTRIBUTE14
,ValueSetValuePEO.ATTRIBUTE15
,ValueSetValuePEO.ATTRIBUTE16
,ValueSetValuePEO.ATTRIBUTE17
,ValueSetValuePEO.ATTRIBUTE18
,ValueSetValuePEO.ATTRIBUTE19
,ValueSetValuePEO.ATTRIBUTE20
,ValueSetValuePEO.ATTRIBUTE21
,ValueSetValuePEO.ATTRIBUTE22
,ValueSetValuePEO.ATTRIBUTE23
,ValueSetValuePEO.ATTRIBUTE24
,ValueSetValuePEO.ATTRIBUTE25
,ValueSetValuePEO.ATTRIBUTE26
,ValueSetValuePEO.ATTRIBUTE27
,ValueSetValuePEO.ATTRIBUTE28
,ValueSetValuePEO.ATTRIBUTE29
,ValueSetValuePEO.ATTRIBUTE30
,ValueSetValuePEO.ATTRIBUTE31
,ValueSetValuePEO.ATTRIBUTE32
,ValueSetValuePEO.ATTRIBUTE33
,ValueSetValuePEO.ATTRIBUTE34
,ValueSetValuePEO.ATTRIBUTE35
,ValueSetValuePEO.ATTRIBUTE36
,ValueSetValuePEO.ATTRIBUTE37
,ValueSetValuePEO.ATTRIBUTE38
,ValueSetValuePEO.ATTRIBUTE39
,ValueSetValuePEO.ATTRIBUTE40
,ValueSetValuePEO.ATTRIBUTE41
,ValueSetValuePEO.ATTRIBUTE42
,ValueSetValuePEO.ATTRIBUTE43
,ValueSetValuePEO.ATTRIBUTE44
,ValueSetValuePEO.ATTRIBUTE45
,ValueSetValuePEO.ATTRIBUTE46
,ValueSetValuePEO.ATTRIBUTE47
,ValueSetValuePEO.ATTRIBUTE48
,ValueSetValuePEO.ATTRIBUTE49
,ValueSetValuePEO.ATTRIBUTE50
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
AND ValueSetPEO.MODULE_ID   in   (SELECT rf.child_module_id
	FROM fnd_appl_taxonomy_rf rf
	,fnd_appl_taxonomy at
	WHERE at.module_type = 'APPLICATION'
	AND at.module_key    = 'PJC'
	AND AT.MODULE_ID     = RF.ANCESTOR_MODULE_ID
	)
AND (ValueSetValuePEO.ATTRIBUTE_CATEGORY IS NOT NULL OR
ValueSetValuePEO.ATTRIBUTE1 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE2 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE3 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE4 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE5 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE6 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE7 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE8 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE9 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE10 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE11 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE12 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE13 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE14 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE15 IS NOT NULL OR
ValueSetValuePEO.ATTRIBUTE16 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE17 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE18 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE19 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE20 IS NOT NULL OR
ValueSetValuePEO.ATTRIBUTE21 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE22 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE23 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE24 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE25 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE26 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE27 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE28 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE29 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE30 IS NOT NULL OR
ValueSetValuePEO.ATTRIBUTE31 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE32 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE33 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE34 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE35 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE36 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE37 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE38 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE39 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE40 IS NOT NULL OR
ValueSetValuePEO.ATTRIBUTE41 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE42 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE43 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE44 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE45 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE46 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE47 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE48 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE49 IS NOT NULL OR 
ValueSetValuePEO.ATTRIBUTE50 IS NOT NULL)
ORDER BY RES_VALUE_SET_CODE, RES_VALUE