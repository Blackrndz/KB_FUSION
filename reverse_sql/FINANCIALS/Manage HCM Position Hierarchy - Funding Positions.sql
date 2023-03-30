/* ****************************************************************************
 * $Revision: 73970 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2020-04-15 21:09:13 +0700 (Wed, 15 Apr 2020) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.20/trunk/core/reverse_sql/FINANCIALS/Manage%20Positions%20-%20Funding%20Positions.sql $:
 * $Id: Manage Positions - Funding Positions.sql 73970 2020-04-15 14:09:13Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=PER_POS_FUNDING_POSITIONS_F
 
SELECT TO_CHAR(hrALLPOSTIONEO.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,(SELECT BU_NAME
	FROM FUN_ALL_BUSINESS_UNITS_V
	WHERE BU_ID = hrALLPOSTIONEO.BUSINESS_UNIT_ID 
	) RES_BUSINESS_UNIT
,hrALLPOSTIONEO.NAME RES_NAME
,hrALLPOSTIONEO.POSITION_CODE RES_CODE
,funPostionsE0.NAME RES_FUNDING_POSITION_NAME
,funPostionsE0.POSITION_CODE RES_FUNDING_POSITION_CODE
,(SELECT BU_NAME 
	FROM FUN_ALL_BUSINESS_UNITS_V 
	WHERE BU_ID = funPostionsE0.BUSINESS_UNIT_ID
	AND SYSDATE BETWEEN DATE_FROM AND NVL(DATE_TO ,TO_DATE('31-12-4712','DD-MM-YYYY'))
	) RES_FUNDING_POSITION_BUSINESS_
,perFUNDPOSITIONEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,perFUNDPOSITIONEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,perFUNDPOSITIONEO.CREATED_BY RSC_CREATED_BY
,perFUNDPOSITIONEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HR_ALL_POSITIONS_F_VL hrALLPOSTIONEO
,PER_POS_FUNDING_POSITIONS_F perFUNDPOSITIONEO
,HR_ALL_POSITIONS_F_VL funPostionsE0
WHERE hrALLPOSTIONEO.POSITION_ID = perFUNDPOSITIONEO.POSITION_ID
AND hrALLPOSTIONEO.EFFECTIVE_END_DATE BETWEEN perFUNDPOSITIONEO.EFFECTIVE_START_DATE AND NVL(perFUNDPOSITIONEO.EFFECTIVE_END_DATE ,TO_DATE('31-12-4712','DD-MM-YYYY'))
AND perFUNDPOSITIONEO.FUNDING_POSITION_ID  = funPostionsE0.POSITION_ID
AND perFUNDPOSITIONEO.EFFECTIVE_END_DATE BETWEEN funPostionsE0.EFFECTIVE_START_DATE AND NVL(funPostionsE0.EFFECTIVE_END_DATE ,TO_DATE('31-12-4712','DD-MM-YYYY'))
ORDER BY hrALLPOSTIONEO.NAME
,hrALLPOSTIONEO.POSITION_CODE
,hrALLPOSTIONEO.EFFECTIVE_START_DATE
,funPostionsE0.NAME