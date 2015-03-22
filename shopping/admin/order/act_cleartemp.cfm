<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page clears old data from the temporary tables. Called by shopping.admin&order=cleartemp --->

<!--- Change the variable below to adjust the number of days to leave in the tables. --->

<cfset Daysago = DateAdd("d", -30, Now())>

<cfquery name="ClearBasket" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	DELETE FROM #Request.DB_Prefix#TempBasket 
	WHERE DateAdded < <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Daysago#">
</cfquery>

<cfquery name="ClearOrder" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	DELETE FROM #Request.DB_Prefix#TempOrder 
	WHERE DateAdded < <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Daysago#">
</cfquery>

<cfquery name="ClearCustomer" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	DELETE FROM #Request.DB_Prefix#TempCustomer
	WHERE DateAdded < <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Daysago#">
</cfquery>

<cfquery name="ClearShip" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	DELETE FROM #Request.DB_Prefix#TempShipTo 
	WHERE DateAdded < <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Daysago#">
</cfquery>

<cfoutput>
<cfprocessingdirective suppresswhitespace="no">
<script type="text/javascript">
alert('Temporary Tables Cleared!')
location.href = '#self#?fuseaction=home.admin&inframes=yes&redirect=1#request.token2#'
</script>
</cfprocessingdirective>
</cfoutput>

