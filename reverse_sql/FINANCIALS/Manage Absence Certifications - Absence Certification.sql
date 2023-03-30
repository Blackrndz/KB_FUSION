/* ****************************************************************************
 * $Revision: 78239 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 22:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Absence%20Certifications%20-%20Absence%20Certification.sql $:
 * $Id: Manage Absence Certifications - Absence Certification.sql 78239 2022-04-07 15:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=ANC_ABS_CERTIFICATIONS_F

SELECT (SELECT NAME 
	FROM ANC_ABS_CERTIFICATIONS_F_TL 
	WHERE ABSENCE_CERTIFICATION_ID = ancABSENCECEREO.ABSENCE_CERTIFICATION_ID
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
	) RES_NAME
,ancABSENCECEREO.LAST_UPDATED_BY 			RSC_LAST_UPDATED_BY
,ancABSENCECEREO.LAST_UPDATE_DATE 			RSC_LAST_UPDATE_DATE
,ancABSENCECEREO.CREATED_BY 				RSC_CREATED_BY
,ancABSENCECEREO.CREATION_DATE 			RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,ancABSENCECEREO.LEGISLATION_CODE RSC_COUNTRY_ID
FROM ANC_ABS_CERTIFICATIONS_F ancABSENCECEREO
WHERE SYSDATE BETWEEN ancABSENCECEREO.EFFECTIVE_START_DATE AND NVL(ancABSENCECEREO.EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))
ORDER BY RES_NAME