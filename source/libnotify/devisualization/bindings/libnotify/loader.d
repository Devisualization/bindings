﻿/**
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
        SharedLib loader, loaderPixbuf;

        version(OSX) {
            static string[] ToLoadFiles = ["libnotify.dylib"];
            static string[] ToLoadFilesPixbuf = ["libgdk_pixbuf-2.0.dylib", "libgdk_pixbuf.dylib"];
        } else version(linux) {
            static string[] ToLoadFiles = ["libnotify.so.4"];
            static string[] ToLoadFilesPixbuf = ["libgdk_pixbuf-2.0.so.0"];
        } else version(Windows) {
            static string[] ToLoadFiles = ["libnotify.dll"];
            static string[] ToLoadFilesPixbuf = ["libgdk_pixbuf-2.0.dll", "libgdk_pixbuf.dll"];
        } else static assert(0, "Unsupported platform");
    }

    @disable this(this);

    /// File can be null
    this(string file, string filePixbuf=null) {
    	libnotify = new LibNotifyAllFunctions;

    	if (file !is null)
    		loader.load(file ~ ToLoadFiles);
    	else
    		loader.load(ToLoadFiles);

        if (filePixbuf !is null)
    		loaderPixbuf.load(filePixbuf ~ ToLoadFilesPixbuf);
    	else
    		loaderPixbuf.load(ToLoadFilesPixbuf);

        loadSymbols();
    }

    ~this() {
        loader.unload;
        loaderPixbuf.unload;
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
                        mixin("if (libnotify." ~ m ~ " is null) libnotify." ~ m ~ " = cast(M)loaderPixbuf.loadSymbol(\"" ~ m ~ "\", false);");
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
    import devisualization.bindings.gdk.glib.gmem : GdkGlibGmem_Functions;
    import devisualization.bindings.gdk.glib.gstrfuncs : GdkGlibGstrfuncs_Functions;
    import devisualization.bindings.gdk.gobject.gtype : GObjectGType_Functions;
    import devisualization.bindings.gdk.gobject.gobject : GObject_Functions;
    import devisualization.bindings.gdk.gobject.gsignal : GObjectGSignal_Functions;
    import devisualization.bindings.gdk.gdk_pixbuf : GDK_Pixbuf_Functions;

    mixin LibNotifyFunctions;
    mixin LibNotifyNotificationFunctions;
    mixin LibNotifyEnumTypesFunctions;

    mixin GdkGlibGmem_Functions;
    mixin GdkGlibGstrfuncs_Functions;
    mixin GObjectGType_Functions;
    mixin GObject_Functions;
    mixin GObjectGSignal_Functions;

@("LoadOptional"):
    mixin GDK_Pixbuf_Functions;
}
