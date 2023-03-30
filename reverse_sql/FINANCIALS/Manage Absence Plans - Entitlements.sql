/* ****************************************************************************
 * $Revision: 55346 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-05-23 14:11:43 +0700 (Mon, 23 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Chart%20of%20Accounts%20Value%20Set%20Values%20-%20Manage%20Values.sql $:
 * $Id: Manage Chart of Accounts Value Set Values - Manage Values.sql 55346 2016-05-23 07:11:43Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=ANC_ABSENCE_PLANS_F

SELECT (SELECT NAME 
	FROM ANC_ABSENCE_PLANS_F_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND ABSENCE_PLAN_ID = absencePlansE0.ABSENCE_PLAN_ID
	AND EFFECTIVE_START_DATE = absencePlansE0.EFFECTIVE_START_DATE
	) RES_PLAN
,(SELECT TERRITORY_SHORT_NAME
	FROM FND_TERRITORIES_VL
	WHERE TERRITORY_CODE = absencePlansE0.LEGISLATION_CODE 
	) RES_LEGISLATION
,(SELECT NAME
	FROM PER_LEGISLATIVE_DATA_GROUPS_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND LEGISLATIVE_DATA_GROUP_ID = absencePlansE0.LEGISLATIVE_DATA_GROUP_ID 
	) RES_LEGISLATIVE_DATA_GROUP
,TO_CHAR(absencePlansE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,DECODE(TO_CHAR(absencePlansE0.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(absencePlansE0.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_EFFECTIVE_END_DATE
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ANC_DEFN_TYPE'
	AND LOOKUP_CODE = absencePlansE0.ENTL_DEFINITION_TYPE 
	) RES_ENTITLEMENT_DEFINITION_TYP
,DECODE(absencePlansE0.DISABLE_ENT_OVERRIDE_FLAG,'Y','Yes','No') RES_DISABLE_PAYMENT_PERCENTAGE
,(SELECT MEANING
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ANC_QUA_ENT_PLN_START_DATE'
	AND LOOKUP_CODE = absencePlansE0.ENTITLEMENT_START_DATE
	) RES_ENTITLEMENT_START_DATE
,(CASE
	WHEN absencePlansE0.ENTL_DEFINITION_TYPE = 'F' THEN
		(SELECT BASE_FORMULA_NAME
			FROM FF_FORMULAS_VL
			WHERE FORMULA_ID = absencePlansE0.ENTL_FORMULA_ID
			AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE)
	END) RES_ENTITLEMENT_FORMULA
,absencePlansE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,absencePlansE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,absencePlansE0.CREATED_BY  RSC_CREATED_BY
,absencePlansE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,absencePlansE0.LEGISLATION_CODE RSC_COUNTRY_ID
 
FROM ANC_ABSENCE_PLANS_F absencePlansE0
WHERE absencePlansE0.ENTL_METHOD_CD = 'Q'
ORDER BY 1
,absencePlansE0.EFFECTIVE_START_DATE