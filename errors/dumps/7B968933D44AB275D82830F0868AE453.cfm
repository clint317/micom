
	
		
	    
	
		
	   
	   		








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Browser</td>
					<td>
					
						
							
			Mozilla/4.0 (compatible; MSIE8.0; Windows NT 6.0) .NET CLR 2.0.50727)
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">DateTime</td>
					<td>
					
						
							
			{ts '2015-03-16 21:19:43'}
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Diagnostics</td>
					<td>
					
						
							
			The request has exceeded the allowable time limit Tag: cfoutput  &lt;br&gt;The error occurred on line 56.
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">GeneratedContent</td>
					<td>
					
						
							
			
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTPReferer</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Mailto</td>
					<td>
					
						
							
			webmaster@mysticinsight.com
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Message</td>
					<td>
					
						
							
			The request has exceeded the allowable time limit Tag: cfoutput
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">QueryString</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">RemoteAddress</td>
					<td>
					
						
							
			61.141.201.160
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">RootCause</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Detail</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Message</td>
					<td>
					
						
							
			The request has exceeded the allowable time limit Tag: cfoutput
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">StackTrace</td>
					<td>
					
						
							
			coldfusion.runtime.RequestTimedOutException: The request has exceeded the allowable time limit Tag: cfoutput
	at coldfusion.tagext.io.OutputTag.doStartTag(OutputTag.java:149)
	at cfdump2ecfm565982208._factor54(E:\cf9_final\cfusion\wwwroot\WEB-INF\cftags\dump.cfm:119)
	at cfdump2ecfm565982208.runPage(E:\cf9_final\cfusion\wwwroot\WEB-INF\cftags\dump.cfm:1)
	at coldfusion.runtime.CfJspPage.invoke(CfJspPage.java:231)
	at coldfusion.filter.CFVariablesScopeFilter.invoke(CFVariablesScopeFilter.java:56)
	at coldfusion.tagext.lang.ModuleTag.doStartTag(ModuleTag.java:271)
	at coldfusion.runtime.CfJspPage._emptyTcfTag(CfJspPage.java:2722)
	at cfApplication2ecfc536915856$funcONERROR.runFunction(D:\Inetpub\mysticinsight\Application.cfc:56)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:472)
	at coldfusion.runtime.UDFMethod$ReturnTypeFilter.invoke(UDFMethod.java:405)
	at coldfusion.runtime.UDFMethod$ArgumentCollectionFilter.invoke(UDFMethod.java:368)
	at coldfusion.filter.FunctionAccessFilter.invoke(FunctionAccessFilter.java:55)
	at coldfusion.runtime.UDFMethod.runFilterChain(UDFMethod.java:321)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:220)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:490)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:336)
	at coldfusion.runtime.AppEventInvoker.invoke(AppEventInvoker.java:88)
	at coldfusion.runtime.AppEventInvoker.onError(AppEventInvoker.java:427)
	at coldfusion.filter.ApplicationFilter.invoke(ApplicationFilter.java:414)
	at coldfusion.filter.RequestMonitorFilter.invoke(RequestMonitorFilter.java:48)
	at coldfusion.filter.MonitoringFilter.invoke(MonitoringFilter.java:40)
	at coldfusion.filter.PathFilter.invoke(PathFilter.java:87)
	at coldfusion.filter.ExceptionFilter.invoke(ExceptionFilter.java:70)
	at coldfusion.filter.BrowserDebugFilter.invoke(BrowserDebugFilter.java:74)
	at coldfusion.filter.ClientScopePersistenceFilter.invoke(ClientScopePersistenceFilter.java:28)
	at coldfusion.filter.BrowserFilter.invoke(BrowserFilter.java:38)
	at coldfusion.filter.NoCacheFilter.invoke(NoCacheFilter.java:46)
	at coldfusion.filter.GlobalsFilter.invoke(GlobalsFilter.java:38)
	at coldfusion.filter.DatasourceFilter.invoke(DatasourceFilter.java:22)
	at coldfusion.filter.CachingFilter.invoke(CachingFilter.java:53)
	at coldfusion.CfmServlet.service(CfmServlet.java:201)
	at coldfusion.bootstrap.BootstrapServlet.service(BootstrapServlet.java:89)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:86)
	at com.intergral.fusionreactor.filter.FusionReactorFilter.c(FusionReactorFilter.java:428)
	at com.intergral.fusionreactor.filter.FusionReactorFilter.d(FusionReactorFilter.java:262)
	at com.intergral.fusionreactor.filter.FusionReactorFilter.doFilter(FusionReactorFilter.java:171)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:94)
	at coldfusion.monitor.event.MonitoringServletFilter.doFilter(MonitoringServletFilter.java:42)
	at coldfusion.bootstrap.BootstrapFilter.doFilter(BootstrapFilter.java:46)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:94)
	at jrun.servlet.FilterChain.service(FilterChain.java:101)
	at jrun.servlet.ServletInvoker.invoke(ServletInvoker.java:106)
	at jrun.servlet.JRunInvokerChain.invokeNext(JRunInvokerChain.java:42)
	at jrun.servlet.JRunRequestDispatcher.invoke(JRunRequestDispatcher.java:286)
	at jrun.servlet.ServletEngineService.dispatch(ServletEngineService.java:543)
	at jrun.servlet.jrpp.JRunProxyService.invokeRunnable(JRunProxyService.java:203)
	at jrunx.scheduler.ThreadPool$DownstreamMetrics.invokeRunnable(ThreadPool.java:320)
	at jrunx.scheduler.ThreadPool$ThreadThrottle.invokeRunnable(ThreadPool.java:428)
	at jrunx.scheduler.ThreadPool$UpstreamMetrics.invokeRunnable(ThreadPool.java:266)
	at jrunx.scheduler.WorkerThread.run(WorkerThread.java:66)
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Suppressed</td>
					<td>
					
						
							
			
				<table class="cfdump_array">
				<tr><th class="array" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - array
				[empty]</th></tr>
				

				
				

				
			</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TagContext</td>
					<td>
					
						
							
			
				<table class="cfdump_array">
				<tr><th class="array" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - array
				</th></tr>
				

				
				
					
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">1</td>
					<td>

					
                    	
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">COLUMN</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ID</td>
					<td>
					
						
							
			CFMODULE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">LINE</td>
					<td>
					
						
							
			56
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">RAW_TRACE</td>
					<td>
					
						
							
			at cfApplication2ecfc536915856$funcONERROR.runFunction(D:\Inetpub\mysticinsight\Application.cfc:56)
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TEMPLATE</td>
					<td>
					
						
							
			D:\Inetpub\mysticinsight\Application.cfc
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TYPE</td>
					<td>
					
						
							
			CFML
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
                    

					</td></tr>
				

				
			</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Type</td>
					<td>
					
						
							
			Application
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">tname</td>
					<td>
					
						
							
			cfoutput
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">StackTrace</td>
					<td>
					
						
							
			coldfusion.runtime.RequestTimedOutException: The request has exceeded the allowable time limit Tag: cfoutput
	at coldfusion.tagext.io.OutputTag.doStartTag(OutputTag.java:149)
	at cfdump2ecfm565982208._factor54(E:\cf9_final\cfusion\wwwroot\WEB-INF\cftags\dump.cfm:119)
	at cfdump2ecfm565982208.runPage(E:\cf9_final\cfusion\wwwroot\WEB-INF\cftags\dump.cfm:1)
	at coldfusion.runtime.CfJspPage.invoke(CfJspPage.java:231)
	at coldfusion.filter.CFVariablesScopeFilter.invoke(CFVariablesScopeFilter.java:56)
	at coldfusion.tagext.lang.ModuleTag.doStartTag(ModuleTag.java:271)
	at coldfusion.runtime.CfJspPage._emptyTcfTag(CfJspPage.java:2722)
	at cfApplication2ecfc536915856$funcONERROR.runFunction(D:\Inetpub\mysticinsight\Application.cfc:56)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:472)
	at coldfusion.runtime.UDFMethod$ReturnTypeFilter.invoke(UDFMethod.java:405)
	at coldfusion.runtime.UDFMethod$ArgumentCollectionFilter.invoke(UDFMethod.java:368)
	at coldfusion.filter.FunctionAccessFilter.invoke(FunctionAccessFilter.java:55)
	at coldfusion.runtime.UDFMethod.runFilterChain(UDFMethod.java:321)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:220)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:490)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:336)
	at coldfusion.runtime.AppEventInvoker.invoke(AppEventInvoker.java:88)
	at coldfusion.runtime.AppEventInvoker.onError(AppEventInvoker.java:427)
	at coldfusion.filter.ApplicationFilter.invoke(ApplicationFilter.java:414)
	at coldfusion.filter.RequestMonitorFilter.invoke(RequestMonitorFilter.java:48)
	at coldfusion.filter.MonitoringFilter.invoke(MonitoringFilter.java:40)
	at coldfusion.filter.PathFilter.invoke(PathFilter.java:87)
	at coldfusion.filter.ExceptionFilter.invoke(ExceptionFilter.java:70)
	at coldfusion.filter.BrowserDebugFilter.invoke(BrowserDebugFilter.java:74)
	at coldfusion.filter.ClientScopePersistenceFilter.invoke(ClientScopePersistenceFilter.java:28)
	at coldfusion.filter.BrowserFilter.invoke(BrowserFilter.java:38)
	at coldfusion.filter.NoCacheFilter.invoke(NoCacheFilter.java:46)
	at coldfusion.filter.GlobalsFilter.invoke(GlobalsFilter.java:38)
	at coldfusion.filter.DatasourceFilter.invoke(DatasourceFilter.java:22)
	at coldfusion.filter.CachingFilter.invoke(CachingFilter.java:53)
	at coldfusion.CfmServlet.service(CfmServlet.java:201)
	at coldfusion.bootstrap.BootstrapServlet.service(BootstrapServlet.java:89)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:86)
	at com.intergral.fusionreactor.filter.FusionReactorFilter.c(FusionReactorFilter.java:428)
	at com.intergral.fusionreactor.filter.FusionReactorFilter.d(FusionReactorFilter.java:262)
	at com.intergral.fusionreactor.filter.FusionReactorFilter.doFilter(FusionReactorFilter.java:171)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:94)
	at coldfusion.monitor.event.MonitoringServletFilter.doFilter(MonitoringServletFilter.java:42)
	at coldfusion.bootstrap.BootstrapFilter.doFilter(BootstrapFilter.java:46)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:94)
	at jrun.servlet.FilterChain.service(FilterChain.java:101)
	at jrun.servlet.ServletInvoker.invoke(ServletInvoker.java:106)
	at jrun.servlet.JRunInvokerChain.invokeNext(JRunInvokerChain.java:42)
	at jrun.servlet.JRunRequestDispatcher.invoke(JRunRequestDispatcher.java:286)
	at jrun.servlet.ServletEngineService.dispatch(ServletEngineService.java:543)
	at jrun.servlet.jrpp.JRunProxyService.invokeRunnable(JRunProxyService.java:203)
	at jrunx.scheduler.ThreadPool$DownstreamMetrics.invokeRunnable(ThreadPool.java:320)
	at jrunx.scheduler.ThreadPool$ThreadThrottle.invokeRunnable(ThreadPool.java:428)
	at jrunx.scheduler.ThreadPool$UpstreamMetrics.invokeRunnable(ThreadPool.java:266)
	at jrunx.scheduler.WorkerThread.run(WorkerThread.java:66)
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Suppressed</td>
					<td>
					
						
							
			
				<table class="cfdump_array">
				<tr><th class="array" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - array
				[empty]</th></tr>
				

				
				

				
			</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TagContext</td>
					<td>
					
						
							
			
				<table class="cfdump_array">
				<tr><th class="array" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - array
				</th></tr>
				

				
				
					
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">1</td>
					<td>

					
                    	
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ERROR - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">COLUMN</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ID</td>
					<td>
					
						
							
			CFMODULE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">LINE</td>
					<td>
					
						
							
			56
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">RAW_TRACE</td>
					<td>
					
						
							
			at cfApplication2ecfc536915856$funcONERROR.runFunction(D:\Inetpub\mysticinsight\Application.cfc:56)
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TEMPLATE</td>
					<td>
					
						
							
			D:\Inetpub\mysticinsight\Application.cfc
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TYPE</td>
					<td>
					
						
							
			CFML
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
                    

					</td></tr>
				

				
			</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Template</td>
					<td>
					
						
							
			/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Type</td>
					<td>
					
						
							
			coldfusion.runtime.CfErrorWrapper
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	    
	
		
	   
	   		
	   		
				
					
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
					
				
			
				
			
				
			
				
			
	   	  








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Application - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">applicationname</td>
					<td>
					
						
							
			maindata
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">reload_cfcs</td>
					<td>
					
						
							
			true
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">sqlchecker</td>
					<td>
					
						
							
			
			    
				
					
					
						
						
						
						
						
						
						
					
					
				
					
						
					
					

				
				<table class="cfdump_object">
				<tr><th class="object" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Application -  object  of java.util.regex.Pattern<br>
				
				</th></tr>
				

				
				    
					
						
					
					
						<tr>
							<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Class Name</td>
							<td>java.util.regex.Pattern</td>
						</tr>
					


					
					
						
							<tr>
								<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Methods</td>
								<td>
								<table class="cfdump_object">
									<tr><th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Method

										</th>
										<th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Return Type
										</th>
									</tr>
						
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">compile(java.lang.String)</td>
										<td>java.util.regex.Pattern</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">compile(java.lang.String, int)</td>
										<td>java.util.regex.Pattern</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">flags()</td>
										<td>int</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">matcher(java.lang.CharSequence)</td>
										<td>java.util.regex.Matcher</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">matches(java.lang.String, java.lang.CharSequence)</td>
										<td>boolean</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">pattern()</td>
										<td>java.lang.String</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">quote(java.lang.String)</td>
										<td>java.lang.String</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">split(java.lang.CharSequence, int)</td>
										<td>java.lang.String[]</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">split(java.lang.CharSequence)</td>
										<td>java.lang.String[]</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">toString()</td>
										<td>java.lang.String</td>
									</tr>
								
						
						</table></td></tr>

					

					
						
						
							
								<tr>
									<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Fields</td>
									<td>
									<table class="cfdump_object">
										<tr><th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Field
											</th>
											<th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Value
											</th>
										</tr>
							
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;CANON_EQ</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        128
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;CASE_INSENSITIVE</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        2
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;COMMENTS</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        4
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;DOTALL</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        32
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;LITERAL</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        16
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;MULTILINE</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        8
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;UNICODE_CASE</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        64
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;UNICODE_CHARACTER_CLASS</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        256
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;UNIX_LINES</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        1
                                                    
												
											</td>
										</tr>
									
							
							</table></td></tr>

						
					
					
							
					
					
				 
				
				</table>
				
			
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">xsschecker</td>
					<td>
					
						
							
			
			    
				
					
					
						
						
						
						
						
						
						
					
					
				
					
						
					
					

				
				<table class="cfdump_object">
				<tr><th class="object" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Application -  object  of java.util.regex.Pattern<br>
				
				</th></tr>
				

				
				    
					
						
					
					
						<tr>
							<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Class Name</td>
							<td>java.util.regex.Pattern</td>
						</tr>
					


					
					
						
							<tr>
								<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Methods</td>
								<td>
								<table class="cfdump_object">
									<tr><th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Method

										</th>
										<th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Return Type
										</th>
									</tr>
						
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">compile(java.lang.String)</td>
										<td>java.util.regex.Pattern</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">compile(java.lang.String, int)</td>
										<td>java.util.regex.Pattern</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">flags()</td>
										<td>int</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">matcher(java.lang.CharSequence)</td>
										<td>java.util.regex.Matcher</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">matches(java.lang.String, java.lang.CharSequence)</td>
										<td>boolean</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">pattern()</td>
										<td>java.lang.String</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">quote(java.lang.String)</td>
										<td>java.lang.String</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">split(java.lang.CharSequence, int)</td>
										<td>java.lang.String[]</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">split(java.lang.CharSequence)</td>
										<td>java.lang.String[]</td>
									</tr>
								
						
								
								
									<tr>
										<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">toString()</td>
										<td>java.lang.String</td>
									</tr>
								
						
						</table></td></tr>

					

					
						
						
							
								<tr>
									<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">Fields</td>
									<td>
									<table class="cfdump_object">
										<tr><th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Field
											</th>
											<th class="object"  onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Value
											</th>
										</tr>
							
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;CANON_EQ</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        128
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;CASE_INSENSITIVE</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        2
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;COMMENTS</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        4
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;DOTALL</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        32
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;LITERAL</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        16
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;MULTILINE</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        8
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;UNICODE_CASE</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        64
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;UNICODE_CHARACTER_CLASS</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        256
                                                    
												
											</td>
										</tr>
									
							
                                   
									
										<tr>
											<td class="object" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">int&nbsp;UNIX_LINES</td>
											<td>
												
                                                    
                                                    
                                                    
                                                        1
                                                    
												
											</td>
										</tr>
									
							
							</table></td></tr>

						
					
					
							
					
					
				 
				
				</table>
				
			
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	   	  
	    
	
		
	   
	      	
	      	
				
			
			








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">ATTRIBUTES - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">FUSEACTION</td>
					<td>
					
						
							
			page.home
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	    
	
		
	    
	
		
	   
	      	
	      	
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
			








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">CGI - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">AUTH_PASSWORD</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">AUTH_TYPE</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">AUTH_USER</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_COOKIE</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_FLAGS</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_ISSUER</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_KEYSIZE</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_SECRETKEYSIZE</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_SERIALNUMBER</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_SERVER_ISSUER</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_SERVER_SUBJECT</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CERT_SUBJECT</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CF_TEMPLATE_PATH</td>
					<td>
					
						
							
			D:\Inetpub\mysticinsight\index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CONTENT_LENGTH</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CONTENT_TYPE</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CONTEXT_PATH</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">GATEWAY_INTERFACE</td>
					<td>
					
						
							
			CGI/1.1
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTPS</td>
					<td>
					
						
							
			off
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTPS_KEYSIZE</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTPS_SECRETKEYSIZE</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTPS_SERVER_ISSUER</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTPS_SERVER_SUBJECT</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_ACCEPT</td>
					<td>
					
						
							
			text/html
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_ACCEPT_ENCODING</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_ACCEPT_LANGUAGE</td>
					<td>
					
						
							
			zh-cn
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_CONNECTION</td>
					<td>
					
						
							
			Keep-Alive
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_COOKIE</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_HOST</td>
					<td>
					
						
							
			www.mysticinsight.com
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_REFERER</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HTTP_USER_AGENT</td>
					<td>
					
						
							
			Mozilla/4.0 (compatible; MSIE8.0; Windows NT 6.0) .NET CLR 2.0.50727)
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">PATH_INFO</td>
					<td>
					
						
							
			/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">PATH_TRANSLATED</td>
					<td>
					
						
							
			D:\Inetpub\mysticinsight\index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">QUERY_STRING</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">REMOTE_ADDR</td>
					<td>
					
						
							
			61.141.201.160
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">REMOTE_HOST</td>
					<td>
					
						
							
			61.141.201.160
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">REMOTE_USER</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">REQUEST_METHOD</td>
					<td>
					
						
							
			GET
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SCRIPT_NAME</td>
					<td>
					
						
							
			/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SERVER_NAME</td>
					<td>
					
						
							
			www.mysticinsight.com
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SERVER_PORT</td>
					<td>
					
						
							
			80
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SERVER_PORT_SECURE</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SERVER_PROTOCOL</td>
					<td>
					
						
							
			HTTP/1.1
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SERVER_SOFTWARE</td>
					<td>
					
						
							
			Microsoft-IIS/7.5
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">WEB_SERVER_API</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	    
	
		
	   
	   		








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">CLIENT - struct [empty]</th></tr>
			
			
			</table>
		
			
			
		
	







	    
	
		
	    
	
		
	   
	   		








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">FILE - struct [empty]</th></tr>
			
			
			</table>
		
			
			
		
	







	    
	
		
	   
	      	
	      	
			








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">FORM - struct [empty]</th></tr>
			
			
			</table>
		
			
			
		
	







	    
	
		
	   
	      	
	      	
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
			








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">REQUEST - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">addtoken</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">allowextensions</td>
					<td>
					
						
							
			jpg,jpeg,gif,png,pdf,doc,mov,ppt,zip,txt,xls
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">appsettings</td>
					<td>
					
						
							
		
		<table class="cfdump_query">
			<tr>
			
			
				<th class="query" colspan="55" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">REQUEST - query</th>
				</tr>
			
				<tr bgcolor="eeaaaa" >
				<td class="query"   style="cursor:hand;" title="click to collapse" onClick="cfdump_toggleRow_qry(this);">&nbsp;</td>
				
				<td class="query">ADMIN_NEW_WINDOW</td>
				
				<td class="query">ALLOWWHOLESALE</td>
				
				<td class="query">CACHEDPRODS</td>
				
				<td class="query">CCOLUMNS</td>
				
				<td class="query">COLLECTIONNAME</td>
				
				<td class="query">COLOR_ID</td>
				
				<td class="query">CURREXCHANGE</td>
				
				<td class="query">CURREXLABEL</td>
				
				<td class="query">DEFAULTIMAGES</td>
				
				<td class="query">DEFAULT_FUSEACTION</td>
				
				<td class="query">EDITOR</td>
				
				<td class="query">EMAIL_PORT</td>
				
				<td class="query">EMAIL_SERVER</td>
				
				<td class="query">FEATUREREVIEWS</td>
				
				<td class="query">FEATUREREVIEW_ADD</td>
				
				<td class="query">FEATUREREVIEW_APPROVE</td>
				
				<td class="query">FEATUREREVIEW_FLAG</td>
				
				<td class="query">FEATUREROOT</td>
				
				<td class="query">FILEPATH</td>
				
				<td class="query">GIFTREGISTRY</td>
				
				<td class="query">HOMECOUNTRY</td>
				
				<td class="query">INVLEVEL</td>
				
				<td class="query">ITEMSORT</td>
				
				<td class="query">KEYWORDS</td>
				
				<td class="query">LOCALE</td>
				
				<td class="query">MAXFEATURES</td>
				
				<td class="query">MAXPRODS</td>
				
				<td class="query">MERCHANT</td>
				
				<td class="query">MERCHANTEMAIL</td>
				
				<td class="query">METADESCRIPTION</td>
				
				<td class="query">MIMETYPES</td>
				
				<td class="query">MONEYUNIT</td>
				
				<td class="query">ORDERBUTTONIMAGE</td>
				
				<td class="query">ORDERBUTTONTEXT</td>
				
				<td class="query">OUTOFSTOCK</td>
				
				<td class="query">PCOLUMNS</td>
				
				<td class="query">PRODROOT</td>
				
				<td class="query">PRODUCTREVIEWS</td>
				
				<td class="query">PRODUCTREVIEWS_PAGE</td>
				
				<td class="query">PRODUCTREVIEW_ADD</td>
				
				<td class="query">PRODUCTREVIEW_APPROVE</td>
				
				<td class="query">PRODUCTREVIEW_FLAG</td>
				
				<td class="query">PRODUCTREVIEW_RATE</td>
				
				<td class="query">SETTINGID</td>
				
				<td class="query">SHOWINSTOCK</td>
				
				<td class="query">SHOWRETAIL</td>
				
				<td class="query">SITELOGO</td>
				
				<td class="query">SITENAME</td>
				
				<td class="query">SIZEUNIT</td>
				
				<td class="query">USESES</td>
				
				<td class="query">USEVERITY</td>
				
				<td class="query">WEBMASTER</td>
				
				<td class="query">WEIGHTUNIT</td>
				
				<td class="query">WISHLISTS</td>
				
				</tr>
				
				
				<tr >
				<td   style="cursor:hand;" title="click to collapse" onClick="cfdump_toggleRow_qry(this);" class="query">1</td>
				
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			2
		</td>
				
					<td valign="top">
			[empty string]
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			None
		</td>
				
					<td valign="top">
			[empty string]
		</td>
				
					<td valign="top">
			images
		</td>
				
					<td valign="top">
			page.home
		</td>
				
					<td valign="top">
			Default
		</td>
				
					<td valign="top">
			25
		</td>
				
					<td valign="top">
			mail.mysticinsight.com
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			2
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			[empty string]
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			US^United States
		</td>
				
					<td valign="top">
			None
		</td>
				
					<td valign="top">
			Name
		</td>
				
					<td valign="top">
			metaphysical, store, mystic, mystical, psychic, astrology
		</td>
				
					<td valign="top">
			English (US)
		</td>
				
					<td valign="top">
			6
		</td>
				
					<td valign="top">
			10
		</td>
				
					<td valign="top">
			48 Cochise Ct&lt;br/&gt;
