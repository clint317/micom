<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Displays the Products Totals Report for stores using SKU options. Called by dsp_reports.cfm --->

<tr><td colspan="2" align="CENTER"><cfoutput>
<strong>PRODUCT TOTALS (by SKU) - #LSDateFormat(StartDate, "mmm d, yyyy")# - #LSDateFormat(ToDate, "mmm d, yyyy")#</strong><br/>&nbsp;
</td></tr>
</cfoutput>

<cfif NOT GetOrders.RecordCount>
<tr><td align="center">No orders found for this date range.</td></tr>

<cfelse>

<tr><td align="center">
<cfoutput><table width="95%" border="0" cellspacing="0" cellpadding="5" bgcolor="###Request.GetColors.OutputTbgcolor#" align="center" class="formtext" style="color:###Request.GetColors.OutputTText#"> </cfoutput>
<tr>
<td><b>SKU</b></td>
<td><b>Product</b></td>
<td><b>Units Sold</b></td>
<td><b>Total Sales</b></td>
</tr>
<cfoutput query="GetOrders">
<cfif CurrentRow MOD 2 IS 0>
	<tr>
<cfelse>
	<tr bgcolor="###Request.GetColors.outputtaltcolor#">
</cfif>
<td>#SKU#</td>
<td>#Name#</td>
<td align="center">#Int(ProductsSold_Sum)#</td>
<td align="center">#LSCurrencyFormat(ProductsPrice_Sum)#</td>
</tr>
</cfoutput>
</table>
</td></tr>

</cfif>

