<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Recent Logins --->
<cfquery name="Login_Report" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT User_ID, Username, Email, Created, LastLogin, LoginsTotal, LoginsDay, Disable, EmailLock, EmailIsBad
	FROM #Request.DB_Prefix#Users
	WHERE LastLogin > <cfqueryparam cfsqltype="cf_sql_timestamp" value="#DateAdd('d',-30,now())#">
	ORDER BY LastLogin DESC, LoginsDay DESC
</cfquery>

