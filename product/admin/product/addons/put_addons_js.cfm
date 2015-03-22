<!--- CFWebstore, version 6.50 --->

<!--- CFWebstore is Copyright 1998-2013 by Dogpatch Software, All Rights Reserved. This code may not be copied or sold without permission of the original author. Dogpatch Software may be contacted at info@cfwebstore.com --->

<!--- This page is used to run the javascript checks for the custom addon form. Called from dsp_cust_addon.cfm --->

<cfprocessingdirective suppresswhitespace="no">
<script type="text/javascript">
function checkForm(thisform) {
        returnval=true;
        for (var j=0; j<(thisform.elements.length); j++)
                {
                indx = thisform.elements[j].name.indexOf('_required');
				indx2 = thisform.elements[j].name.indexOf('_float');
                if (indx != -1)
                        {
                        fieldname=thisform.elements[j].name.substring(0,indx);
                        if (thisform.elements[fieldname].value.length == 0)
                                {
                                alert(thisform.elements[j].value);
                                j = (thisform.elements.length);
                                returnval = false;
                                }
                        }
				else if (indx2 != -1) 
					{
					fieldname=thisform.elements[j].name.substring(0,indx2);
					var checkVal = parseFloat(thisform.elements[fieldname].value)
					if (isNaN(checkVal) && thisform.elements[fieldname].value.length != 0)
                           	{
                             alert(thisform.elements[j].value);
                          	 j = (thisform.elements.length);
                             returnval = false;
                            }
					}
						

                }
        return returnval;
        }
	
function CancelForm () {
	<cfoutput>location.href = "#self#?fuseaction=product.admin&product_ID=#attributes.product_id#&cid=#attributes.cid#&do=addons&redirect=yes#request.token2#";</cfoutput>
	}
</script>
</cfprocessingdirective>

