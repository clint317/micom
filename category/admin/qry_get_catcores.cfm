
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the list of category templates, must be set for use with categories. Used on the list pages for filter and for the category form page --->

<cfparam name="attributes.catcore_content" default="">

<!--- remove any non-alphanumeric or non-space characters --->
<cfset attributes.catcore_content = sanitize(attributes.catcore_content)>

<cfquery name="qry_get_catCores"  datasource="#Request.ds#"	 username="#Request.DSuser#"  password="#Request.DSpass#" >
	SELECT CatCore_ID, Catcore_Name
	FROM #Request.DB_Prefix#CatCore
	WHERE Category = 1
	<cfif len(attributes.catcore_content)>
		AND #attributes.catcore_content# = 1
	</cfif>
</cfquery>
		
