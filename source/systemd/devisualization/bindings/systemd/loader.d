/**
 * License:
 *              Copyright Devisualization (Richard Andrew Cattermole) 2014 - 2018.
 *     Distributed under the Boost Software License, Version 1.0.
 *        (See accompanying file LICENSE_1_0.txt or copy at
 *              http://www.boost.org/LICENSE_1_0.txt)
 */
module devisualization.bindings.systemd.loader;
version(linux):
import derelict.util.sharedlib;

///
__gshared SystemDLoader systemdLoader;
///
__gshared SystemDAllFunctions* systemd;

/// Uses GC
struct SystemDLoader {
    private {
        SharedLib loader;
        static string[] ToLoadFiles = ["libsystemd.so.0"];
    }

    @disable this(this);

    /// File can be null
    this(string file) {
        systemd = new SystemDAllFunctions;

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

            foreach(m; __traits(allMembers, SystemDAllFunctions)) {
                static if (__traits(compiles, { mixin("alias M = typeof(systemd." ~ m ~ ");"); })) {
                    mixin("alias M = typeof(systemd." ~ m ~ ");");
                    static if (__traits(compiles, {mixin("systemd." ~ m ~ " = null;");}) && isFunctionPointer!M) {
                        static if (__traits(getAttributes, __traits(getMember, systemd, m)).length > 0)
                            enum LoadOptional = __traits(getAttributes, __traits(getMember, systemd, m))[0] == "LoadOptional";
                        else enum LoadOptional = false;


                        mixin("systemd." ~ m ~ " = cast(M)loader.loadSymbol(\"" ~ m ~ "\", false);");
                        if (!LoadOptional && __traits(getMember, systemd, m) is null)
                            throw new Exception("Failed to load symbol " ~ m);
                    }
                }
            }
        }
    }
}

///
struct SystemDAllFunctions {
    import devisualization.bindings.systemd.sd_bus;
    import devisualization.bindings.systemd.sd_id128;

    mixin SystemDBus_Functions;
    mixin SystemDId128_Functions;
}
