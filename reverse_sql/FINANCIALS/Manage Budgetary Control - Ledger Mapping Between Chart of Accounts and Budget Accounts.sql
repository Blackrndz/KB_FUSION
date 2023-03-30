/* ****************************************************************************
 * $Revision$:
 * $Author$:
 * $Date$:
 * $HeadURL$:
 * $Id$:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

--RSC_PREREQUISITE_OBJECTS=XCC_SEG_NOT_BUDGETED_SEG_VAL

SELECT gl.NAME RES_LEDGER_NAME
,(SELECT BU_NAME
	FROM FUN_ALL_BUSINESS_UNITS_V
	WHERE BU_ID = xccBCEBUE0.BUSINESS_UNIT_ID 
	) RES_BUSINESS_UNIT_NAME
,(SELECT SEGMENT_CODE FROM FND_KF_SEGMENTS_VL seg
	,FND_KF_STR_INSTANCES_VL strInst
	WHERE seg.STRUCTURE_ID                 = strInst.STRUCTURE_ID
	AND seg.ENABLED_FLAG                   = 'Y'
	AND strInst.ENABLED_FLAG               = 'Y'
	AND strInst.APPLICATION_ID             = 101
	AND strInst.KEY_FLEXFIELD_CODE         = 'GL#'
	AND strInst.STRUCTURE_INSTANCE_NUMBER  = gl.CHART_OF_ACCOUNTS_ID
	AND seg.COLUMN_NAME = xccBSEGVALE0.SOURCE_SEGMENT_COLUMN_NAME) RES_LEDGER_CHART_OF_ACCOUNTS
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = xccBSEGVALE0.SEG_VAL_SOURCE_CODE
			AND LOOKUP_TYPE = 'ORA_XCC_SEG_VAL_SOURCE' AND LANGUAGE = USERENV('LANG')) RES_LEDGER_BUDGET_SEGMENT
,xccBSEGVALE0.SEGMENT_VALUE RES_LEDGER_SEGMENT_VALUE


,xccBSEGVALE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,xccBSEGVALE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,xccBSEGVALE0.CREATED_BY RSC_CREATED_BY
,xccBSEGVALE0.CREATION_DATE RSC_CREATION_DATE
,xccBCELEDE0.LEDGER_ID RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,xccBCEBUE0.BUSINESS_UNIT_ID RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
   
FROM XCC_BCE_LEDGERS xccBCELEDE0
,XCC_BCE_BUSINESS_UNITS xccBCEBUE0
,XCC_SEG_NOT_BUDGETED_SEG_VAL xccBSEGVALE0
,GL_LEDGERS gl
WHERE xccBCELEDE0.LEDGER_ID = xccBSEGVALE0.LEDGER_ID
AND xccBCELEDE0.LEDGER_ID = xccBCEBUE0.LEDGER_ID
AND gl.LEDGER_ID = xccBSEGVALE0.LEDGER_ID
ORDER BY 1