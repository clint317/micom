
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to check that a form submission has been done properly, to check for cross-site request forgeries --->

<cfparam name="keyname" default="csrfkey">

<cfif NOT StructKeyExists(session, "formkeys")>
	<cflocation url="#self#?fuseaction=home.csrferror&missingkey=#keyname#">
<cfelseif StructKeyExists(attributes, "formkey") AND StructKeyExists(session.formKeys, keyname) AND attributes.formkey IS Hash(session.formKeys[keyname],"SHA-256")>
	<cfset structDelete(session.formKeys, keyname)>
<!--- If key exists and we aren't going to be running the check, delete the key --->
<cfelseif StructKeyExists(session.formKeys, keyname) AND Request.DevelopmentMode>
	<cfset structDelete(session.formKeys, keyname)>	
<cfelseif FindNoCase(".admin",attributes.fuseaction) AND NOT Request.DevelopmentMode>
	<cfprocessingdirective suppresswhitespace="no">
	<script type="text/javascript">
  	<cfoutput>location.href = '#self#?fuseaction=home.admin&csrferror=yes&inframes=yes';</cfoutput>
    </script>
	</cfprocessingdirective>
	<!--- <CFOUTPUT>#keyname#</CFOUTPUT>
	<cfdump var="#Session#">
	<cfdump var="#attributes#">
	<cfabort> --->
	
<!--- 	<cflocation url="#self#?fuseaction=home.admin&csrferror=yes&inframes=yes"> --->
<cfelseif NOT Request.DevelopmentMode>
	<cflocation url="#self#?fuseaction=home.csrferror&missingkey=#keyname#">
</cfif>
