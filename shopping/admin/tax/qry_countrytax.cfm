<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieve selected country tax rate(s). Called by shopping.admin&taxes=country --->

<cfquery name="GetTaxes" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT T.*, C.Name 
	FROM #Request.DB_Prefix#CountryTax T
	INNER JOIN Countries C ON T.Country_ID = C.ID
	WHERE Code_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.code_ID#">
	ORDER BY Name
</cfquery>
