<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to save the USPS Settings for the store. Called by shopping.admin&shipping=usps --->

<!--- CSRF Check --->
<cfset keyname = "uspsSettings">
<cfinclude template="../../../../includes/act_check_csrf_key.cfm">

<cfquery name="UpdUSPS" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
UPDATE #Request.DB_Prefix#USPS_Settings
SET UserID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(attributes.Userid)#">,
<!--- Server = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(attributes.Server)#">, --->
MerchantZip = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(attributes.MerchantZip)#">,
MaxWeight = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.MaxWeight#">,
UseAV = <cfqueryparam cfsqltype="#Request.SQL_Bit#" value="#attributes.UseAV#">,
Logging = <cfqueryparam cfsqltype="#Request.SQL_Bit#" value="#attributes.Logging#">,
Debug = <cfqueryparam cfsqltype="#Request.SQL_Bit#" value="#attributes.Debug#">
</cfquery>

<!--- Update Cached Settings --->
<cfset Request.Cache = CreateTimeSpan(0, 0, 0, 0)>
<cfset Application.objShipping.getUSPSSettings()>

