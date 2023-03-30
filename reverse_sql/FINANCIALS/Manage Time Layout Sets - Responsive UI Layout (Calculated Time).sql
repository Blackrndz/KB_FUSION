/* ****************************************************************************
 * $Revision: 71972 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2019-05-07 10:16:43 +0700 (Tue, 07 May 2019) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Time%20Layout%20Sets%20-%20Time%20Entry%20Layout%20(Entry%20Level%20Details).sql $:
 * $Id: Manage Time Layout Sets - Time Entry Layout (Entry Level Details).sql 71972 2019-05-07 03:16:43Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=HXT_TCLAY_V

SELECT RES_LAYOUT_NAME
,RES_TIME_CARD_TYPE
,RES_ENABLE_ENTRY_OF_NEGATIVE_H
,RES_ENABLE_TIME_TO_SPAN_MIDNIG
,RES_DISPLAY_UNIT_OF_MEASURE
,RES_ENABLE_OPTION_TO_HIGHLIGHT
,RES_TIME_ENTRY_FORMAT
,RES_DECIMAL_PLACES
,RES_DATE_FORMAT

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
,DECODE(matrixE0.TCLAYFLD_ATTRIBUTE_CHAR1,'Y','Yes','No') RES_ENABLE_ENTRY_OF_NEGATIVE_H
,DECODE(matrixE0.TCLAYFLD_ATTRIBUTE_CHAR9,'Y','Yes','No')  RES_ENABLE_TIME_TO_SPAN_MIDNIG
,DECODE(matrixE0.TCLAYFLD_ATTRIBUTE_CHAR10,'Y','Yes','No')  RES_DISPLAY_UNIT_OF_MEASURE
,NULL RES_ENABLE_OPTION_TO_HIGHLIGHT
,DECODE(matrixE0.TCLAYFLD_ATTRIBUTE_CHAR2,'BOTH','Display hours and times','HOUR','Display hours only','TIME','Display start and end time') RES_TIME_ENTRY_FORMAT
,matrixE0.TCLAYFLD_ATTRIBUTE_NUMBER1 RES_DECIMAL_PLACES
,DECODE(matrixE0.TCLAYFLD_ATTRIBUTE_CHAR3
	,'EEEEE, MMMMM dd','Monday, January 01' 
	,'EEE, MMMMM dd','Mon, January 01' 
	,'EEE,MMM dd','Mon,Jan 01' 
	,'EEEEE','Monday' 
	,'EEE','Mon' 
	,'MMM dd','Jan 01' 
	,'MMM dd,EEE','Jan 01,Mon' 
	,'MMMMM dd,EEE','January 01,Mon' 
	,'MMMMM dd, EEEEE','January 01, Monday') RES_DATE_FORMAT


,matrixE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,matrixE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,matrixE0.CREATED_BY RSC_CREATED_BY
,matrixE0.CREATION_DATE RSC_CREATION_DATE

FROM HXT_TCLAYST_VL hxtTCLAYEO   
,HXT_TCLAY_B hxtTCLATVEO
,(SELECT * FROM HXT_TCLAYFLD_DEFNS_VL WHERE TCLAYFLD_ATTRIBUTE_CATEGORY IN 'MATRIX_PARAMS_TCR') matrixE0


WHERE hxtTCLAYEO.TCLAYST_ID =  hxtTCLATVEO.TCLAYST_ID
AND hxtTCLATVEO.TCLAY_ID = matrixE0.TCLAY_ID
AND hxtTCLATVEO.TCLAY_TYPE LIKE 'Responsive UI%'
)

ORDER BY RES_LAYOUT_NAME,RES_TIME_CARD_TYPE


