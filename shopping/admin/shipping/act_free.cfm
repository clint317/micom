<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Updates the information for the free shipping promotion. Called by shopping.admin&shipping=free --->

<cfparam name="attributes.freeship_shipids" default="">
<cfparam name="session.ship_id" default="1">

<!--- CSRF Check --->
<cfset keyname = "shipFreeMethods">
<cfinclude template="../../../includes/act_check_csrf_key.cfm">

<cfquery name="UpdShipsettings" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE #Request.DB_Prefix#ShipSettings
	SET Freeship_Min = <cfqueryparam cfsqltype="cf_sql_integer" value="#iif(isNumeric(attributes.freeship_min),attributes.freeship_min,0)#">,
	Freeship_ShipIDs = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.freeship_shipids#">
	WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.ship_ID#">
</cfquery>


<!--- Get New Settings --->
<cfset Request.Cache = CreateTimeSpan(0, 0, 0, 0)>
<cfinclude template="../../qry_ship_settings.cfm">


