
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->


<!--- Outputs a div holder for form submission results --->
<cfparam name="session.result_message" default="">

<cfoutput>
<cfif len(session.result_message)>
	<div id="messages" class="messages">
		#session.result_message#
	</div>
	
	<cfset Session.result_message = "">
</cfif>

#HTMLCompressFormat(fusebox.layout)#
</cfoutput>


