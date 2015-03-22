component output="false" {
	
	this.name = "mysticinsight_com1";
	this.applicationTimeout = createTimeSpan(0, 1, 0, 0);
	this.clientManagement = false;
	this.clientStorage = "registry";
	this.loginStorage = "cookie";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 20, 0);
	this.setClientCookies = true;
	this.setDomainCookies = false;
	
	boolean function OnApplicationStart(){
		return true;
	}
	
	/*void function onRequest(required string TargetPage){
		
	}*/
	
	boolean function onRequestStart(required string TargetPage){
		include "config.cfm";

		if(structKeyExists(URL,"fuseaction") and listLen(URL.fuseaction, ".") != 2){
			abort;
		}
		
		if(getDirectoryFromPath(getCurrentTemplatePath( )) & "index.cfm" != getBaseTemplatePath()
			 && getDirectoryFromPath(getCurrentTemplatePath( )) & "go.cfm" != getBaseTemplatePath()
			 && getDirectoryFromPath(getCurrentTemplatePath( )) & "image.cfm" != getBaseTemplatePath()
			 && getDirectoryFromPath(getCurrentTemplatePath( )) & "colortool.cfm" != getBaseTemplatePath()
			 && getDirectoryFromPath(getCurrentTemplatePath( )) & "admin\index.cfm" != getBaseTemplatePath()){
			 	location(url="#request.StorePath#index.cfm");
			 }
		
		return true;
	}
	
	void function onRequestEnd(){
		
	}
	
	void function onSessionStart(){
		
	}
	
	void function onSessionEnd(required struct SessionScope, struct ApplicationScope=structNew()){
		
	}
	
	boolean function onMissingTemplate(required string TargetPage){
		return true;
	}
	
	void function onError(required any Exception, required string EventName){
		writedump(var=Exception,expand=false,label='dump',abort=true);
	}
	
	void function OnApplicationEnd(struct ApplicationScope=structNew()){
		
	}

}