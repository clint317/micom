
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This query retrieves the list of states. --->

<cfquery name="GetStates" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" cachedwithin="#Request.Cache#">
	SELECT * FROM #Request.DB_Prefix#States
	ORDER BY Name
</cfquery>



