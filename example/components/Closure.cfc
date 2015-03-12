<cfscript>
/**
 * Utility for compiling closures. Required ACF 10+ / Railo 4.0+
 * @author Tristan Lee
 */
component {
	// must be set in Application.cfc mappings for CF Admin
	variables.closureMapping = "/closures";
	
	public any function init () {
		return this;	
	}
	
	/**
	 * Takes a string representation of a function and returns it as an anonymous Closure
	 * @output false
	 * @return Closure
	 */
	public any function toClosure (required string closure) {
		local.id = replace(createUUID(), "-", "", "all");
		local.closurePath = "#variables.closureMapping#/closure#id#.cfm";
		local.script = "<cfscript>local.fn#id# = #closure#;</cfscript>";
		
		try {
			fileWrite(expandPath(closurePath), script);
			include closurePath;
		} catch (any e) {
				
		} finally {
			try {
				fileDelete(expandPath(closurePath));
			} catch (any e) {}
		}
		
		if (!structkeyExists(local, "fn#id#") || !isClosure(local["fn#id#"])) {
			throw (message="Unable to compile closure",
				   type="ClosureCompilationException");	
		}
		
		// return the closure
		return local["fn#id#"];			
	}
	
	/**
	 * Compiles the closure and sets it to the supplied scope with the specified name
	 * @output false
	 * @return void
	 */
	public void function toNamedClosure (required string name, required string closure, required struct scope) {
		scope[name] = toClosure(closure);
	}
}
</cfscript>
