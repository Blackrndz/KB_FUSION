/* ****************************************************************************
 * $Revision: 59704 $:
 * $Author: nasrullah.dusenmahamad $:
 * $Date: 2016-11-22 17:48:05 +0700 (Tue, 22 Nov 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.19.01/trunk/core/reverse_sql/FINANCIALS/Manage%20Tax%20Reporting%20Types%20-%20Tax%20Reporting%20Types.sql $:
 * $Id: Manage Tax Reporting Types - Tax Reporting Types.sql 59704 2016-11-22 10:48:05Z nasrullah.dusenmahamad $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


WITH FILTERS AS (SELECT TCLAYFLD_DEFNS_ID
    ,TCLAYFLD_ATTRIBUTE_CHAR10 FILTERS
    ,TCLAYFLD_ATTRIBUTE_NUMBER3 FVALUES
    ,1 SEQ
    FROM HXT_TCLAYFLD_DEFNS_VL
    WHERE TCLAY_ID IS NULL
    
    UNION
    
    SELECT TCLAYFLD_DEFNS_ID
    ,TCLAYFLD_ATTRIBUTE_CHAR11 FILTERS
    ,TCLAYFLD_ATTRIBUTE_NUMBER4 FVALUES
    ,2 SEQ
    FROM HXT_TCLAYFLD_DEFNS_VL
    WHERE TCLAY_ID IS NULL
    
    UNION
    
    SELECT TCLAYFLD_DEFNS_ID
    ,TCLAYFLD_ATTRIBUTE_CHAR12 FILTERS
    ,TCLAYFLD_ATTRIBUTE_NUMBER5 FVALUES
    ,3 SEQ
    FROM HXT_TCLAYFLD_DEFNS_VL
    WHERE TCLAY_ID IS NULL
    
    UNION
    
    SELECT TCLAYFLD_DEFNS_ID
    ,TCLAYFLD_ATTRIBUTE_CHAR13 FILTERS
    ,TCLAYFLD_ATTRIBUTE_NUMBER6 FVALUES
    ,4 SEQ
    FROM HXT_TCLAYFLD_DEFNS_VL
    WHERE TCLAY_ID IS NULL
    
    UNION
    
    SELECT TCLAYFLD_DEFNS_ID
    ,TCLAYFLD_ATTRIBUTE_CHAR14 FILTERS
    ,TCLAYFLD_ATTRIBUTE_NUMBER7 FVALUES
    ,5 SEQ
    FROM HXT_TCLAYFLD_DEFNS_VL
    WHERE TCLAY_ID IS NULL
    )
	 
SELECT layoutCompsE0.NAME RES_NAME
,filtersE0.FILTERS RES_FILTER_VARIABLE
,(SELECT DISPLAY_NAME
    FROM HWM_TM_ATRB_FLDS_VL
    WHERE TM_ATRB_FLD_ID = filtersE0.FVALUES
    ) RES_FILTER_INPUT_ATTRIBUTE
,layoutCompsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,layoutCompsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,layoutCompsE0.CREATED_BY RSC_CREATED_BY
,layoutCompsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HXT_TCLAYFLD_DEFNS_VL layoutCompsE0
,FILTERS filtersE0
WHERE layoutCompsE0.TCLAY_ID IS NULL
AND layoutCompsE0.TCLAYFLD_DEFNS_ID = filtersE0.TCLAYFLD_DEFNS_ID
AND layoutCompsE0.TCLAYFLD_ATTRIBUTE_CHAR1 = 'M'
AND layoutCompsE0.P_TCLAYFLD_DEFNS_ID IS NULL
AND (filtersE0.FILTERS IS NOT NULL AND filtersE0.FVALUES IS NOT NULL)
ORDER BY layoutCompsE0.NAME
,filtersE0.SEQ