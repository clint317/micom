
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Performs the admin actions for Customer (address) records: add, update, delete.
Called by users.admin&customer=act --->

<!--- CSRF Check --->
<cfset keyname = "customerEdit">
<cfinclude template="../../../includes/act_check_csrf_key.cfm">

	
<cfswitch expression="#mode#">
	<!--- Add a new Customer record --->
	<cfcase value="i">
		
		<!--- IF a user name is given, check to make sure the user is valid --->
		<cfif len(attributes.UName)>
		
			<cfquery name="finduser" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
				SELECT User_ID FROM #Request.DB_Prefix#Users
				WHERE Username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.UName#">
			</cfquery>
			
			<cfif finduser.recordcount is 1>	
				<cfset attributes.UID = finduser.User_ID>
			<cfelse>
				<cfset attributes.error_message = "Can not add this Customer. Not a valid User">
			</cfif>
		
		<cfelse>
		
			<cfset attributes.UID = 0>
		
		</cfif>		

		
		<cfif not isdefined("attributes.error_message")>
		
			<!--- Add the customer address --->
			<cfset attributes.customer_id = Application.objUsers.AddCustomer(argumentcollection=attributes)>
		
		</cfif>
		
	</cfcase>
			
	<cfcase value="u">
		<!--- Delete Customer Record ---->
		<cfif submit is "Delete">
		
			<!--- Can not delete customer record if used in an order. --->
			<cfquery name="checkorders" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
				SELECT Order_No
				FROM #Request.DB_Prefix#Order_No
				WHERE Customer_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#"> 
				OR ShipTo = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#">
			</cfquery>
				
			<cfif checkorders.recordcount is 0>
			
				<!--- remove customer ID from User record ---->
				<cfquery name="UpdateUserCustomer" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
					UPDATE #Request.DB_Prefix#Users
					SET Customer_ID = 0
					WHERE Customer_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#">
				</cfquery>
			
				<cfquery name="UpdateUserShipto" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
					UPDATE #Request.DB_Prefix#Users
					SET ShipTo = 0
					WHERE ShipTo = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#">
				</cfquery>
				
				<!--- remove customer ID from any Account Record ---->
				<cfquery name="UpdateAccounts" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
					UPDATE #Request.DB_Prefix#Account
					SET Customer_ID = 0
					WHERE Customer_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#">
				</cfquery>	


				<!--- Delete customer ---->
				<cfquery name="delete_Customers"  datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
					DELETE FROM #Request.DB_Prefix#Customers 
					WHERE Customer_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#">
				</cfquery>
			
			<cfelse>
			
				<cfset attributes.error_message = "Can not delete this customer record. It is used in order number(s)" & valuelist(checkorders.order_no)>
			
			</cfif>		
				
		<cfelse>
			<!--- Update Customer record --->
		
			<!--- IF a user name is given, check to make sure the user is valid --->
			<cfif len(attributes.UName)>
		
				<cfquery name="finduser" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
					SELECT User_ID FROM #Request.DB_Prefix#Users
					WHERE Username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.UName#">
				</cfquery>
			
				<cfif finduser.recordcount is 1>	
					<cfset attributes.UID = finduser.User_ID>
				<cfelse>
					<cfset attributes.error_message = "Can not update this Customer. Not a valid User">
				</cfif>
		
			<cfelse>
			
				<cfset attributes.UID = 0>
		
			</cfif>		

			<cfif not isdefined("attributes.error_message")>
			
				<!--- Update the customer record --->
				<cfset attributes.Address_ID = attributes.cid>
				<cfset Application.objUsers.UpdateCustomer(argumentcollection=attributes)>
			
			</cfif>
			
		</cfif>

	</cfcase>
		
</cfswitch>
			
			


