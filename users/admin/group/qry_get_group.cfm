
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves a specific Group record for editing. Called by the fuseaction users.admin&group=edit --->

<cfquery name="qry_get_group" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT * FROM #Request.DB_Prefix#Groups
	WHERE Group_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.gid#">
</cfquery>
		
		

