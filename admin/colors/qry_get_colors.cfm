
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Retrieves the list of color palettes. Called by home.admin&colors=list --->

<!--- This page is also called by various admin pages to display the list of color palettes that can be used for a store page. --->

<cfquery name="qry_get_Colors" datasource="#Request.ds#" username="#Request.DSuser#"  password="#Request.DSpass#" >
SELECT * FROM #Request.DB_Prefix#Colors
</cfquery>
		
	

	
