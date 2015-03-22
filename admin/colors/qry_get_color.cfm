
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the information on a selected color palette. Called by home.admin&colors=edit --->

<cfquery name="qry_get_Color" datasource="#Request.ds#" username="#Request.DSuser#"  password="#Request.DSpass#" maxrows="1">
	SELECT * FROM #Request.DB_Prefix#Colors
	WHERE Color_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.color_ID#">
</cfquery>

