/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20AutoInvoice%20Line%20Ordering%20Rules%20-%20Order%20By%20-%20DFF.sql $:
* $Id: Manage AutoInvoice Line Ordering Rules - Order By - DFF.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */
-- syntax: APPLICATION_ID##RES##DFF_CODE (Descriptive Flexfield name)
-- DFF_LOGIC_TO_APPLY=222##RES##RA_LINE_ORDER_BYS
-- DFF_ATTRIBUTES=ATTRIBUTE
-- IMPORTANT:
--  - the alias names for the Foreign keys must be the same as in the inventory.
--  - the alias name for context code must be RES_CONTEXT_CODE
--  - NO ALIASES for atributes fields.

SELECT
	(SELECT name
	FROM RA_LINE_ORDERING_RULES
	WHERE ORDERING_RULE_ID = RARULES.ORDERING_RULE_ID
	)                         AS RES_NAME
,RARULES.ORDER_BY_SEQUENCE AS RES_SEQUENCE
,(SELECT COLUMN_NAME
	FROM RA_LINE_ORDER_BY_COLUMNS
	WHERE COLUMN_ID = RARULES.COLUMN_ID
	) AS RES_TRANSACTION_ATTRIBUTE
,RARULES.ATTRIBUTE_CATEGORY RES_CONTEXT_CODE
,RARULES.ATTRIBUTE1
,RARULES.ATTRIBUTE2
,RARULES.ATTRIBUTE3
,RARULES.ATTRIBUTE4
,RARULES.ATTRIBUTE5
,RARULES.ATTRIBUTE6
,RARULES.ATTRIBUTE7
,RARULES.ATTRIBUTE8
,RARULES.ATTRIBUTE9
,RARULES.ATTRIBUTE10
,RARULES.ATTRIBUTE11
,RARULES.ATTRIBUTE12
,RARULES.ATTRIBUTE13
,RARULES.ATTRIBUTE14
,RARULES.ATTRIBUTE15
,RARULES.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,RARULES.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,RARULES.CREATED_BY RSC_CREATED_BY
,RARULES.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM RA_LINE_ORDER_BYS RARULES
WHERE(RARULES.ATTRIBUTE_CATEGORY IS NOT NULL
OR RARULES.ATTRIBUTE1            IS NOT NULL
OR RARULES.ATTRIBUTE2            IS NOT NULL
OR RARULES.ATTRIBUTE3            IS NOT NULL
OR RARULES.ATTRIBUTE4            IS NOT NULL
OR RARULES.ATTRIBUTE5            IS NOT NULL
OR RARULES.ATTRIBUTE6            IS NOT NULL
OR RARULES.ATTRIBUTE7            IS NOT NULL
OR RARULES.ATTRIBUTE8            IS NOT NULL
OR RARULES.ATTRIBUTE9            IS NOT NULL
OR RARULES.ATTRIBUTE10           IS NOT NULL
OR RARULES.ATTRIBUTE11           IS NOT NULL
OR RARULES.ATTRIBUTE12           IS NOT NULL
OR RARULES.ATTRIBUTE13           IS NOT NULL
OR RARULES.ATTRIBUTE14           IS NOT NULL
OR RARULES.ATTRIBUTE15           IS NOT NULL)
ORDER BY RES_NAME