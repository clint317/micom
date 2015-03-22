<cfsilent>
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to make sure that the user goes through the main index.cfm page --->

<!---<cfset request.self="index.cfm">--->
<cfabort />
<cfinclude template="config.cfm">

<cfif Request.DevelopmentMode>
	<cfsetting showdebugoutput="Yes">
<cfelse>
	<cfsetting showdebugoutput="Yes">
</cfif>

<!--- add any files that can be directly accessed to this list --->
<!--- <cfset directAccessFiles="#request.self#,go.cfm,image.cfm,colortool.cfm">
<cfif not listFindNoCase(directaccessfiles,getfilefrompath(cgi.script_name))>
	<cflocation url="#request.self#" addtoken="No">
</cfif>	 --->

<!--- check for invalid fuseaction --->
<cfif StructKeyExists(URL,"fuseaction") AND ListLen(URL.fuseaction, ".") IS NOT 2>
<cfabort>
</cfif>

<cfif "#GetDirectoryFromPath(GetCurrentTemplatePath( ))#index.cfm" NEQ GetBaseTemplatePath()
 AND "#GetDirectoryFromPath(GetCurrentTemplatePath( ))#go.cfm" NEQ GetBaseTemplatePath()
 AND "#GetDirectoryFromPath(GetCurrentTemplatePath( ))#image.cfm" NEQ GetBaseTemplatePath()
 AND "#GetDirectoryFromPath(GetCurrentTemplatePath( ))#colortool.cfm" NEQ GetBaseTemplatePath()
 AND "#GetDirectoryFromPath(GetCurrentTemplatePath( ))#admin\index.cfm" NEQ GetBaseTemplatePath()>
	<cflocation url="#Request.StorePath#index.cfm">
 </cfif>

</cfsilent>