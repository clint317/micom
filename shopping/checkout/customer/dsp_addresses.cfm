
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Displays the customer address form for the checkout. Preloads with the customer information if user logged in or loads with the information from the address book. Called from shopping.checkout (step=address) --->


<!--- These parameters hold the billto and shipto customer address ID for addresses
chosen from the customer's address book. When passed, the customer ID is loaded into
the appropriate temporary table. ------------------>
<cfparam name="attributes.billto" default="">
<cfparam name="attributes.shipto" default="">

<cfset useExpress = Session.CheckoutVars.TotalBasket GT 0 AND ( get_Order_Settings.CCProcess IS "PayPalPro" OR (get_Order_Settings.UsePayPal AND get_Order_Settings.PayPalMethod IS "Express") )>
<cfset expressOnly = useExpress AND get_Order_Settings.CCProcess IS "None">

<cfset attributes.fieldlist="FirstName,LastName,Company,Address1,Address2,City,County,State,State2,Zip,Country,Phone,Email,Residence">

<!--- Initialize Billto ----->
<cfinclude template="qry_get_tempcustomer.cfm">

<cfloop list="#attributes.fieldlist#" index="counter">
	<cfset attributes[counter] =  getcustomer[counter][1]>
</cfloop>
		
<cfinclude template="qry_get_tempshipto.cfm">	

<cfloop list="#attributes.fieldlist#" index="counter">
	<cfset attributes[counter & '_shipto'] = getshipto[counter][1]>
</cfloop>

<!--- set variable to set initial status of 'same as billing address' check box --->
<cfif getshipto.recordcount and len(getshipto.lastname)>
	<cfset have_shipto = 1>
<cfelse>
	<cfset have_shipto = 0>
</cfif>
	
<cfinclude template="../../../queries/qry_getstates.cfm">
<cfinclude template="../../../queries/qry_getcounties.cfm">
<cfinclude template="../../../queries/qry_getcountries.cfm">



<!--- Display the PayPal Express Checkout Option --->
<cfif useExpress>
	<cfif expressOnly AND NOT Session.User_ID>
		<cfmodule template="../../../customtags/format_input_form.cfm"
			box_title="User Login"
			width="400"
			required_Fields="0"
			>
		<cfmodule template="../../../#thisSelf#"
		fuseaction="users.login"
		xfa_login_successful="fuseaction=shopping.checkout&step=#attributes.step#"
		format="_formfield"
		message="Please login before continuing to save this order to your account."
		/>
		</cfmodule><br/><br/>
	</cfif>
	<cfinclude template="../paypal/put_paypalexpress.cfm">
</cfif>

