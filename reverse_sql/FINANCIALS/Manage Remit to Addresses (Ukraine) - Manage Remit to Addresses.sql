 /* ****************************************************************************
 * $Revision: 79973 $:
 * $Author: tanawat.wongjan $:
 * $Date: 2023-01-16 11:29:30 +0700 (Mon, 16 Jan 2023) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Remit%20to%20Addresses%20(Ukraine)%20-%20Manage%20Remit%20to%20Addresses.sql $:
 * $Id: Manage Remit to Addresses (Ukraine) - Manage Remit to Addresses.sql 79973 2023-01-16 04:29:30Z tanawat.wongjan $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */

 SELECT 'Country' RES_SEARCH
	,(SELECT TERRITORY_SHORT_NAME 
	FROM FND_TERRITORIES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND TERRITORY_CODE =  loc.country
	)                                                                                AS RES_NAME
, remitToLocs.location_id                                                         AS RES_SITE_NUMBER
 ,hz_format_pub.format_address(loc.location_id, NULL, NULL, ',', NULL, NULL, NULL, NULL) AS RES_ADDRESS,
  (SELECT SET_NAME FROM fusion.FND_SETID_SETS_VL WHERE SET_ID = remitToLocs.SET_ID) AS RES_REMIT_TO_ADDRESS_SET ,
 (SELECT TERRITORY_SHORT_NAME 
	FROM FND_TERRITORIES_TL
	WHERE LANGUAGE = USERENV('LANG')
	AND TERRITORY_CODE =  loc.country) AS RES_COUNTRY,
 loc.address1 RES_ADDRESS_LINE_1,
 loc.address2 RES_ADDRESS_LINE_2,
 loc.address3 RES_ADDRESS_LINE_3,
 loc.CITY  RES_CITY,
 loc.postal_code AS RES_POSTAL_CODE
 ,loc.LAST_UPDATED_BY  RSC_LAST_UPDATED_BY
 ,loc.LAST_UPDATE_DATE  RSC_LAST_UPDATE_DATE
 ,loc.CREATED_BY  RSC_CREATED_BY
 ,loc.CREATION_DATE  RSC_CREATION_DATE
 ,null RSC_LEDGER_ID
 ,null RSC_CHART_OF_ACCOUNTS_ID
 ,null RSC_BUSINESS_UNIT_ID
 ,null RSC_LEGAL_ENTITY_ID
 ,null RSC_ORGANIZATION_ID
 ,null RSC_BUSINESS_GROUP_ID
 ,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

FROM fusion.ar_remit_to_locs_all remitToLocs,
  fusion.hz_locations loc
WHERE remitToLocs.location_id = loc.location_id
AND loc.country  = 'UA'
order by 1,2
