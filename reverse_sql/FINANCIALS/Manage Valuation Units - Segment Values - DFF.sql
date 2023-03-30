/* ****************************************************************************
 * $Revision: 60907 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2017-02-03 18:18:54 +0700 (Fri, 03 Feb 2017) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Ledger%20Sets%20-%20Ledger%20Set%20Assignments%20-%20DFF.sql $:
 * $Id: Manage Ledger Sets - Ledger Set Assignments - DFF.sql 60907 2017-02-03 11:18:54Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=707##RES##CST_VAL_UNIT_DETAILS
-- DFF_ATTRIBUTES=ATTRIBUTE_CHAR,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT:
-- - the alias names for the Foreign keys must be the same as in the inventory.
-- - the alias name for context code must be RES_CONTEXT_CODE
-- - NO ALIASES for atributes fields.

SELECT CostOrgPEO.COST_ORG_NAME RES_COST_ORGANIZATION
,CostBookPEO.COST_BOOK_CODE RES_COST_BOOK
,ValUnitEO.VAL_UNIT_CODE RES_VALUATION_UNIT
,ValStructurePEO.VAL_STRUCTURE_CODE RES_VALUATION_STRUCTURE_CODE
,ValUnitDetailEO.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,(SELECT REPLACE(LTRIM(SYS_CONNECT_BY_PATH(SEGMENT_CODE,'$$$'),'$$$'),'$$$',DELIMITER) CONCAT_SEGMENT_CODE
	FROM
		(SELECT StructureInstancePEO.STRUCTURE_INSTANCE_NUMBER
		,SegmentPEO.SEQUENCE_NUMBER
		,FKSV.DELIMITER
		,SegmentPEO.COLUMN_NAME
		,SegmentInstancePEO.REQUIRED_FLAG
		,StructureInstancePEO.STRUCTURE_INSTANCE_ID
		,SegmentPEO.STRUCTURE_ID
		,SegmentPEO.SEGMENT_CODE
		,SegmentInstancePEO.STRUCTURE_INSTANCE_ID                                                                     AS STRUCTURE_INSTANCE_ID1
		,SegmentInstancePEO.SEGMENT_CODE                                                                              AS SEGMENT_CODE1
		,COUNT( *) over(partition BY STRUCTUREINSTANCEPEO.STRUCTURE_INSTANCE_NUMBER)                                  AS CNT
		,RANK() over(partition BY STRUCTUREINSTANCEPEO.STRUCTURE_INSTANCE_NUMBER ORDER BY SegmentPEO.SEQUENCE_NUMBER) AS
			SEG_SEQUENCE
		FROM FND_KF_STRUCTURES_VL FKSV
		,FND_KF_STR_INSTANCES_VL StructureInstancePEO
		,FND_KF_SEGMENT_INSTANCES SegmentInstancePEO
		,FND_KF_SEGMENTS_VL SegmentPEO
		WHERE StructureInstancePEO.STRUCTURE_INSTANCE_ID = SegmentInstancePEO.STRUCTURE_INSTANCE_ID
		AND StructureInstancePEO.STRUCTURE_ID            = SegmentPEO.STRUCTURE_ID
		AND StructureInstancePEO.APPLICATION_ID          = 707
		AND SegmentPEO.SEGMENT_CODE                      = SegmentInstancePEO.SEGMENT_CODE
		AND FKSV.STRUCTURE_ID                            = STRUCTUREINSTANCEPEO.STRUCTURE_ID
		AND SEGMENTPEO.ENABLED_FLAG                      = 'Y'
		AND SegmentInstancePEO.DISPLAY_FLAG              = 'Y'
		) TEMP_VIEW
	WHERE SEG_SEQUENCE             = CNT
		START WITH SEG_SEQUENCE       = 1
	AND STRUCTURE_INSTANCE_NUMBER  = ValUnitDetailEO.STRUCTURE_INSTANCE_NUMBER
		CONNECT BY PRIOR SEG_SEQUENCE = SEG_SEQUENCE - 1
	AND STRUCTURE_INSTANCE_NUMBER  = ValUnitDetailEO.STRUCTURE_INSTANCE_NUMBER
	) RES_ACCOUNT_CODE
,(SELECT COST_ORG_CODE||'-'||INV_ORG_CODE
	FROM CST_VAL_UNIT_COMBINATIONS
	WHERE VAL_UNIT_COMBINATION_ID = ValUnitDetailEO.VAL_UNIT_COMBINATION_ID
	) RES_SEGMENT_VALUES
,ValUnitDetailEO.ATTRIBUTE_CHAR1
,ValUnitDetailEO.ATTRIBUTE_CHAR2
,ValUnitDetailEO.ATTRIBUTE_CHAR3
,ValUnitDetailEO.ATTRIBUTE_CHAR4
,ValUnitDetailEO.ATTRIBUTE_CHAR5
,ValUnitDetailEO.ATTRIBUTE_CHAR6
,ValUnitDetailEO.ATTRIBUTE_CHAR7
,ValUnitDetailEO.ATTRIBUTE_CHAR8
,ValUnitDetailEO.ATTRIBUTE_CHAR9
,ValUnitDetailEO.ATTRIBUTE_CHAR10
,ValUnitDetailEO.ATTRIBUTE_CHAR11
,ValUnitDetailEO.ATTRIBUTE_CHAR12
,ValUnitDetailEO.ATTRIBUTE_CHAR13
,ValUnitDetailEO.ATTRIBUTE_CHAR14
,ValUnitDetailEO.ATTRIBUTE_CHAR15
,ValUnitDetailEO.ATTRIBUTE_CHAR16
,ValUnitDetailEO.ATTRIBUTE_CHAR17
,ValUnitDetailEO.ATTRIBUTE_CHAR18
,ValUnitDetailEO.ATTRIBUTE_CHAR19
,ValUnitDetailEO.ATTRIBUTE_CHAR20
,ValUnitDetailEO.ATTRIBUTE_NUMBER1
,ValUnitDetailEO.ATTRIBUTE_NUMBER2
,ValUnitDetailEO.ATTRIBUTE_NUMBER3
,ValUnitDetailEO.ATTRIBUTE_NUMBER4
,ValUnitDetailEO.ATTRIBUTE_NUMBER5
,ValUnitDetailEO.ATTRIBUTE_NUMBER6
,ValUnitDetailEO.ATTRIBUTE_NUMBER7
,ValUnitDetailEO.ATTRIBUTE_NUMBER8
,ValUnitDetailEO.ATTRIBUTE_NUMBER9
,ValUnitDetailEO.ATTRIBUTE_NUMBER10
,TO_CHAR(ValUnitDetailEO.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(ValUnitDetailEO.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(ValUnitDetailEO.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(ValUnitDetailEO.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(ValUnitDetailEO.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,ValUnitDetailEO.ATTRIBUTE_TIMESTAMP1
,ValUnitDetailEO.ATTRIBUTE_TIMESTAMP2
,ValUnitDetailEO.ATTRIBUTE_TIMESTAMP3
,ValUnitDetailEO.ATTRIBUTE_TIMESTAMP4
,ValUnitDetailEO.ATTRIBUTE_TIMESTAMP5
,ValUnitDetailEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,ValUnitDetailEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,ValUnitDetailEO.CREATED_BY RSC_CREATED_BY
,ValUnitDetailEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,ValUnitEO.COST_ORG_ID RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CST_VAL_UNITS_VL ValUnitEO
,CST_VAL_STRUCTURES_VL ValStructurePEO
,CST_COST_ORGS_V CostOrgPEO
,CST_COST_BOOKS_VL CostBookPEO
,CST_VAL_UNIT_DETAILS ValUnitDetailEO
WHERE ValUnitEO.VAL_STRUCTURE_ID      = ValStructurePEO.VAL_STRUCTURE_ID
AND ValUnitEO.COST_ORG_ID              = CostOrgPEO.COST_ORG_ID
AND ValUnitEO.COST_BOOK_ID             = CostBookPEO.COST_BOOK_ID
AND (ValUnitEO.VAL_UNIT_ID = ValUnitDetailEO.VAL_UNIT_ID
AND ValUnitEO.COST_BOOK_ID = ValUnitDetailEO.COST_BOOK_ID
AND ValUnitEO.VAL_STRUCTURE_ID = ValUnitDetailEO.VAL_STRUCTURE_ID)
AND (ValUnitDetailEO.ATTRIBUTE_CATEGORY IS NOT NULL OR
ValUnitDetailEO.ATTRIBUTE_CHAR1 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR2 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR3 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR4 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR5 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR6 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR7 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR8 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR9 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR10 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR11 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR12 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR13 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR14 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR15 IS NOT NULL OR
ValUnitDetailEO.ATTRIBUTE_CHAR16 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR17 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR18 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR19 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_CHAR20 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER1 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER2 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER3 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER4 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER5 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER6 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER7 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER8 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER9 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_NUMBER10 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_DATE1 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_DATE2 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_DATE3 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_DATE4 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_DATE5 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_TIMESTAMP1 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_TIMESTAMP2 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_TIMESTAMP3 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_TIMESTAMP4 IS NOT NULL OR 
ValUnitDetailEO.ATTRIBUTE_TIMESTAMP5 IS NOT NULL)
ORDER BY CostOrgPEO.COST_ORG_NAME
,CostBookPEO.COST_BOOK_CODE
,5