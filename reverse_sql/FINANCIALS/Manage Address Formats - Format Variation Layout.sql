/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Address%20Formats%20-%20Format%20Variation%20Layout.sql $:
 * $Id: Manage Address Formats - Format Variation Layout.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 
SELECT hzStyleFormatEO.STYLE_FORMAT_CODE RES_CODE
 ,hzStyleFormatEO.STYLE_FORMAT_NAME RES_NAME
 ,hzStyleFmtLayoutEO.VARIATION_NUMBER RES_VARIATION_NUMBER
 ,hzStyleFmtLayoutEO.LINE_NUMBER RES_LINE
 ,hzStyleFmtLayoutEO.POSITION RES_POSITION
 ,hzStyleFmtLayoutEO.PROMPT RES_PROMPT
 ,hzStyleFmtLayoutEO.PROMPT RES_ADDRESS_ELEMENT
 ,DECODE(hzStyleFmtLayoutEO.MANDATORY_FLAG,'Y','Yes','No') RES_REQUIRED
 ,DECODE(hzStyleFmtLayoutEO.UPPERCASE_FLAG,'Y','Yes','No') RES_UPPERCASE
 ,hzStyleFmtLayoutEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
 ,hzStyleFmtLayoutEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
 ,hzStyleFmtLayoutEO.CREATED_BY RSC_CREATED_BY
 ,hzStyleFmtLayoutEO.CREATION_DATE RSC_CREATION_DATE
 ,NULL RSC_LEDGER_ID
 ,NULL RSC_CHART_OF_ACCOUNTS_ID
 ,NULL RSC_BUSINESS_UNIT_ID
 ,NULL RSC_LEGAL_ENTITY_ID
 ,NULL RSC_ORGANIZATION_ID
 ,NULL RSC_BUSINESS_GROUP_ID
 ,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HZ_STYLE_FORMATS_VL hzStyleFormatEO
,HZ_STYLE_FMT_LAYOUTS_VL hzStyleFmtLayoutEO
WHERE hzStyleFormatEO.STYLE_FORMAT_CODE = hzStyleFmtLayoutEO.STYLE_FORMAT_CODE
AND hzStyleFormatEO.STYLE_CODE IN ('PARTY_SUFFIX','POSTAL_ADDR','SUPP_TAX_AND_RPTNG_ADDR')
ORDER BY 1


