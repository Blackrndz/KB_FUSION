/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah.Dusenmahamad $:
 * $Date: 2017-09-08  $:
 * $HeadURL: $:
 * $Id: Manage Suppliers - Supplier Addresses.sql  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

-- STRICTLY_BATCH_SEQ = RES_SUPPLIER_NAME,RES_ADDRESS_NAME

SELECT 'CREATE' RES_IMPORT_ACTION
,(SELECT PersonParty.PARTY_NAME 
	FROM HZ_PARTIES PersonParty
	WHERE PersonParty.PARTY_ID = PartySitePEO.PARTY_ID 
	) RES_SUPPLIER_NAME
,PartySitePEO.PARTY_SITE_NAME RES_ADDRESS_NAME
,NULL RES_ADDRESS_NAME_NEW
,LocationPEO.COUNTRY RES_COUNTRY
,LocationPEO.ADDRESS1 RES_ADDRESS_LINE_1
,LocationPEO.ADDRESS2 RES_ADDRESS_LINE_2
,LocationPEO.ADDRESS3 RES_ADDRESS_LINE_3
,LocationPEO.ADDRESS4 RES_ADDRESS_LINE_4
,LocationPEO.ADDRESS_LINES_PHONETIC RES_PHONETIC_ADDRESS_LINE
,LocationPEO.ADDR_ELEMENT_ATTRIBUTE1 RES_ADDRESS_ELEMENT_ATTRIBUTE_
,LocationPEO.ADDR_ELEMENT_ATTRIBUTE2 RES_ADDRESS_ELEMENT_ATTRIBUT_0
,LocationPEO.ADDR_ELEMENT_ATTRIBUTE3 RES_ADDRESS_ELEMENT_ATTRIBUT_1
,LocationPEO.ADDR_ELEMENT_ATTRIBUTE4 RES_ADDRESS_ELEMENT_ATTRIBUT_2
,LocationPEO.ADDR_ELEMENT_ATTRIBUTE5 RES_ADDRESS_ELEMENT_ATTRIBUT_3
,LocationPEO.BUILDING RES_BUILDING
,LocationPEO.FLOOR_NUMBER RES_FLOOR_NUMBER
,LocationPEO.CITY RES_CITY
,LocationPEO.STATE RES_STATE
,LocationPEO.PROVINCE RES_PROVINCE
,LocationPEO.COUNTY RES_COUNTY
,LocationPEO.POSTAL_CODE RES_POSTAL_CODE
,LocationPEO.POSTAL_PLUS4_CODE RES_POSTAL_PLUS_4_CODE
,PartySitePEO.ADDRESSEE RES_ADDRESSEE
,PartySitePEO.GLOBAL_LOCATION_NUMBER RES_GLOBAL_LOCATION_NUMBER
,PartySitePEO.PARTY_SITE_LANGUAGE RES_LANGUAGE
,(CASE
    WHEN TRUNC(PartySitePEO.end_date_active)=to_date('31-12-4712','DD-MM-YYYY')
    THEN NULL
    ELSE TO_CHAR(PartySitePEO.END_DATE_ACTIVE,'YYYY/MM/DD')
  END) RES_INACTIVE_DATE
