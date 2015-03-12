# coldfusion-closure

Closure is a CF utility component, supported in ACF 10+ / Railo 4+, that compiles functions dynamically at runtime.

### Configuration

Closure uses a single application mapping for a location to compile its code on the fly. You must either add a mapping to your Application.cfc or in the CF Administrator. By default, the mapping name should be `/closures`:

*Application.cfc*
```cfc
this.mappings = {
     "/closures" = "ram:///"
};
```
> If your administrator has disabled the in-memory filesystem, you will need to change the path from `ram:///` to a writeable directory on your local filesystem.

### Installation
Place the component in the directory of your choice accessible by your application.

### Usage
Create an instance of the Closure component:
```cfc
var oClosure = createObject("Closure");
```

Creating an anonymous closure:
```cfc
// string representation of the closure to compile
var closure = "function (num) { return num*10; }";

// compile the string to a callable function
var multiplyByTen = oClosure.toClosure(closure);
writeOutput(multiplyByTen(2)); // outputs 20
```

Creating a named closure in a specific scope
```cfc
// string representation of the closure to compile
var closure = "function (num) { return num*5; }";

// compile the string to a callable function and place it in the scope
oClosure.toNamedClosure("multiplyBy5", closure, request);

// invoke the function
var value = request.multiplyBy5(10);
writeOutput(value); // outputs 50
```

License
----
MIT
