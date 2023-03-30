/* ****************************************************************************
 * $Revision: 53543 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-03-15 15:46:40 +0700 (Tue, 15 Mar 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Accounting%20Calendars%20-%20Calendar%20Options.sql $:
 * $Id: Manage Accounting Calendars - Calendar Options.sql 53543 2016-03-15 08:46:40Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=IRC_REQUISITIONS_VL

-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=821##RES##IRC_REQUISITIONS_DFF
-- DFF_ATTRIBUTES=ATTRIBUTE_CHAR,ATTRIBUTE_NUMBER,ATTRIBUTE_DATE,ATTRIBUTE_TIMESTAMP

-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.

SELECT jobReqTemplatesE0.NAME RES_NAME
--,jobReqTemplatesE0.REQUISITION_NUMBER RES_CODE
,jobReqTemplatesE0.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,jobReqTemplatesE0.ATTRIBUTE_CHAR1
,jobReqTemplatesE0.ATTRIBUTE_CHAR2
,jobReqTemplatesE0.ATTRIBUTE_CHAR3
,jobReqTemplatesE0.ATTRIBUTE_CHAR4
,jobReqTemplatesE0.ATTRIBUTE_CHAR5
,jobReqTemplatesE0.ATTRIBUTE_CHAR6
,jobReqTemplatesE0.ATTRIBUTE_CHAR7
,jobReqTemplatesE0.ATTRIBUTE_CHAR8
,jobReqTemplatesE0.ATTRIBUTE_CHAR9
,jobReqTemplatesE0.ATTRIBUTE_CHAR10
,jobReqTemplatesE0.ATTRIBUTE_CHAR11
,jobReqTemplatesE0.ATTRIBUTE_CHAR12
,jobReqTemplatesE0.ATTRIBUTE_CHAR13
,jobReqTemplatesE0.ATTRIBUTE_CHAR14
,jobReqTemplatesE0.ATTRIBUTE_CHAR15
,jobReqTemplatesE0.ATTRIBUTE_CHAR16
,jobReqTemplatesE0.ATTRIBUTE_CHAR17
,jobReqTemplatesE0.ATTRIBUTE_CHAR18
,jobReqTemplatesE0.ATTRIBUTE_CHAR19
,jobReqTemplatesE0.ATTRIBUTE_CHAR20
,jobReqTemplatesE0.ATTRIBUTE_CHAR21
,jobReqTemplatesE0.ATTRIBUTE_CHAR22
,jobReqTemplatesE0.ATTRIBUTE_CHAR23
,jobReqTemplatesE0.ATTRIBUTE_CHAR24
,jobReqTemplatesE0.ATTRIBUTE_CHAR25
,jobReqTemplatesE0.ATTRIBUTE_CHAR26
,jobReqTemplatesE0.ATTRIBUTE_CHAR27
,jobReqTemplatesE0.ATTRIBUTE_CHAR28
,jobReqTemplatesE0.ATTRIBUTE_CHAR29
,jobReqTemplatesE0.ATTRIBUTE_CHAR30
,jobReqTemplatesE0.ATTRIBUTE_NUMBER1
,jobReqTemplatesE0.ATTRIBUTE_NUMBER2
,jobReqTemplatesE0.ATTRIBUTE_NUMBER3
,jobReqTemplatesE0.ATTRIBUTE_NUMBER4
,jobReqTemplatesE0.ATTRIBUTE_NUMBER5
,jobReqTemplatesE0.ATTRIBUTE_NUMBER6
,jobReqTemplatesE0.ATTRIBUTE_NUMBER7
,jobReqTemplatesE0.ATTRIBUTE_NUMBER8
,jobReqTemplatesE0.ATTRIBUTE_NUMBER9
,jobReqTemplatesE0.ATTRIBUTE_NUMBER10
,jobReqTemplatesE0.ATTRIBUTE_NUMBER11
,jobReqTemplatesE0.ATTRIBUTE_NUMBER12
,jobReqTemplatesE0.ATTRIBUTE_NUMBER13
,jobReqTemplatesE0.ATTRIBUTE_NUMBER14
,jobReqTemplatesE0.ATTRIBUTE_NUMBER15
,jobReqTemplatesE0.ATTRIBUTE_NUMBER16
,jobReqTemplatesE0.ATTRIBUTE_NUMBER17
,jobReqTemplatesE0.ATTRIBUTE_NUMBER18
,jobReqTemplatesE0.ATTRIBUTE_NUMBER19
,jobReqTemplatesE0.ATTRIBUTE_NUMBER20
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE1,'DD-Mon-YYYY') ATTRIBUTE_DATE1
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE2,'DD-Mon-YYYY') ATTRIBUTE_DATE2
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE3,'DD-Mon-YYYY') ATTRIBUTE_DATE3
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE4,'DD-Mon-YYYY') ATTRIBUTE_DATE4
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE5,'DD-Mon-YYYY') ATTRIBUTE_DATE5
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE6,'DD-Mon-YYYY') ATTRIBUTE_DATE6
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE7,'DD-Mon-YYYY') ATTRIBUTE_DATE7
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE8,'DD-Mon-YYYY') ATTRIBUTE_DATE8
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE9,'DD-Mon-YYYY') ATTRIBUTE_DATE9
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_DATE10,'DD-Mon-YYYY') ATTRIBUTE_DATE10
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP1,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP1
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP2,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP2
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP3,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP3
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP4,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP4
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP5,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP5
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP6,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP6
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP7,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP7
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP8,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP8
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP9,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP9
,TO_CHAR(jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP10,'DD-Mon-YYYY HH24:MI:SS') ATTRIBUTE_TIMESTAMP10
,jobReqTemplatesE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,jobReqTemplatesE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,jobReqTemplatesE0.CREATED_BY RSC_CREATED_BY
,jobReqTemplatesE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM IRC_REQUISITIONS_VL jobReqTemplatesE0
WHERE jobReqTemplatesE0.REQ_USAGE_CODE = 'ORA_TEMPLATE'
AND (jobReqTemplatesE0.ATTRIBUTE_CATEGORY IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR1 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR2 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR3 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR4 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR5 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR6 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR7 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR8 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR9 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR10 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR11 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR12 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR13 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR14 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR15 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR16 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR17 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR18 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR19 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR20 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR21 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR22 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR23 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR24 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR25 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR26 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR27 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR28 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR29 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_CHAR30 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER1 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER2 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER3 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER4 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER5 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER6 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER7 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER8 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER9 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER10 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER11 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER12 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER13 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER14 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER15 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER16 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER17 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER18 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER19 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_NUMBER20 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE1 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE2 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE3 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE4 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE5 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE6 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE7 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE8 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE9 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_DATE10 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP1 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP2 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP3 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP4 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP5 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP6 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP7 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP8 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP9 IS NOT NULL
	OR jobReqTemplatesE0.ATTRIBUTE_TIMESTAMP10 IS NOT NULL)
ORDER BY jobReqTemplatesE0.NAME