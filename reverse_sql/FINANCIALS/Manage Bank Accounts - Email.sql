/* ****************************************************************************
 * $Revision: 53609 $:
 * $Author: Nasrullah Dusenmahamad $:
 * $Date: 2016-07-13 10:53:25 +0700  $:
 * $HeadURL: http://svn01.rapidesuite.com:999/svn/a/dev/rapidesuite/controldata/FUSION_11.1.9/trunk/core/reverse_sql/FINANCIALS/Manage%20Accounting%20Calendars%20-%20Additional%20Year.sql $:
 * $Id: Manage Bank Accounts - Email.sql 53609 2016-07-13 03:53:25Z  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
SELECT Head.BANK_NAME RES_BANK
,Head.COUNTRY_NAME RES_COUNTRY
,Head.BANK_BRANCH_NAME RES_BANK_BRANCH
,Head.BANK_ACCOUNT_NAME RES_ACCOUNT_NAME
,Head.BANK_ACCOUNT_NUM RES_ACCOUNT_NUMBER
,Detail.PARTY_NAME RES_CONTACT_NAME
,DECODE(Detail.PRIMARY_FLAG,'Y','Yes','No') RES_PRIMARY
,Detail.RES_PURPOSE RES_PURPOSE
,Detail.EMAIL_ADDRESS RES_E_MAIL
,Detail.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,Detail.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,Detail.CREATED_BY RSC_CREATED_BY
,Detail.CREATION_DATE  							RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,Head.ACCOUNT_OWNER_ORG_ID RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM (Select CeBankAccounts.BANK_ACCOUNT_ID
	,BankBranchSimplePEO.BANK_NAME
	,BankBranchSimplePEO.COUNTRY_NAME
	,BankBranchSimplePEO.BANK_BRANCH_NAME
	,CeBankAccounts.BANK_ACCOUNT_NAME
	,CeBankAccounts.BANK_ACCOUNT_NUM
	,CeBankAccounts.ACCOUNT_OWNER_ORG_ID
	FROM CE_BANK_ACCOUNTS CeBankAccounts
	,XLE_ENTITY_PROFILES XleEntityProfiles
	,CE_BANK_BRANCHES_SIMPLE_V BankBranchSimplePEO
	,CE_RECON_RULESETS BankStatementReconRuleSetPEO
	WHERE ((CeBankAccounts.ACCOUNT_OWNER_ORG_ID = XleEntityProfiles.LEGAL_ENTITY_ID)
	AND (CeBankAccounts.BANK_BRANCH_ID          = BankBranchSimplePEO.BRANCH_PARTY_ID)
	AND (CeBankAccounts.RECON_RULESET_ID        = BankStatementReconRuleSetPEO.RECON_RULESET_ID (+))
	AND NOT EXISTS
		(SELECT xtr.bank_account_id
		FROM ce_bank_accounts xtr
		WHERE NVL(AP_USE_ALLOWED_FLAG, 'N') = 'N'
		AND NVL(AR_USE_ALLOWED_FLAG, 'N')   = 'N'
		AND NVL(PAY_USE_ALLOWED_FLAG, 'N')  = 'N'
		AND NVL(XTR_USE_ALLOWED_FLAG, 'N')  = 'Y'
		AND xtr.bank_account_id             = CeBankAccounts.bank_account_id))
	) Head
,(SELECT CeContactAssignments.BANK_ACCOUNT_ID
	,SubjectPartyEO.PARTY_NAME
    ,(SELECT MEANING
		FROM FND_LOOKUP_VALUES
		WHERE LANGUAGE = USERENV('LANG')
		AND LOOKUP_TYPE = 'CONTACT_POINT_PURPOSE'
		AND LOOKUP_CODE = EmailEO.CONTACT_POINT_PURPOSE
		) AS RES_PURPOSE
    ,EmailEO.PRIMARY_FLAG
    ,EmailEO.EMAIL_ADDRESS
    ,EmailEO.CONTACT_POINT_ID    
    ,EmailEO.CONTACT_POINT_TYPE
    ,EmailEO.LAST_UPDATED_BY
    ,EmailEO.LAST_UPDATE_DATE
    ,EmailEO.CREATED_BY
    ,EmailEO.CREATION_DATE 
	FROM CE_CONTACT_ASSIGNMENTS CeContactAssignments
	,HZ_RELATIONSHIPS RelationshipEO
	,HZ_ORG_CONTACTS OrganizationContactEO
	,HZ_PARTY_SITES ContactPartySiteEO
	,HZ_PARTIES SubjectPartyEO
	,HZ_CONTACT_POINTS EmailEO
	WHERE CeContactAssignments.RELATIONSHIP_ID = RelationshipEO.RELATIONSHIP_ID
	AND RelationshipEO.RELATIONSHIP_ID = OrganizationContactEO.PARTY_RELATIONSHIP_ID(+)
	AND RelationshipEO.RELATIONSHIP_ID = ContactPartySiteEO.RELATIONSHIP_ID(+)
	AND RelationshipEO.SUBJECT_ID = ContactPartySiteEO.PARTY_ID(+)
	AND CeContactAssignments.ASSIGNMENT_TYPE = 'ACCOUNT' 
	AND RelationshipEO.RELATIONSHIP_ID = EmailEO.RELATIONSHIP_ID(+)
	AND RelationshipEO.SUBJECT_ID = EmailEO.OWNER_TABLE_ID(+)
	AND EmailEO.OWNER_TABLE_NAME(+) = 'HZ_PARTIES'
	AND EmailEO.CONTACT_POINT_TYPE = 'EMAIL'
	AND RelationshipEO.SUBJECT_ID = SubjectPartyEO.PARTY_ID
	) Detail
WHERE Head.BANK_ACCOUNT_ID = Detail.BANK_ACCOUNT_ID
ORDER BY RES_BANK
,RES_COUNTRY
,RES_ACCOUNT_NAME
,RES_CONTACT_NAME