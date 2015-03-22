
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the information for the Payment Summary Report. Called by dsp_reports.cfm --->

<!--- Get list of orders --->
<cfquery name="qPaymentTotals" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	SELECT CardType, COUNT(*) AS Count,
		SUM(Amount) AS Amount
	FROM #Request.DB_Prefix#Payments
	WHERE Captured = <cfqueryparam value="1" cfsqltype="#Request.SQL_Bit#">
		AND PaymentDateTime >= <cfqueryparam value="#StartDate#" cfsqltype="cf_sql_timestamp">
		AND PaymentDateTime <= <cfqueryparam value="#ToDate#" cfsqltype="cf_sql_timestamp">
	GROUP BY CardType
	ORDER BY CardType
</cfquery>