Palm Coast FL 32137
		</td>
				
					<td valign="top">
			service@mysticinsight.com
		</td>
				
					<td valign="top">
			A metaphysical store for the mystically spiritual.
		</td>
				
					<td valign="top">
			application/x-zip-compressed,application/zip, application/msword, application/x-excel, 

text/plain, application/pdf, image/gif, image/jpeg, image/pjpeg, image/png, audio/mpeg
		</td>
				
					<td valign="top">
			Dollars
		</td>
				
					<td valign="top">
			addtocart.gif
		</td>
				
					<td valign="top">
			Add to Cart
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			2
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			2
		</td>
				
					<td valign="top">
			2
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			defaultlayout/headerbartop.png
		</td>
				
					<td valign="top">
			MysticInsight.com
		</td>
				
					<td valign="top">
			Inches
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			0
		</td>
				
					<td valign="top">
			webmaster@mysticinsight.com
		</td>
				
					<td valign="top">
			Pounds
		</td>
				
					<td valign="top">
			1
		</td>
				
				</tr>
				
			


			
			
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">browsertype</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">REQUEST - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BROWSERNAME</td>
					<td>
					
						
							
			MSIE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BROWSERVERSION</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HACKATTEMPT</td>
					<td>
					
						
							
			no
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">cache</td>
					<td>
					
						
							
			0.0416666666667
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">cfcmapping</td>
					<td>
					
						
							
			/cfcs
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">cfdumpinited</td>
					<td>
					
						
							
			false
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">color_id</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">db_prefix</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">dbtype</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">demomode</td>
					<td>
					
						
							
			no
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">developmentmode</td>
					<td>
					
						
							
			no
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">downloadpath</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ds</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">dspass</td>
					<td>
					
						
							
			dyn317
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">dsuser</td>
					<td>
					
						
							
			carla317
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">encrypt_key</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">errordirectory</td>
					<td>
					
						
							
			D:\inetpub\mysticinsight\errors\dumps\
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">errordomain</td>
					<td>
					
						
							
			https://www.mysticinsight.com/index.cfm?fuseaction=home.admin&amp;error=display&amp;ID=
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">getcolors</td>
					<td>
					
						
							
		
		<table class="cfdump_query">
			<tr>
			
			
				<th class="query" colspan="33" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">REQUEST - query</th>
				</tr>
			
				<tr bgcolor="eeaaaa" >
				<td class="query"   style="cursor:hand;" title="click to collapse" onClick="cfdump_toggleRow_qry(this);">&nbsp;</td>
				
				<td class="query">BGCOLOR</td>
				
				<td class="query">BGIMAGE</td>
				
				<td class="query">BOXHBGCOLOR</td>
				
				<td class="query">BOXHTEXT</td>
				
				<td class="query">BOXTBGCOLOR</td>
				
				<td class="query">BOXTTEXT</td>
				
				<td class="query">COLOR_ID</td>
				
				<td class="query">FORMREQ</td>
				
				<td class="query">FORMREQOB</td>
				
				<td class="query">HOTIMAGE</td>
				
				<td class="query">INPUTHBGCOLOR</td>
				
				<td class="query">INPUTHTEXT</td>
				
				<td class="query">INPUTTBGCOLOR</td>
				
				<td class="query">INPUTTTEXT</td>
				
				<td class="query">LAYOUTFILE</td>
				
				<td class="query">LINECOLOR</td>
				
				<td class="query">MAINLINEIMAGE</td>
				
				<td class="query">MAINLINK</td>
				
				<td class="query">MAINTEXT</td>
				
				<td class="query">MAINTITLE</td>
				
				<td class="query">MAINVLINK</td>
				
				<td class="query">MINORLINEIMAGE</td>
				
				<td class="query">NEWIMAGE</td>
				
				<td class="query">OUTPUTHBGCOLOR</td>
				
				<td class="query">OUTPUTHTEXT</td>
				
				<td class="query">OUTPUTTALTCOLOR</td>
				
				<td class="query">OUTPUTTBGCOLOR</td>
				
				<td class="query">OUTPUTTHIGHLIGHT</td>
				
				<td class="query">OUTPUTTTEXT</td>
				
				<td class="query">PALETTE_NAME</td>
				
				<td class="query">PASSPARAM</td>
				
				<td class="query">SALEIMAGE</td>
				
				</tr>
				
				
				<tr >
				<td   style="cursor:hand;" title="click to collapse" onClick="cfdump_toggleRow_qry(this);" class="query">1</td>
				
				
					<td valign="top">
			FFFFFC
		</td>
				
					<td valign="top">
			[empty string]
		</td>
				
					<td valign="top">
			999999
		</td>
				
					<td valign="top">
			ffffff
		</td>
				
					<td valign="top">
			DBDBDB
		</td>
				
					<td valign="top">
			000000
		</td>
				
					<td valign="top">
			1
		</td>
				
					<td valign="top">
			ff3300
		</td>
				
					<td valign="top">
			ff3300
		</td>
				
					<td valign="top">
			hot.jpg
		</td>
				
					<td valign="top">
			8696b6
		</td>
				
					<td valign="top">
			ffffff
		</td>
				
					<td valign="top">
			ffffff
		</td>
				
					<td valign="top">
			000000
		</td>
				
					<td valign="top">
			[empty string]
		</td>
				
					<td valign="top">
			000000
		</td>
				
					<td valign="top">
			HR
		</td>
				
					<td valign="top">
			560099
		</td>
				
					<td valign="top">
			241132
		</td>
				
					<td valign="top">
			666699
		</td>
				
					<td valign="top">
			54521C
		</td>
				
					<td valign="top">
			HR
		</td>
				
					<td valign="top">
			new.gif
		</td>
				
					<td valign="top">
			acaba9
		</td>
				
					<td valign="top">
			ffffff
		</td>
				
					<td valign="top">
			FAF287
		</td>
				
					<td valign="top">
			ffffcc
		</td>
				
					<td valign="top">
			C2C8CE
		</td>
				
					<td valign="top">
			242215
		</td>
				
					<td valign="top">
			CFWebstore Basic
		</td>
				
					<td valign="top">
			[empty string]
		</td>
				
					<td valign="top">
			sale.gif
		</td>
				
				</tr>
				
			


			
			
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">hotimage</td>
					<td>
					
						
							
			&lt;img src=&quot;/images/hot.jpg&quot; border=&quot;0&quot; style=&quot;vertical-align: middle&quot; alt=&quot;HOT!&quot; /&gt;
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">imagepath</td>
					<td>
					
						
							
			/images/
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">mainline</td>
					<td>
					
						
							
			HR
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">mimetypes</td>
					<td>
					
						
							
			image/gif, image/jpeg, image/pjpeg, image/png, application/x-zip-compressed, application/zip, application/msword, application/powerpoint, application/x-excel, text/plain, application/pdf, audio/mpeg
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">minorline</td>
					<td>
					
						
							
			HR
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">newimage</td>
					<td>
					
						
							
			&lt;img src=&quot;/images/new.gif&quot; border=&quot;0&quot; style=&quot;vertical-align: middle&quot; alt=&quot;New!&quot; /&gt;
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">reg_form</td>
					<td>
					
						
							
			register
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">registrybutton</td>
					<td>
					
						
							
			addtoregistry.gif
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">saleimage</td>
					<td>
					
						
							
			&lt;img src=&quot;/images/sale.gif&quot; border=&quot;0&quot; style=&quot;vertical-align: middle&quot; alt=&quot;On Sale!&quot; /&gt;
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">secure_cookie</td>
					<td>
					
						
							
			yes
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">secureself</td>
					<td>
					
						
							
			https://www.mysticinsight.com/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">secureurl</td>
					<td>
					
						
							
			https://www.mysticinsight.com/
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">securevars</td>
					<td>
					
						
							
			CFID,CFTOKEN,user,pass,ds,DownloadPath,dbtype,servertype,encrypt_key,username,password,nameoncard,CardNumber,CVV2,CardZip,HTTP_COOKIE,SessionID,URLToken
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">self</td>
					<td>
					
						
							
			http://www.mysticinsight.com/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">servertype</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">sesdummyextension</td>
					<td>
					
						
							
			cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">sessiontimeout</td>
					<td>
					
						
							
			0.0138888888889
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">sharedssl</td>
					<td>
					
						
							
			no
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">slash</td>
					<td>
					
						
							
			\
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">sql_bit</td>
					<td>
					
						
							
			CF_SQL_TINYINT
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">storepath</td>
					<td>
					
						
							
			/
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">storeself</td>
					<td>
					
						
							
			http://www.mysticinsight.com/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">storeurl</td>
					<td>
					
						
							
			http://www.mysticinsight.com/
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">temppath</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">thefilename</td>
					<td>
					
						
							
			7B968933D44AB275D82830F0868AE453
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">thisself</td>
					<td>
					
						
							
			index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">token1</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">token2</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">varstodump</td>
					<td>
					
						
							
			CFCATCH,ERROR,APPLICATION,ATTRIBUTES,CALLER,CGI,CLIENT,CFHTTP,FILE,FORM,REQUEST,SESSION,THIS,THISTAG,URL,VARIABLES,SERVER
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">varstoscrub</td>
					<td>
					
						
							
			ATTRIBUTES,CGI,FORM,REQUEST,SESSION,URL,VARIABLES
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	    
	
		
	   
	      	
	      	
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
			
				
					
				
			
				
					
				
			
				
			
				
			
				
					
				
			
			








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">SESSION - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">affiliate</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">basketnum</td>
					<td>
					
						
							
			4208021194361141201160
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">baskettotals</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">cfid</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">cftoken</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">coup_code</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">formkeys</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">SESSION - struct [empty]</th></tr>
			
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">gift_cert</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">group_id</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">page</td>
					<td>
					
						
							
			http://www.mysticinsight.com/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">realname</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">referrer</td>
					<td>
					
						
							
			Unknown
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">sessionid</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">urltoken</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">user_id</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">username</td>
					<td>
					
						
							
			removed
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">userpermissions</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">wholesaler</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	    
	
		
	    
	
		
	    
	
		
	   
	      	
	      	
			








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">URL - struct [empty]</th></tr>
			
			
			</table>
		
			
			
		
	







	    
	
		
	   
	     
	     	
	   		
				
			
				
					
				
			
				
					
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
					
				
			
				
					
				
			
				
					
				
			
				
					
				
			
				
					
				
			
				
			
				
			
				
			
				
			
				
					
				
			
				
			
				
			
				
			
				
					
				
			
				
					
				
			
				
					
				
			
				
			
				
					
				
			
				
			
				
					
				
			
				
						
	   	  








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BASEVARNAME</td>
					<td>
					
						
							
			baseHREF
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BROWSERINFO</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BROWSERNAME</td>
					<td>
					
						
							
			MSIE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BROWSERVERSION</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HACKATTEMPT</td>
					<td>
					
						
							
			no
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BROWSERNAME</td>
					<td>
					
						
							
			MSIE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">BROWSERVERSION</td>
					<td>
					
						
							
			0
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CFQUERY.EXECUTIONTIME</td>
					<td>
					
						
							
			47
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CHECKFORFORMATTACK</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function checkforFormAttack</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td><i>Arguments:</i></td><td>none</td>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>Any<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>This function checks the Form scope only for XSS and SQL injection This is used only for public users</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CHECKNULL</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function CheckNull</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td colspan="2">
				<i>Arguments:</i>
				<br>
				<table class="cfdump_udfarguments">
					<tr>
						<th><b>Name</b></th>
						<th><b>Required</b></th>
						<th><b>Type</b></th>
						<th><b>Default</b></th>
					</tr>
					
					<tr>
						<td>val</td>
						<td>Optional</td>
						<td>Any</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>Any<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CHECKPARAMS</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CLEANHIGHASCII</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function CleanHighAscii</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td colspan="2">
				<i>Arguments:</i>
				<br>
				<table class="cfdump_udfarguments">
					<tr>
						<th><b>Name</b></th>
						<th><b>Required</b></th>
						<th><b>Type</b></th>
						<th><b>Default</b></th>
					</tr>
					
					<tr>
						<td>Text</td>
						<td>Required</td>
						<td>string</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>string<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>false</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>Cleans extended ascii values to make the as web safe as possible.</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CLEANPATHINFO</td>
					<td>
					
						
							
			/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">COOKIESON</td>
					<td>
					
						
							
			1
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CURRENTPATH</td>
					<td>
					
						
							
			/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">DUMMYEXTENSION</td>
					<td>
					
						
							
			cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">EACH</td>
					<td>
					
						
							
			sessionid
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">EMPTYSTRING</td>
					<td>
					
						
							
			null
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">FB_</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">PATHARRAY</td>
					<td>
					
						
							
			
				<table class="cfdump_array">
				<tr><th class="array" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - array
				[empty]</th></tr>
				

				
				

				
			</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SETTINGSDONE</td>
					<td>
					
						
							
			FALSE
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">FUSEBOX</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CIRCUITS</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ACCESS</td>
					<td>
					
						
							
			home/access
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CATEGORY</td>
					<td>
					
						
							
			home/category
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">FEATURE</td>
					<td>
					
						
							
			home/feature
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">HOME</td>
					<td>
					
						
							
			home
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">PAGE</td>
					<td>
					
						
							
			home/page
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">PRODUCT</td>
					<td>
					
						
							
			home/product
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SHOPPING</td>
					<td>
					
						
							
			home/shopping
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">USERS</td>
					<td>
					
						
							
			home/users
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CURRENTPATH</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ISHOMECIRCUIT</td>
					<td>
					
						
							
			TRUE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ISTARGETCIRCUIT</td>
					<td>
					
						
							
			FALSE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ROOTPATH</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SUPPRESSERRORS</td>
					<td>
					
						
							
			FALSE
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">THISLAYOUTPATH</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">FUSEBOXOSNAME</td>
					<td>
					
						
							
			Windows Server 2008 R2
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">FUSEBOXVERSION</td>
					<td>
					
						
							
			900
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">GETBROWSERTYPE</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function getBrowserType</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td colspan="2">
				<i>Arguments:</i>
				<br>
				<table class="cfdump_udfarguments">
					<tr>
						<th><b>Name</b></th>
						<th><b>Required</b></th>
						<th><b>Type</b></th>
						<th><b>Default</b></th>
					</tr>
					
					<tr>
						<td>user_agent</td>
						<td>Optional</td>
						<td>Any</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>Any<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">ISEMAIL</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function isEmail</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td colspan="2">
				<i>Arguments:</i>
				<br>
				<table class="cfdump_udfarguments">
					<tr>
						<th><b>Name</b></th>
						<th><b>Required</b></th>
						<th><b>Type</b></th>
						<th><b>Default</b></th>
					</tr>
					
					<tr>
						<td>str</td>
						<td>Optional</td>
						<td>Any</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>Any<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>Tests passed value to see if it is a valid e-mail address (supports subdomain nesting and new top-level domains). Update by David Kearns to support ' SBrown@xacting.com pointing out regex still wasn't accepting ' correctly. More TLDs Version 4 by P Farrel, supports limits on u/h</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">LOCALE</td>
					<td>
					
						
							
			English (US)
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">LOOPITEM</td>
					<td>
					
						
							
			VARIABLES
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">PUTDEBUG</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function putDebug</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td colspan="2">
				<i>Arguments:</i>
				<br>
				<table class="cfdump_udfarguments">
					<tr>
						<th><b>Name</b></th>
						<th><b>Required</b></th>
						<th><b>Type</b></th>
						<th><b>Default</b></th>
					</tr>
					
					<tr>
						<td>strDebug</td>
						<td>Optional</td>
						<td>Any</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>Any<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SCRUBBEDVARS</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - struct [empty]</th></tr>
			
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SELF</td>
					<td>
					
						
							
			http://www.mysticinsight.com/index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SESRBASENAME</td>
					<td>
					
						
							
			baseHREF
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">STRBLACKLIST</td>
					<td>
					
						
							
			((or)+[[:space:]]*\(*'?[[:print:]]+'?([[:space:]]*[\+\-\/\*][[:space:]]*'?[[:print:]]+'?)*\)*[[:space:]]*(([=&gt;&lt;!]{1,2}|(like))[[:space:]]*\(*'?[[:print:]]+'?([[:space:]]*[\+\-\/\*][[:space:]]*'?[[:print:]]+'?)*\)*)|((in)[[:space:]]*\(+[[:space:]]*'?[[:print:]]+'?(\,[[:space:]]*'?[[:print:]]+'?)*\)+)|((between)[[:space:]]*\(*[[:space:]]*'?[[:print:]]+'?(\,[[:space:]]*'?[[:print:]]+'?)*\)*(and)[[:space:]]+\(*[[:space:]]*'?[[:print:]]+'?(\,[[:space:]]*'?[[:print:]]+'?)*\)*)|((;)([^a-z&gt;]*)(insert|delete|select|update|create|alter|drop|truncate|grant|revoke|declare|exec|backup|restore|sp_|xp_|set|execute|dbcc|deny|union|Cast|Char|Varchar|nChar|nVarchar)([^a-z]+|$))|(union[^a-z]+(all|select))|(\/\*)|(--$))
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">STRIPZEROS</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function stripZeros</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td colspan="2">
				<i>Arguments:</i>
				<br>
				<table class="cfdump_udfarguments">
					<tr>
						<th><b>Name</b></th>
						<th><b>Required</b></th>
						<th><b>Type</b></th>
						<th><b>Default</b></th>
					</tr>
					
					<tr>
						<td>str</td>
						<td>Optional</td>
						<td>Any</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>Any<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">STRXSS</td>
					<td>
					
						
							
			((\%3C)|&lt;)((\%2F)|\/)*[a-zA-Z0-9\%]+
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">S_BASE</td>
					<td>
					
						
							
			http://www.mysticinsight.com/
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">S_PORT</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">S_PREFIX</td>
					<td>
					
						
							
			http
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TESTQUERYSTRING</td>
					<td>
					
						
							
		
		<table class="cfdump_udf" width="100%">
		<tr><th class="udf" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">Variables - function testQueryString</b></th></tr>
		<tr>
			<td>
			<table class="cfdump_udfbody">
			<tr>
				
				<td colspan="2">
				<i>Arguments:</i>
				<br>
				<table class="cfdump_udfarguments">
					<tr>
						<th><b>Name</b></th>
						<th><b>Required</b></th>
						<th><b>Type</b></th>
						<th><b>Default</b></th>
					</tr>
					
					<tr>
						<td>browserType</td>
						<td>Optional</td>
						<td>Any</td>
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>query_string</td>
						<td>Optional</td>
						<td>Any</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
				
			</tr>
			<tr><td width="30%"><i>ReturnType:</i></td>
				<td>Any<br></td>
			</tr>
			<tr><td><i>Roles:</i></td>
				<td>&nbsp;<br></td>
			</tr>
			<tr><td><i>Access:</i></td>
				<td>public</br></td>
			</tr>
			<tr><td><i>Output:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>DisplayName:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Hint:</i></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><i>Description:</i></td>
				<td>&nbsp;</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">THISSELF</td>
					<td>
					
						
							
			index.cfm
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">TOPDIRECTORY</td>
					<td>
					
						
							
			D:\inetpub\mysticinsight\
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">baseHREF</td>
					<td>
					
						
							
			http://www.mysticinsight.com/
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	   	 
	
		
	   
	   		








	
	
	










































	

	

	

	
	
	

	

	
		
			
		
	

	

	

	
	
	

	
	
		
		
		
	

	
		
	





	
	
	










		
		
		
		

		
			
			
			
			
		

		
			
			
			
		

		

		
			
			
			
			
			
			
			
			
			
			
			
		

		

			 <style>



	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}


