/* ****************************************************************************
 * $Revision: 58428 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-09-23 18:27:01 +0700 (Fri, 23 Sep 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/customized/In%20Develop/reverse_sql/Manage%20Bank%20Statement%20Reconciliation%20Tolerance%20Rules%20-%20Manage%20Bank%20Statement%20Reconciliation%20Tolera $:
 * $Id: Manage Bank Statement Reconciliation Tolerance Rules - Manage Bank Statement Reconciliation Tolerance Rules.sql 58428 2016-09-23 11:27:01Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 


SELECT BANKSTMTRECONTOLERANCERULEEO.TOLERANCE_RULE_NAME RES_NAME
,DECODE(BANKSTMTRECONTOLERANCERULEEO.ACTIVE_FLAG,'Y','Yes','No') RES_ACTIVE
,BANKSTMTRECONTOLERANCERULEEO.DESCRIPTION RES_DESCRIPTION
,DECODE(BANKSTMTRECONTOLERANCERULEEO.DATE_ENABLED_FLAG,'Y','Yes','No') RES_DATE_TOLERANCE_ENABLE
,BANKSTMTRECONTOLERANCERULEEO.DAYS_BEFORE RES_DAYS_BEFORE
,BANKSTMTRECONTOLERANCERULEEO.DAYS_AFTER RES_DAYS_AFTER
,DECODE(BANKSTMTRECONTOLERANCERULEEO.AMOUNT_ENABLED_FLAG,'Y','Yes','No') RES_AMOUNT_TOLERANCE_ENABLE
,BANKSTMTRECONTOLERANCERULEEO.AMOUNT_BELOW RES_AMOUNT_BELOW
,BANKSTMTRECONTOLERANCERULEEO.AMOUNT_ABOVE RES_AMOUNT_ABOVE
,DECODE(BANKSTMTRECONTOLERANCERULEEO.PERCENT_ENABLED_FLAG,'Y','Yes','No') RES_PERCENTAGE_AMOUNT_TOLERANC
,BANKSTMTRECONTOLERANCERULEEO.PERCENT_BELOW RES_PERCENT_BELOW
,BANKSTMTRECONTOLERANCERULEEO.PERCENT_ABOVE RES_PERCENT_ABOVE
,BANKSTMTRECONTOLERANCERULEEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,BANKSTMTRECONTOLERANCERULEEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,BANKSTMTRECONTOLERANCERULEEO.CREATED_BY RSC_CREATED_BY
,BANKSTMTRECONTOLERANCERULEEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM CE_RECON_TOLERANCE_RULES BANKSTMTRECONTOLERANCERULEEO
ORDER BY BANKSTMTRECONTOLERANCERULEEO.TOLERANCE_RULE_NAME