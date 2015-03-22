
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the selected category. Called by category.admin&category=edit --->

<cfquery name="qry_get_category" datasource="#Request.ds#"	 username="#Request.DSuser#"  password="#Request.DSpass#" >
	SELECT C.*, CC.PassParams
	FROM #Request.DB_Prefix#Categories C 
	LEFT JOIN #Request.DB_Prefix#CatCore CC ON C.CatCore_ID = CC.CatCore_ID
	WHERE C.Category_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#">
</cfquery>
		


