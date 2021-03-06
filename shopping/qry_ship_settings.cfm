
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This query is used throughout the store to retrieve the settings related to shipping. It is cached to improve performance so is also called after changing any of the settings to update the cached query.  --->

<cfquery name="ShipSettings" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" cachedwithin="#Request.Cache#">
	SELECT * FROM #Request.DB_Prefix#ShipSettings
</cfquery>



