<cfscript>
component{
	// Application properties
	this.name = hash( getCurrentTemplatePath() );
	
	// application mappings
	APP_ROOT_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings = {
		"/components" = "#APP_ROOT_PATH#components",
		"/closures" = "ram:///"
	};
}
</cfscript>
