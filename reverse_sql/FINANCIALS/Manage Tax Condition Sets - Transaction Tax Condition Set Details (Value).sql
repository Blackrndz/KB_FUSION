/* ****************************************************************************
 * $Revision: 50638 $:
 * $Author: wuttipong.thongvises $:
 * $Date: 2015-11-18 14:55:09 +0700 (Wed, 18 Nov 2015) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Cumulative%20Mileage%20Determinants%20-%20Manage%20Cumulative%20Mileage%20Determinants.sql $:
 * $Id: Manage Cumulative Mileage Determinants - Manage Cumulative Mileage Determinants.sql 50638 2015-11-18 07:55:09Z wuttipong.thongvises $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 
 
SELECT QRSLT.CONDITION_GROUP_CODE RES_TAX_CONDITION_SET_CODE
,QRSLT.TaxFactorClass RES_TAX_DETERMINING_FACTOR_CLA
,(SELECT meaning
	FROM fnd_lookup_values_vl
	WHERE lookup_type = 'ZX_PLACE_OF_SUPPLY_TYPE'
	AND lookup_code   = QRSLT.DETERMINING_FACTOR_CQ_CODE
	) RES_TAX_CLASS_QUALIFIER
,QRSLT.DETERMINING_FACTOR_NAME RES_TAX_DETERMINING_FACTOR_NAM
,NULL RES_FIELD_NAME
,(SELECT meaning
	FROM fnd_lookup_values_vl
	WHERE lookup_type = 'ZX_OPERATORS'
	AND lookup_code   =  QRSLT.OPERATOR_CODE
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_FIELD_CONDITION
,QRSLT.NUMERIC_VALUE_NAME RES_FIELD_VALUE1
,NULL RES_FIELD_VALUE2
,QRSLT.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,QRSLT.CREATED_BY RSC_CREATED_BY
,QRSLT.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT ZxConditionGroupsVl.CONDITION_GROUP_CODE
	,ZxConditionGroupsVl.CONDITION_GROUP_ID
	,DECODE(SUBSTR(DetFactorTemplTLEO.TEMPLATE_USAGE_CODE,1,3),'WHT','W','I') USAGE_TYPE_FLAG
	,(SELECT meaning
		FROM FND_LOOKUPS
		WHERE LOOKUP_TYPE = 'ZX_DETERMINING_FACTOR_CLASS'
		AND LOOKUP_CODE   = ZxConditions.DETERMINING_FACTOR_CLASS_CODE
		) TaxFactorClass
	,ZxConditions.DETERMINING_FACTOR_CQ_CODE
	,(CASE WHEN ZxConditions.OPERATOR_CODE IN ('IN','NOT_IN')
		THEN NULL
		ELSE ZxConditions.OPERATOR_CODE END) OPERATOR_CODE
	,CASE
			WHEN ZxConditions.DETERMINING_FACTOR_CLASS_CODE LIKE '%FISCAL_CLASS%'
			THEN
				(SELECT classification_type_NAME
				FROM zx_fc_types_VL
				WHERE classification_type_code     = ZxConditions.DETERMINING_FACTOR_CODE
				AND classification_type_categ_code = ZxConditions.DETERMINING_FACTOR_CLASS_CODE
				)
			ELSE
				(SELECT ZxDeterminingFactorsVl.DETERMINING_FACTOR_NAME
				FROM ZX_DETERMINING_FACTORS_VL ZxDeterminingFactorsVl
				WHERE(ZxConditions.DETERMINING_FACTOR_CLASS_CODE = ZxDeterminingFactorsVl.DETERMINING_FACTOR_CLASS_CODE)
				AND(ZxConditions.DETERMINING_FACTOR_CODE         = ZxDeterminingFactorsVl.DETERMINING_FACTOR_CODE)
				)
		END AS DETERMINING_FACTOR_NAME
	,CASE
			WHEN TaxRuleConditionDetailsEO.DATA_TYPE_CODE = 'NUMERIC'
			THEN
				CASE
					WHEN(TaxRuleConditionDetailsEO.data_type_code               = 'NUMERIC'
					AND TaxRuleConditionDetailsEO.DETERMINING_FACTOR_CLASS_CODE = 'TRX_GENERIC_CLASSIFICATION'
					AND TaxRuleConditionDetailsEO.DETERMINING_FACTOR_CODE       = 'TRX_TYPE')
					THEN 
						(SELECT NAME
						FROM RA_CUST_TRX_TYPES_ALL
						WHERE CUST_TRX_TYPE_SEQ_ID = TaxRuleConditionDetailsEO.NUMERIC_VALUE
						AND TYPE = TaxRuleConditionDetailsEO.ALPHANUMERIC_VALUE)
					WHEN(TaxRuleConditionDetailsEO.data_type_code               = 'NUMERIC'
					AND TaxRuleConditionDetailsEO.DETERMINING_FACTOR_CLASS_CODE = 'TRX_GENERIC_CLASSIFICATION')
					THEN 
						TaxRuleConditionDetailsEO.numeric_value||''
					WHEN(TaxRuleConditionDetailsEO.data_type_code               = 'NUMERIC'
					AND TaxRuleConditionDetailsEO.DETERMINING_FACTOR_CLASS_CODE = 'TRX_INPUT_FACTOR'
					AND TaxRuleConditionDetailsEO.DETERMINING_FACTOR_CODE       = 'TAX_PURCHASING_CATEGORY')
					THEN
						(SELECT CATEGORY_NAME
						FROM EGP_CATEGORIES_VL geo
						WHERE CATEGORY_ID = TaxRuleConditionDetailsEO.numeric_value)
					WHEN(TaxRuleConditionDetailsEO.data_type_code                = 'NUMERIC'
					AND TaxRuleConditionDetailsEO.DETERMINING_FACTOR_CLASS_CODE <> 'TRX_GENERIC_CLASSIFICATION')
					THEN
						(SELECT geo.Geography_Name
						FROM hz_geographies geo
						WHERE geo.geography_id = TaxRuleConditionDetailsEO.numeric_value
						)
				END
			WHEN TaxRuleConditionDetailsEO.DATA_TYPE_CODE = 'ALPHANUMERIC'
			THEN TaxRuleConditionDetailsEO.ALPHANUMERIC_VALUE
		END AS NUMERIC_VALUE_NAME
	,ZxConditions.IGNORE_FLAG
	,TaxRuleConditionDetailsEO.LAST_UPDATED_BY
	,TaxRuleConditionDetailsEO.LAST_UPDATE_DATE
	,TaxRuleConditionDetailsEO.CREATED_BY
	,TaxRuleConditionDetailsEO.CREATION_DATE
	FROM ZX_CONDITION_GROUPS_VL ZxConditionGroupsVl
	,ZX_CONDITIONS ZxConditions
	,ZX_DET_FACTOR_TEMPL_VL DetFactorTemplTLEO
	,ZX_CONDITION_DETAILS TaxRuleConditionDetailsEO
	WHERE ZxConditionGroupsVl.DET_FACTOR_TEMPL_CODE = DetFactorTemplTLEO.DET_FACTOR_TEMPL_CODE(+)
	AND ZxConditionGroupsVl.CONDITION_GROUP_ID      = ZxConditions.CONDITION_GROUP_ID
	AND ZxConditions.CONDITION_ID                   = TaxRuleConditionDetailsEO.CONDITION_ID
	) QRSLT
WHERE QRSLT.USAGE_TYPE_FLAG = 'I'
AND QRSLT.TaxFactorClass <> 'Accounting'

UNION

SELECT QRSLT.CONDITION_GROUP_CODE RES_TAX_CONDITION_SET_CODE
,QRSLT.TaxFactorClass RES_TAX_DETERMINING_FACTOR_CLA
,(SELECT meaning
	FROM fnd_lookup_values_vl
	WHERE lookup_type = 'ZX_PLACE_OF_SUPPLY_TYPE'
	AND lookup_code   = QRSLT.DETERMINING_FACTOR_CQ_CODE
	) RES_TAX_CLASS_QUALIFIER
,QRSLT.DETERMINING_FACTOR_NAME RES_TAX_DETERMINING_FACTOR_NAM
,QRSLT.SEGMENT_NAME RES_FIELD_NAME
,(CASE
	WHEN QRSLT.OPERATOR != 'CUSTOM' THEN
		(SELECT decode(MEANING,'Equals to','Equals','Not equals to','Does not equal','Greater than or equals to','Greater than or equal to',MEANING)
		FROM GL_LOOKUPS
		WHERE LOOKUP_TYPE = 'FILTER_OPERATORS'
		AND LOOKUP_CODE   = QRSLT.OPERATOR)
	ELSE
		QRSLT.VALUE_3
	END) RES_FIELD_CONDITION
,QRSLT.VALUE_1 RES_FIELD_VALUE1
,QRSLT.VALUE_2 RES_FIELD_VALUE2
,QRSLT.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,QRSLT.CREATED_BY RSC_CREATED_BY
,QRSLT.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM
	(SELECT ZxConditionGroupsVl.CONDITION_GROUP_CODE
	,ZxConditionGroupsVl.CONDITION_GROUP_ID
	,DECODE(SUBSTR(DetFactorTemplTLEO.TEMPLATE_USAGE_CODE,1,3),'WHT','W','I') USAGE_TYPE_FLAG
	,(SELECT meaning
		FROM FND_LOOKUPS
		WHERE LOOKUP_TYPE = 'ZX_DETERMINING_FACTOR_CLASS'
		AND LOOKUP_CODE   = ZxConditions.DETERMINING_FACTOR_CLASS_CODE
		) TaxFactorClass
	,ZxConditions.DETERMINING_FACTOR_CQ_CODE
	,CASE
			WHEN ZxConditions.DETERMINING_FACTOR_CLASS_CODE LIKE '%FISCAL_CLASS%'
			THEN
				(SELECT classification_type_NAME
				FROM zx_fc_types_VL
				WHERE classification_type_code     = ZxConditions.DETERMINING_FACTOR_CODE
				AND classification_type_categ_code = ZxConditions.DETERMINING_FACTOR_CLASS_CODE
				)
			ELSE
				(SELECT ZxDeterminingFactorsVl.DETERMINING_FACTOR_NAME
				FROM ZX_DETERMINING_FACTORS_VL ZxDeterminingFactorsVl
				WHERE(ZxConditions.DETERMINING_FACTOR_CLASS_CODE = ZxDeterminingFactorsVl.DETERMINING_FACTOR_CLASS_CODE)
				AND(ZxConditions.DETERMINING_FACTOR_CODE         = ZxDeterminingFactorsVl.DETERMINING_FACTOR_CODE)
				)
		END AS DETERMINING_FACTOR_NAME
	,(SELECT segsE0.PROMPT 
		FROM FND_KF_SEGMENTS_VL segsE0
		,FND_KF_STR_INSTANCES_VL strsE0
		WHERE segsE0.STRUCTURE_ID = strsE0.STRUCTURE_ID
		AND strsE0.STRUCTURE_INSTANCE_CODE =(EXTRACTVALUE(ZxConditions.FLEX_FILTER_VALUE,'/FndFilter/KeyFlexFilter/structureInstanceCode'))
		AND segsE0.SEGMENT_IDENTIFIER = EXTRACTVALUE(value(X),'/filterCriteriaItem/attributeName')
		AND ROWNUM = 1
		) SEGMENT_NAME
	,EXTRACTVALUE(value(X),'/filterCriteriaItem/operator') OPERATOR
	,EXTRACTVALUE(value(X),'/filterCriteriaItem/value[1]') VALUE_1
	,EXTRACTVALUE(value(X),'/filterCriteriaItem/value[2]') VALUE_2
	,EXTRACTVALUE(VALUE(X),'/filterCriteriaItem/properties/property[2]/value') VALUE_3
	,ZxConditions.IGNORE_FLAG
	,ZxConditions.LAST_UPDATED_BY
	,ZxConditions.LAST_UPDATE_DATE
	,ZxConditions.CREATED_BY
	,ZxConditions.CREATION_DATE
	FROM ZX_CONDITION_GROUPS_VL ZxConditionGroupsVl
	,ZX_CONDITIONS ZxConditions
	,ZX_DET_FACTOR_TEMPL_VL DetFactorTemplTLEO
	,TABLE(XMLSEQUENCE(extract(ZxConditions.FLEX_FILTER_VALUE,'/FndFilter/KeyFlexFilter/filterCriteriaRow/filterCriteriaItem'))) X
	WHERE ZxConditionGroupsVl.DET_FACTOR_TEMPL_CODE = DetFactorTemplTLEO.DET_FACTOR_TEMPL_CODE(+)
	AND ZxConditionGroupsVl.CONDITION_GROUP_ID      = ZxConditions.CONDITION_GROUP_ID
	AND ZxConditions.DETERMINING_FACTOR_CLASS_CODE = 'ACCOUNTING_FLEXFIELD'
	) QRSLT
WHERE QRSLT.USAGE_TYPE_FLAG = 'I'
AND QRSLT.TaxFactorClass = 'Accounting' 