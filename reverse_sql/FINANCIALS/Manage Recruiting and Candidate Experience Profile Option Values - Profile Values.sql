/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Recruiting%20and%20Candidate%20Experience%20Profile%20Option%20Values%20-%20Profile%20Values.sql $:
 * $Id: Manage Recruiting and Candidate Experience Profile Option Values - Profile Values.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 -- FIELD_TO_APPLY_FUNCTION=RES_PRODUCT_NAME/GET_SYSTEM_PROFILE_VALUE
-- FIELD_TO_APPLY_FUNCTION=RES_USER_NAME/GET_SYSTEM_PROFILE_VALUE
-- FIELD_TO_APPLY_FUNCTION=RES_PROFILE_VALUE/GET_SYSTEM_PROFILE_VALUE

select PROFILEOPTIONEO.PROFILE_OPTION_NAME RES_PROFILE_OPTION_CODE
,PROFILEOPTIONEO.USER_PROFILE_OPTION_NAME RES_PROFILE_DISPLAY_NAME
,PROFILELEVELEO.DESCRIPTION RES_PROFILE_LEVEL
,(case 
	when PROFILEOPTIONVALUEEO.LEVEL_NAME = 'PRODUCT' then  
		PROFILEOPTIONVALUEEO.LEVEL_VALUE||'##RES##LEVEL:'||PROFILELEVELEO.LEVEL_NAME
	else
		null
	end) RES_PRODUCT_NAME
,(case 
	when PROFILEOPTIONVALUEEO.LEVEL_NAME = 'USER' then  
		PROFILEOPTIONVALUEEO.LEVEL_VALUE||'##RES##LEVEL:'||PROFILELEVELEO.LEVEL_NAME
	else
		null
	end) RES_USER_NAME
,PROFILEOPTIONVALUEEO.profile_option_value||'##RES##'||DECODE(PROFILEOPTIONEO.SQL_VALIDATION,NULL,NULL,'OPTION:'||PROFILEOPTIONEO.PROFILE_OPTION_ID) RES_PROFILE_VALUE
,PROFILEOPTIONVALUEEO.LAST_UPDATED_BY   RSC_LAST_UPDATED_BY
,PROFILEOPTIONVALUEEO.LAST_UPDATE_DATE   RSC_LAST_UPDATE_DATE
,PROFILEOPTIONVALUEEO.CREATED_BY  RSC_CREATED_BY
,PROFILEOPTIONVALUEEO.CREATION_DATE  RSC_CREATION_DATE
, null RSC_LEDGER_ID
, null RSC_CHART_OF_ACCOUNTS_ID
, null RSC_BUSINESS_UNIT_ID
, null RSC_LEGAL_ENTITY_ID
, null RSC_ORGANIZATION_ID
, null RSC_BUSINESS_GROUP_ID
, NULL RSC_ENTERPRISE_ID
, NULL RSC_COUNTRY_ID
    
FROM FND_PROFILE_OPTIONS_VL ProfileOptionEO
,FND_PROFILE_OPTION_VALUES PROFILEOPTIONVALUEEO
,FND_PROFILE_LEVELS ProfileLevelEO
where(PROFILEOPTIONEO.APPLICATION_ID  = PROFILEOPTIONVALUEEO.APPLICATION_ID)
and(PROFILEOPTIONEO.PROFILE_OPTION_ID = PROFILEOPTIONVALUEEO.PROFILE_OPTION_ID)
and PROFILEOPTIONEO.APPLICATION_ID = 821
and PROFILEOPTIONEO.PROFILE_OPTION_NAME in (select BOATTRIBUTEVALUESEO.BO_ATTRIBUTE_VALUE
														from ASK_BO_ATTRIBUTE_VALUES BOATTRIBUTEVALUESEO
														WHERE BOATTRIBUTEVALUESEO.BO_ATTRIBUTE_SHORT_NAME = 'profileOptionName'
														AND BoAttributeValuesEO.TASK_ID  IN
															(SELECT task_id
															FROM ASK_TASKS_VL
															where TASK_SHORT_NAME = 'ORA_IRC_MANAGE_RECRUITING_AND_CANDIDATE_EXPERIENCE_PROFILE_OPTION_VALUES'
															))
and PROFILEOPTIONVALUEEO.LEVEL_NAME = PROFILELEVELEO.LEVEL_NAME

ORDER BY ProfileOptionEO.PROFILE_OPTION_NAME