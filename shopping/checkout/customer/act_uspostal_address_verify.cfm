<!--- CFWebstore�, version 5.63 --->

<!--- CFWebstore� is �Copyright 1998-2004 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Sofware may be contacted at info@cfwebstore.com --->

<!--- This page is used to run the address verification for USPS. Called from do_checkout.cfm  --->


<cfset GetUSPS = Application.objShipping.getUSPSSettings()>

<cfif GetUSPS.UseAV>
	
	<cfscript>
	if (NOT attributes.ShipToYes) {
		// USPS address verification has suite or apartment as address 1
		checkaddress1 = attributes.Address2_shipto;
		checkaddress2 = attributes.Address1_shipto;
		checkcity = attributes.City_shipto;
		checkstate = attributes.State_shipto;
		checkzip = attributes.Zip_shipto;
		checkcountry = ListGetAt(attributes.Country_shipto, 1, "^");
	}
	else {
		checkaddress1 = attributes.Address2;
		checkaddress2 = attributes.Address1;
		checkcity = attributes.City;
		checkstate = attributes.State;
		checkzip = attributes.Zip;
		checkcountry = ListGetAt(attributes.Country, 1, "^");
	}
	</cfscript>
	
	<!--- only run for US addresses --->
	 <cfif checkcountry IS "US">
	 	
	 	<!--- Turn off verification success unless it passes --->
	 	<cfset addressOK = "no">
	 	
		<cfinvoke component="#Request.CFCMapping#.shipping.uspostal" 
			returnvariable="Result" method="VerifyAddress"
			UserID="#GetUSPS.UserID#"
			server="#GetUSPS.Server#" 
			Address1="#checkaddress1#"
			Address2="#checkaddress2#"
			City="#checkcity#"
			State="#checkstate#"
			Zipcode="#checkzip#"
			debug="#YesNoFormat(GetUSPS.Debug)#">
			
			<!--- Output debug if returned --->
			<cfif len(Result.Debug)>
				<cfoutput>#putDebug(Result.Debug)#</cfoutput>
			</cfif>
	
		<cfscript>
		
			if (Result.Success AND Result.ValidAddress)
				addressOK = 'yes';
			else if (Result.Success) {
				Message = 'The address entered is not a valid shipping address. <br/>Suggested address:<br />';
				if ( isDefined("Result.Address.Address2") ) {
					Message = Message & '<strong>' & Result.Address.Address2;
					if (isDefined("Result.Address.Address1")) {
						Message = Message & ', ' & Result.Address.Address1;
					}
					Message = Message & '<br/>' & Result.Address.City & ', ' & Result.Address.State & " " & Result.Address.Zip5 & '-' & Result.Address.Zip4;
					Message = Message & '</br></strong>';
					} else { 
						Message = Message & '<strong>No suggestions found.</strong>'; 
					}
				}
			else {
				Message = Result.errormessage;
				}
		
		</cfscript>
	
	<cfelse>
		
		<cfset addressOK = 'yes'>
				
	</cfif>
	
</cfif>

<!--- <cfdump var="#Result#"><cfabort>  --->