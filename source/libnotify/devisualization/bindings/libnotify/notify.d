/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2004-2006 Christian Hammond
 * Copyright (C) 2010 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA  02111-1307, USA.
 */
module devisualization.bindings.libnotify.notify;

///
mixin template LibNotifyFunctions() {
    import devisualization.bindings.gdk.glib;
    import devisualization.bindings.libnotify.notification;
    import devisualization.bindings.libnotify.notify_enum_types;
extern(C):

    ///
    gboolean function(const char* app_name) notify_init;
    ///
    void function() notify_uninit;
    ///
    gboolean function() notify_is_initted;
    ///
    const char* function() notify_get_app_name;
    ///
    void function(const char* app_name) notify_set_app_name;
    ///
    GList* function() notify_get_server_caps;
    ///
    gboolean function(char** ret_name, char** ret_vendor, char** ret_version, char** ret_spec_version) notify_get_server_info;
}
