<cfsilent>
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page outputs a copyright notice, useful as a footer on your layout pages --->

<!--- Make replacements for @ and . in address string to HIDE email address from spambots. --->
<cfset email = Replace(Request.AppSettings.MerchantEmail, "@", "&##64;", "All")>
<cfset email = Replace(email, ".", "&##46;", "All")>

</cfsilent>

<cfoutput>
<!-- start layouts/put_copyright.cfm -->
<div id="copyright">
&copy; #year(now())# <a href="mailto&##58;#email#">#Request.AppSettings.sitename#</a> 
&nbsp;All rights reserved.</div>
</div>
<!-- end layouts/put_copyright.cfm -->
</cfoutput>

