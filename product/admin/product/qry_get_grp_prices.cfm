<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieve the list of group prices for a product. Called by product.admin&do=grp_price --->

<!--- Get list of Group Prices --->
<cfquery name="qry_get_grp_prices" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT P.*, G.Name 
	FROM #Request.DB_Prefix#ProdGrpPrice P, #Request.DB_Prefix#Groups G
	WHERE P.Product_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.product_id#">
	AND P.Group_ID = G.Group_ID
	ORDER BY Name
</cfquery>

<cfset GroupList = ValueList(qry_get_grp_prices.Group_ID)>

