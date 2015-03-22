<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Runs the CSRF checks for the product image upload forms --->

<cfif isdefined("Form.TheTableName")>
	
	<!--- CSRF Check --->
	<cfset keyname = "uploadImage">
	<cfinclude template="../../../includes/act_check_csrf_key.cfm">
	
</cfif>

<cfset formkey = CreateUUID()>
<cfset session.formKeys.uploadImage = formkey>
