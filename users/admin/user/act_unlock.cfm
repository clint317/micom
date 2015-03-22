
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Marks the email for a user record as "Verified". Called by fuseaction users.admin&user=unlock. --->

<!--- CSRF Check --->
<cfset keyname = "userEdit">
<cfinclude template="../../../includes/act_check_csrf_key.cfm">

<cfquery name="UpdateUser" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE #Request.DB_Prefix#Users
	SET EmailIsBad = 0, 
	EmailLock = 'verified'
	WHERE User_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.uid#">
</cfquery>

<cfinclude template="../../act_set_registration_permissions.cfm">
	

