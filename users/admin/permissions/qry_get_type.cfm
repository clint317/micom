
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the name of the user or group being edited. Called from act_set_permissions.cfm --->

<!--- attributes.type: user | group , attributes.ID: user_id | group_id --->
<cfset attributes.type = Trim(sanitize(attributes.type))>

<cfquery name="qry_get_type" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT <cfif attributes.type is "user">Username<cfelse>Name</cfif> AS TypeName
	FROM #Request.DB_Prefix##attributes.type#s
	WHERE #attributes.type#_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.ID#">
</cfquery>
	

	
