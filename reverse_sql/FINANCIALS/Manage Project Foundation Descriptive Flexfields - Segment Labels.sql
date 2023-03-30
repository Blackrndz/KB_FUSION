/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Project%20Foundation%20Descriptive%20Flexfields%20-%20Segment%20Labels.sql $:
 * $Id: Manage Project Foundation Descriptive Flexfields - Segment Labels.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT DescriptiveFlexfieldEO.NAME AS RES_FLEXFIELD_NAME
,SegmentLabel.DESCRIPTIVE_FLEXFIELD_CODE AS RES_FLEXFIELD_CODE
,SegmentLabel.SEGMENT_LABEL_CODE         AS RES_SEGMENT_LABEL_CODE
,SegmentLabel.NAME                       AS RES_NAME
,SegmentLabel.DESCRIPTION                AS RES_DESCRIPTION
,SegmentLabel.BI_OBJECT_NAME             AS RES_BI_OBJECT_NAME
,SegmentLabel.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,SegmentLabel.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,SegmentLabel.CREATED_BY  RSC_CREATED_BY
,SegmentLabel.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FND_DF_FLEXFIELDS_VL DescriptiveFlexfieldEO
,FND_DF_SEGMENT_LABELS_VL SegmentLabel
WHERE DescriptiveFlexfieldEO.DESCRIPTIVE_FLEXFIELD_CODE = SegmentLabel.DESCRIPTIVE_FLEXFIELD_CODE
AND(DescriptiveFlexfieldEO.MODULE_ID     IN
	(SELECT rf.CHILD_MODULE_ID
	FROM FND_APPL_TAXONOMY_RF rf
	INNER JOIN FND_APPL_TAXONOMY t
	ON rf.ANCESTOR_MODULE_ID = t.MODULE_ID
	WHERE t.MODULE_TYPE      = 'APPLICATION'
	AND t.MODULE_KEY         = 'PJF'
	))
ORDER BY DescriptiveFlexfieldEO.NAME
,RES_SEGMENT_LABEL_CODE