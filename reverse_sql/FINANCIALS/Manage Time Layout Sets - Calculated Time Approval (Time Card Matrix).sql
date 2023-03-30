/* ****************************************************************************
 * $Revision: 71972 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2019-05-07 10:16:43 +0700 (Tue, 07 May 2019) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Time%20Layout%20Sets%20-%20Time%20Entry%20Layout%20(Time%20Card%20Matrix).sql $:
 * $Id: Manage Time Layout Sets - Time Entry Layout (Time Card Matrix).sql 71972 2019-05-07 03:16:43Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 -- RSC_PREREQUISITE_OBJECTS=HXT_TCLAY_V

SELECT RES_LAYOUT_NAME
,RES_TIME_CARD_TYPE
,RES_NAME
,RES_DISPLAY_LABEL
,RES_DESCRIPTION
,RES_DISPLAY_OPTION
,RES_TIME_ENTRY_IDENTIFIER

,RSC_LAST_UPDATED_BY
,RSC_LAST_UPDATE_DATE
,RSC_CREATED_BY
,RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM 
(SELECT DISTINCT hxtTCLAYEO.NAME RES_LAYOUT_NAME
,(CASE WHEN hxtTCLATVEO.TCLAY_TYPE LIKE '%Indiv'
	THEN 'Worker'
	ELSE 'Manager' END) RES_TIME_CARD_TYPE
,hxtTCLATDEFNSVEO.DISPLAY_SEQUENCE
,hxtTCLATDEFNSVEO.NAME RES_NAME
,hxtTCLATDEFNSVEO.LABEL RES_DISPLAY_LABEL
,hxtTCLATDEFNSVEO.DESCRIPTION RES_DESCRIPTION
,(CASE WHEN hxtTCLATVEO.TCLAY_TYPE LIKE '%Indiv'
	THEN NULL
	ELSE DECODE(hxtTCLATDEFNSVEO.TCLAYFLD_ATTRIBUTE_CHAR29,'Y','Yes','No') END) RES_DISPLAY_OPTION
,DECODE(hxtTCLATDEFNSVEO.TCLAYFLD_ATTRIBUTE_CHAR28,'Y','Yes','No') RES_TIME_ENTRY_IDENTIFIER

,hxtTCLATDEFNSVEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,hxtTCLATDEFNSVEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,hxtTCLATDEFNSVEO.CREATED_BY RSC_CREATED_BY
,hxtTCLATDEFNSVEO.CREATION_DATE RSC_CREATION_DATE
FROM HXT_TCLAYST_VL hxtTCLAYEO   
,HXT_TCLAY_V hxtTCLATVEO
,HXT_TCLAYFLD_DEFNS_VL hxtTCLATDEFNSVEO

WHERE hxtTCLAYEO.TCLAYST_ID =  hxtTCLATVEO.TCLAYST_ID
AND hxtTCLATVEO.TCLAY_ID = hxtTCLATDEFNSVEO.TCLAY_ID
AND hxtTCLATDEFNSVEO.TCLAYFLD_ATTRIBUTE_CHAR26 = 'MATRIX'
AND hxtTCLATVEO.TASK_SHORT_NAME = 'TANL'
AND hxtTCLATDEFNSVEO.TCLAYFLD_ATTRIBUTE_CATEGORY = 'TCR_INSTANCE')

ORDER BY RES_LAYOUT_NAME,RES_TIME_CARD_TYPE,DISPLAY_SEQUENCE





