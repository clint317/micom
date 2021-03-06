
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the information on a specific promotion. Called by product.admin&promotion=edit --->

<cfquery name="qry_get_promotion" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
	SELECT P.*, Pt.Name AS ProdName 
	FROM #Request.DB_Prefix#Promotions P
	LEFT OUTER JOIN #Request.DB_Prefix#Products Pt ON P.Disc_Product = Pt.Product_ID
	WHERE Promotion_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Promotion_ID#">
</cfquery>
		
	

	