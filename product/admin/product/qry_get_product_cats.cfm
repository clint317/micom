
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to retrieve the list of categories the product is assigned to. Called from dsp_product_form.cfm  --->

<cfquery name="qry_get_Product_cats" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT C.Category_ID, Name, ParentNames
	FROM #Request.DB_Prefix#Categories C, #Request.DB_Prefix#Product_Category PC
	WHERE PC.Category_ID = C.Category_ID
	AND PC.Product_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Product_id#">
	ORDER BY ParentNames, Name
</cfquery>
		


