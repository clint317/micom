
<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This template flags a review for Admin review. It is invoked by a link in the Feature review:
<a href="#self#?fuseaction=Feature.reviews&do=flag&Review_ID=#Review_ID##request.token2#">Flag for Editor Review</a>
 --->

<!--- CSRF Check --->
<cfset keyname = "featReviewFlag">
<cfinclude template="../../includes/act_check_csrf_key.cfm">
	
<cfparam name="attributes.Review_ID" default="0">

<cfif isNumeric(attributes.Review_ID) AND attributes.Review_ID IS NOT 0>

	<cfquery name="Flag_Review" datasource="#request.ds#" username="#Request.DSuser#" password="#Request.DSpass#">
	UPDATE #Request.DB_Prefix#FeatureReviews
	SET	NeedsCheck = 1
		WHERE Review_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.Review_ID#">
	</CFQUERY>

</cfif>

<!--- Alert confirmation --->
<cfparam name = "attributes.message" default="This comment has been flagged for Editor Review.">
<cfparam name = "attributes.error_message" default="">
<cfparam name = "attributes.box_title" default="Thanks">
<cfparam name = "attributes.XFA_success" default="#Replace(session.page,self & '?','','ALL')#">
<cfinclude template="../../includes/form_confirmation.cfm">

<!---- Use the following if you don't want the alert confirmation 
<cflocation url="#session.page#" addtoken="NO">
---->

