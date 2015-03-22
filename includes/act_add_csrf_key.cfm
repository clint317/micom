
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to create the form key and add the hidden field, used to check for cross-site request forgeries --->

<cfparam name="keyname" default="csrfkey">

<cfset formkey = CreateUUID()>
<cfset session.formKeys[keyname] = formkey>
<cfoutput>
	<input type="hidden" name="formkey" value="#Hash(formkey,"SHA-256")#"/>
</cfoutput>
