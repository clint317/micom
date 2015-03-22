
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This is used to unblock an account that has been locked due to maximum failed logins or too many logins for the day. Called by fuseaction users.admin&user=unblock. --->

<!--- CSRF Check --->
<cfset keyname = "userEdit">
<cfinclude template="../../../includes/act_check_csrf_key.cfm">

<cfquery name="UpdateUser" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE Users
	SET FailedLogins = 0,
	LastAttempt = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#">,
	LoginsDay = 1
	WHERE User_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.uid#">
</cfquery>

