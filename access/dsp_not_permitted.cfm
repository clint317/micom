<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Default page to use when the customer tries to access a page requiring an access key. Will display a list of memberhip products they can purchase. Called from secure.cfm --->

<!-- start access/dsp_not_permitted.cfm -->
<div id="dspnotpermitted" class="access">

<cfmodule template="../#request.thisself#"
	fuseaction="page.membersOnly"
	>
	
	
<!--- insert a list of membership products --->
<cfmodule template="../#request.thisself#"
	fuseaction="product.list"
	category_id=""
	type="membership"
	searchheader="0"
	searchform="0"
	listing="membership">

</div>
<!-- end access/dsp_not_permitted.cfm -->