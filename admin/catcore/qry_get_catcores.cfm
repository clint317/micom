
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the list of page templates. Called by home.admin&catcore=list --->

<cfparam name="attributes.name" default="">

<cfquery name="qry_get_catCores"  datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		SELECT * FROM #Request.DB_Prefix#CatCore
		ORDER BY CatCore_ID
</cfquery>
		

