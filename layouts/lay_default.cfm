
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This is the layout page for the entire store. Edit it as much as you desire using the components below. Your store can use more than one layout page.  Lay_default.cfm will be the site's default layout. Additional layouts can be created and named. You can attach a custom layout page to a Palette that you create in the Palette Admin. The Palette can then be assigned to an individual Category, Product, Feature, or Page. --->

<!-- start layouts/lay_default.cfm -->

<!--- This file must be included at the top of all CFWebstore layout pages! Creates the header section and additional code needed by the software --->	
<cfinclude template="put_layouthead.cfm">

<cfoutput>
	<!--- Style sheet(s) for the layout --->	
	<link rel="stylesheet" href="#Request.StorePath#css/default.css" type="text/css" />
	<link rel="stylesheet" href="#Request.StorePath#css/MenuDynamic.css" type="text/css" />
</cfoutput>

</head>

<!--- Creates the body tag with background image and colors set by the palette. --->
<cfinclude template="put_body.cfm">

<table border="0" cellspacing="0" cellpadding="0" width="1010" id="bodytable">

<!--- The page has three columns: left menu, spacer, and body 
The column widths are set in this first row. Change the spacer.gif width to adjust columns.----->
<cfoutput>
	<tr>  
		<td><img src="#Request.ImagePath#spacer.gif" height="0" alt="" width="200" border="0" /></td>
		<td><img src="#Request.ImagePath#spacer.gif" height="0" alt="" width="10" border="0" /></td>
		<td><img src="#Request.ImagePath#spacer.gif" height="0" alt="" width="800" border="0" /></td>
	</tr>
</cfoutput>

<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

<!--- Logo/Store title row ------------------------------->
<cfif len(request.appsettings.sitelogo)>
	<cfimage source="..#Request.ImagePath##request.appsettings.sitelogo#" name="logoImage">
	<cfset logoImageHeight = imageGetHeight(logoImage)>
</cfif>
<tr>
 <td colspan="3">
 	
 	<cfoutput>
	<div style="padding-left:370px;padding-right:10px;height:#logoImageHeight#px;background:url('#Request.ImagePath##request.appsettings.sitelogo#');">
	
		<table width="100%" height="#logoImageHeight#" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left" width="40%">
					<span style="color:white;font-size:16px;font-weight: bolder;">New Age Market</span>
				</td>
				<td align="left" width="20%">
					<div class="fb-like" data-href="http://www.facebook.com/MysticInsightPsychics" data-send="false" data-layout="button_count" data-width="120" data-show-faces="true"></div>
				</td>
				<td align="right" width="40%">
					<!--- Output the storewide discounts and shopping cart totals --->
					<cfinclude template="put_topinfo.cfm">
				</td> 
			</tr>
		</table>
		
	</div>
	
	<div>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td><img src="/images/mysticfairybkgrnd.png"/></td>
				<td width='100%' align="center"><h1>Your Online Source for New Age Products</h1></div></td>
			</tr>
		</table>
	</div>
 	</cfoutput>
 
 </td> 
</tr> 

<!---- Main Body Row -------->
<tr>
	<!---- MENU COLUMN------->
	<td valign="top" align="right" style="padding-top: 10px">
				
		<!--- Menu of Top Level Categories and Pages ---->
		<cfinclude template="put_sidemenus.cfm">
			
		<!--- Links for admins --->		
		<cfinclude template="put_adminlinks.cfm">	
		
		<!--- An optional persistent search box --->		
		<cfinclude template="put_searchbox.cfm">	
		
		<!--- An optional persistent log-in box -- the site works perfectly well without --->
		<cfinclude template="put_loginbox.cfm">			
			
	</td>
	
	<!---- SPACER COLUMN between menu and content ------->
	<td>&nbsp;</td>
	
	<!---- PAGE CONTENT ------->
	<td valign="top" class="mainpage">
		
		<!--- Breadcrumb Trail Menu Table--------------->
		<table width="100%" cellpadding="3" cellspacing="0" border="0">
			<tr>
				<td class="menu_trail">
					<cfinclude template="put_breadcrumb.cfm">
				</td>
			</tr>
		</table>
	
		<!--- THIS IS WHERE ALL GENERATED PAGE CONTENT GOES ---->
		<cfinclude template="put_storecontent.cfm">
	
	</td>
</tr>

<!---- Footer Menus ------->
<tr>
	<td valign="top" align="right"></td>
	<td colspan="2" align="center">
		
		<p>&nbsp;</p>
		
		<!--- horizontal category and page menus --->
		<cfinclude template="put_bottommenus.cfm">
		
		<!--- copyright/merchant line --->	
		<cfinclude template="put_copyright.cfm">

		
	</td>	
</tr>
</table>
		
<!--- Allow debug variables list to display only for Administrators when &debug=1 is included in URL. --->
<cfinclude template="put_debug.cfm">

</body>
</html>
<!-- end layouts/lay_default.cfm -->
	