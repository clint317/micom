
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the information for a selected product. Used by numerous product admin pages --->

<cfmodule template="../../../access/secure.cfm"	keyname="product" requiredPermission="1">

<cfquery name="qry_get_product" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
	SELECT * FROM #Request.DB_Prefix#Products
	WHERE Product_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.product_id#">
	<!--- If not full product admin, filter by user to check for access --->
	<cfif not ispermitted>	
		AND User_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Session.User_ID#"> 
	</cfif>
</cfquery>

