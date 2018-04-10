/* GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 1998-1999, 2000-2001 Tim Janik and Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */
module devisualization.bindings.gdk.gobject.gtype;
import devisualization.bindings.gdk.glib.gtypes;

mixin template GObjectGType_Functions() {
    import devisualization.bindings.gdk.gobject.gtype;
extern(C):
    /**
     * G_TYPE_CHECK_INSTANCE_CAST:
     * @instance: Location of a #GTypeInstance structure
     * @g_type: The type to be returned
     * @c_type: The corresponding C type of @g_type
     *
     * Checks that @instance is an instance of the type identified by @g_type
     * and issues a warning if this is not the case. Returns @instance casted
     * to a pointer to @c_type.
     *
     * This macro should only be used in type implementations.
     */
    ct* G_TYPE_CHECK_INSTANCE_CAST(c_type, Instance, G_type)(Instance instance, G_type g_type) { return _G_TYPE_CCC!(Instance, G_type, c_type)(instance, g_type); }
    ct* _G_TYPE_CCC(CP, GT, ct)(CP cp, GT gt) { return cast(ct*)g_type_check_class_cast(cast(GTypeClass*)cp, gt); }

    ///
    GTypeClass* function(GTypeClass* g_class, GType is_a_type) g_type_check_class_cast;
}

///
alias GType = gsize;

///
alias GTypeClass = _GTypeClass;
///
alias GTypeInstance = _GTypeInstance;

/**
 * GTypeClass:
 *
 * An opaque structure used as the base of all classes.
 */
struct _GTypeClass {
private:
  GType g_type;
}

/**
 * GTypeInstance:
 *
 * An opaque structure used as the base of all type instances.
 */
struct _GTypeInstance {
private:
  GTypeClass *g_class;
}

