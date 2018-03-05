/**
 * License:
 *              Copyright Devisualization (Richard Andrew Cattermole) 2014 - 2018.
 *     Distributed under the Boost Software License, Version 1.0.
 *        (See accompanying file LICENSE_1_0.txt or copy at
 *              http://www.boost.org/LICENSE_1_0.txt)
 */
module devisualization.bindings.x11.loader;
import derelict.util.sharedlib;

///
__gshared X11Loader x11Loader;
__gshared X11Functions* x11;

/// uses GC because it is "smart" in loading the library
struct X11Loader {
	private {
		SharedLib loader;

		version(OSX) {
			static string[] ToLoadFiles = ["libX11.dylib"];
		} else version(linux) {
            static string[] ToLoadFiles = ["libX11.so.6", "libX11.so.5"];
		} else version(Windows) {
			static string[] ToLoadFiles = ["libX11.dll"];
		} else static assert(0, "Unsupported platform");
	}
	@disable this(this);

	/// File can be null
	this(string file) {
    	x11 = new X11Functions;

    	if (file !is null)
    		loader.load(file ~ ToLoadFiles);
    	else
    		loader.load(ToLoadFiles);

		loadSymbols();
	}

	~this() {
		import std.file : remove;
		loader.unload;
	}

	private {
		void loadSymbols() {
            import std.traits : isFunctionPointer;
			assert(loader.isLoaded);

            foreach(m; __traits(allMembers, X11Functions)) {
                static if (__traits(compiles, { mixin("alias M = typeof(x11." ~ m ~ ");"); })) {
                    mixin("alias M = typeof(x11." ~ m ~ ");");
                    static if (__traits(compiles, {mixin("x11." ~ m ~ " = null;");}) && isFunctionPointer!M) {
                        static if (__traits(getAttributes, __traits(getMember, x11, m)).length > 0)
                            enum LoadOptional = __traits(getAttributes, __traits(getMember, x11, m))[0] == "LoadOptional";
                        else enum LoadOptional = false;
                        mixin("x11." ~ m ~ " = cast(M)loader.loadSymbol(\"" ~ m ~ "\", LoadOptional);");
                    }
                }
            }
		}
	}
}

///
struct X11Functions {
    import devisualization.bindings.x11 : XLibFunctions, XResourceFunctions, XUtilFunctions,
    XrandrFunctions, XrenderFunctions;

    mixin XLibFunctions;
    mixin XResourceFunctions;
    mixin XUtilFunctions;
@("LoadOptional"):
    mixin XrandrFunctions;
    mixin XrenderFunctions;
}
