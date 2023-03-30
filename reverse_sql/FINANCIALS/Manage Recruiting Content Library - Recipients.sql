/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2018-03-20  $:
 * $HeadURL: $:
 * $Id: Configure Exception Sets - Exception  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=IRC_DESCRIPTIONS_VL

WITH LKU AS (SELECT MEANING
	,LOOKUP_CODE
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ORA_IRC_REQ_OWNER_TYPE'
	AND LOOKUP_CODE = 'ORA_RECRUITER'

	UNION

	SELECT MEANING
	,LOOKUP_CODE
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ORA_IRC_REQ_OWNER_TYPE'
	AND LOOKUP_CODE = 'ORA_HIRINGMANAGER'

	UNION

	SELECT MEANING
	,LOOKUP_CODE
	FROM FND_LOOKUP_VALUES
	WHERE LANGUAGE = USERENV('LANG')
	AND LOOKUP_TYPE = 'ORA_IRC_COLLABORATOR_RESP_TYPE'
	AND LOOKUP_CODE = 'ORA_HIRING_TEAM_COLLABORATOR')

SELECT librariesE0.NAME RES_NAME
,librariesE0.DESCRIPTION_CODE RES_CODE
,LKU.MEANING RES_RECIPIENTS
,librariesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,librariesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,librariesE0.CREATED_BY RSC_CREATED_BY
,librariesE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM IRC_DESCRIPTIONS_VL librariesE0
,(SELECT DESCRIPTION_ID
    ,SHORT_DESCRIPTION
    ,DESCRIPTION
    ,ROW_NUMBER() OVER(PARTITION BY DESCRIPTION_ID ORDER BY VERSION_START_DATE) R1
    ,CREATED_BY
    ,CREATION_DATE
    ,LAST_UPDATED_BY
    ,LAST_UPDATE_DATE
    FROM IRC_DESC_VERSIONS_VL
    ) versionsE0
,LKU
WHERE librariesE0.DESCRIPTION_ID = versionsE0.DESCRIPTION_ID
AND versionsE0.R1 = 1
AND NVL(librariesE0.COLLABORATOR_RESP_TYPE_LIST,'###') LIKE '%'||LKU.LOOKUP_CODE||'%'
ORDER BY librariesE0.NAME