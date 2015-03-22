<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Getting column details for specific table --->
<cfif Request.dbtype IS "MSSQL">
	<cfquery name="GetColumnDetails" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
		SELECT * FROM INFORMATION_SCHEMA.Columns
		WHERE Table_Name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#GetTableNames.Table_Name#">
		ORDER BY ORDINAL_POSITION
	</cfquery>	
	<cfset tablename = GetTableNames.table_name>
<cfelse>
	<cfset resultset = ListGetAt(GetTableNames.columnList,1)>
	<cfset tablename = GetTableNames[resultset][currentrow]>
	<cfquery name="GetColumnDetails" datasource="#Request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
		DESCRIBE <cfqueryparam cfsqltype="cf_sql_varchar" value="#tablename#">
	</cfquery>
</cfif>
	
	