/* ****************************************************************************
 * $Revision: 73701 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2020-03-05 12:34:33 +0700 (Thu, 05 Mar 2020) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.20/trunk/core/reverse_sql/FINANCIALS/Manage%20Receipt%20Classes%20and%20Methods%20-%20Remittance%20Bank%20Account.sql $:
 * $Id: Manage Receipt Classes and Methods - Remittance Bank Account.sql 73701 2020-03-05 05:34:33Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=HRC_TXN_COMMENT

SELECT TO_CHAR(laddersE0.EFFECTIVE_START_DATE,'DD-Mon-YYYY') RES_EFFECTIVE_START_DATE
,laddersE0.NAME RES_NAME
,commentsE0.COMMENT_TEXT RES_COMMENT
,commentsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,commentsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,commentsE0.CREATED_BY RSC_CREATED_BY
,commentsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PER_GRADE_LADDERS_F_VL laddersE0
,(SELECT DISTINCT commentsE0.COMMENT_TEXT
    ,commentsE0.CREATED_BY
    ,commentsE0.CREATION_DATE
    ,commentsE0.LAST_UPDATED_BY
    ,commentsE0.LAST_UPDATE_DATE
    ,trxsE0.PARENT_OBJ_ID
    FROM HRC_TXN_CHILD_OBJECTS trxsE0
    ,HRC_TXN_COMMENT commentsE0
    WHERE commentsE0.TRANSACTION_ID = trxsE0.PARENT_TXN_ID
    ) commentsE0
WHERE laddersE0.GRADE_LADDER_ID = commentsE0.PARENT_OBJ_ID
ORDER BY laddersE0.NAME
,laddersE0.EFFECTIVE_START_DATE