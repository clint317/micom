<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Runs the function to delete an order and all its related information. Called from act_order.cfm and act_orders_filled.cfm --->

<cfparam name="attributes.message" default="">

<!--- Make sure the order does not need to be saved for a recurring membership. --->
<cfquery name="CheckMemberships" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT Membership_ID FROM #Request.DB_Prefix#Memberships
	WHERE Recur = 1
	AND Expire >= <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#">
	AND Order_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">
</cfquery>

<cfif CheckMemberships.RecordCount>
	
	<cfif NOT len(attributes.message)>
		<cfset attributes.message = "The following could not be deleted as they have active recurring memberships:\n">
	</cfif>
	
	<cfset attributes.message = attributes.message & "\nOrder ##" & (Order_No + Get_Order_Settings.BaseOrderNum)>

<cfelse>

	
	<cftransaction isolation="SERIALIZABLE">
	
	<!--- Delete guest accounts only --->
	<cfquery name="GetCustomer" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		SELECT Customer_ID FROM #Request.DB_Prefix#Customers
		WHERE Customer_ID = (SELECT Customer_ID FROM #Request.DB_Prefix#Order_No 
							WHERE Order_No = <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">) 
		AND Customer_ID NOT IN (SELECT Customer_ID FROM #Request.DB_Prefix#Users)
		AND Customer_ID NOT IN (SELECT Customer_ID FROM #Request.DB_Prefix#Order_No  
							WHERE Order_No <> <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">) 
		AND Customer_ID NOT IN (SELECT Customer_ID FROM #Request.DB_Prefix#Account)
		AND User_ID = 0
	</cfquery>
	
	<cfquery name="GetCard" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		SELECT Card_ID FROM #Request.DB_Prefix#Order_No 
		WHERE Order_No = <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">
	</cfquery>
	
	<cfquery name="DeleteCardData" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		DELETE FROM #Request.DB_Prefix#CardData
		WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#GetCard.Card_ID#">
	</cfquery>
	
	<cfquery name="DeleteOrder" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		DELETE FROM #Request.DB_Prefix#Order_Items
		WHERE Order_No = <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">
	</cfquery>
	
	<cfquery name="DeleteTaxes" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		DELETE FROM #Request.DB_Prefix#OrderTaxes
		WHERE Order_No = <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">
	</cfquery>
	
	<cfquery name="DeleteOrderPO" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		DELETE FROM #Request.DB_Prefix#Order_PO
		WHERE Order_No = <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">
	</cfquery>
	
	<cfquery name="DeleteOrderNo" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
		DELETE FROM #Request.DB_Prefix#Order_No 
		WHERE Order_No = <cfqueryparam cfsqltype="cf_sql_integer" value="#Order_No#">
	</cfquery>
	
	<cfif GetCustomer.RecordCount>
		<cfquery name="DeleteCustomer" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
			DELETE FROM #Request.DB_Prefix#Customers
			WHERE Customer_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#GetCustomer.Customer_ID#">
		</cfquery>
	</cfif>
	
	</cftransaction>

</cfif>
