/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Payroll%20Security%20Profile%20-%20Basic%20Details.sql $:
 * $Id: Manage Payroll Security Profile - Basic Details.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT payPAYSECEO.NAME RES_NAME
,DECODE(payPAYSECEO.ENABLED_FLAG,'Y','Yes','No') RES_ENABLED
,DECODE(payPAYSECEO.VIEW_ALL,'Y','Yes','No')	RES_VIEW_ALL

,payPAYSECEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,payPAYSECEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,payPAYSECEO.CREATED_BY RSC_CREATED_BY
,payPAYSECEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM PAY_PAY_SECURITY_PROFILES  payPAYSECEO
