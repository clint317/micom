
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is run to create a string with the expiration date and compare it to the current date to make sure the card isn't expired. Called from checkout\act_pay_form.cfm --->

<cftry>

	<cfset tempdate = "#Month#" & "/1/" & "#Year#"> 
	<cfset day = DaysInMonth("#tempdate#")>
	<cfparam name="expdate" default= "#Month#/#day#/#Year#"> 
	<cfset checkdate = DateCompare("#ParseDateTime(expdate)#", DateFormat(Now(), "mm/dd/yy"))>

<cfcatch type="any">
	<cfset checkdate=(-1)>
</cfcatch>
</cftry>
