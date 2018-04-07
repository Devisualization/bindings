/**
 * License:
 *              Copyright Devisualization (Richard Andrew Cattermole) 2014 - 2018.
 *     Distributed under the Boost Software License, Version 1.0.
 *        (See accompanying file LICENSE_1_0.txt or copy at
 *              http://www.boost.org/LICENSE_1_0.txt)
 */
module devisualization.bindings.libnotify.loader;
import derelict.util.sharedlib;

///
__gshared LibNotifyLoader libnotifyLoader;
///
__gshared LibNotifyAllFunctions* libnotify;

/// uses GC because it is "smart" in loading the library
struct LibNotifyLoader {
    private {
        SharedLib loader;

        version(OSX) {
            static string[] ToLoadFiles = ["libnotify.dylib"];
        } else version(linux) {
            static string[] ToLoadFiles = ["libnotify.so.4"];
        } else version(Windows) {
            static string[] ToLoadFiles = ["libnotify.dll"];
        } else static assert(0, "Unsupported platform");
    }

    @disable this(this);

    /// File can be null
    this(string file) {
    	libnotify = new LibNotifyAllFunctions;

    	if (file !is null)
    		loader.load(file ~ ToLoadFiles);
    	else
    		loader.load(ToLoadFiles);

        loadSymbols();
    }

    ~this() {
        loader.unload;
    }

    private {
        void loadSymbols() {
            import std.traits : isFunctionPointer;
            assert(loader.isLoaded);

            foreach(m; __traits(allMembers, LibNotifyAllFunctions)) {
                static if (__traits(compiles, { mixin("alias M = typeof(libnotify." ~ m ~ ");"); })) {
                    mixin("alias M = typeof(libnotify." ~ m ~ ");");
                    static if (__traits(compiles, {mixin("libnotify." ~ m ~ " = null;");}) && isFunctionPointer!M) {
                        static if (__traits(getAttributes, __traits(getMember, libnotify, m)).length > 0)
                            enum LoadOptional = __traits(getAttributes, __traits(getMember, libnotify, m))[0] == "LoadOptional";
                        else enum LoadOptional = false;


                        mixin("libnotify." ~ m ~ " = cast(M)loader.loadSymbol(\"" ~ m ~ "\", false);");
                        if (!LoadOptional && __traits(getMember, libnotify, m) is null)
                            throw new Exception("Failed to load symbol " ~ m);
                    }
                }
            }
        }
    }
}

///
struct LibNotifyAllFunctions {
    import devisualization.bindings.libnotify : LibNotifyFunctions, LibNotifyNotificationFunctions, LibNotifyEnumTypesFunctions;

    mixin LibNotifyFunctions;
    mixin LibNotifyNotificationFunctions;
    mixin LibNotifyEnumTypesFunctions;
}