<cfif NOT expressOnly>
	<cfmodule template="../../../customtags/format_input_form.cfm"
	box_title="Order Information"
	width="400"
	required_Fields="0"
	>
	
		<!--- put log in form if appropriate ------------->
		<cfif NOT Session.User_ID>
			<cfmodule template="../../../#thisSelf#"
			fuseaction="users.login"
			xfa_login_successful="fuseaction=shopping.checkout&step=#attributes.step#"
			format="_formfield"
			/>
	
			<cfoutput>
				<tr><td colspan="3" align="center" bgcolor="###Request.GetColors.InputHBGcolor#">
				<img src="#Request.ImagePath#spacer.gif" alt="" height="1" width="1" /></td></tr>
			</cfoutput>
		</cfif>
	
	
	<cfoutput>	
		<cfif len(Message)>
		<tr>
			<td colspan="3" align="center" class="formerror"><br/>#Message#<br/><br/></td></tr>
		</cfif>		
		
		<tr><td colspan="3" align="center" class="formtext">
		<form action="#XHTMLFormat('#self#?fuseaction=shopping.checkout&step=address#request.token2#')#" method="post" name="editform" id="editform">
		<table width="100%" border="0" cellpadding="0" cellspacing="3" class="formtext">
		
		<!------->
		<cfinclude template="../../../includes/form/put_space.cfm">	
		
		<cfif isDefined("addressOK") AND NOT addressOK>
		<input type="hidden" name="addressverify" value="yes">
		</cfif>
		
		<tr align="left">
			<td colspan="2" class="formtitle">
			<cfif NOT get_User_Settings.UseShipTo>Customer<cfelse>Billing</cfif> Address
			</td>
			<td align="right" class="formtextsmall">
			<cfif Session.User_ID>[<a href="#XHTMLFormat('#self#?fuseaction=users.addressbook&show=billto#Request.Token2#')#">Select from Addressbook</a>]</cfif></td>
		</tr>
	
		
		<cfset attributes.mode = "customer">
		<cfinclude template="../../../users/formfields/put_contact.cfm">	
		
	<!--- display shipping if used ------->	
	<cfif get_User_Settings.UseShipTo>	
		<cfinclude template="../../../includes/form/put_space.cfm">	
		<tr>
			<td></td><td width="3">&nbsp;</td><td></td>
		</tr>
		
		<tr align="left">
			<td colspan="2" class="formtitle" nowrap="nowrap">
			Shipping Address
			</td>
			<td align="right" class="formtextsmall">
			<cfif Session.User_ID>[<a href="#XHTMLFormat('#self#?fuseaction=users.addressbook&show=shipto#Request.Token2#')#">Select from Addressbook</a>]</cfif></td>
		</tr>
			
		<tr align="left">
			<td></td>
			<td></td>
			<td><input type="checkbox" name="ShipToYes" value="1" onclick="clearshipto()" #doChecked(have_shipto,0)# /> <strong>Same as Billing Address</strong></td>
		</tr>			
	
			<cfinclude template="../../../includes/form/put_space.cfm">	
	
	 	<tr align="left">
	   	 	<td align="right">First Name:</td>
			<td style="background-color: ###Request.GetColors.formreq#;" width="3">&nbsp;</td>
	   	 	<td><input type="text" size="30" name="FirstName_shipto" value="#HTMLEditFormat(attributes.FirstName_shipto)#" class="formfield" onfocus="editform.ShipToYes.checked=false;" onblur="javascript:changeCase(this.form.FirstName_shipto)" />
		 	</td></tr>
	
	 	<tr align="left">
	   	 	<td align="right">Last Name: </td>
			<td style="background-color: ###Request.GetColors.formreq#;"></td>
	   	 	<td><input type="text" size="30"name="LastName_shipto" value="#HTMLEditFormat(attributes.LastName_shipto)#" class="formfield" onfocus="editform.ShipToYes.checked=false;" onblur="javascript:changeCase(this.form.LastName_shipto)"/></td></tr>	
	
	
	  	<tr align="left">
	    	<td align="right">Company: </td>
			<td></td>
	    	<td><input type="text" size="30" name="Company_shipto" value="#HTMLEditFormat(attributes.Company_shipto)#" class="formfield"/></td></tr>
	
	
		<tr align="left">
	    	<td align="right">Address: </td>
			<td style="background-color: ###Request.GetColors.formreq#;"></td>
	    	<td><input type="text" size="30" name="Address1_shipto" value="#HTMLEditFormat(attributes.Address1_shipto)#" class="formfield" onfocus="editform.ShipToYes.checked=false;" onblur="javascript:changeCase(this.form.Address1_shipto)"/>
			</td></tr>
			
		<tr align="left">
	    	<td align="right" valign="baseline"></td>
			<td></td>
	    	<td><input type="text" size="30" name="Address2_shipto" value="#HTMLEditFormat(attributes.Address2_shipto)#" class="formfield" onblur="javascript:changeCase(this.form.Address2_shipto)"/></td></tr>	
			
		<tr align="left">
	    	<td align="right">City: </td>
			<td style="background-color: ###Request.GetColors.formreq#;"></td>
	    	<td><input type="text" size="30" name="City_shipto" value="#HTMLEditFormat(attributes.City_shipto)#" class="formfield" onblur="javascript:changeCase(this.form.City_shipto)"/></td></tr>
		
	<cfif get_User_Settings.UseStateList>		
		<tr align="left">
			<td align="right" valign="baseline">State/Province: </td>	
			<td style="background-color: ###Request.GetColors.formreq#;"></td>
		    <td><select name="State_shipto" size="1" class="formfield" <cfif ShowCounties>onchange="objForm.County_shipto.populate(stcCounties[objForm.State_shipto.getValue()], null, null, stcBlank);"</cfif>>
				<option value="">Unlisted/None</option>
	   			<option value="">___________________</option>
			<cfloop query="GetStates">
	   			<option value="#Abb#" #doSelected(attributes.State_shipto,Abb)#>#Name# (#Abb#)</option>
			</cfloop></select></td></tr>
	<cfelse>
		<tr style="display:none"><td colspan="3">
		<input type="hidden" name="State_shipto" value="Unlisted"/>
		</td></tr>
	</cfif>
	
	<cfif get_User_Settings.UseStateBox>		
		<tr align="left">
		    <td align="right"><cfif NOT get_User_Settings.UseStateList>State/Region:</cfif></td>
			<td></td>
			<td><input type="text" name="State2_shipto" value="#HTMLEditFormat(attributes.State2_shipto)#" size="30" maxlength="150" class="formfield" />
			<cfif get_User_Settings.UseStateList><span class="formtextsmall"><br/>Enter here if not listed above</span></cfif></td></tr>
	<cfelse>
		<tr style="display:none"><td colspan="3">
		<input type="hidden" name="State2_shipto" value=""/>
		</td></tr>
	</cfif>
	<cfif ShowCounties>
		<tr align="left">
	    	<td align="right">County: </td>
			<td <cfif get_User_Settings.RequireCounty>style="background-color: ###Request.GetColors.formreq#;"</cfif>></td>
	    	<td><select name="County_shipto" class="formfield">
		<option value="">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </option>
		<option value=""></option><option value=""></option><option value=""></option><option value=""></option><option value=""></option></select></td></tr>
	<cfelse>
		<tr style="display:none"><td colspan="3">
		<input type="hidden" name="County_shipto" value=""/>
		</td></tr>
	</cfif>
	
		<tr align="left">
		    <td align="right">Zip: </td>
			<td style="background-color: ###Request.GetColors.formreq#;"></td>
	    	<td><input type="text" name="Zip_shipto" value="#HTMLEditFormat(attributes.Zip_shipto)#"  size="30" maxlength="50" class="formfield" /></td></tr>
	
	<cfif get_User_Settings.UseCountryList>
		<tr align="left">
	    	<td align="right">Country: </td>
			<td style="background-color: ###Request.GetColors.formreq#;"></td>
	    	<td>
			<select name="Country_shipto" size="1" class="formfield">
				<option value="#Request.AppSettings.HomeCountry#">#ListGetAt(Request.AppSettings.HomeCountry, 2, "^")#</option>
	 			<option value="" selected="selected">___________________</option>
			<cfloop query="GetCountries">
	   			<option value="#Abbrev#^#Name#" #doSelected(attributes.Country_shipto,"#Abbrev#^#Name#")#>#Left(Name,28)#</option>
			</cfloop>
			</select></td></tr>		
	<cfelse>
		<tr style="display:none"><td colspan="3">
		<input type="hidden" name="Country_shipto" value="#Request.AppSettings.HomeCountry#"/>
		</td></tr>
	</cfif>
		<tr align="left">
		    <td align="right">Phone: </td>
			<td></td>
	   	 	<td><input type="text" name="Phone_shipto" value="#HTMLEditFormat(attributes.Phone_shipto)#" size="30" maxlength="150" class="formfield"/></td></tr>
	
	<cfif get_User_Settings.UseResidential>
		<tr align="left">
		    <td align="right">Residence: </td>
			<td style="background-color: ###Request.GetColors.formreq#;"></td>
	   	 	 <td><input type="radio" name="residence_shipto" value="1" #doChecked(attributes.residence_shipto)# /> Yes 
			 &nbsp;&nbsp;<input type="radio" name="residence_shipto" value="0" #doChecked(attributes.residence_shipto,0)# /> No
			</td>
		</tr>
	<cfelse>
		<tr style="display:none"><td colspan="3">
		<input type="hidden" name="residence_shipto" value="1"/>
		</td></tr>
	</cfif>
	
	<cfelse>
		<tr style="display:none"><td colspan="3">
		<input type="hidden" name="ShipToYes" value="1"/>
		</td></tr>
	
	</cfif>	<!--- shipping address used --->
	
		<tr><td colspan="3">
		<img src="#Request.ImagePath#spacer.gif" alt="" height="3" width="1" /></td></tr>
		<tr align="left">
		<td colspan="2"></td>
		<td><input type="submit" name="SubmitAddress" value="Continue" class="formbutton"/>
			<input type="submit" name="CancelForm" value="Cancel" class="formbutton" onclick="noValidation();"/>
			</td></tr>
	
	<cfinclude template="../../../includes/form/put_requiredfields.cfm">			
		
	<!--- If using Address Verification, output UPS notices. --->	
	<cfif ShipSettings.ShipType IS "UPS">
		<cfset GetUPS = Application.objShipping.getUPSSettings()>
	
		<cfif GetUPS.UseAV>
			<tr align="left"><td colspan="3"><br/>
			<i>NOTICE: The address validation functionality will validate P.O. Box address. However, UPS does not deliver to P.O. boxes. Attempts by customer to ship to a P.O. Box via UPS may result in additional charges. <cfif isDefined("addressOK") AND NOT addressOK>UPS assumes no liability for the information provided by the address validation functionality. The address validation functionality does not support the identification or verification of occupants at an address.</cfif></i><br/><br/>
	
	<img src="#Request.ImagePath#icons/ups_smlogo.jpg" alt="" width="32" height="32" border="0" align="left" />
	<i>UPS, UPS brandmark, and the Color Brown are trademarks of United
	Parcel Service of America, Inc. All Rights Reserved.</i>
		</td></tr>
		
		</cfif>
	
	</cfif>
	
	
	</cfoutput>
	</table>
	</form>
	</td></tr>
	
	</cfmodule>
	
	
</cfif>
</div>
<!-- end shopping/checkout/customer/dsp_addresses.cfm -->
