
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<cfparam name="attributes.permissions" default="">

<!--- This template is used externally for User pick lists --->
<cfquery name="qry_Get_Users" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT * FROM #Request.DB_Prefix#Users
	WHERE 1=1
	<cfif len(attributes.permissions)>
		AND 
		(Permissions LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.permissions#%">
		OR Group_ID IN (SELECT Group_ID FROM #Request.DB_Prefix#Groups 
			WHERE Permissions LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.permissions#%">) )
	</cfif>
	
	ORDER BY Username
</cfquery>



