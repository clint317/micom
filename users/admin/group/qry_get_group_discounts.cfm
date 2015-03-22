
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Get the list of discounts for the selected group, called from dsp_group_form.cfm --->

<cfparam name="attributes.GID" default="0">

<cfquery name="qry_Get_Group_Discounts" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT Discount_ID FROM #Request.DB_Prefix#Discount_Groups
	WHERE Group_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.GID#">
	ORDER BY Discount_ID
</cfquery>

<cfset DiscountList = ValueList(qry_Get_Group_Discounts.Discount_ID)>

