
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the current order information from the temporary table. Called by from do_checkout.cfm --->

<cfquery name="GetTempOrder" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT * FROM #Request.DB_Prefix#TempOrder
	WHERE BasketNum = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Session.BasketNum#">
</cfquery>



