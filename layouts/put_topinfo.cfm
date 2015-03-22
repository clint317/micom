
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to create the info for the top of the page. Call from your layout pages --->

 <!--- Change type to "Order" to show order-level discount instead --->
 
 <cfscript>
 	DiscountMess = Application.objDiscounts.dspDiscountMess(DiscType:'Store', class:'cat_text_list');
 	BasketSummary = Application.objCart.dspBasketStats("basketStats");

	TopInfo = DiscountMess & BasketSummary;
 </cfscript>

<cfoutput>
	<!-- start layouts/put_topinfo.cfm -->
	<div id="puttopinfo" class="layouts">
	#HTMLCompressFormat(TopInfo)#
	</div>
	<!-- end layouts/put_topinfo.cfm -->
</cfoutput>			
			