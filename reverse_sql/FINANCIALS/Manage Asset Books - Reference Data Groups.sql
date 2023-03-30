/* ****************************************************************************
 * $Revision: 78229 $:
 * $Author: pisan.jariyasettachok $:
 * $Date: 2022-04-07 14:37:05 +0700 (Thu, 07 Apr 2022) $:
 * $HeadURL: https://svn03.rapid4cloud.com/svn/a/dev/rapidesuite/controldata/FUSION_11.1.13/trunk/core/reverse_sql/FINANCIALS/Manage%20Asset%20Books%20-%20Reference%20Data%20Groups.sql $:
 * $Id: Manage Asset Books - Reference Data Groups.sql 78229 2022-04-07 07:37:05Z pisan.jariyasettachok $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */
 
 
SELECT QRSLT.BOOK_TYPE_CODE RES_NAME
,QRSLT.VISIBLE_GROUP_NAME RES_REFERENCE_DATA_OBJECT
,QRSLT.SET_CODE RES_REFERENCE_DATA_SET_CODE
,QRSLT.SET_NAME RES_REFERENCE_DATA_SET_NAME
,QRSLT.LAST_UPDATED_BY  AS RSC_LAST_UPDATED_BY
,QRSLT.LAST_UPDATE_DATE AS RSC_LAST_UPDATE_DATE
,QRSLT.CREATED_BY  AS RSC_CREATED_BY
,QRSLT.CREATION_DATE AS RSC_CREATION_DATE
,PGL.PRIMARY_LEDGER_ID AS RSC_LEDGER_ID
,null RSC_CHART_OF_ACCOUNTS_ID
,null RSC_BUSINESS_UNIT_ID
,null RSC_LEGAL_ENTITY_ID
,null RSC_ORGANIZATION_ID
,null RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID

from (SELECT BookControlEO.BOOK_TYPE_CODE
	,BookControlEO.BOOK_CLASS
,SetIdReferenceGroupPEO.VISIBLE_GROUP_NAME
,SetIdSetsEO.SET_CODE
,SetIdSetsEO.SET_NAME
,SetIdAssignmentsEO.REFERENCE_GROUP_NAME AS REFERENCE_GROUP_NAME1
,SetIdAssignmentsEO.DETERMINANT_TYPE
,SetIdAssignmentsEO.DETERMINANT_VALUE
,SetIdAssignmentsEO.SET_ID
,SetIdAssignmentsEO.LAST_UPDATED_BY
,SetIdAssignmentsEO.LAST_UPDATE_DATE
,SetIdAssignmentsEO.CREATED_BY
,SetIdAssignmentsEO.CREATION_DATE
,SetIdAssignmentsEO.LAST_UPDATE_LOGIN
,SetIdReferenceGroupPEO.REFERENCE_GROUP_NAME
,SetIdSetsEO.SET_ID AS SET_ID1
,BookControlEO.SET_OF_BOOKS_ID
FROM FND_SETID_ASSIGNMENTS SetIdAssignmentsEO
,FND_SETID_REFERENCE_GROUPS_VL SetIdReferenceGroupPEO
,FND_SETID_SETS_VL SETIDSETSEO
,FA_BOOK_CONTROLS BookControlEO
WHERE(SetIdAssignmentsEO.REFERENCE_GROUP_NAME(+) = SetIdReferenceGroupPEO.REFERENCE_GROUP_NAME)
AND(SETIDASSIGNMENTSEO.SET_ID                    = SETIDSETSEO.SET_ID(+))
AND SetIdReferenceGroupPEO.DETERMINANT_TYPE      = 'AB'
AND SETIDASSIGNMENTSEO.DETERMINANT_TYPE(+)       = 'AB'
AND SETIDASSIGNMENTSEO.DETERMINANT_VALUE      = BOOKCONTROLEO.BOOK_CONTROL_ID
) QRSLT
,(select RSHIP.TARGET_LEDGER_ID
	, RSHIP.PRIMARY_LEDGER_ID 
	from GL_LEDGER_RELATIONSHIPS RSHIP
	WHERE (RSHIP.RELATIONSHIP_TYPE_CODE <> 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'SECONDARY')
	OR (RSHIP.RELATIONSHIP_TYPE_CODE = 'NONE'
	AND RSHIP.TARGET_LEDGER_CATEGORY_CODE = 'PRIMARY')) PGL
WHERE QRSLT.SET_OF_BOOKS_ID = PGL.TARGET_LEDGER_ID
ORDER BY (CASE
	WHEN QRSLT.BOOK_CLASS = 'CORPORATE' THEN
		1
	ELSE
		2
	END)
,QRSLT.BOOK_TYPE_CODE
,QRSLT.VISIBLE_GROUP_NAME 