
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Ths file is used to create URL paths for searches --->

<cfparam name="addedpath" default="&fuseaction=#attributes.fuseaction#">
<cfparam name="fieldlist" default="">

<cfloop list="#fieldlist#" index="counter">
	<cfif StructKeyExists(attributes,counter) AND len(attributes[counter])>
		<!--- Sanitize the parameter --->
		<cfset addedpath = addedpath & "&#counter#=" & sanitize(attributes[counter])>
	</cfif>
</cfloop>

