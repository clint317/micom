
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to update the discounted product for a promotion. Called by product.admin&promotion=disc_product --->

<cfparam name="attributes.parent" default="0">

<cfif isdefined("attributes.Action") AND attributes.Action IS "select_product" AND IsDefined("attributes.Product_ID")>
	
	<!--- Add the selected product --->
	<cfquery name="Add_Related" datasource="#Request.ds#" username="#Request.DSuser#"  password="#Request.DSpass#">
		UPDATE #Request.DB_Prefix#Promotions
		SET Disc_Product = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Product_ID#">
		WHERE Promotion_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Promotion_ID#">
	</cfquery>
	
<!--- change category selector --->
<cfelseif isdefined("attributes.Action") AND attributes.Action IS "view_subcats">
	
	<cfset attributes.parent = attributes.pid>
	
	<!--- make sure a category was selected in the list --->
	<cfif StructKeyExists(attributes, 'cid' )>
		<cfset attributes.pid = attributes.cid>
	<cfelse>
		<cfset attributes.pid = 0>
	</cfif>
	
<!--- parent category selector --->
<cfelseif isdefined("attributes.Action") AND attributes.Action IS "view_parent">

	<cfset attributes.pid = attributes.cid>

</cfif>

<!----- RESET Promotion Application query ---->
<cfset Application.objPromotions.getallPromotions('yes')>	

	

