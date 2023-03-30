/* ****************************************************************************
 * $Revision: 79346 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-09-15 11:40:19 +0700 (Thu, 15 Sep 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Absence%20Certifications%20-%20Void%20Reasons.sql $:
 * $Id: Manage Absence Certifications - Void Reasons.sql 79346 2022-09-15 04:40:19Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=ANC_ABS_CERTIFICATIONS_F

SELECT 
(SELECT NAME FROM ANC_ABS_CERTIFICATIONS_F_TL WHERE ABSENCE_CERTIFICATION_ID = ancABSENCECEREO.ABSENCE_CERTIFICATION_ID
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_NAME
,TO_CHAR(ancABSENCECEREO.EFFECTIVE_START_DATE,'DD-Mon-YYYY')  RES_EFFECTIVE_START_DATE
,(SELECT TERRITORY_SHORT_NAME FROM FND_TERRITORIES_VL WHERE TERRITORY_CODE = ancABSENCECEREO.LEGISLATION_CODE) RES_LEGISLATION
,LookUPEO.MEANING RES_REASON
,(CASE WHEN ', '||ancABSENCECEREO.VOID_RSN_VALUES||', ' LIKE '%, '||LookUPEO.LOOKUP_CODE||',%'
	THEN 'Yes'
	ELSE 'No' END)RES_ENABLE
	
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
,(SELECT MEANING,LOOKUP_CODE FROM FND_LOOKUP_VALUES WHERE LOOKUP_TYPE = 'ORA_ANC_CERT_VOID_RSN' AND LANGUAGE = USERENV('LANG')) LookUPEO
ORDER BY RES_NAME,ancABSENCECEREO.EFFECTIVE_START_DATE
