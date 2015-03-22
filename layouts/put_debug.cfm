
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->


<!--- Allow debug variables list to display only for Administrators when &debug=1 is included in URL. 
USERS Permission 1 = Site Admin --->
<cfif isdefined("URL.debug")>
	<!-- start layouts/put_debug.cfm -->
	<cfmodule template="../access/secure.cfm" keyname="users" requiredPermission="1">
		<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
		<cfmodule template="../customtags/avartree.cfm" />
	</cfmodule>	
	<!-- end layouts/put_debug.cfm -->
</cfif>

		