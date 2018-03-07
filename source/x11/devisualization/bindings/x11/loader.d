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
///
__gshared X11Functions* x11;

/// uses GC because it is "smart" in loading the library
struct X11Loader {
	private {
		SharedLib loader, loader_xrandr, loader_xrender;

		version(OSX) {
			static string[] ToLoadFiles = ["libX11.dylib"];
            static string[] ToLoadFilesXrandr = ["libXrandr.dylib"];
            static string[] ToLoadFilesXrender = ["libXrender.dylib"];
		} else version(linux) {
            static string[] ToLoadFiles = ["libX11.so.6", "libX11.so.5"];
            static string[] ToLoadFilesXrandr = ["libXrandr.so.2"];
            static string[] ToLoadFilesXrender = ["libXrender.so.1"];
		} else version(Windows) {
			static string[] ToLoadFiles = ["libX11.dll"];
            static string[] ToLoadFilesXrandr = ["libXrandr.dll"];
            static string[] ToLoadFilesXrender = ["libXrender.dll"];
		} else static assert(0, "Unsupported platform");
	}
	@disable this(this);

	/// File can be null
	this(string file, string filexrandr=null, string filexrender=null) {
    	x11 = new X11Functions;

    	if (file !is null)
    		loader.load(file ~ ToLoadFiles);
    	else
    		loader.load(ToLoadFiles);

        if (filexrandr !is null)
    		loader_xrandr.load(filexrandr ~ ToLoadFilesXrandr);
    	else
    		loader_xrandr.load(ToLoadFilesXrandr);

        if (filexrender !is null)
    		loader_xrender.load(filexrender ~ ToLoadFilesXrender);
    	else
    		loader_xrender.load(ToLoadFilesXrender);

		loadSymbols();
	}

	~this() {
		loader_xrender.unload;
        loader_xrender.unload;
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


                        mixin("x11." ~ m ~ " = cast(M)loader.loadSymbol(\"" ~ m ~ "\", false);");
                        mixin("if (x11." ~ m ~ " is null) x11." ~ m ~ " = cast(M)loader_xrandr.loadSymbol(\"" ~ m ~ "\", false);");
                        mixin("if (x11." ~ m ~ " is null) x11." ~ m ~ " = cast(M)loader_xrender.loadSymbol(\"" ~ m ~ "\", false);");
                        if (!LoadOptional && __traits(getMember, x11, m) is null)
                            throw new Exception("Failed to load symbol " ~ m);
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
    mixin XrandrFunctions;
    mixin XrenderFunctions;
}
