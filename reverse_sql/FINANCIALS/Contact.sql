/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah.Dusenmahamad $:
 * $Date: 2017-09-11  $:
 * $HeadURL: $:
 * $Id: Manage Suppliers - Supplier Contact.sql  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
-- RSC_PREREQUISITE_OBJECTS=HZ_PARTIES 
-- STRICTLY_BATCH_SEQ = RES_SUPPLIER_NAME,RES_FIRST_NAME,RES_LAST_NAME
 
SELECT 'CREATE' RES_IMPORT_ACTION
,(SELECT PersonParty.PARTY_NAME 
	FROM HZ_PARTIES PersonParty
	WHERE PersonParty.PARTY_ID = QRSLT.SUPPLIER_PARTY_ID
	) RES_SUPPLIER_NAME
,(SELECT aa.meaning 
	FROM FND_LOOKUP_VALUES_VL aa
	WHERE aa.lookup_type = 'CONTACT_TITLE'
	AND  aa.lookup_code = QRSLT.CONTACT_TITLE 
	) RES_PREFIX
,QRSLT.FIRST_NAME RES_FIRST_NAME
,NULL RES_FIRST_NAME_NEW
,QRSLT.MIDDLE_NAME RES_MIDDLE_NAME
,QRSLT.LAST_NAME RES_LAST_NAME
,NULL RES_LAST_NAME_NEW
,QRSLT.JOB_TITLE RES_JOB_TITLE
,QRSLT.ADMINISTRATIVE_CONTACT RES_ADMINISTRATIVE_CONTACT
,QRSLT.EMAIL_ADDRESS RES_E_MAIL
,NULL RES_E_MAIL_NEW
,QRSLT.PHONE_COUNTRY_CODE RES_PHONE_COUNTRY_CODE
,QRSLT.PHONE_AREA_CODE RES_PHONE_AREA_CODE
,QRSLT.PHONE_NUMBER RES_PHONE
,QRSLT.PHONE_EXTENSION RES_PHONE_EXTENSION
,QRSLT.FAX_COUNTRY_CODE RES_FAX_COUNTRY_CODE
,QRSLT.FAX_AREA_CODE RES_FAX_AREA_CODE
,QRSLT.FAX_NUMBER RES_FAX
,QRSLT.MOBILE_COUNTRY_CODE RES_MOBILE_COUNTRY_CODE
,QRSLT.MOBILE_AREA_CODE RES_MOBILE_AREA_CODE
,QRSLT.MOBILE_NUMBER RES_MOBILE
,TO_CHAR(QRSLT.END_DATE,'YYYY/MM/DD') RES_INACTIVE_DATE
,QRSLT.RES_ATTRIBUTE_CATEGORY
,QRSLT.RES_ATTRIBUTE1
,QRSLT.RES_ATTRIBUTE2
,QRSLT.RES_ATTRIBUTE3
,QRSLT.RES_ATTRIBUTE4
,QRSLT.RES_ATTRIBUTE5
,QRSLT.RES_ATTRIBUTE6
,QRSLT.RES_ATTRIBUTE7
,QRSLT.RES_ATTRIBUTE8
,QRSLT.RES_ATTRIBUTE9
,QRSLT.RES_ATTRIBUTE10
,QRSLT.RES_ATTRIBUTE11
,QRSLT.RES_ATTRIBUTE12
,QRSLT.RES_ATTRIBUTE13
,QRSLT.RES_ATTRIBUTE14
,QRSLT.RES_ATTRIBUTE15
,QRSLT.RES_ATTRIBUTE16
,QRSLT.RES_ATTRIBUTE17
,QRSLT.RES_ATTRIBUTE18
,QRSLT.RES_ATTRIBUTE19
,QRSLT.RES_ATTRIBUTE20
,QRSLT.RES_ATTRIBUTE21
,QRSLT.RES_ATTRIBUTE22
,QRSLT.RES_ATTRIBUTE23
,QRSLT.RES_ATTRIBUTE24
,QRSLT.RES_ATTRIBUTE25
,QRSLT.RES_ATTRIBUTE26
,QRSLT.RES_ATTRIBUTE27
,QRSLT.RES_ATTRIBUTE28
,QRSLT.RES_ATTRIBUTE29
,QRSLT.RES_ATTRIBUTE30
,QRSLT.RES_ATTRIBUTE_NUMBER1
,QRSLT.RES_ATTRIBUTE_NUMBER2
,QRSLT.RES_ATTRIBUTE_NUMBER3
,QRSLT.RES_ATTRIBUTE_NUMBER4
,QRSLT.RES_ATTRIBUTE_NUMBER5
,QRSLT.RES_ATTRIBUTE_NUMBER6
,QRSLT.RES_ATTRIBUTE_NUMBER7
,QRSLT.RES_ATTRIBUTE_NUMBER8
,QRSLT.RES_ATTRIBUTE_NUMBER9
,QRSLT.RES_ATTRIBUTE_NUMBER10
,QRSLT.RES_ATTRIBUTE_NUMBER11
,QRSLT.RES_ATTRIBUTE_NUMBER12
,QRSLT.RES_ATTRIBUTE_DATE1
,QRSLT.RES_ATTRIBUTE_DATE2
,QRSLT.RES_ATTRIBUTE_DATE3
,QRSLT.RES_ATTRIBUTE_DATE4
,QRSLT.RES_ATTRIBUTE_DATE5
,QRSLT.RES_ATTRIBUTE_DATE6
,QRSLT.RES_ATTRIBUTE_DATE7
,QRSLT.RES_ATTRIBUTE_DATE8
,QRSLT.RES_ATTRIBUTE_DATE9
,QRSLT.RES_ATTRIBUTE_DATE10
,QRSLT.RES_ATTRIBUTE_DATE11
,QRSLT.RES_ATTRIBUTE_DATE12
,NULL RES_BATCH_ID
,'END' RES_END
,QRSLT.RSC_LAST_UPDATED_BY
,QRSLT.RSC_LAST_UPDATE_DATE
,QRSLT.RSC_CREATED_BY
,QRSLT.RSC_CREATION_DATE
,null RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,supContactsE0.PRC_BU_ID RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM (SELECT PersonParty.PERSON_PRE_NAME_ADJUNCT CONTACT_TITLE
	,PersonParty.PERSON_FIRST_NAME FIRST_NAME
	,PersonParty.PERSON_MIDDLE_NAME MIDDLE_NAME
	,PersonParty.PERSON_LAST_NAME LAST_NAME
	,Relationship.OBJECT_ID SUPPLIER_PARTY_ID
	,(CASE 
		WHEN trunc(PartyUsageAssignment.EFFECTIVE_END_DATE) = to_date('31-12-4712','DD-MM-YYYY') THEN 
			NULL 
		ELSE 
			PartyUsageAssignment.EFFECTIVE_END_DATE 
		END) END_DATE
	,OrgContact.JOB_TITLE
	,DECODE(OrgContactRole.ROLE_TYPE, NULL, 'N', 'Y') ADMINISTRATIVE_CONTACT
	,Email.EMAIL_ADDRESS
	,Phone.PHONE_COUNTRY_CODE
	,Phone.PHONE_AREA_CODE
	,Phone.PHONE_NUMBER
	,Phone.PHONE_EXTENSION
	,Mobile.PHONE_COUNTRY_CODE MOBILE_COUNTRY_CODE
	,Mobile.PHONE_AREA_CODE MOBILE_AREA_CODE
	,Mobile.PHONE_NUMBER MOBILE_NUMBER
	,Fax.PHONE_COUNTRY_CODE FAX_COUNTRY_CODE
	,Fax.PHONE_AREA_CODE FAX_AREA_CODE
	,Fax.PHONE_NUMBER FAX_NUMBER
	,PersonParty.ATTRIBUTE_CATEGORY RES_ATTRIBUTE_CATEGORY
	,PersonParty.ATTRIBUTE1 RES_ATTRIBUTE1
	,PersonParty.ATTRIBUTE2 RES_ATTRIBUTE2
	,PersonParty.ATTRIBUTE3 RES_ATTRIBUTE3
	,PersonParty.ATTRIBUTE4 RES_ATTRIBUTE4
	,PersonParty.ATTRIBUTE5 RES_ATTRIBUTE5
	,PersonParty.ATTRIBUTE6 RES_ATTRIBUTE6
	,PersonParty.ATTRIBUTE7 RES_ATTRIBUTE7
	,PersonParty.ATTRIBUTE8 RES_ATTRIBUTE8
	,PersonParty.ATTRIBUTE9 RES_ATTRIBUTE9
	,PersonParty.ATTRIBUTE10 RES_ATTRIBUTE10
	,PersonParty.ATTRIBUTE11 RES_ATTRIBUTE11
	,PersonParty.ATTRIBUTE12 RES_ATTRIBUTE12
	,PersonParty.ATTRIBUTE13 RES_ATTRIBUTE13
	,PersonParty.ATTRIBUTE14 RES_ATTRIBUTE14
	,PersonParty.ATTRIBUTE15 RES_ATTRIBUTE15
	,PersonParty.ATTRIBUTE16 RES_ATTRIBUTE16
	,PersonParty.ATTRIBUTE17 RES_ATTRIBUTE17
	,PersonParty.ATTRIBUTE18 RES_ATTRIBUTE18
	,PersonParty.ATTRIBUTE19 RES_ATTRIBUTE19
	,PersonParty.ATTRIBUTE20 RES_ATTRIBUTE20
	,PersonParty.ATTRIBUTE21 RES_ATTRIBUTE21
	,PersonParty.ATTRIBUTE22 RES_ATTRIBUTE22
	,PersonParty.ATTRIBUTE23 RES_ATTRIBUTE23
	,PersonParty.ATTRIBUTE24 RES_ATTRIBUTE24
	,PersonParty.ATTRIBUTE25 RES_ATTRIBUTE25
	,PersonParty.ATTRIBUTE26 RES_ATTRIBUTE26
	,PersonParty.ATTRIBUTE27 RES_ATTRIBUTE27
	,PersonParty.ATTRIBUTE28 RES_ATTRIBUTE28
	,PersonParty.ATTRIBUTE29 RES_ATTRIBUTE29
	,PersonParty.ATTRIBUTE30 RES_ATTRIBUTE30
	,PersonParty.ATTRIBUTE_NUMBER1 RES_ATTRIBUTE_NUMBER1
	,PersonParty.ATTRIBUTE_NUMBER2 RES_ATTRIBUTE_NUMBER2
	,PersonParty.ATTRIBUTE_NUMBER3 RES_ATTRIBUTE_NUMBER3
	,PersonParty.ATTRIBUTE_NUMBER4 RES_ATTRIBUTE_NUMBER4
	,PersonParty.ATTRIBUTE_NUMBER5 RES_ATTRIBUTE_NUMBER5
	,PersonParty.ATTRIBUTE_NUMBER6 RES_ATTRIBUTE_NUMBER6
	,PersonParty.ATTRIBUTE_NUMBER7 RES_ATTRIBUTE_NUMBER7
	,PersonParty.ATTRIBUTE_NUMBER8 RES_ATTRIBUTE_NUMBER8
	,PersonParty.ATTRIBUTE_NUMBER9 RES_ATTRIBUTE_NUMBER9
	,PersonParty.ATTRIBUTE_NUMBER10 RES_ATTRIBUTE_NUMBER10
	,PersonParty.ATTRIBUTE_NUMBER11 RES_ATTRIBUTE_NUMBER11
	,PersonParty.ATTRIBUTE_NUMBER12 RES_ATTRIBUTE_NUMBER12
	,PersonParty.ATTRIBUTE_DATE1 RES_ATTRIBUTE_DATE1
	,PersonParty.ATTRIBUTE_DATE2 RES_ATTRIBUTE_DATE2
	,PersonParty.ATTRIBUTE_DATE3 RES_ATTRIBUTE_DATE3
	,PersonParty.ATTRIBUTE_DATE4 RES_ATTRIBUTE_DATE4
	,PersonParty.ATTRIBUTE_DATE5 RES_ATTRIBUTE_DATE5
	,PersonParty.ATTRIBUTE_DATE6 RES_ATTRIBUTE_DATE6
	,PersonParty.ATTRIBUTE_DATE7 RES_ATTRIBUTE_DATE7
	,PersonParty.ATTRIBUTE_DATE8 RES_ATTRIBUTE_DATE8
	,PersonParty.ATTRIBUTE_DATE9 RES_ATTRIBUTE_DATE9
	,PersonParty.ATTRIBUTE_DATE10 RES_ATTRIBUTE_DATE10
	,PersonParty.ATTRIBUTE_DATE11 RES_ATTRIBUTE_DATE11
	,PersonParty.ATTRIBUTE_DATE12 RES_ATTRIBUTE_DATE12
	,PersonParty.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
	,PersonParty.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
	,PersonParty.CREATED_BY RSC_CREATED_BY
	,PersonParty.CREATION_DATE RSC_CREATION_DATE
	,PersonParty.party_name
	,Relationship.RELATIONSHIP_ID 
	FROM HZ_PARTIES PersonParty
	,HZ_RELATIONSHIPS Relationship
	,HZ_PARTY_USG_ASSIGNMENTS PartyUsageAssignment
	,HZ_ORG_CONTACTS OrgContact
	,HZ_ORG_CONTACT_ROLES OrgContactRole
	,HZ_CONTACT_POINTS Email
	,HZ_CONTACT_POINTS Phone
	,HZ_CONTACT_POINTS Mobile
	,HZ_CONTACT_POINTS Fax
	WHERE PersonParty.STATUS = 'A'
	AND (Relationship.SUBJECT_ID = PersonParty.PARTY_ID 
	and Relationship.RELATIONSHIP_TYPE = 'CONTACT' 
	and Relationship.RELATIONSHIP_CODE = 'CONTACT_OF' 
	and Relationship.SUBJECT_TYPE = 'PERSON' 
	and Relationship.SUBJECT_TABLE_NAME = 'HZ_PARTIES' 
	and Relationship.OBJECT_TYPE = 'ORGANIZATION' 
	and Relationship.OBJECT_TABLE_NAME = 'HZ_PARTIES' 
	and Relationship.STATUS = 'A')
	AND OrgContact.PARTY_RELATIONSHIP_ID(+) = Relationship.RELATIONSHIP_ID 
	AND (OrgContactRole.ORG_CONTACT_ID(+) = OrgContact.ORG_CONTACT_ID
	and OrgContactRole.ROLE_TYPE(+) = 'ADMINISTRATIVE_CONTACT_FOR'
	and OrgContactRole.STATUS(+) = 'A') 
	AND (PersonParty.PARTY_ID = PartyUsageAssignment.PARTY_ID 
	AND PartyUsageAssignment.PARTY_USAGE_CODE = 'SUPPLIER_CONTACT' 
	AND PartyUsageAssignment.STATUS_FLAG = 'A' 
	AND PartyUsageAssignment.OWNER_TABLE_ID = Relationship.RELATIONSHIP_ID 
	AND PartyUsageAssignment.OWNER_TABLE_NAME = 'HZ_RELATIONSHIPS' ) 
	AND (Email.OWNER_TABLE_NAME(+) = 'HZ_PARTIES'  
	and Email.OWNER_TABLE_ID(+) =  Relationship.SUBJECT_ID 
	and Email.RELATIONSHIP_ID(+) = Relationship.RELATIONSHIP_ID 
	and Email.CONTACT_POINT_TYPE(+) = 'EMAIL' 
	and Email.PRIMARY_FLAG(+) = 'Y' 
	and Email.STATUS(+) = 'A')   
	AND (Phone.OWNER_TABLE_NAME(+) = 'HZ_PARTIES'  
	and Phone.OWNER_TABLE_ID(+) =  Relationship.SUBJECT_ID 
	and Phone.RELATIONSHIP_ID(+) = Relationship.RELATIONSHIP_ID 
	and Phone.CONTACT_POINT_TYPE(+) = 'PHONE' 
	and Phone.PHONE_LINE_TYPE(+) = 'GEN'
	and Phone.STATUS(+) = 'A'
	and Phone.PRIMARY_FLAG(+) = 'Y') 
	AND (Mobile.OWNER_TABLE_NAME(+) = 'HZ_PARTIES'  
	and Mobile.OWNER_TABLE_ID(+) =  Relationship.SUBJECT_ID 
	and Mobile.RELATIONSHIP_ID(+) = Relationship.RELATIONSHIP_ID 
	and Mobile.CONTACT_POINT_TYPE(+) = 'PHONE' 
	and Mobile.PHONE_LINE_TYPE(+) = 'MOBILE'
	and Mobile.STATUS(+) = 'A')  
	AND (Fax.OWNER_TABLE_NAME(+) = 'HZ_PARTIES'  
	and Fax.OWNER_TABLE_ID(+) =  Relationship.SUBJECT_ID 
	and Fax.RELATIONSHIP_ID(+) = Relationship.RELATIONSHIP_ID 
	and Fax.CONTACT_POINT_TYPE(+) = 'PHONE' 
	and Fax.PHONE_LINE_TYPE(+) = 'FAX' 
	and Fax.STATUS(+) = 'A')

	UNION

	SELECT ContactRequest.CONTACT_TITLE
	,ContactRequest.FIRST_NAME
	,ContactRequest.MIDDLE_NAME
	,ContactRequest.LAST_NAME
	,RequestMapping.PARTY_ID SUPPLIER_PARTY_ID
	,REQUESTED_END_DATE END_DATE
	,ContactRequest.JOB_TITLE
	,ContactRequest.ADMINISTRATIVE_CONTACT
	,ContactRequest.EMAIL_ADDRESS
	,ContactRequest.PHONE_COUNTRY_CODE
	,ContactRequest.PHONE_AREA_CODE
	,ContactRequest.PHONE_NUMBER
	,ContactRequest.PHONE_EXTENSION
	,ContactRequest.MOBILE_COUNTRY_CODE
	,ContactRequest.MOBILE_AREA_CODE
	,ContactRequest.MOBILE_NUMBER
	,ContactRequest.FAX_COUNTRY_CODE
	,ContactRequest.FAX_AREA_CODE
	,ContactRequest.FAX_NUMBER
	,NULL RES_ATTRIBUTE_CATEGORY
	,NULL RES_ATTRIBUTE1
	,NULL RES_ATTRIBUTE2
	,NULL RES_ATTRIBUTE3
	,NULL RES_ATTRIBUTE4
	,NULL RES_ATTRIBUTE5
	,NULL RES_ATTRIBUTE6
	,NULL RES_ATTRIBUTE7
	,NULL RES_ATTRIBUTE8
	,NULL RES_ATTRIBUTE9
	,NULL RES_ATTRIBUTE10
	,NULL RES_ATTRIBUTE11
	,NULL RES_ATTRIBUTE12
	,NULL RES_ATTRIBUTE13
	,NULL RES_ATTRIBUTE14
	,NULL RES_ATTRIBUTE15
	,NULL RES_ATTRIBUTE16
	,NULL RES_ATTRIBUTE17
	,NULL RES_ATTRIBUTE18
	,NULL RES_ATTRIBUTE19
	,NULL RES_ATTRIBUTE20
	,NULL RES_ATTRIBUTE21
	,NULL RES_ATTRIBUTE22
	,NULL RES_ATTRIBUTE23
	,NULL RES_ATTRIBUTE24
	,NULL RES_ATTRIBUTE25
	,NULL RES_ATTRIBUTE26
	,NULL RES_ATTRIBUTE27
	,NULL RES_ATTRIBUTE28
	,NULL RES_ATTRIBUTE29
	,NULL RES_ATTRIBUTE30
	,NULL RES_ATTRIBUTE_NUMBER1
	,NULL RES_ATTRIBUTE_NUMBER2
	,NULL RES_ATTRIBUTE_NUMBER3
	,NULL RES_ATTRIBUTE_NUMBER4
	,NULL RES_ATTRIBUTE_NUMBER5
	,NULL RES_ATTRIBUTE_NUMBER6
	,NULL RES_ATTRIBUTE_NUMBER7
	,NULL RES_ATTRIBUTE_NUMBER8
	,NULL RES_ATTRIBUTE_NUMBER9
	,NULL RES_ATTRIBUTE_NUMBER10
	,NULL RES_ATTRIBUTE_NUMBER11
	,NULL RES_ATTRIBUTE_NUMBER12
	,NULL RES_ATTRIBUTE_DATE1
	,NULL RES_ATTRIBUTE_DATE2
	,NULL RES_ATTRIBUTE_DATE3
	,NULL RES_ATTRIBUTE_DATE4
	,NULL RES_ATTRIBUTE_DATE5
	,NULL RES_ATTRIBUTE_DATE6
	,NULL RES_ATTRIBUTE_DATE7
	,NULL RES_ATTRIBUTE_DATE8
	,NULL RES_ATTRIBUTE_DATE9
	,NULL RES_ATTRIBUTE_DATE10
	,NULL RES_ATTRIBUTE_DATE11
	,NULL RES_ATTRIBUTE_DATE12
	,ContactRequest.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
	,ContactRequest.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
	,ContactRequest.CREATED_BY RSC_CREATED_BY
	,ContactRequest.CREATION_DATE RSC_CREATION_DATE
	,Null party_name
	,CAST(NULL AS NUMBER) RELATIONSHIP_ID
	FROM POZ_CONTACT_REQUESTS ContactRequest
	,POZ_SUPPLIER_MAPPINGS RequestMapping
	,POZ_UP_REQUESTS UserRequests
	WHERE ContactRequest.REQUEST_STATUS = 'PENDING'
	and ContactRequest.REQUEST_TYPE = 'ADD'
	and ContactRequest.contact_party_id is null
	and ContactRequest.MAPPING_ID = RequestMapping.MAPPING_ID 
	and ContactRequest.contact_request_id = UserRequests.contact_request_id (+)
) QRSLT  
,(SELECT CONTACT.RELATIONSHIP_ID
	,CONTACT.PARTY_SITE_ID
	,SUPSITE.PRC_BU_ID
	FROM POZ_SUPPLIER_CONTACTS CONTACT
	,POZ_SUPPLIER_SITES_ALL_M SUPSITE
	WHERE SUPSITE.PARTY_SITE_ID = CONTACT.PARTY_SITE_ID
	AND NVL(SUPSITE.INACTIVE_DATE,TO_DATE('4712/12/31','YYYY/MM/DD')) > SYSDATE
	) supContactsE0
WHERE QRSLT.RELATIONSHIP_ID = supContactsE0.RELATIONSHIP_ID(+)