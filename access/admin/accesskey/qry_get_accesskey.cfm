
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the information for a specific access key. Called by access.admin&accessKey=edit/act --->

<cfquery name="qry_get_AccessKey"  datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
	SELECT * FROM #Request.DB_Prefix#AccessKeys
	WHERE AccessKey_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.AccessKey_id#">
</cfquery>
		

