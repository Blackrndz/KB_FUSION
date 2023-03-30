/* ****************************************************************************
* $Revision: 78229 $:
* $Author: pisan.jariyasettachok $:
* $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
* $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Asset%20Categories%20-%20Default%20Rules.sql $:
* $Id: Manage Asset Categories - Default Rules.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
* ****************************************************************************
* Description:
* ************************************************************************** */

-- RSC_PREREQUISITE_OBJECTS=FA_CATEGORY_BOOK_DEFAULTS

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Advanced lease payment'RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.ADVANCE_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.ADVANCE_PAYMENT_LIAB_FLAG IS NOT NULL

UNION

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Initial direct cost'RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.INITIAL_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.INITIAL_PAYMENT_LIAB_FLAG IS NOT NULL


UNION

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Other payments'RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.OTHER_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.OTHER_PAYMENT_LIAB_FLAG IS NOT NULL


UNION

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Periodic lease payment'RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.PERIOD_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.PERIOD_PAYMENT_LIAB_FLAG IS NOT NULL

UNION

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Purchase price'RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.PURCHASE_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.PURCHASE_PAYMENT_LIAB_FLAG IS NOT NULL

UNION

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Residual value'RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.RESIDUAL_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.RESIDUAL_PAYMENT_LIAB_FLAG IS NOT NULL

UNION

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Termination penalty'RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.TERMINAL_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.TERMINAL_PAYMENT_LIAB_FLAG IS NOT NULL

UNION

SELECT faCatsE0.SEGMENT1 AS RES_CATEGORY1
,faCatsE0.SEGMENT2 AS RES_CATEGORY2
,faCatsE0.SEGMENT3 AS RES_CATEGORY3
,faCatsE0.SEGMENT4 AS RES_CATEGORY4
,faCatsE0.SEGMENT5 AS RES_CATEGORY5
,faCatsE0.SEGMENT6 AS RES_CATEGORY6
,faCatsE0.SEGMENT7 AS RES_CATEGORY7
,CategoryBookDefaultEO.BOOK_TYPE_CODE                    AS RES_BOOK 
,TO_CHAR(CategoryBookDefaultEO.START_DPIS,'DD-Mon-YYYY') AS RES_FROM_DATE_PLACED_IN_SERVIC
,'Variable lease payment' RES_PAYMENT_TYPES_EXCLUDED_FRO
,DECODE(CategoryBookDefaultEO.VARIABLE_PAYMENT_LIAB_FLAG,'Y','Yes','N','No') RES_ENABLED

,CategoryBookDefaultEO.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY 
,CategoryBookDefaultEO.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE 
,CategoryBookDefaultEO.CREATED_BY RSC_CREATED_BY 
,CategoryBookDefaultEO.CREATION_DATE RSC_CREATION_DATE 
,PGL.PRIMARY_LEDGER_ID RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID 
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID 
,NULL RSC_BUSINESS_GROUP_ID 
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID


FROM FA_CATEGORY_BOOK_DEFAULTS CategoryBookDefaultEO
,FA_BOOK_CONTROLS BookControlPEO
,FA_CATEGORIES_B faCatsE0
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE CategoryBookDefaultEO.BOOK_TYPE_CODE = BookControlPEO.BOOK_TYPE_CODE
AND BookControlPEO.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
AND CategoryBookDefaultEO.CATEGORY_ID = faCatsE0.CATEGORY_ID
AND CategoryBookDefaultEO.VARIABLE_PAYMENT_LIAB_FLAG IS NOT NULL


ORDER BY RES_CATEGORY1