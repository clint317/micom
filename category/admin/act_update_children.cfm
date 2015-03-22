
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is called by act_categories.cfm and is used to edit the parent string names of any children of the category. --->

<cfquery name="GetChildren" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
SELECT Category_ID FROM #Request.DB_Prefix#Categories
WHERE Parent_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.CID#">
</cfquery>

<cfset CatList = ValueList(GetChildren.Category_ID)>

<!--- Loop until no children --->
<cfloop condition="len(CatList)">

<!--- For each category, redo parent string --->
<cfloop index="Category" list="#CatList#">

	<!--- Get Parent ID --->
	<cfquery name="GetParent" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
	SELECT Parent_ID FROM #Request.DB_Prefix#Categories
	WHERE Category_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Category#">
	</cfquery>
	
	<cfset Parent_ID = GetParent.Parent_ID>
	
	<cfinclude template="act_calc_parents.cfm">
	
	<cfquery name="UpdCategory" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE #Request.DB_Prefix#Categories
	SET ParentIDs = <cfqueryparam cfsqltype="cf_sql_varchar" value="#CatIDs#">,
	ParentNames = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#CatNames#">
	WHERE Category_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Category#">
	</cfquery>
</cfloop>

<!--- Get any subcategories --->
<cfquery name="GetChildren" datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#">
SELECT Category_ID
FROM #Request.DB_Prefix#Categories
WHERE Parent_ID IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#CatList#" list="Yes">)
</cfquery>

<cfset CatList = ValueList(GetChildren.Category_ID)>

</cfloop>



