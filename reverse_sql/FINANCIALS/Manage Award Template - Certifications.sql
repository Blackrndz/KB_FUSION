/* ****************************************************************************
 * $Revision: 74208 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2020-06-03 19:08:12 +0700 (Wed, 03 Jun 2020) $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13.20/branches/core/v2.2.3.0.B/reverse_sql/FINANCIALS/Manage%20AutoPost%20Criteria%20Sets%20-%20AutoPost%20Criteria.sql $:
 * $Id: Manage AutoPost Criteria Sets - AutoPost Criteria.sql 74208 2020-06-03 12:08:12Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT gmsAWARDTEMPE0.TEMPLATE_NAME RES_TEMPLATE_NAME
,gmsAWARDTEMPE0.TEMPLATE_NUMBER RES_TEMPLATE_NUMBER
,(SELECT CERTIFICATION_NAME FROM GMS_CERTIFICATIONS_TL WHERE CERTIFICATION_ID = gmsAWARDCERTE0.CERTIFICATION_ID 
	AND LANGUAGE = USERENV('LANG')) RES_NAME
,TO_CHAR(gmsAWARDCERTE0.CERTIFICATION_DATE,'DD-Mon-YYYY') RES_CERTIFICATION_DATE
,(SELECT DISPLAY_NAME
	FROM PER_PERSON_NAMES_F
	WHERE NAME_TYPE = 'GLOBAL'
	AND PERSON_ID = gmsAWARDCERTE0.CERTIFIED_BY
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE
	) RES_CERTIFICATION_BY
,gmsAWARDCERTE0.INDICATOR RES_STATUS
,TO_CHAR(gmsAWARDCERTE0.APPROVAL_DATE,'DD-Mon-YYYY') RES_APPROVAL_DATE
,TO_CHAR(gmsAWARDCERTE0.EXPIRATION_DATE,'DD-Mon-YYYY') RES_EXPIRATION_DATE
,DECODE(gmsAWARDCERTE0.EXPEDITED_REVIEW,'Y','Yes','No') RES_EXPEDITED_REVIEW
,DECODE(gmsAWARDCERTE0.FULL_REVIEW,'Y','Yes','No') RES_FULL_REVIEW

,gmsAWARDCERTE0.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,gmsAWARDCERTE0.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,gmsAWARDCERTE0.CREATED_BY RSC_CREATED_BY
,gmsAWARDCERTE0.CREATION_DATE RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM GMS_AWARD_TEMPLATES_VL gmsAWARDTEMPE0
,GMS_AWARD_HEADERS_B gmsAWARDHEABE0
,GMS_AWARD_CERTS_VL gmsAWARDCERTE0
WHERE gmsAWARDTEMPE0.AWARD_HEADER_ID = gmsAWARDHEABE0.ID
AND gmsAWARDHEABE0.ID = gmsAWARDCERTE0.AWARD_ID
ORDER BY gmsAWARDTEMPE0.TEMPLATE_NAME