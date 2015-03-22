
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is used to process the complete list of shipping methods, to set which ones are being used by the store. Called by shopping.admin&shipping=method --->

<!--- CSRF Check --->
<cfset keyname = "upsMethodList">
<cfinclude template="../../../../includes/act_check_csrf_key.cfm">

<cfloop index="ID" list="#attributes.ID_List#">

	<cfset Priority = attributes['Priority' & ID]>
		
	<cfif NOT isNumeric(Priority) OR Priority IS 0>
		<cfset Priority = 99>
	</cfif>	

	<cfif StructKeyExists(attributes,'Used' & ID)>

		<cfquery name="UpdateMethod" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
			UPDATE #Request.DB_Prefix#UPSMethods
			SET Used = 1,
			Priority = <cfqueryparam cfsqltype="cf_sql_integer" value="#Priority#">
			WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#ID#">
		</cfquery>

	<cfelse>
		<cfquery name="UpdateMethod2" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
			UPDATE #Request.DB_Prefix#UPSMethods
			SET Used = 0,
			Priority = <cfqueryparam cfsqltype="cf_sql_integer" value="#Priority#">
			WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#ID#">
		</cfquery>
	</cfif>

</cfloop>

<!--- Refresh cached Query for UPS shipping methods --->
<cfinclude template="act_refresh_queries.cfm">

<cfset message = "Changes Saved">
<cfset attributes.XFA_success = "fuseaction=shopping.admin&shipping=settings">
<cfinclude template="../../../../includes/admin_confirmation.cfm">


