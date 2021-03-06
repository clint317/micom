
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the list of permissions for the selected group --->

<cfquery name="qry_get_perm_list" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#" >
	SELECT * FROM #Request.DB_Prefix#Permissions P, #Request.DB_Prefix#Permission_Groups PG
	WHERE PG.Name LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.circuit#">
	AND P.Group_ID = PG.Group_ID
	ORDER BY BitValue
</cfquery>
	

	
