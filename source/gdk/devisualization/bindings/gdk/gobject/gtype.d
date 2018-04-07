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
