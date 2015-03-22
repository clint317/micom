<cfsilent>
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Used to call the CFCs for creating the site menus. Call from your layout pages --->

<!--- See the written documentation for information on parameters you can use for creating your menus. --->
<cfparam name="attributes.useJS" default="yes">

<cfif NOT isDefined("Session.SideMenus") OR isDefined("URL.Refresh") OR isDefined("URL.redirect")>
		
	<cfscript>
		CatMenu = Application.objMenus.dspCatMenu(useJS=attributes.useJS,menu_type="normal");
		PageMenu = Application.objMenus.dspPageMenu(useJS=attributes.useJS);

		SideMenus = CatMenu & "<br/>" & PageMenu;
	</cfscript>
	
	<cfset Session.SideMenus = HTMLCompressFormat(SideMenus)>

</cfif>

</cfsilent>

<cfoutput>
	<!-- start layouts/put_sidemenus.cfm -->
	<div id="putsidemenus" class="layouts">
	#Session.SideMenus#
	</div>
	<!-- end layouts/put_sidemenus.cfm -->
</cfoutput>			
		
<!--- Alternative version if your menus change and need to be reloaded on different pages of the site 
<cfscript>
	CatMenu = Application.objMenus.dspCatMenu();
	PageMenu = Application.objMenus.dspPageMenu();
	
	SideMenus = CatMenu & "<br/>" & PageMenu;
	Writeoutput(HTMLCompressFormat(SideMenus));
</cfscript>
--->