</style> 

			
				
				 <script language="javascript">



// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}


</script> 
			

			
			

			

			
			
				
				
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">SERVER - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">coldfusion</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">SERVER - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">InstallKit</td>
					<td>
					
						
							
			Native Windows
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">SERVICETAGATTRIBUTES</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">SERVER - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">CFQUERY</td>
					<td>
					
						
							
			blockfactor,cachedafter,cachedwithin,datasource,dbname,dbtype,debug,maxrows,name,password,result,sql,timeout,username
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">appserver</td>
					<td>
					
						
							
			JRun4
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">expiration</td>
					<td>
					
						
							
			{ts '2015-03-16 21:16:56'}
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">productlevel</td>
					<td>
					
						
							
			Enterprise
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">productname</td>
					<td>
					
						
							
			ColdFusion Server
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">productversion</td>
					<td>
					
						
							
			9,0,0,251028
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">rootdir</td>
					<td>
					
						
							
			C:\ColdFusion9
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">supportedlocales</td>
					<td>
					
						
							
			Chinese (China),Chinese (Hong Kong),Chinese (Taiwan),Dutch (Belgian),Dutch (Standard),English (Australian),English (Canadian),English (New Zealand),English (UK),English (US),French (Belgian),French (Canadian),French (Standard),French (Swiss),German (Austrian),German (Standard),German (Swiss),Italian (Standard),Italian (Swiss),Japanese,Korean,Norwegian (Bokmal),Norwegian (Nynorsk),Portuguese (Brazilian),Portuguese (Standard),Spanish (Mexican),Spanish (Modern),Spanish (Standard),Swedish,ar,ar_AE,ar_BH,ar_DZ,ar_EG,ar_IQ,ar_JO,ar_KW,ar_LB,ar_LY,ar_MA,ar_OM,ar_QA,ar_SA,ar_SD,ar_SY,ar_TN,ar_YE,be,be_BY,bg,bg_BG,ca,ca_ES,cs,cs_CZ,da,da_DK,de,de_AT,de_CH,de_DE,de_LU,el,el_CY,el_GR,en,en_AU,en_CA,en_GB,en_IE,en_IN,en_MT,en_NZ,en_PH,en_SG,en_US,en_ZA,es,es_AR,es_BO,es_CL,es_CO,es_CR,es_DO,es_EC,es_ES,es_GT,es_HN,es_MX,es_NI,es_PA,es_PE,es_PR,es_PY,es_SV,es_US,es_UY,es_VE,et,et_EE,fi,fi_FI,fr,fr_BE,fr_CA,fr_CH,fr_FR,fr_LU,ga,ga_IE,hi_IN,hr,hr_HR,hu,hu_HU,in,in_ID,is,is_IS,it,it_CH,it_IT,iw,iw_IL,ja,ja_JP,ja_JP_JP_#u-ca-japanese,ko,ko_KR,lt,lt_LT,lv,lv_LV,mk,mk_MK,ms,ms_MY,mt,mt_MT,nl,nl_BE,nl_NL,no,no_NO,no_NO_NY,pl,pl_PL,pt,pt_BR,pt_PT,ro,ro_RO,ru,ru_RU,sk,sk_SK,sl,sl_SI,sq,sq_AL,sr,sr_BA,sr_BA_#Latn,sr_CS,sr_ME,sr_ME_#Latn,sr_RS,sr_RS_#Latn,sr__#Latn,sv,sv_SE,th,th_TH,th_TH_TH_#u-nu-thai,tr,tr_TR,uk,uk_UA,vi,vi_VN,zh,zh_CN,zh_HK,zh_SG,zh_TW
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">os</td>
					<td>
					
						
							
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:hand;" title="click to collapse">SERVER - struct</th></tr>
			
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">additionalinformation</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">arch</td>
					<td>
					
						
							
			amd64
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">buildnumber</td>
					<td>
					
						
							
			[empty string]
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">name</td>
					<td>
					
						
							
			Windows Server 2008 R2
		
						
						
					</td>
					</tr>
					
				
			
				
				
				
                
				
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:hand;" title="click to collapse">version</td>
					<td>
					
						
							
			6.1
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
						
						
					</td>
					</tr>
					
				
			
			</table>
		
			
			
		
	







	    
	
	
