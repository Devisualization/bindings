/* GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2000-2001 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */
module devisualization.bindings.gdk.gobject.gsignal;

///
mixin template GObjectGSignal_Functions() {
    import devisualization.bindings.gdk.glib.gtypes;
    import devisualization.bindings.gdk.gobject.gclosure;
    import devisualization.bindings.gdk.gobject.gsignal;
extern(C):
    /**
     * g_signal_connect:
     * @instance: the instance to connect to.
     * @detailed_signal: a string of the form "signal-name::detail".
     * @c_handler: the #GCallback to connect.
     * @data: data to pass to @c_handler calls.
     *
     * Connects a #GCallback function to a signal for a particular object.
     *
     * The handler will be called before the default handler of the signal.
     *
     * See [memory management of signal handlers][signal-memory-management] for
     * details on how to handle the return value and memory management of @data.
     *
     * Returns: the handler id (always greater than 0 for successful connections)
     */
    gulong g_signal_connect(gpointer instance, const gchar* detailed_signal, GCallback c_handler, gpointer data) {
        return g_signal_connect_data(instance, detailed_signal, c_handler, data, null, cast(GConnectFlags)0);
    }

    ///
    gulong function(gpointer instance, const gchar* detailed_signal, GCallback c_handler, gpointer data, GClosureNotify destroy_data, GConnectFlags connect_flags) g_signal_connect_data;
    ///
    void function(gpointer instance, gulong handler_id) g_signal_handler_disconnect;
}

/**
 * GConnectFlags:
 * @G_CONNECT_AFTER: whether the handler should be called before or after the
 *  default handler of the signal.
 * @G_CONNECT_SWAPPED: whether the instance and data should be swapped when
 *  calling the handler; see g_signal_connect_swapped() for an example.
 *
 * The connection flags are used to specify the behaviour of a signal's
 * connection.
 */
enum GConnectFlags {
    ///
    G_CONNECT_AFTER	= 1 << 0,
    ///
    G_CONNECT_SWAPPED	= 1 << 1
}
