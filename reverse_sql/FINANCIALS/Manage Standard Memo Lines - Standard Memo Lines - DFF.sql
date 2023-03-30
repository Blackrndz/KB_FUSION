/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Standard%20Memo%20Lines%20-%20Standard%20Memo%20Lines%20-%20DFF.sql $:
 * $Id: Manage Standard Memo Lines - Standard Memo Lines - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 -- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=222##RES##AR_MEMO_LINES
-- DFF_ATTRIBUTES=ATTRIBUTE,GLOBAL_ATTRIBUTE,GLOBAL_ATTRIBUTE_NUMBER,GLOBAL_ATTRIBUTE_DATE

-- IMPORTANT: 
-- 	- the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.
 
select (SELECT SET_NAME
	FROM Fusion.FND_SETID_SETS_VL
	WHERE SET_ID = ArMemoLinesAllVl.SET_ID
	) 																	RES_MEMO_LINE_SET
,ArMemoLinesAllVl.NAME 														RES_NAME
,ArMemoLinesAllVl.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,ArMemoLinesAllVl.ATTRIBUTE1 
,ArMemoLinesAllVl.ATTRIBUTE2
,ArMemoLinesAllVl.ATTRIBUTE3
,ArMemoLinesAllVl.ATTRIBUTE4
,ArMemoLinesAllVl.ATTRIBUTE5
,ArMemoLinesAllVl.ATTRIBUTE6
,ArMemoLinesAllVl.ATTRIBUTE7
,ArMemoLinesAllVl.ATTRIBUTE8
,ArMemoLinesAllVl.ATTRIBUTE9
,ArMemoLinesAllVl.ATTRIBUTE10
,ArMemoLinesAllVl.ATTRIBUTE11
,ArMemoLinesAllVl.ATTRIBUTE12
,ArMemoLinesAllVl.ATTRIBUTE13
,ArMemoLinesAllVl.ATTRIBUTE14
,ArMemoLinesAllVl.ATTRIBUTE15
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE1 
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE2
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE3
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE4
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE5
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE6
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE7
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE8
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE9
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE10
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE11
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE12
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE13
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE14
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE15
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE16
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE17
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE18
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE19
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE20
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER1 
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER2
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER3
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER4
,ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER5
, TO_CHAR(ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE1, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE1
, TO_CHAR(ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE2, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE2
, TO_CHAR(ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE3, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE3
, TO_CHAR(ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE4, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE4
, TO_CHAR(ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE5, 'DD-Mon-YYYY') GLOBAL_ATTRIBUTE_DATE5
,ArMemoLinesAllVl.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,ArMemoLinesAllVl.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,ArMemoLinesAllVl.CREATED_BY  RSC_CREATED_BY
,ArMemoLinesAllVl.CREATION_DATE  RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
 

from AR_MEMO_LINES_ALL_VL ArMemoLinesAllVl
WHERE 
(ArMemoLinesAllVl.ATTRIBUTE_CATEGORY IS NOT NULL OR
ArMemoLinesAllVl.ATTRIBUTE1 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE2 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE3 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE4 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE5 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE6 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE7 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE8 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE9 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE10 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE11 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE12 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE13 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE14 IS NOT NULL OR 
ArMemoLinesAllVl.ATTRIBUTE15 IS NOT NULL OR
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE1 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE2 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE3 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE4 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE5 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE6 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE7 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE8 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE9 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE10 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE11 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE12 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE13 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE14 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE15 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE16 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE17 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE18 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE19 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE20 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER1 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER2 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER3 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER4 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_NUMBER5 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE1 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE2 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE3 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE4 IS NOT NULL OR 
ArMemoLinesAllVl.GLOBAL_ATTRIBUTE_DATE5 IS NOT NULL )
order by RES_NAME