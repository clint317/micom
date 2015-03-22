
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->
<cfif thistag.ExecutionMode is "start">

<cfparam name="Attributes.TitleText">
<cfparam name="Attributes.class" default=""> 

<cfoutput>
	<!-- customtags/puttitle.cfm -->
<h1 <cfif len(attributes.class)>class="#Attributes.class#"</cfif> style="color: ###Request.GetColors.MainTitle#">#Attributes.TitleText#</h1>
</cfoutput>

</cfif>


