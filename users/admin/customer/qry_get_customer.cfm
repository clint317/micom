
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves a specific Customer record for editing. Called by the fuseaction users.admin&customer=edit --->

<cfquery name="qry_get_Customer" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT * FROM #Request.DB_Prefix#Customers
	WHERE Customer_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Customer_ID#">
</cfquery>
		
		


