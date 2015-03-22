
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This is the standard footer that goes at the bottom of product listings. It is called by catcore_product.cfm and dsp_results.cfm. --->

<!-- start product/put_search_footer.cfm -->	
<div id="putsearchfooter" class="product">
	<cfif attributes.thickline>
		<cfmodule template="../customtags/putline.cfm" linetype="thick">
	</cfif>
			
	<cfif len(pt_pagethru)>		
		<cfoutput><div align="center">#pt_pagethru#</div><br/></cfoutput>
	</cfif>

</div>
<!-- end product/put_search_footer.cfm -->