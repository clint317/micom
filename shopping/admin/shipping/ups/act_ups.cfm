<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to save the UPS Settings for the store. Called by shopping.admin&shipping=ups --->

<!--- CSRF Check --->
<cfset keyname = "upsSettings">
<cfinclude template="../../../../includes/act_check_csrf_key.cfm">

<!--- Determine Customer Class --->
<cfswitch expression="#attributes.Pickup#">
	<cfcase value="01">
		<!--- Wholesale --->
		<cfset CustomerClass = '01'>
	</cfcase>
	<cfcase value="03">
		<!--- Occasional --->
		<cfset CustomerClass = '03'>
	</cfcase>
	<cfdefaultcase>
		<!--- Retail --->
		<cfset CustomerClass = '04'>
	</cfdefaultcase>
</cfswitch>

<cfquery name="UpdUPS" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE #Request.DB_Prefix#UPS_Settings
	SET MaxWeight = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.MaxWeight#">,
	UnitsofMeasure = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.UnitsofMeasure#">,
	Pickup = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.Pickup#">,
	CustomerClass = <cfqueryparam cfsqltype="cf_sql_varchar" value="#CustomerClass#">,
	Packaging = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.Packaging#">,
	OrigZip = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.OrigZip#">,
	OrigCity = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.OrigCity#">,
	OrigCountry = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.OrigCountry#">,
	Origin = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.Origin#">,
	UseAV = <cfqueryparam cfsqltype="#Request.SQL_Bit#" value="#attributes.UseAV#">,
	Logging = <cfqueryparam cfsqltype="#Request.SQL_Bit#" value="#attributes.Logging#">,
	Debug = <cfqueryparam cfsqltype="#Request.SQL_Bit#" value="#attributes.Debug#">
</cfquery>

<!--- Update Cached Settings --->
<cfset Request.Cache = CreateTimeSpan(0, 0, 0, 0)>
<cfset Application.objShipping.getUPSSettings()>

<!--- Refresh cached Query for UPS shipping methods, using new origin --->
<cfinclude template="act_refresh_queries.cfm">

