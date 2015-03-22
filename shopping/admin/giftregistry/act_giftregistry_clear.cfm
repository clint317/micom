
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Clears Expired Gift Registries ---->

<!--- Get all Gift Registries with Event Date older than attributes.Days --->
<cfquery name="GetRegistries"  datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT GiftRegistry_ID FROM #Request.DB_Prefix#GiftRegistry
	WHERE Expire <= <cfqueryparam cfsqltype="cf_sql_timestamp" value="#DateAdd("m", "-1", Now())#">
</cfquery>

<cfloop query="GetRegistries">

	<cfquery name="delete_GiftItems"  datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
		DELETE FROM #Request.DB_Prefix#GiftItems 
		WHERE GiftRegistry_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#GiftRegistry_ID#">
	</cfquery>
	
	<cfquery name="delete_GiftRegistry"  datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
		DELETE FROM #Request.DB_Prefix#GiftRegistry 
		WHERE GiftRegistry_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#GiftRegistry_ID#">
	</cfquery>

</cfloop>

