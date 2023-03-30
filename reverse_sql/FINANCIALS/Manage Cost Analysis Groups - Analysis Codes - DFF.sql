/* ****************************************************************************
 * $Revision: 53540 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-03-15 15:13:43 +0700 (Tue, 15 Mar 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Currency%20Rates%20Manager%20-%20Rate%20Types.sql $:
 * $Id: Currency Rates Manager - Rate Types.sql 53540 2016-03-15 08:13:43Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=707##RES##CST_ANALYSIS_CODES_B
-- DFF_ATTRIBUTES=ATTRIBUTE_CHAR,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.
 
SELECT AnalysisGroupsE0.ANALYSIS_GROUP_CODE RES_ANALYSIS_GROUP
,AnalysisCodes.ANALYSIS_CODE RES_ANALYSIS_CODE
,AnalysisCodes.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,AnalysisCodes.ATTRIBUTE_CHAR1
,AnalysisCodes.ATTRIBUTE_CHAR2
,AnalysisCodes.ATTRIBUTE_CHAR3
,AnalysisCodes.ATTRIBUTE_CHAR4
,AnalysisCodes.ATTRIBUTE_CHAR5
,AnalysisCodes.ATTRIBUTE_CHAR6
,AnalysisCodes.ATTRIBUTE_CHAR7
,AnalysisCodes.ATTRIBUTE_CHAR8
,AnalysisCodes.ATTRIBUTE_CHAR9
,AnalysisCodes.ATTRIBUTE_CHAR10
,AnalysisCodes.ATTRIBUTE_CHAR11
,AnalysisCodes.ATTRIBUTE_CHAR12
,AnalysisCodes.ATTRIBUTE_CHAR13
,AnalysisCodes.ATTRIBUTE_CHAR14
,AnalysisCodes.ATTRIBUTE_CHAR15
,AnalysisCodes.ATTRIBUTE_CHAR16
,AnalysisCodes.ATTRIBUTE_CHAR17
,AnalysisCodes.ATTRIBUTE_CHAR18
,AnalysisCodes.ATTRIBUTE_CHAR19
,AnalysisCodes.ATTRIBUTE_CHAR20
,AnalysisCodes.ATTRIBUTE_NUMBER1
,AnalysisCodes.ATTRIBUTE_NUMBER2
,AnalysisCodes.ATTRIBUTE_NUMBER3
,AnalysisCodes.ATTRIBUTE_NUMBER4
,AnalysisCodes.ATTRIBUTE_NUMBER5
,AnalysisCodes.ATTRIBUTE_NUMBER6
,AnalysisCodes.ATTRIBUTE_NUMBER7
,AnalysisCodes.ATTRIBUTE_NUMBER8
,AnalysisCodes.ATTRIBUTE_NUMBER9
,AnalysisCodes.ATTRIBUTE_NUMBER10
,TO_CHAR(AnalysisCodes.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(AnalysisCodes.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(AnalysisCodes.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(AnalysisCodes.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(AnalysisCodes.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,AnalysisCodes.ATTRIBUTE_TIMESTAMP1
,AnalysisCodes.ATTRIBUTE_TIMESTAMP2
,AnalysisCodes.ATTRIBUTE_TIMESTAMP3
,AnalysisCodes.ATTRIBUTE_TIMESTAMP4
,AnalysisCodes.ATTRIBUTE_TIMESTAMP5
,AnalysisCodes.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,AnalysisCodes.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,AnalysisCodes.CREATED_BY RSC_CREATED_BY
,AnalysisCodes.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CST_ANALYSIS_GROUPS_VL AnalysisGroupsE0
,CST_ANALYSIS_CODES_VL AnalysisCodes
WHERE AnalysisGroupsE0.ANALYSIS_GROUP_ID = AnalysisCodes.ANALYSIS_GROUP_ID
AND (AnalysisCodes.ATTRIBUTE_CATEGORY IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR1 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR2 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR3 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR4 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR5 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR6 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR7 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR8 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR9 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR10 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR11 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR12 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR13 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR14 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR15 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR16 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR17 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR18 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR19 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_CHAR20 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER1 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER2 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER3 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER4 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER5 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER6 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER7 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER8 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER9 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_NUMBER10 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_DATE1 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_DATE2 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_DATE3 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_DATE4 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_DATE5 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_TIMESTAMP1 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_TIMESTAMP2 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_TIMESTAMP3 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_TIMESTAMP4 IS NOT NULL OR
AnalysisCodes.ATTRIBUTE_TIMESTAMP5 IS NOT NULL)
ORDER BY AnalysisGroupsE0.ANALYSIS_GROUP_CODE
,AnalysisCodes.ANALYSIS_CODE