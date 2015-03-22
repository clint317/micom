<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Saves the paypal express processing settings for the store. Called by shopping.admin&payment=paypal --->

<!--- CSRF Check --->
<cfset keyname = "paypalSettings">
<cfinclude template="../../../../includes/act_check_csrf_key.cfm">

<cfquery name="EditExpressSettings" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE #Request.DB_Prefix#CCProcess
	SET Password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.Password#" null="#CheckNull(attributes.Password)#">,
	Username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.Username#" null="#CheckNull(attributes.Username)#">,
	Transtype = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(attributes.Transtype)#" null="#CheckNull(attributes.Transtype)#">,
	Setting1 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(attributes.Setting1)#" null="#CheckNull(attributes.Setting1)#">
	WHERE Setting3 = <cfqueryparam cfsqltype="cf_sql_varchar" value="PayPalExpress">
</cfquery>

