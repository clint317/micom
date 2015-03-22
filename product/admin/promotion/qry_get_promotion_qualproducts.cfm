
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the list of qualifying products the selected promotion is currently assigned to. Called by product.admin&discount=qual_products --->

<cfquery name="qry_get_product_item" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT P.Product_ID, P.Name, P.SKU, P.Short_Desc
	FROM #Request.DB_Prefix#Promotion_Qual_Products PP, #Request.DB_Prefix#Products P 
	WHERE PP.Product_ID = P.Product_ID
	AND PP.Promotion_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Promotion_ID#">
</cfquery>
		


