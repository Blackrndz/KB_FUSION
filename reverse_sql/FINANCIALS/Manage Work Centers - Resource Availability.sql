/* ****************************************************************************
* $Revision: 59117 $:
* $Author: nasrullah.dusenmahamad $:
* $Date: 2016-10-21 11:10:58 +0700 (Fri, 21 Oct 2016) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Key%20Flexfields%20-%20Segment%20Labels.sql $:
* $Id: Manage Key Flexfields - Segment Labels.sql 59117 2016-10-21 04:10:58Z nasrullah.dusenmahamad $:
* ****************************************************************************
* Description:
* ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=WIS_WORK_CENTERS_VL
-- RSC_PREREQUISITE_OBJECTS=WIS_WC_RESOURCES
-- RSC_PREREQUISITE_OBJECTS=WIS_RESOURCES_VL

SELECT (SELECT ORGANIZATION_CODE
	FROM INV_ORG_PARAMETERS
	WHERE ORGANIZATION_ID = WisWorkCentersE0.ORGANIZATION_ID
	AND MFG_PLANT_FLAG = 'Y'
	) RES_ORGANIZATION
,WisWorkCentersE0.WORK_CENTER_NAME RES_NAME
,WisResourcesVlE0.RESOURCE_NAME RES_RESOURCE
,TO_CHAR(WisResourcesVlE0.INACTIVE_DATE,'DD-Mon-YYYY') RES_INACTIVE_ON
,WisWcResourcesE0.RESOURCE_QUANTITY RES_DEFAULT_UNITS_AVAILABLE
,DECODE(WisWcResourcesE0.AVAILABLE_24_HOURS_FLAG,'Y','Yes','No') RES_AVAILABLE_24_HOURS
,DECODE(WisWcResourcesE0.CHECK_CTP_FLAG,'Y','Yes','No') RES_CHECK_CAPABLE_TO_PROMISE
,WisWcResourcesE0.UTILIZATION_PERCENTAGE RES_UTILIZATION
,WisWcResourcesE0.EFFICIENCY_PERCENTAGE RES_EFFICIENCY
,WisWcResourcesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,WisWcResourcesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,WisWcResourcesE0.CREATED_BY RSC_CREATED_BY
,WisWcResourcesE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,WisWorkCentersE0.ORGANIZATION_ID RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM WIS_WORK_CENTERS_VL WisWorkCentersE0
,WIS_WC_RESOURCES WisWcResourcesE0
,WIS_RESOURCES_VL WisResourcesVlE0
WHERE WisWorkCentersE0.WORK_CENTER_ID = WisWcResourcesE0.WORK_CENTER_ID
AND WisWcResourcesE0.RESOURCE_ID = WisResourcesVlE0.RESOURCE_ID
ORDER BY RES_ORGANIZATION
,WisWorkCentersE0.WORK_CENTER_NAME
,WisResourcesVlE0.RESOURCE_NAME