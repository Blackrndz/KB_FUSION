/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20AutoPost%20Criteria%20Sets%20-%20AutoPost%20Criteria%20Sets.sql $:
 * $Id: Manage AutoPost Criteria Sets - AutoPost Criteria Sets.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


select distinct GLAUTOMATICPOSTINGSETS.AUTOPOST_SET_NAME RES_NAME
,GLAUTOMATICPOSTINGSETS.DESCRIPTION RES_DESCRIPTION
,LookupCodePEO.MEANING RES_ENABLED
,DECODE(GlAutomaticPostingSets.SUBMIT_ALL_PRIORITIES_FLAG,'Y','Yes','No') RES_PROCESS_ALL_CRITERIA
,GLAUTOMATICPOSTINGSETS.NUM_OF_PRIORITY_OPTIONS RES_NUMBER_OF_CRITERIA_TO_PROC
,GLAUTOMATICPOSTINGSETS.EFFECTIVE_DAYS_BEFORE RES_NUMBER_OF_DAYS_BEFORE_SUBM
,GlAutomaticPostingSets.EFFECTIVE_DAYS_AFTER RES_NUMBER_OF_DAYS_AFTER_SUBMI
,GLAUTOMATICPOSTINGSETS.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,GLAUTOMATICPOSTINGSETS.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,GLAUTOMATICPOSTINGSETS.CREATED_BY  RSC_CREATED_BY
,GLAUTOMATICPOSTINGSETS.CREATION_DATE  RSC_CREATION_DATE
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

from GL_AUTOMATIC_POSTING_SETS GLAUTOMATICPOSTINGSETS
,GL_AUTOMATIC_POSTING_OPTIONS GlAutomaticPostingOptions
,GL_LOOKUPS LOOKUPCODEPEO
,(select RSHIP.TARGET_LEDGER_ID, RSHIP.PRIMARY_LEDGER_ID from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE GLAUTOMATICPOSTINGSETS.AUTOPOST_SET_ID	  = GLAUTOMATICPOSTINGOPTIONS.AUTOPOST_SET_ID(+)
and LookupCodePEO.LOOKUP_TYPE = 'YES/NO'
and LOOKUPCODEPEO.LOOKUP_CODE = GLAUTOMATICPOSTINGSETS.ENABLED_FLAG
AND GlAutomaticPostingOptions.LEDGER_ID = PGL.TARGET_LEDGER_ID(+)
ORDER BY GlAutomaticPostingSets.AUTOPOST_SET_NAME