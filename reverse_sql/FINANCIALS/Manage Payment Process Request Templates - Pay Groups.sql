/* ****************************************************************************
 * $Revision: 59683 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2016-11-22 10:55:17 +0700 (Tue, 22 Nov 2016) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Mapping%20Sets%20-%20Cost%20Management%20(Chart%20of%20Accounts%20Mappings).sql $:
 * $Id: Manage Mapping Sets - Cost Management (Chart of Accounts Mappings).sql 59683 2016-11-22 03:55:17Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT apTemplatesE0.TEMPLATE_NAME RES_NAME
,DECODE(apTemplatesE0.PAY_GROUP_OPTION,'ALL','All','SPECIFY','Specific') RES_OPTION_PAY_GROUPS
,(SELECT MEANING
	FROM AP_LOOKUP_VALUES
	WHERE LOOKUP_TYPE = 'PAY GROUP'
	AND LOOKUP_CODE = apPayGroupsE0.VENDOR_PAY_GROUP
	) RES_PAY_GROUP
,apPayGroupsE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,apPayGroupsE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,apPayGroupsE0.CREATED_BY RSC_CREATED_BY
,apPayGroupsE0.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM AP_PAYMENT_TEMPLATES apTemplatesE0
,AP_PAY_GROUP apPayGroupsE0
WHERE apTemplatesE0.TEMPLATE_ID = apPayGroupsE0.TEMPLATE_ID
ORDER BY apTemplatesE0.TEMPLATE_NAME,3