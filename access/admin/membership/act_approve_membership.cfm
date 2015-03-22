
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to approve a membership. Called by access.admin&membership=approve --->

<cfif isDefined("attributes.membership_id")>
	
	<!--- CSRF Check --->
	<cfset keyname = "approveMember">
	<cfinclude template="../../../includes/act_check_csrf_key.cfm">

	
	<!--- Set a membership to "approved" --->
	<cfquery name="Approve_membership" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE #Request.DB_Prefix#Memberships
	SET Valid = 1
	WHERE Membership_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.membership_ID#">
	</cfquery>
	
</cfif>


