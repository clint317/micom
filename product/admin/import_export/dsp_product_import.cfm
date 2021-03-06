
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Displays the form to create a product import. Called by product.admin&do=import --->

<cfquery name="getfields"  datasource="#Request.DS#" username="#Request.DSuser#" password="#Request.DSpass#" maxrows="1">
SELECT * FROM #Request.DB_Prefix#Products
</cfquery>

<cfset fieldlist = getfields.ColumnList>
<!---<cfset MetaData = getfields.getMetaData()> --->

<!--- Remove reserved fields --->
<cfset reservedlist = "Product_ID,User_ID,DateAdded,Discounts,OptQuant,Promotions">

<cfloop index="item" list="#reservedlist#">
	<cfset located = ListFindNoCase(fieldlist, item)>
	<cfset fieldlist = ListDeleteAt(fieldlist, located)>
</cfloop>

<!---- get list of categories that hold products ---->
<cfset attributes.catcore_content = "Products">
<cfinclude template="../../../category/qry_get_cat_picklist.cfm">

<cfhtmlhead text="
	<script language=""JavaScript"">
		function CancelForm () {
		location.href = ""#self#?fuseaction=home.admin&redirect=yes#request.token2#"";
		}
	</script>
">

<cfmodule template="../../../customtags/format_output_admin.cfm"
	box_title="Product Import"
	width="500">
	
<cfoutput>
	<!--- Table --->
	<table border="0" cellpadding="0" cellspacing="4" width="100%" class="formtext"
	style="color:###Request.GetColors.InputTText#">
	<form action="#self#?fuseaction=product.admin&do=doimport#Request.Token2#" method="post" enctype="multipart/form-data" name="importform" id="importform">
	<input type="hidden" name="XFA_failure" value="#Request.CurrentURL#">
	<cfset keyname = "prodImport">
	<cfinclude template="../../../includes/act_add_csrf_key.cfm">
	<tr>
		<td><br/>
		Select .csv file to import:</td>
		<td><br/><input name="importcsv" type="file" size="30" class="formtext"/></td>
	</tr>	
	<tr>
		<td>First row contains headers:</td>
		<td><select name="headers" size="1" class="formtext">
		<option value="yes">yes</option>
		<option value="no">no</option>
		</select></td>
	</tr>	
 <!--- Category_id --->		
	<tr>
		<td align="RIGHT" valign="top"><br/>Add to category:
		<br/><br/><span class="formtextsmall">CTRL + Click to<br/>select multiple<br/>categories.</span>
		</td>
		<td><br/>
	 	<select name="CID_LIST" size="6" multiple="multiple" class="formfield">	
		<cfloop query="qry_get_cat_picklist">
		<option value="#category_id#">&raquo;<cfif parentnames is not ""><cfif len(parentnames) gt 50>...</cfif>#Right(replace(parentnames,':','&raquo;'),50)#&raquo;</cfif>#Name#
		</cfloop>
			</select>	
		</td>
	</tr>	
	
	<tr>
		<td colspan="2" align="center"><br/>
		<strong>IMPORT FIELD SELECTOR</strong><br/>
		(All fields optional other than NAME)</td>
	</tr>

<cfset numFields = ListLen(fieldlist)>
	
<cfloop index="num" from="1" to="30">
	<tr>
		<td align="right"><cfif num is 1><br/></cfif>Field #num#:</td>
		<td><cfif num is 1><br/></cfif>
	 	<select name="Field_#Num#" size="1" class="formfield">	
		<!--- <option value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
		<cfloop list="#fieldlist#" index="theField">
			<cfset DataType = getfields.getColumnTypeName(MetaData.GetColumnType(getfields.findColumn(theField)))>
			<option value="#theField#^#DataType#">#theField#</option>
		</cfloop> --->
		<cfinclude template="put_fields.cfm">
		</select>	
		</td>
</cfloop>
	
	<tr>
		<td align="center" colspan="2"><br/>
		<input type="submit" name="submit_import" value="Add Products" class="formbutton"/> 
		<input type="button" value="Cancel" onclick="CancelForm();" class="formbutton"/>
		</td>
	</tr>
	
	</form>	
	</table>
</cfoutput>

<cfprocessingdirective suppresswhitespace="no">
<script type="text/javascript">
objForm = new qForm("importform");

objForm.required("importcsv,Field_1");

objForm.importcsv.description = "file to import";
objForm.Field_1.description = "field 1";

qFormAPI.errorColor = "###Request.GetColors.formreq#";
</script>
</cfprocessingdirective>

</cfmodule>
	
	