
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the information for the product custom fields. Called by product.admin&fields=edit --->

<cfquery name="qry_Get_Customfields" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
SELECT * FROM #Request.DB_Prefix#Prod_CustomFields
ORDER BY Custom_ID
</cfquery>


