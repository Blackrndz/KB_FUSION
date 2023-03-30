/* ****************************************************************************
 * $Revision: 55346 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-05-23 14:11:43 +0700 (Mon, 23 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Chart%20of%20Accounts%20Value%20Set%20Values%20-%20Manage%20Values.sql $:
 * $Id: Manage Chart of Accounts Value Set Values - Manage Values.sql 55346 2016-05-23 07:11:43Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- REPLACE_HTML_KEYWORD = RES_EXPRESSION

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
,TO_CHAR(entitlementsE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,entitlementsE0.ENTL_BAND_SEQUENCE RES_SEQUENCE
,REPLACE(REPLACE(REPLACE(entitlementsE0.ENTL_INPUT_EXPRESSION,'&','#AMP#'),'<','#OPENTAG#'),'>','#CLOSETAG#') RES_EXPRESSION
,DECODE(TO_CHAR(entitlementsE0.EFFECTIVE_END_DATE ,'DD-MM-YYYY'),'31-12-4712',NULL,TO_CHAR(entitlementsE0.EFFECTIVE_END_DATE ,'DD-Mon-YYYY')) RES_EFFECTIVE_END_DATE
,entitlementsE0.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,entitlementsE0.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,entitlementsE0.CREATED_BY  RSC_CREATED_BY
,entitlementsE0.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,absencePlansE0.LEGISLATION_CODE RSC_COUNTRY_ID
 
FROM ANC_ABSENCE_PLANS_F absencePlansE0
,ANC_ENTL_BANDS_F entitlementsE0
WHERE absencePlansE0.ENTL_METHOD_CD = 'Q'
AND absencePlansE0.ABSENCE_PLAN_ID = entitlementsE0.ABSENCE_PLAN_ID
AND absencePlansE0.EFFECTIVE_START_DATE BETWEEN entitlementsE0.EFFECTIVE_START_DATE AND entitlementsE0.EFFECTIVE_END_DATE
ORDER BY 1
,absencePlansE0.EFFECTIVE_START_DATE
,entitlementsE0.ENTL_BAND_SEQUENCE