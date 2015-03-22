<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is called by the shopping.tracking fuseaction and used to display the tracking information for the order for FedEx Tracking. --->

<!--- <cfdump var="#Result#"> --->

<!-- start shopping/tracking/fedex/put_tracking.cfm -->
<div id="puttracking" class="shopping">

<cfmodule template="../../../customtags/format_output_box.cfm"
box_title="FedEx<sup>&reg;</sup> Tracking - Shipment ###ShipNumber#"
width="550"
align="left"
>

<!--- Determine status of shipment --->
<cfoutput>
<table width="100%">
<tr align="left"> 
<td class="trackbold" width="10%" nowrap="nowrap">FedEx<sup>&reg;</sup> Tracking Number:</td>
<td class="track" nowrap="nowrap">#Result.TrackNumber#</td>
</tr>
<tr align="left"> 
<td class="trackbold" nowrap="nowrap">Service Type:</td>
<td class="track" nowrap="nowrap">#Result.Service#</td>
</tr>
<cfif IsDefined("Result.StatusDescription")>
<tr align="left"> 
<td class="trackbold" nowrap="nowrap">Status:</td>
<td class="track" nowrap="nowrap">#Result.StatusDescription#</td>
</tr>
</cfif>
<cfif IsDefined("Result.Weight")>
	<tr align="left"> 
	<td class="trackbold">Weight:</td>
	<td class="track">#Result.Weight# #Result.WeightUnit#</td>
	</tr>
</cfif>
<tr> 
<td colspan="2">&nbsp;</td>
</tr>
<cfif IsDefined("Result.Address.DestinationAddress.City")>
	<tr align="left"> 
	<td class="trackbold" nowrap="nowrap">Shipped To:</td>
	<td class="track">#Result.Address.DestinationAddress.City.XMLText#<cfif isDefined("Result.Address.DestinationAddress.StateOrProvinceCode")>, #Result.Address.DestinationAddress.StateOrProvinceCode.XMLText#</cfif>, #Result.Address.DestinationAddress.CountryCode.XMLText#</td>
	</tr>
</cfif>
<cfif IsDefined("Result.ShipDate")>
	<tr align="left"> 
	<td class="trackbold" nowrap="nowrap">Shipped or Billed on:</td>
	<td class="track">#LSDateFormat(Left(Result.ShipDate,10), "short")#</td>
	</tr>
</cfif>
<cfif IsDefined("Result.EstimatedDeliveryDate")>
	<tr align="left"> 
	<td class="trackbold">Estimated Delivery:</td>
	<td class="track">#LSDateFormat(Result.EstimatedDeliveryDate, "short")#</td>
	</tr>
</cfif>	
<cfif IsDefined("Result.PackageCount")>
	<tr align="left"> 
	<td class="trackbold">Packages:</td>
	<td class="track">#Result.PackageCount#</td>
	</tr>
</cfif>	
<tr> 
<td colspan="2">&nbsp;</td>
</tr>
</table>

<cfif ArrayLen(Result.Activity)>

	<table width="100%" cellpadding="5" cellspacing="0">
	<tr align="left">
	<th class="track">Location</th><th class="track">Date</th><th class="track">Local Time</th><th class="track">Activity</th>
	</tr>
	<cfscript>
	NumActivity = ArrayLen(Result.Activity);
	lastLocation = "";
	currclass = 1;
	</cfscript>
	<cfloop index="i" from="1" to="#NumActivity#">
	<cfscript>
		printLocation = '';
		currArray = Result.Activity[i];
		currLocation = "";
		if (isDefined("currArray.Address")) {
			theAddress = currArray.Address;
			
			if (isDefined("theAddress.City")) {
				currLocation = theAddress.City.XMLText & ", ";
				currLocation = currLocation & theAddress.StateOrProvinceCode.XMLText;
				if (theAddress.CountryCode.XMLText IS NOT ListGetAt(Request.AppSettings.HomeCountry, 1, "^"))
					currLocation = currLocation & ", " & theAddress.CountryCode.XMLText;
			}
		}
		if (lastLocation IS NOT currLocation) {
			currclass = currclass + 1;
			printLocation = currLocation;
		}
		tagclass = currclass MOD 2;
		lastLocation = currLocation;
	</cfscript>
	<!--- <cfdump var="#theAddress#"> --->
	<cfset Status = currArray.EventDescription.XMLText>
	<tr align="left">
	<td class="track#tagclass#">#printLocation#</td>
	<td class="track#tagclass#">#LSDateFormat(Left(currArray.Timestamp.XMLText,10), "short")#</td>
	<td class="track#tagclass#">#LSTimeFormat(Mid(currArray.Timestamp.XMLText,12,8))#</td>
	<td class="track#tagclass#">#Status#
	<cfif isDefined("currArray.StatusExceptionDescription")><br/>#currArray.StatusExceptionDescription.XMLText#</cfif>
	</td>
	</tr>
	</cfloop>
	</table>

</cfif>

</cfoutput>


</cfmodule>

</div>
<!-- end shopping/tracking/fedex/put_tracking.cfm -->

