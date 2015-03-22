
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Ths file is used to create URL paths for navigation in the store pages --->

<cfparam name="addedpath" default="">
<cfparam name="fieldlist" default="">
<cfparam name="IDlist" default="">

<!--- If Not SEO, and no addedpath passed in, add the fuseaction --->
<cfif NOT Request.AppSettings.UseSES AND NOT len(addedpath)>
	<cfset addedpath = "&fuseaction=#attributes.fuseaction#">
</cfif>
	
<!--- Add any variables in the list that are found --->
<cfloop list="#fieldlist#" index="counter">
	<cfif StructKeyExists(attributes,counter) AND len(attributes[counter])>
		<!--- Sanitize the parameter --->
		<cfset addedpath = addedpath & "&#counter#=" & sanitize(attributes[counter])>
	</cfif>
</cfloop>

<!--- if not SEO, add any ID fields --->
<cfif NOT Request.AppSettings.UseSES>
	<cfloop list="#IDlist#" index="counter">
		<cfif StructKeyExists(attributes,counter) AND len(attributes[counter])>
			<!--- Sanitize the parameter --->
			<cfset addedpath = addedpath & "&#counter#=" & sanitize(attributes[counter])>
		</cfif>
	</cfloop>
</cfif>

<!--- Set the template path. For non-SEO, just use the request.self. Otherwise, use the SEO path --->
<cfif Request.AppSettings.UseSES>
	<cfset templatepath = self & cgi.path_info>
<cfelse>
	<cfset templatepath = self>
</cfif>

