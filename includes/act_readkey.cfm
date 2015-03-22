
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Read in the encryption key. If none found, create one --->
<cftry>
	<cfinclude template="../key.cfm">
	
<cfcatch type="missingInclude">
	<cfset objGlobal = Request.Loader.getComponent('/','global')>
	<cfset encrypt_key = objGlobal.createKey()>
</cfcatch>

</cftry>

