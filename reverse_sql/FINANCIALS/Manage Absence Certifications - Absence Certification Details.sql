/* ****************************************************************************
 * $Revision: 79346 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2022-09-15 11:40:19 +0700 (Thu, 15 Sep 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Absence%20Certifications%20-%20Absence%20Certification%20Details.sql $:
 * $Id: Manage Absence Certifications - Absence Certification Details.sql 79346 2022-09-15 04:40:19Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=ANC_ABS_CERTIFICATIONS_F

SELECT 
(SELECT NAME FROM ANC_ABS_CERTIFICATIONS_F_TL WHERE ABSENCE_CERTIFICATION_ID = ancABSENCECEREO.ABSENCE_CERTIFICATION_ID
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_NAME
,TO_CHAR(ancABSENCECEREO.EFFECTIVE_START_DATE,'DD-Mon-YYYY')  RES_EFFECTIVE_START_DATE
,TO_CHAR(ancABSENCECEREO.EFFECTIVE_END_DATE,'DD-Mon-YYYY')  RES_EFFECTIVE_END_DATE
,(SELECT TERRITORY_SHORT_NAME FROM FND_TERRITORIES_VL WHERE TERRITORY_CODE = ancABSENCECEREO.LEGISLATION_CODE) RES_LEGISLATION
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CLASS_CD
	AND LOOKUP_TYPE = 'ORA_ANC_CERT_CLASS' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD')))  RES_CLASSIFICATION
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.MANAGEMENT_TYPE_CD
	AND LOOKUP_TYPE = 'ANC_SETUP_OBJ_MGMT' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_MANAGEMENT 

,(SELECT ABSENCE_CERTIFICATION_DESC FROM ANC_ABS_CERTIFICATIONS_F_TL WHERE ABSENCE_CERTIFICATION_ID = ancABSENCECEREO.ABSENCE_CERTIFICATION_ID
	AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_DESCRIPTION
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_STATUS_CD
	AND LOOKUP_TYPE = 'ANC_ABSENCE_CERT_STATUS' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_STATUS
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_USE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_USE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_ABSENCE_RECORD_UPDATE_RULE
	
--Creation	
,(CASE WHEN CLASS_CD = 'ORA_ANC_DOCUMENTATION' THEN
	(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_TRIGGER_CD
		AND LOOKUP_TYPE = 'ANC_ABS_CERT_TRIGGER' AND LANGUAGE = USERENV('LANG')
		AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD')))
	WHEN CLASS_CD = 'ORA_ANC_PAYMENT_PERCENT' THEN
	(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_TRIGGER_CD
		AND LOOKUP_TYPE = 'ORA_ANC_CERT_TRIGGER' AND LANGUAGE = USERENV('LANG')
		AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD')))
	ELSE NULL
	END) RES_CREATION_TRIGGER
,DECODE(ancABSENCECEREO.AUTO_COMPLETE_FLAG,'Y','Yes','No') RES_CREATION_MARK_AS_CONFIRMED
,(SELECT NAME
	FROM BEN_ELIGY_PRFL
	WHERE ELIGY_PRFL_ID = ancABSENCECEREO.ELIG_PROFILE_ID 
	AND SYSDATE BETWEEN START_DATE AND NVL(END_DATE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CREATION_ELIGIBILITY_PROFI
,DECODE(ancABSENCECEREO.ALLOW_ON_DEMAND,'Y','Yes','No') RES_CREATION_ALLOW_CREATION_ON
,DECODE(ancABSENCECEREO.CONFIRM_ON_DEMAND,'Y','Yes','No') RES_CREATION_MARK_AS_CONFIRM_0
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_CREATE_UPDATE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_UPDATE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CREATION_ABSENCE_RECORD_UP

--Creation Entitlement
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_CREATE_CALC_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CREATION_ENTITLEMENT_REEVA
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_CREATE_CALC_MODE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC_MODE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CREATION_ENTITLEMENT_UPDAT
,TO_CHAR(ancABSENCECEREO.CERT_CREATE_CALC_OVERRIDE,'999') RES_CREATION_REVISED_PAYMENT_P

--Passage of Due Date
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.DUE_DATE_TYPE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_DUE_DATE_TYPE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_PASSAGE_OF_DUE_DATE_DUE_DA
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.DUE_DATE_REFERENCE_DATE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_DUE_DATE_REF_DATE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_PASSAGE_OF_DUE_DATE_REFERE 
,TO_CHAR(ancABSENCECEREO.DUE_DATE_UNITS,'9999') RES_PASSAGE_OF_DUE_DATE_DURATI
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.DUE_DATE_UOM_CD 
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_DUE_DATE_UOM' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD')))RES_PASSAGE_OF_DUE_DATE_UOM
	
--Passage Entitlement
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_DUE_DATE_UPDATE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_UPDATE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_PASSAGE_OF_DUE_DATE_ABSENC
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_DUE_DATE_CALC_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_PASSAGE_OF_DUE_DATE_ENTITL
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_DUE_DATE_CALC_MODE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC_MODE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_PASSAGE_OF_DUE_DATE_ENTI_1
,TO_CHAR(ancABSENCECEREO.CERT_DUE_DATE_CALC_OVERRIDE,'999') RES_PASSAGE_OF_DUE_DATE_REVISE
	
--Confirm
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CNFM_RSN_RULE
	AND LOOKUP_TYPE = 'ORA_ANC_CERT_REASON_RULE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CONFIRMATION_REASON_RULE

,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_COMPLETE_UPDATE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_UPDATE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CONFIRMATION_ABSENCE_RECOR
	
--Confirm Entitlement
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_COMPLETE_CALC_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CONFIRMATION_ENTITLEMENT_R
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_COMPLETE_CALC_MODE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC_MODE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_CONFIRMATION_ENTITLEMENT_U
,TO_CHAR(ancABSENCECEREO.CERT_COMPLETE_CALC_OVERRIDE,'999') RES_CONFIRMATION_REVISED_PAYME

--Expiration
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.EXPIRY_RULE
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_DUE_DATE_TYPE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_EXPIRATION_EXPIRATION_RULE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.EXPIRY_REF_DATE
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_DUE_DATE_REF_DATE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_EXPIRATION_REFERENCE_DATE
,ancABSENCECEREO.EXPIRY_DURATION RES_EXPIRATION_DURATION
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.EXPIRY_UOM
	AND LOOKUP_TYPE = 'ANC_DURATION_UOM' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_EXPIRATION_UOM
	
--Expiration Entitlement
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_EXPIRE_UPDATE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_UPDATE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_EXPIRATION_ABSENCE_RECORD_
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_EXPIRE_CALC_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_EXPIRATION_ENTITLEMENT_REE
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.CERT_EXPIRE_CALC_MODE_CD
	AND LOOKUP_TYPE = 'ANC_ABS_CERT_CALC_MODE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_EXPIRATION_ENTITLEMENT_UPD
,TO_CHAR(ancABSENCECEREO.CERT_EXPIRE_CALC_OVERRIDE,'999') RES_EXPIRATION_REVISED_PAYMENT

--Void
,(SELECT MEANING FROM FND_LOOKUP_VALUES WHERE LOOKUP_CODE = ancABSENCECEREO.VOID_RSN_RULE
	AND LOOKUP_TYPE = 'ORA_ANC_CERT_REASON_RULE' AND LANGUAGE = USERENV('LANG')
	AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,TO_DATE('4712-12-31','YYYY-MM-DD'))) RES_VOID_REASON_RULE
	
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
ORDER BY RES_NAME,ancABSENCECEREO.EFFECTIVE_START_DATE