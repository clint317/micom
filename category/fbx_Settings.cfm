
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!---
<fusedoc fuse="FBX_Settings.cfm">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can use CFSET to override a value set in a parent circuit or CFPARAM to accept a value set by a parent circuit
	</responsibilities>	
</fusedoc>
--->


<!--- Used for Keep Shopping --->
<cfset thispage = getfilefrompath(gettemplatepath())>

<cfif fusebox.IsHomeCircuit>
<!--- put settings here that you want to execute only when this is the application's home circuit (for example "<cfapplication>" )--->
	
<cfelse>
<!--- put settings here that you want to execute only when this is not an application's home circuit ------------------------------------------------------------------------->

	<cfif not isdefined("attributes.category_id") AND attributes.fuseaction IS NOT "category.admin">
		<cfset attributes.fuseaction ="category.topcatmenu">
	</cfif>

	
	
</cfif>

<cfif IsDefined("ThisTag.ExecutionMode")>
	<cfparam name="self" default="#caller.self#">
</cfif>




