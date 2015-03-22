<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CFML Test</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfoutput>
If ColdFusion is working then you'll see the date and time here: <cfoutput>#dateformat(now(), "dddd, mmmm dd, yyyy")# - #timeformat(now())#</cfoutput>
<br /><br />
#server.ColdFusion.ProductName# #server.ColdFusion.ProductLevel# Version: #server.ColdFusion.ProductVersion# (#server.OS.Name# #server.OS.Version#, #server.ColdFusion.AppServer# #server.ColdFusion.RootDir#)
<br>
Address: #cgi.HTTP_HOST# (#cgi.REMOTE_HOST#), Path: #cgi.PATH_TRANSLATED#
<br /><br />
Some ColdFusion Scope Dumps:<br>
</cfoutput>
<cfloop list="FORM,URL,SERVER,APPLICATION,SESSION,REQUEST,COOKIE,CGI" index="i">
    <h5>
       <cfoutput>#i#</cfoutput> VARIABLES
    </h5>
    <cftry>
       <cfswitch expression="#i#">
           <cfcase value="session">
               <!--- lock the session scoped variables --->
               <cflock timeout="10" type="READONLY" scope="SESSION">
                    <cfdump var="#evaluate(i)#"> 
               </cflock>
           </cfcase>
           <cfcase value="application">
               <!--- also should lock the application scoped variables --->
               <cflock timeout="10" type="READONLY" scope="APPLICATION">
                    <cfdump var="#evaluate(i)#"> 
               </cflock> 
           </cfcase>
           <cfdefaultcase>
                <cfdump var="#evaluate(i)#">
           </cfdefaultcase>
        </cfswitch>
        <cfcatch>
            <p>An error occurred while trying to display <strong><cfoutput>#i#</cfoutput></strong> variables.</p>
        </cfcatch>
    </cftry>
  </cfloop>
</body>
</html>
