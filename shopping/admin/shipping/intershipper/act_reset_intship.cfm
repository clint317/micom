
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is used to reset the cached query for the intershipper methods. Called from act_intship_method.cfm and act_save_intship_used.cfm --->

<!--- Reset cached query --->

<cfset Request.Cache = CreateTimeSpan(0, 0, 0, 0)>
<cfset Application.objShipping.getIntShipMethods()>



