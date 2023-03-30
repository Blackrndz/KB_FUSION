/* ****************************************************************************
 * $Revision:  $:
 * $Author: Nasrullah.Dusenmahamad $:
 * $Date: 2017-09-06 $:
 * $HeadURL:  $:
 * $Id: Create Implementation Users - User Information.sql  $:
 * ****************************************************************************
 * Description:
 * ************************************************************************** */


SELECT aseUserEO.USER_LOGIN RES_USER_NAME
,NULL RES_PASSWORD
,NULL RES_CONFIRM_PASSWORD
,HeadEO.FIRST_NAME RES_FIRST_NAME
,HeadEO.LAST_NAME RES_LAST_NAME
,HeadEO.EMAIL RES_E_MAIL
,NULL RES_EXTERNAL_IDENTIFIER
,DECODE(HeadEO.PERSON_ID,'','None','Worker') RES_ASSOCIATED_PERSON_TYPE
,HeadEO.DISPLAY_NAME RES_WORKER_NAME
,NULL RES_PASSWORD_EXPIRATION_DATE
,DECODE(HeadEO.ACTIVE,'1','Yes','No') RES_ACTIVE
,DECODE(HeadEO.LOCKED,'1','Yes','No') RES_LOCKED
,aseUserEO.LAST_UPDATED_BY RSC_LAST_UPDATED_BY
,aseUserEO.LAST_UPDATE_DATE RSC_LAST_UPDATE_DATE
,aseUserEO.CREATED_BY RSC_CREATED_BY
,aseUserEO.CREATION_DATE RSC_CREATION_DATE
,NULL RSC_LEDGER_ID
,NULL RSC_CHART_OF_ACCOUNTS_ID
,NULL RSC_BUSINESS_UNIT_ID
,NULL RSC_LEGAL_ENTITY_ID
,NULL RSC_ORGANIZATION_ID
,NULL RSC_BUSINESS_GROUP_ID
,NULL RSC_ENTERPRISE_ID
,NULL RSC_COUNTRY_ID
FROM ASE_USER_B aseUserEO,
(SELECT A.GUID
	,A.ACTION_ID
	,LOCKED.ATTRIBUTE_VALUE_NUMBER LOCKED
	,ACTIVE.ATTRIBUTE_VALUE_NUMBER ACTIVE
	,DISPLAY_NAME.ATTRIBUTE_VALUE_TEXT DISPLAY_NAME
	,PERSON_ID.ATTRIBUTE_VALUE_NUMBER PERSON_ID
	,EMAIL.ATTRIBUTE_VALUE_TEXT EMAIL
	,LAST_NAME.ATTRIBUTE_VALUE_TEXT LAST_NAME
	,FIRST_NAME.ATTRIBUTE_VALUE_TEXT FIRST_NAME
	FROM /*(SELECT ACTION_ID 
		, GUID  
		FROM */(SELECT ACTION_ID 
			, ATTRIBUTE_VALUE_TEXT AS GUID 
			FROM  (SELECT A.*
				,ROW_NUMBER() OVER(PARTITION BY A.ATTRIBUTE_VALUE_TEXT ORDER BY A.ACTION_ID DESC) R1 
				FROM ASE_STAGED_ACTION_VALUE A
				,ASE_STAGED_ACTION X
				WHERE A.ACTION_ID = X.ACTION_ID
				AND X.ACTION_TYPE = 'USER' 
				AND A.ATTRIBUTE_NAME = 'USER_LOGIN' 
				AND A.ACTION_ID NOT IN (SELECT ACTION_ID 
					FROM ASE_STAGED_ACTION 
					WHERE ACTION_TYPE = 'USER' 
					AND ACTION_NAME LIKE 'D%')) 
			WHERE R1 = 1 /*) 
		WHERE ACTION_ID IN (SELECT ACTION_ID 
			FROM ASE_STAGED_ACTION_VALUE 
			WHERE ATTRIBUTE_NAME = 'USER_LOGIN')*/
		) A 
	,(SELECT ACTION_ID
		,ATTRIBUTE_VALUE_NUMBER 
		FROM ASE_STAGED_ACTION_VALUE 
		WHERE ATTRIBUTE_NAME = 'LOCKED'
		AND ATTRIBUTE_TYPE = 'java.lang.Long'
		) LOCKED
	,(SELECT ACTION_ID
		,ATTRIBUTE_VALUE_NUMBER 
		FROM ASE_STAGED_ACTION_VALUE 
		WHERE ATTRIBUTE_NAME = 'ACTIVE'
		AND ATTRIBUTE_TYPE = 'java.lang.Long'
		) ACTIVE
	,(SELECT A.ACTION_ID
		,ATTRIBUTE_VALUE_TEXT 
		FROM ASE_STAGED_ACTION_VALUE A
		,ASE_STAGED_ACTION X
		WHERE A.ACTION_ID = X.ACTION_ID
		AND X.ACTION_TYPE = 'USER' 
		AND ATTRIBUTE_NAME = 'DISPLAY_NAME'
		AND ATTRIBUTE_TYPE = 'java.lang.String'
		) DISPLAY_NAME 
	,(SELECT ACTION_ID
		,ATTRIBUTE_VALUE_NUMBER 
		FROM ASE_STAGED_ACTION_VALUE 
		WHERE ATTRIBUTE_NAME = 'PERSON_ID'
		AND ATTRIBUTE_TYPE = 'java.lang.Long'
		) PERSON_ID
	,(SELECT ACTION_ID
		,ATTRIBUTE_VALUE_TEXT 
		FROM ASE_STAGED_ACTION_VALUE 
		WHERE ATTRIBUTE_NAME = 'EMAIL'
		AND ATTRIBUTE_TYPE = 'java.lang.String'
		) EMAIL
	,(SELECT ACTION_ID
		,ATTRIBUTE_VALUE_TEXT 
		FROM ASE_STAGED_ACTION_VALUE 
		WHERE ATTRIBUTE_NAME = 'LAST_NAME'
		AND ATTRIBUTE_TYPE = 'java.lang.String'
		) LAST_NAME
	,(SELECT ACTION_ID
		,ATTRIBUTE_VALUE_TEXT 
		FROM ASE_STAGED_ACTION_VALUE 
		WHERE ATTRIBUTE_NAME = 'FIRST_NAME'
		AND ATTRIBUTE_TYPE = 'java.lang.String'
		) FIRST_NAME
	WHERE A.ACTION_ID = LOCKED.ACTION_ID(+)
	AND A.ACTION_ID = EMAIL.ACTION_ID(+)
	AND A.ACTION_ID = ACTIVE.ACTION_ID(+)
	AND A.ACTION_ID = DISPLAY_NAME.ACTION_ID(+)
	AND A.ACTION_ID = PERSON_ID.ACTION_ID(+)
	AND A.ACTION_ID = LAST_NAME.ACTION_ID(+)
	AND A.ACTION_ID = FIRST_NAME.ACTION_ID(+)
	) HeadEO 
WHERE  aseUserEO.USER_LOGIN = HeadEO.GUID 
AND SYSDATE BETWEEN aseUserEO.EFFECTIVE_START_DATE AND NVL(aseUserEO.EFFECTIVE_END_DATE,TO_DATE('31-12-4712','DD-MM-YYYY'))
ORDER BY aseUserEO.USER_LOGIN, 2