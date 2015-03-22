<cfsilent>
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to create the persistent login box. Call from your layout pages --->

<cfsavecontent variable="loginbox">	
	<cfset attributes.format = "_box">
	<cfset fusebox.nextaction="users.loginbox">
	<cfinclude template="../lbb_runaction.cfm">

	<br/>		
</cfsavecontent>			

</cfsilent>

<cfoutput>
	<!-- start layouts/put_loginbox.cfm -->
	<div id="putloginbox" class="layouts">
	#HTMLCompressFormat(variables.loginbox)#
	</div>
	<!-- end layouts/put_loginbox.cfm -->
</cfoutput>	
				