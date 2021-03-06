﻿/**
 * License:
 *              Copyright Devisualization (Richard Andrew Cattermole) 2014 - 2017.
 *     Distributed under the Boost Software License, Version 1.0.
 *        (See accompanying file LICENSE_1_0.txt or copy at
 *              http://www.boost.org/LICENSE_1_0.txt)
 */
module devisualization.bindings.opengl.loader;

version(Windows) {
    static string[] Default_OpenGL_FileNames = ["opengl32.dll"];
    static string[] Default_EGL_FileNames = ["libEGL.dll"];
    static import defaultgl = devisualization.bindings.opengl.gl;
} else version(OSX) {
    static string[] Default_EGL_FileNames = ["libEGL.dylib"];
    static string[] Default_OpenGL_FileNames = ["../Frameworks/OpenGL.framework/OpenGL", "/Library/Frameworks/OpenGL.framework/OpenGL", "/System/Library/Frameworks/OpenGL.framework/OpenGL"];
    static import defaultgl = devisualization.bindings.opengl.gl;
} else version(Posix) {
    static string[] Default_EGL_FileNames = ["libEGL.so", "libEGL.so.1", "libEGL.so"];
    static string[] Default_OpenGL_FileNames = ["libGL.so.1", "libGL.so"];
    static import defaultgl = devisualization.bindings.opengl.gl;
} else {
    pragma(msg, "Warning: OpenGL may not supported on this platform. ", __MODULE__, " bindings are not implemented");
    static import defaultgl = devisualization.bindings.opengl.gl;
}

///
struct OpenGL_Loader(T_Callbacks, T_Bindings=defaultgl.GL, T_Bindings_ExtensionUDA=defaultgl.OpenGL_Extension, T_Bindings_VersionUDA=defaultgl.OpenGL_Version) {
    import derelict.util.sharedlib;
	
    private{
        string[] openglFileNames, eglFileNames;
        ushort minMajor, minMinor;
        bool loaded;
        SharedLib sharedLib, sharedLibEGL;
        T_Bindings* bindings;
        char[256] openglFunctionNameBuffer;

        alias PlatformSpecificLoaderFunc = extern(System) void* function(char*) @nogc;
        PlatformSpecificLoaderFunc platformSpecificLoaderFunc;
    }

    T_Callbacks callbacks;
	
    @disable
    this(this);
	
    ///
    static if (__traits(compiles, Default_OpenGL_FileNames)) {
        ///
        this(T_Bindings* theBindings, ushort minMajor=0, ushort minMinor=0, string[] openglFileNames=Default_OpenGL_FileNames, string[] eglFileNames = Default_EGL_FileNames) {
            this.bindings = theBindings;
            this.minMajor = minMajor;
            this.minMinor = minMinor;
            this.openglFileNames = openglFileNames;
            this.eglFileNames = eglFileNames;
            init();
        }
    } else {
        ///
        this(T_Bindings* theBindings, string[] openglFileNames, ushort minMajor=0, ushort minMinor=0) {
            this.bindings = theBindings;
            this.minMajor = minMajor;
            this.minMinor = minMinor;
            this.openglFileNames = openglFileNames;
            init();
        }
    }
	
    void init() {
        static if (__traits(hasMember, T_Callbacks, "onLoad")) {
            callbacks.onLoad = &loadSymbols;
        }

        static if (__traits(hasMember, T_Callbacks, "onReload")) {
            callbacks.onReload = &reloadSymbols!true;
        }

        static if (__traits(hasMember, T_Callbacks, "loadSymbol")) {
            callbacks.loadSymbol = &getSymbol;
        }

        sharedLib.load(openglFileNames);
        sharedLibEGL.load(eglFileNames);
        assert(sharedLib.isLoaded, "OpenGL shared library failed to load.");
        loaded = true;
    }
	
    void reloadSymbols(bool LoadExtensions)() {
        import std.traits : isFunctionPointer, hasUDA, getUDAs;
        if (!loaded) init;

        foreach(m; __traits(allMembers, T_Bindings)) {
            static if (__traits(compiles, mixin("typeof(bindings." ~ m ~ ")")) && isFunctionPointer!(mixin("typeof(bindings." ~ m ~ ")"))) {
        	
                enum No_ExtensionUDA = !is(T_Bindings_ExtensionUDA == void);
                enum Have_Extension_UDA = !No_ExtensionUDA && hasUDA!(mixin("T_Bindings." ~ m), T_Bindings_ExtensionUDA);

                static if (!LoadExtensions && (No_ExtensionUDA || Have_Extension_UDA)) {
                    enum Checked = true;
                } else static if (Have_Extension_UDA &&
                    !is(T_Bindings_VersionUDA == void) && hasUDA!(mixin("T_Bindings." ~ m), T_Bindings_VersionUDA)) {

                    enum UDAS = getUDAs!(mixin("T_Bindings." ~ m), T_Bindings_VersionUDA);
                    enum Checked = LoadExtensions || cast(int)UDAS[0] < 30;
                } else {
                    enum Checked = false;
                }

                // disable/enable extensions+versions
                static if (Checked) {
                    void* got = getSymbol(m);
                    if (got !is null)
                        mixin("bindings." ~ m ~ " = cast(typeof(bindings." ~ m ~ "))got;");
                }
            }
        }
    }

    void loadSymbols(string platformSpecificFunction) {
        if (!loaded) init;
        platformSpecificLoaderFunc = null;
        if (platformSpecificFunction.length > 0)
            platformSpecificLoaderFunc = cast(PlatformSpecificLoaderFunc)getSymbol(platformSpecificFunction);
        reloadSymbols!false();
    }
	
    void* getSymbol(string name) {
        if (!loaded) init;

        void* ret;

        if (platformSpecificLoaderFunc !is null) {
            openglFunctionNameBuffer[0 .. name.length] = name[];
            openglFunctionNameBuffer[name.length] = 0;
            ret = platformSpecificLoaderFunc(openglFunctionNameBuffer.ptr);
        }

        if (ret is null)
            ret = sharedLib.loadSymbol(name, false);
        if (ret is null && sharedLibEGL.isLoaded)
            ret = sharedLibEGL.loadSymbol(name, false);

        return ret;
    }
}
