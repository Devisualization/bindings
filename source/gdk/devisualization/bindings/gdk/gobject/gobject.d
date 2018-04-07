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
module devisualization.bindings.gdk.gobject.gobject;
import devisualization.bindings.gdk.glib.gtypes;
import devisualization.bindings.gdk.glib.gdataset;
import devisualization.bindings.gdk.gobject.gtype;

///
alias GObject = _GObject;
///
alias GObjectClass = _GObjectClass;

/**
 * GObject:
 *
 * All the fields in the GObject structure are private
 * to the #GObject implementation and should never be accessed directly.
 */
struct _GObject {
    ///
    GTypeInstance g_type_instance;

private:
    guint ref_count;
    GData* qdata;
}

/**
 * GObjectClass:
 * @g_type_class: the parent class
 * @constructor: the @constructor function is called by g_object_new () to
 *  complete the object initialization after all the construction properties are
 *  set. The first thing a @constructor implementation must do is chain up to the
 *  @constructor of the parent class. Overriding @constructor should be rarely
 *  needed, e.g. to handle construct properties, or to implement singletons.
 * @set_property: the generic setter for all properties of this type. Should be
 *  overridden for every type with properties. If implementations of
 *  @set_property don't emit property change notification explicitly, this will
 *  be done implicitly by the type system. However, if the notify signal is
 *  emitted explicitly, the type system will not emit it a second time.
 * @get_property: the generic getter for all properties of this type. Should be
 *  overridden for every type with properties.
 * @dispose: the @dispose function is supposed to drop all references to other
 *  objects, but keep the instance otherwise intact, so that client method
 *  invocations still work. It may be run multiple times (due to reference
 *  loops). Before returning, @dispose should chain up to the @dispose method
 *  of the parent class.
 * @finalize: instance finalization function, should finish the finalization of
 *  the instance begun in @dispose and chain up to the @finalize method of the
 *  parent class.
 * @dispatch_properties_changed: emits property change notification for a bunch
 *  of properties. Overriding @dispatch_properties_changed should be rarely
 *  needed.
 * @notify: the class closure for the notify signal
 * @constructed: the @constructed function is called by g_object_new() as the
 *  final step of the object creation process.  At the point of the call, all
 *  construction properties have been set on the object.  The purpose of this
 *  call is to allow for object initialisation steps that can only be performed
 *  after construction properties have been set.  @constructed implementors
 *  should chain up to the @constructed call of their parent class to allow it
 *  to complete its initialisation.
 *
 * The class structure for the GObject type.
 *
 * <example>
 * <title>Implementing singletons using a constructor</title>
 * <programlisting>
 * static MySingleton *the_singleton = NULL;
 *
 * static GObject*
 * my_singleton_constructor (GType                  type,
 *                           guint                  n_construct_params,
 *                           GObjectConstructParam *construct_params)
 * {
 *   GObject *object;
 *
 *   if (!the_singleton)
 *     {
 *       object = G_OBJECT_CLASS (parent_class)->constructor (type,
 *                                                            n_construct_params,
 *                                                            construct_params);
 *       the_singleton = MY_SINGLETON (object);
 *     }
 *   else
 *     object = g_object_ref (G_OBJECT (the_singleton));
 *
 *   return object;
 * }
 * </programlisting></example>
 */
struct _GObjectClass {
    GTypeClass g_type_class;

private:
    void* construct_properties;

public extern(C):
    /* seldom overidden */

    GObject* function(GType type, guint n_construct_properties, void* construct_properties) constructor;

    /* overridable methods */

    void function(GObject* object, guint property_id, const void* value, void* pspec) set_property;
    void function(GObject* object, guint property_id, void* value, void* pspec) get_property;
    void function(GObject* object) dispose;
    void function(GObject* object) finalize;

    /* seldom overidden */

    void function(GObject* object, guint n_pspecs, void**) dispatch_properties_changed;

    /* signals */

    void function(GObject* object, void* pspec) notify;

    /* called when done constructing */

    void function(GObject* object) constructed;

private:
    gsize flags;

    /* padding */
    gpointer[6] pdummy;
}

