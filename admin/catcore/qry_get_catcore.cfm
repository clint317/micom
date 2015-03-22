
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the information on a selected page template. Called by home.admin&catcore=edit --->

<cfquery name="qry_get_catCore"  datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
	SELECT * FROM #Request.DB_Prefix#CatCore
	WHERE CatCore_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CatCore_ID#">
</cfquery>
		
	

	
