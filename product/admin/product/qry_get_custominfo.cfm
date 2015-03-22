
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the custom information entered for a product. Called by product.admin&do=info --->

<cfquery name="qry_Get_Custominfo" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
SELECT * FROM #Request.DB_Prefix#Prod_CustInfo
WHERE Product_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.product_id#">
</cfquery>


