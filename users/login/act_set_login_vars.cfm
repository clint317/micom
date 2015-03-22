<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!---  This page is used with the various login form pages to set the error messages that can be applied. --->

<cfparam name="Message" default="">
<cfparam name="attributes.Username" default="">
<cfparam name="attributes.password" default="">
<cfparam name="attributes.rememberme" default="1">
<cfparam name="attributes.errormess" default="0">

<cfif attributes.errormess IS 1>
	<cfset Message = "Password was incorrect!">
<cfelseif attributes.errormess IS 2>
	<cfset Message = "Username was not found!">
<cfelseif attributes.errormess IS 3>
	<cfset Message = "Too many failed login attempts!">
<cfelseif attributes.errormess IS 4>
	<cfset Message = "Max logins for today exceeded!">
</cfif>

<!--- a parameter passed to turn off the 'register now' link --->
<cfparam name="attributes.use_register" default="1">

<!--- which user circuit is used to 'register now'. --->
<cfparam name="request.reg_form" default="member"> 

