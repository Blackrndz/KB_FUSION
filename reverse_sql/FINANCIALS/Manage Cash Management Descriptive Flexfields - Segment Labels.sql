/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Cash%20Management%20Descriptive%20Flexfields%20-%20Segment%20Labels.sql $:
 * $Id: Manage Cash Management Descriptive Flexfields - Segment Labels.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

SELECT
	(SELECT NAME
	FROM FND_DF_FLEXFIELDS_VL
	WHERE DESCRIPTIVE_FLEXFIELD_CODE = SegmentLabel.DESCRIPTIVE_FLEXFIELD_CODE
	)                                       AS RES_FLEXFIELD_NAME
,SegmentLabel.DESCRIPTIVE_FLEXFIELD_CODE AS RES_FLEXFIELD_CODE
,SegmentLabel.SEGMENT_LABEL_CODE         AS RES_SEGMENT_LABEL_CODE
,SegmentLabel.NAME                       AS RES_NAME
,SegmentLabel.DESCRIPTION                AS RES_DESCRIPTION
,SegmentLabel.BI_OBJECT_NAME             AS RES_BI_OBJECT_NAME
,SegmentLabel.CREATED_BY  AS RSC_CREATED_BY
,SegmentLabel.CREATION_DATE AS RSC_CREATION_DATE
,SegmentLabel.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY
,SegmentLabel.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE
, null RSC_LEDGER_ID
, null RSC_CHART_OF_ACCOUNTS_ID
, null RSC_BUSINESS_UNIT_ID
, null RSC_LEGAL_ENTITY_ID
, null RSC_ORGANIZATION_ID
, null RSC_BUSINESS_GROUP_ID
, NULL RSC_ENTERPRISE_ID
, NULL RSC_COUNTRY_ID

FROM FND_DF_SEGMENT_LABELS_VL SegmentLabel
WHERE SegmentLabel.APPLICATION_ID = 260
ORDER BY RES_FLEXFIELD_NAME
,RES_SEGMENT_LABEL_CODE