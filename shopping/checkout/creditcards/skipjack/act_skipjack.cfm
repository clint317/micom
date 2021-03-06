
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This template is used to run Skipjack credit card validation. Called from checkout/act_pay_form.cfm --->

<!--- Retrive Authorize.Net settings --->

<cfquery name="GetSettings" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
	SELECT CCServer, Username, Password 
	FROM #Request.DB_Prefix#CCProcess
	WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="1">
</cfquery>

<cfif GetCustomer.State Is "Unlisted">
	<cfset CustState = GetCustomer.State2>
<cfelse>
	<cfset CustState = GetCustomer.State>
</cfif>

<cfif NOT GetShipTo.Recordcount OR NOT len(GetShipTo.Phone)>
	<cfset Shiptophone = GetCustomer.Phone>
<cfelse>
	<cfset Shiptophone = GetShipTo.Phone>
</cfif>

<cfset r = Randomize(Minute(now())&Second(now()))>  
<cfset randomnum = RandRange(1000,9999)>

<cfset InvoiceNum = Replace(CGI.REMOTE_ADDR,".","","ALL") & randomnum>

<cfparam name="attributes.CVV2" default="">

<CF_Skipjack
	QUERYNAME="Results"
	INVOICENUM="#InvoiceNum#"
	SHIPTOPHONE="#Shiptophone#"
	NAMEONCARD="#attributes.NameonCard#"
	UNIQUEID="#GetSettings.Username#"
	CCSERVER="#GetSettings.CCServer#"
     CARDNUMBER="#attributes.CardNumber#"
	 MONTH="#month#"
	 YEAR="#year#"
	 CVV2="#attributes.CVV2#"
     AMOUNT="#GetTotals.OrderTotal#"
	 ADDRESS="#GetCustomer.Address1#"
	 CITY="#GetCustomer.City#"
	 STATE="#CustState#"
ZIP="#GetCustomer.Zip#"
COUNTRY="#ListGetAt(GetCustomer.Country, 2, "^")#"
EMAIL="#GetCustomer.Email#">
			  
			  
<!--- DEBUG --->
<!--- <cfdump var="#Results#">  --->

<cfset ErrorMessage = "">

<cfif NOT isDefined("Results.IsApproved")>
		<cfset ErrorMessage = "There was an error with the payment gateway communication. Please contact our tech support for more assistance. ">    
	<cfset display = "Yes">

<cfelseif Results.IsApproved IS NOT "1">
	<cfif len(Results.Message)>
		<cfset ErrorMessage = Results.Message>
	</cfif>
	<cfif len(Results.AuthorizationDeclinedMessage)>
		<cfset ErrorMessage = ErrorMessage & " " & Results.AuthorizationDeclinedMessage>
	</cfif>
	<cfset ErrorMessage = ErrorMessage & " Please change the information entered, or return to the store.">       
<cfset display = "Yes">

<cfelse>

<cfset AuthNumber = Results.AuthCode>
<cfset attributes.step = "receipt">

</cfif>


