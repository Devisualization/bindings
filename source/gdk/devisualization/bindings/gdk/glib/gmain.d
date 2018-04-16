/* gmain.h - the GLib Main loop
 * Copyright (C) 1998-2000 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */
module devisualization.bindings.gdk.glib.gmain;

///
mixin template GlibGmain_Functions() {
    import devisualization.bindings.gdk.glib.gmain;
    import devisualization.bindings.gdk.glib.gtypes;
extern(C):

    ///
    GMainContext* function() g_main_context_default;
    ///
    gboolean function(GMainContext* context, gboolean may_block) g_main_context_iteration;

    ////
    GMainContext* function(GMainContext* context) g_main_context_ref;
    ///
    void function(GMainContext* context) g_main_context_unref;
}

/**
 * GMainContext:
 *
 * The `GMainContext` struct is an opaque data
 * type representing a set of sources to be handled in a main loop.
 */
struct GMainContext;

