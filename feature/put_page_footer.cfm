
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- Outputs a footer for feature pages. Includes navigation links to return to the page top, to the previous page, to email the page (tell a friend), and print the feature. Customize as desired with your own text and graphics --->


<cfoutput>
<!-- start feature/put_page_footer.cfm -->
<div id="putpagefooter" class="feature">

<table width="100%" border="0" cellspacing="2" cellpadding="0">
<!--- LINE --->	
	<tr><td colspan="2" bgcolor="###Request.GetColors.linecolor#"><img src="#Request.ImagePath#spacer.gif" height="1" width="1" border="0" alt="" hspace="0" vspace="0" /></td></tr>
<!--- PageThru --->	
	<tr>
		<td class="section_footer">
		<!--- Top of page link --->
		<img src="#Request.ImagePath#icons/up.gif" border="0" style="vertical-align: middle" alt="" hspace="2" vspace="0" /><a href="#XHTMLFormat(Request.currentURL)###top" class="section_footer" #doMouseover('top of page')#>top</a> |
<!--- Previous page link --->
<img src="#Request.ImagePath#icons/left.gif" border="0" style="vertical-align: middle" alt="" hspace="2" vspace="0" />
<a href="javascript: onClick = window.history.back()" class="section_footer" #doMouseover('previous page')#>previous page</a></td>
		<td align="right" class="section_footer" valign="top">
		<!--- Email page link --->
		<img src="#Request.ImagePath#icons/mail.gif" alt="" border="0" hspace="2" /><a href="javascript:newWindow=openWin('#request.self#?fuseaction=home.email&amp;page=#self#?fuseaction=feature.display^feature_id=#attributes.feature_id#','Email','width=700,height=750,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=1,resizable=1'); newWindow.focus();" class="section_footer" #doMouseover('tell a friend')#>email page</a> | 
		<!--- Print page link --->
		<img src="#Request.ImagePath#icons/print.gif" alt="" border="0" hspace="2" /><a href="" onclick="newWindow=openWin('#self#?fuseaction=feature.print&amp;feature_id=#attributes.feature_id#','Print','width=700,height=750,toolbar=0,location=0,directories=0,status=0,menubar=1,scrollBars=1,resizable=1'); return false;" class="section_footer" #doMouseover('print this article')#>print</a>
		</td>
	</tr>
	<!--- LINE ---><tr><td colspan="2" bgcolor="###Request.GetColors.linecolor#"><img src="#Request.ImagePath#spacer.gif" height="1" width="1" border="0" alt="" hspace="0" vspace="0" /></td></tr>
</table>
</cfoutput>

</div>
<!-- end feature/put_page_footer.cfm -->