
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This query gets the default shipping information for a user --->
<cfquery name="qry_get_shipto" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT * FROM #Request.DB_Prefix#Customers
	WHERE Customer_ID = <cfqueryparam value="#qry_get_user.shipto#" cfsqltype="CF_SQL_INTEGER">
</cfquery>



