/* ****************************************************************************
* $Revision: 61200 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2017-03-01 11:49:01 +0700 (Wed, 01 Mar 2017) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Receivables%20Descriptive%20Flexfields%20-%20Contexts.sql $:
* $Id: Manage Receivables Descriptive Flexfields - Contexts.sql 61200 2017-03-01 04:49:01Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

SELECT DescriptiveFlexfieldEO.NAME                        AS RES_FLEXFIELD_NAME
,DescriptiveFlexfieldContextE1.DESCRIPTIVE_FLEXFIELD_CODE AS RES_FLEXFIELD_CODE
,DescriptiveFlexfieldContextE1.NAME                       AS RES_DISPLAY_NAME
,DescriptiveFlexfieldContextE1.CONTEXT_CODE               AS RES_CONTEXT_CODE
,DescriptiveFlexfieldContextE1.CONTEXT_IDENTIFIER         AS RES_API_NAME
,DescriptiveFlexfieldContextE1.DESCRIPTION                AS RES_DESCRIPTION
,NVL(
	(SELECT meaning
	FROM fnd_lookups
	WHERE lookup_type = 'YES_NO'
	AND lookup_code   = DescriptiveFlexfieldContextE1.ENABLED_FLAG
	),'No') AS RES_ENABLED
,DescriptiveFlexfieldContextE1.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,DescriptiveFlexfieldContextE1.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,DescriptiveFlexfieldContextE1.CREATED_BY  RSC_CREATED_BY
,DescriptiveFlexfieldContextE1.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_DF_CONTEXTS_VL DescriptiveFlexfieldContextE1
,FND_DF_FLEXFIELDS_VL DescriptiveFlexfieldEO
WHERE (DescriptiveFlexfieldEO.MODULE_ID     IN
	(SELECT rf.CHILD_MODULE_ID
	FROM FND_APPL_TAXONOMY_RF rf
	INNER JOIN FND_APPL_TAXONOMY t
	ON rf.ANCESTOR_MODULE_ID = t.MODULE_ID
	WHERE t.MODULE_TYPE      = 'APPLICATION'
	AND t.MODULE_KEY         = 'RCS'
	))
AND DescriptiveFlexfieldContextE1.CONTEXT_CODE NOT IN('Global Data Elements','Context Data Element')
AND DescriptiveFlexfieldEO.DESCRIPTIVE_FLEXFIELD_CODE        = DescriptiveFlexfieldContextE1.DESCRIPTIVE_FLEXFIELD_CODE
AND DescriptiveFlexfieldEO.FLEXFIELD_TYPE                    = 'DFF'
ORDER BY DescriptiveFlexfieldEO.NAME
,RES_DISPLAY_NAME