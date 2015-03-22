<cfsilent>
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to create the search string using cfqueryparam to prevent SQL injection. Called from the various query pages --->

<cfparam name="sqltype" default="longvarchar">
<cfparam name="useparam" default="yes">
<cfparam name="fieldname" default="Long_Desc">
<cfparam name="search_string" default="">
<cfparam name="attributes.all_words" default="false" type="boolean">
<cfset numwords = ListLen(search_string, " ")>
<!--- loop through words separated by spaces --->
</cfsilent>

<cfoutput>
( <cfloop index="i" from="1" to="#numwords#">
	#fieldname# LIKE 
	<cfif useparam>
	<cfqueryparam cfsqltype="cf_sql_#sqltype#" value="%#ListGetAt(search_string, i, " ")#%">
	<cfelse>'%#ListGetAt(search_string, i, " ")#%'
	</cfif>
	<cfif i IS NOT numwords AND attributes.all_words> AND <cfelseif i IS NOT numwords> OR </cfif>
</cfloop> )
</cfoutput>


