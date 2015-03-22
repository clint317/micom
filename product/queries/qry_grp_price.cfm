<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the group price for a product. Called by dsp_quickorder.cfm and qry_get_products.cfm--->

<cfparam name="ProdList" default="">

<!--- Get Group Prices for these products --->
<cfquery name="qry_grp_prices" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT Price FROM #Request.DB_Prefix#ProdGrpPrice
	WHERE 
	<cfif len(ProdList)> Product_ID IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#ProdList#" list="Yes">)
		<cfelse>0 = 1 </cfif>
	AND Group_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Session.Group_ID#">
</cfquery>


