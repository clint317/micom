
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the list of categories that the feature is currently assigned to. Called by feature.admin&feature=edit|copy --->

<cfquery name="qry_get_Feature_cats" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#" >
	SELECT C.Category_ID, C.Name, C.ParentNames
	FROM #Request.DB_Prefix#Categories C, #Request.DB_Prefix#Feature_Category FC
	WHERE FC.Category_ID = C.Category_ID
	AND FC.Feature_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Feature_id#">
</cfquery>
		


