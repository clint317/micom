
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Updates the picklists. Called by home.admin&picklists=edit --->

<!--- CSRF Check --->
<cfset keyname = "picklistEdit">
<cfinclude template="../../includes/act_check_csrf_key.cfm">

<cfquery name="update_picklists" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		UPDATE #Request.DB_Prefix#PickLists
		SET 
		<cfloop index="thisfield" list="#fieldlist#">
			#thisfield# = <cfif len(attributes[thisfield])>
							<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#Trim(attributes[thisfield])#">
						<cfelse>NULL</cfif><cfif listlast(fieldlist) is not "#thisfield#">, </cfif>
		</cfloop>
		WHERE Picklist_ID = 1
</cfquery>
		



