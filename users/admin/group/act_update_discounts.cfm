
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is used to update the discounts after editing a user group. Called by act_group.cfm --->

<!--- Loop through the list of user group discounts --->
<cfloop list="#attributes.DiscountList#" index="discount">

	<!--- discount was found selected for this user group --->
	<cfif isDefined("attributes.Discounts") AND ListFind(attributes.Discounts, discount)>
	
			<!--- Confirm that user group is not already in the table ---->
			<cfquery name="check_relations" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
				SELECT Group_ID
				FROM #Request.DB_Prefix#Discount_Groups
				WHERE Discount_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#discount#">
				AND Group_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Group_ID#">
			</cfquery>		
		
			<cfif check_relations.recordcount is 0>
				
				<cfquery name="Add_Related" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
					INSERT INTO #Request.DB_Prefix#Discount_Groups
						(Discount_ID, Group_ID)
					VALUES ( 
						<cfqueryparam cfsqltype="cf_sql_integer" value="#discount#">, 
						<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Group_ID#"> )
				</cfquery>
		
			</cfif>
			
	<cfelse>
		
		<cfquery name="delete_related"  datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
			DELETE FROM #Request.DB_Prefix#Discount_Groups
			WHERE Discount_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#discount#">
			AND Group_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Group_ID#">
		</cfquery>		
	
	</cfif>

</cfloop>

<!----- RESET Discount Groups query ---->
	<cfinvoke component="#Request.CFCMapping#.shopping.discounts"
			method="qryGroupDiscounts" Group_ID="#attributes.Group_ID#" reset="yes">

