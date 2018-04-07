/* gerror.h - Error reporting system
 *
 *  Copyright 2000 Red Hat, Inc.
 *
 * The Gnome Library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * The Gnome Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with the Gnome Library; see the file COPYING.LIB.  If not,
 * see <http://www.gnu.org/licenses/>.
 */
module devisualization.bindings.gdk.glib.gerror;
import devisualization.bindings.gdk.glib.gtypes;
import devisualization.bindings.gdk.glib.gquark;

/**
 * GError:
 * @domain: error domain, e.g. #G_FILE_ERROR
 * @code: error code, e.g. %G_FILE_ERROR_NOENT
 * @message: human-readable informative error message
 *
 * The `GError` structure contains information about
 * an error that has occurred.
 */
alias GError = _GError;

///
struct _GError {
    ///
    GQuark domain;
    ///
    gint code;
    ///
    gchar* message;
}

