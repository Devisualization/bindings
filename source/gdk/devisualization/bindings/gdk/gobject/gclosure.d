/* GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2000-2001 Red Hat, Inc.
 * Copyright (C) 2005 Imendio AB
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
module devisualization.bindings.gdk.gobject.gclosure;
import devisualization.bindings.gdk.glib.gtypes;

///
struct GClosure;

/**
 * G_CALLBACK:
 * @f: a function pointer.
 *
 * Cast a function pointer to a #GCallback.
 */
GCallback G_CALLBACK(F)(F f) { return cast(GCallback)f; }

/**
 * GCallback:
 *
 * The type used for callback functions in structure definitions and function
 * signatures. This doesn't mean that all callback functions must take no
 * parameters and return void. The required signature of a callback function
 * is determined by the context in which is used (e.g. the signal to which it
 * is connected). Use G_CALLBACK() to cast the callback function to a #GCallback.
 */
alias GCallback = extern(C) void function();

/**
 * GClosureNotify:
 * @data: data specified when registering the notification callback
 * @closure: the #GClosure on which the notification is emitted
 *
 * The type used for the various notification callbacks which can be registered
 * on closures.
 */
alias GClosureNotify = extern(C) void function(gpointer data, GClosure* closure);
