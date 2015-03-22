
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This query gets all user information for a user_ID --->
<cfquery name="qry_Get_User" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
	SELECT U.*, C.FirstName, C.LastName, A.Account_ID AS AccountID
	FROM ((#Request.DB_Prefix#Users U 
		LEFT JOIN #Request.DB_Prefix#Account A on A.User_ID = U.User_ID)
		LEFT JOIN #Request.DB_Prefix#Customers C On C.Customer_ID = U.Customer_ID)
	WHERE U.User_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Session.User_ID#">
</cfquery>



