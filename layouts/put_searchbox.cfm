<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This template is a quick search box that can be included on a layout page. It is self-submitting. --->

<cfparam name="attributes.startText" default="enter your search term...">

<cfoutput>
	<!-- start layouts/put_searchbox.cfm -->
	<div id="putsearchbox" class="layouts">
<form id="searchbox" name="searchbox" action="#XHTMLFormat('#self#?fuseaction=page.searchResults#request.token2#')#" method="post" class="nomargins">
	<input name="string" value="#HTMLEditFormat(attributes.startText)#" size="24" maxlength="30" class="formfield" onfocus="this.value= '';" onchange="form.submit();" />
</form><br/>
	</div>
	<!-- end layouts/put_searchbox.cfm -->
</cfoutput>