,PhonePEO.PHONE_COUNTRY_CODE RES_PHONE_COUNTRY_CODE
,PhonePEO.PHONE_AREA_CODE RES_PHONE_AREA_CODE
,PhonePEO.PHONE_NUMBER RES_PHONE
,PhonePEO.PHONE_EXTENSION RES_PHONE_EXTENSION
,FaxPEO.PHONE_COUNTRY_CODE RES_FAX_COUNTRY_CODE
,FaxPEO.PHONE_AREA_CODE RES_FAX_AREA_CODE
,FaxPEO.PHONE_NUMBER RES_FAX
,DECODE(RfqUsePEO.STATUS,'A','Y','I','N') RES_RFQ_OR_BIDDING
,DECODE(PurUsePEO.STATUS,'A','Y','I','N') RES_ORDERING
,DECODE(PayUsePEO.STATUS,'A','Y','I','N') RES_PAY
,LocationPEO.ATTRIBUTE_CATEGORY RES_ATTRIBUTE_CATEGORY
,LocationPEO.ATTRIBUTE1 RES_ATTRIBUTE1
,LocationPEO.ATTRIBUTE2 RES_ATTRIBUTE2
,LocationPEO.ATTRIBUTE3 RES_ATTRIBUTE3
,LocationPEO.ATTRIBUTE4 RES_ATTRIBUTE4
,LocationPEO.ATTRIBUTE5 RES_ATTRIBUTE5
,LocationPEO.ATTRIBUTE6 RES_ATTRIBUTE6
,LocationPEO.ATTRIBUTE7 RES_ATTRIBUTE7
,LocationPEO.ATTRIBUTE8 RES_ATTRIBUTE8
,LocationPEO.ATTRIBUTE9 RES_ATTRIBUTE9
,LocationPEO.ATTRIBUTE10 RES_ATTRIBUTE10
,LocationPEO.ATTRIBUTE11 RES_ATTRIBUTE11
,LocationPEO.ATTRIBUTE12 RES_ATTRIBUTE12
,LocationPEO.ATTRIBUTE13 RES_ATTRIBUTE13
,LocationPEO.ATTRIBUTE14 RES_ATTRIBUTE14
,LocationPEO.ATTRIBUTE15 RES_ATTRIBUTE15
,LocationPEO.ATTRIBUTE16 RES_ATTRIBUTE16
,LocationPEO.ATTRIBUTE17 RES_ATTRIBUTE17
,LocationPEO.ATTRIBUTE18 RES_ATTRIBUTE18
,LocationPEO.ATTRIBUTE19 RES_ATTRIBUTE19
,LocationPEO.ATTRIBUTE20 RES_ATTRIBUTE20
,LocationPEO.ATTRIBUTE21 RES_ATTRIBUTE21
,LocationPEO.ATTRIBUTE22 RES_ATTRIBUTE22
,LocationPEO.ATTRIBUTE23 RES_ATTRIBUTE23
,LocationPEO.ATTRIBUTE24 RES_ATTRIBUTE24
,LocationPEO.ATTRIBUTE25 RES_ATTRIBUTE25
,LocationPEO.ATTRIBUTE26 RES_ATTRIBUTE26
,LocationPEO.ATTRIBUTE27 RES_ATTRIBUTE27
,LocationPEO.ATTRIBUTE28 RES_ATTRIBUTE28
,LocationPEO.ATTRIBUTE29 RES_ATTRIBUTE29
,LocationPEO.ATTRIBUTE30 RES_ATTRIBUTE30
,LocationPEO.ATTRIBUTE_NUMBER1 RES_ATTRIBUTE_NUMBER1
,LocationPEO.ATTRIBUTE_NUMBER2 RES_ATTRIBUTE_NUMBER2
,LocationPEO.ATTRIBUTE_NUMBER3 RES_ATTRIBUTE_NUMBER3
,LocationPEO.ATTRIBUTE_NUMBER4 RES_ATTRIBUTE_NUMBER4
,LocationPEO.ATTRIBUTE_NUMBER5 RES_ATTRIBUTE_NUMBER5
,LocationPEO.ATTRIBUTE_NUMBER6 RES_ATTRIBUTE_NUMBER6
,LocationPEO.ATTRIBUTE_NUMBER7 RES_ATTRIBUTE_NUMBER7
,LocationPEO.ATTRIBUTE_NUMBER8 RES_ATTRIBUTE_NUMBER8
,LocationPEO.ATTRIBUTE_NUMBER9 RES_ATTRIBUTE_NUMBER9
,LocationPEO.ATTRIBUTE_NUMBER10 RES_ATTRIBUTE_NUMBER10
,LocationPEO.ATTRIBUTE_NUMBER11 RES_ATTRIBUTE_NUMBER11
,LocationPEO.ATTRIBUTE_NUMBER12 RES_ATTRIBUTE_NUMBER12
,LocationPEO.ATTRIBUTE_DATE1 RES_ATTRIBUTE_DATE1
,LocationPEO.ATTRIBUTE_DATE2 RES_ATTRIBUTE_DATE2
,LocationPEO.ATTRIBUTE_DATE3 RES_ATTRIBUTE_DATE3
,LocationPEO.ATTRIBUTE_DATE4 RES_ATTRIBUTE_DATE4
,LocationPEO.ATTRIBUTE_DATE5 RES_ATTRIBUTE_DATE5
,LocationPEO.ATTRIBUTE_DATE6 RES_ATTRIBUTE_DATE6
,LocationPEO.ATTRIBUTE_DATE7 RES_ATTRIBUTE_DATE7
,LocationPEO.ATTRIBUTE_DATE8 RES_ATTRIBUTE_DATE8
,LocationPEO.ATTRIBUTE_DATE9 RES_ATTRIBUTE_DATE9
,LocationPEO.ATTRIBUTE_DATE10 RES_ATTRIBUTE_DATE10
,LocationPEO.ATTRIBUTE_DATE11 RES_ATTRIBUTE_DATE11
,LocationPEO.ATTRIBUTE_DATE12 RES_ATTRIBUTE_DATE12
,EmailPEO.EMAIL_ADDRESS RES_E_MAIL
,NULL RES_BATCH_ID
,'END' RES_END
,LocationPEO.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
,LocationPEO.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
,LocationPEO.CREATED_BY  RSC_CREATED_BY
,LocationPEO.CREATION_DATE  RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM HZ_PARTY_SITES PartySitePEO
,HZ_LOCATIONS LocationPEO
,POZ_SUPPLIERS SupplierPEO
,HZ_PARTY_SITE_USES PayUsePEO
,HZ_PARTY_SITE_USES PurUsePEO
,HZ_PARTY_SITE_USES RfqUsePEO
,HZ_CONTACT_POINTS PhonePEO
,HZ_CONTACT_POINTS FaxPEO
,HZ_CONTACT_POINTS EmailPEO
WHERE (PartySitePEO.LOCATION_ID    = LocationPEO.LOCATION_ID
AND PartySitePEO.STATUS            = 'A')
AND (PayUsePEO.PARTY_SITE_ID(+)    = PartySitePEO.PARTY_SITE_ID
AND PayUsePEO.STATUS(+)            = 'A'
AND PayUsePEO.SITE_USE_TYPE(+)     = 'PAY' )
AND (PurUsePEO.PARTY_SITE_ID(+)    = PartySitePEO.PARTY_SITE_ID
AND PurUsePEO.STATUS(+)            = 'A'
AND PurUsePEO.SITE_USE_TYPE(+)     = 'PURCHASING' )
AND (RfqUsePEO.PARTY_SITE_ID(+)    = PartySitePEO.PARTY_SITE_ID
AND RfqUsePEO.STATUS(+)            = 'A'
AND RfqUsePEO.SITE_USE_TYPE(+)     = 'RFQ' )
AND (PhonePEO.OWNER_TABLE_ID(+)    = PartySitePEO.PARTY_SITE_ID
AND PhonePEO.OWNER_TABLE_NAME(+)   = 'HZ_PARTY_SITES'
AND PhonePEO.STATUS(+)             = 'A'
AND PhonePEO.CONTACT_POINT_TYPE(+) = 'PHONE'
AND PhonePEO.PHONE_LINE_TYPE (+)   = 'GEN'
AND PhonePEO.PRIMARY_FLAG(+)       = 'Y')
AND (FaxPEO.OWNER_TABLE_ID(+)      = PartySitePEO.PARTY_SITE_ID
AND FaxPEO.OWNER_TABLE_NAME(+)     = 'HZ_PARTY_SITES'
AND FaxPEO.STATUS(+)               = 'A'
AND FaxPEO.CONTACT_POINT_TYPE(+)   = 'PHONE'
AND FaxPEO.PHONE_LINE_TYPE (+)     = 'FAX')
AND (EmailPEO.OWNER_TABLE_ID(+)    = PartySitePEO.PARTY_SITE_ID
AND EmailPEO.OWNER_TABLE_NAME(+)   = 'HZ_PARTY_SITES'
AND EmailPEO.STATUS(+)             = 'A'
AND EmailPEO.CONTACT_POINT_TYPE(+) = 'EMAIL'
AND EmailPEO.PRIMARY_FLAG(+)       = 'Y' )
AND PartySitePEO.PARTY_ID          = SupplierPEO.PARTY_ID
ORDER BY PartySitePEO.PARTY_SITE_NAME ASC