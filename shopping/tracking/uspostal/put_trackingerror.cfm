<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is called by the shopping.tracking fuseaction and used to display the tracking error for USPS Tracking. --->

<!--- <cfdump var="#Result#"> --->

<!-- start shopping/tracking/uspostal/put_trackingerror.cfm -->
<div id="puttrackingerror" class="shopping">

<cfmodule template="../../../customtags/format_output_box.cfm"
box_title="U.S. Postal Service Tracking - Shipment ###ShipNumber#"
width="500"
align="left"
>

	
<cfoutput>	
<table>
	<tr>
		<td colspan="3" align="center" class="formerror"><br/>#attributes.Message#<br/><br/></td></tr>
	</table>
</cfoutput>

</cfmodule><br/>

</div>
<!-- end shopping/tracking/uspostal/put_trackingerror.cfm -->
