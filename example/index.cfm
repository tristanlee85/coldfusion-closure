<cfscript>
	// reference to the Closure components
	oClosure = createObject("components.Closure");
	
	// create an anonymous Closure
	myFn = oClosure.toClosure("function (value) { return value; }");
	
	// create a named closure in the variables scope
	oClosure.toNamedClosure("myFn2", "function (num) { return num+1; }", variables);
	
	// create a named closure in the request scope
	oCLosure.tonamedClosure("multiply", "function (num1, num2) { return num1*num2; }", request);
	
	writeDump(myFn("Foo"));
	writeDump(myFn2(10));
	writeDump(request.multiply(2,2));
</cfscript>
