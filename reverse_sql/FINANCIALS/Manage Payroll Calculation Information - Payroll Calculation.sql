/* ****************************************************************************
 * $Revision: 54943 $:
 * $Author: paul.wakefield $:
 * $Date: 2016-05-04 13:45:23 +0700 (Wed, 04 May 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.19/trunk/core/reverse_sql/FINANCIALS/Manage%20Trading%20Community%20Person%20Lookups%20-%20Standard%20Lookup%20Type.sql $:
 * $Id: Manage Trading Community Person Lookups - Standard Lookup Type.sql 54943 2016-05-04 06:45:23Z paul.wakefield $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT payDEDUCTYPEO.DEDUCTION_CODE RES_SHORT_NAME
,payDEDUCTYPEO.NAME RES_NAME
,(SELECT NAME FROM PAY_DEDUCTION_GROUPS_VL WHERE DEDUCTION_GROUP_ID = payDEDUCTYPEO.DEDUCTION_GROUP_ID ) RES_COMPONENT_GROUP
,payDEDUCTYPEO.DISPLAY_SEQUENCE RES_SEQUENCE_IN_COMPONENT_GROU
,(SELECT NAME FROM PER_LEGISLATIVE_DATA_GROUPS_VL WHERE LEGISLATIVE_DATA_GROUP_ID = payDEDUCTYPEO.LEGISLATIVE_DATA_GROUP_ID) RES_LEGISLATIVE_DATA_GROUP
,TO_CHAR(SYSDATE,'DD-Mon-YYYY') RES_SESSION_EFFECTIVE_DATE
/*,(CASE WHEN payDEDUCTYPEO.LEGISLATIVE_DATA_GROUP_ID IS NULL 
	THEN payDEDUCTYPEO.LEGISLATION_CODE 
	ELSE
		(SELECT LEGISLATION_CODE FROM PER_LEGISLATIVE_DATA_GROUPS_VL WHERE LEGISLATIVE_DATA_GROUP_ID = payDEDUCTYPEO.LEGISLATIVE_DATA_GROUP_ID) 
	END) RES_COUNTRY*/




,payDEDUCTYPEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,payDEDUCTYPEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,payDEDUCTYPEO.CREATED_BY RSC_CREATED_BY
,payDEDUCTYPEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PAY_DEDUCTION_TYPES_VL  payDEDUCTYPEO
ORDER BY RES_LEGISLATIVE_DATA_GROUP,payDEDUCTYPEO.LEGISLATION_CODE,RES_NAME