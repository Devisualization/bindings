/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2006 Christian Hammond
 * Copyright (C) 2006 John Palmieri
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
module devisualization.bindings.libnotify.notification;
import devisualization.bindings.gdk.glib;
import devisualization.bindings.gdk.gobject;
import devisualization.bindings.gdk.gdk_pixbuf;

///
mixin template LibNotifyNotificationFunctions() {
    import devisualization.bindings.libnotify.notification;
    import devisualization.bindings.gdk.glib;
    import devisualization.bindings.gdk.gobject;
    import devisualization.bindings.gdk.gdk_pixbuf;
extern(C):

    ///
    auto NOTIFY_TYPE_NOTIFICATION() { return notify_notification_get_type(); }

    ///
    GType function() notify_notification_get_type;
    ///
    NotifyNotification* function(const char* summary, const char* body_, const char* icon) notify_notification_new;
    ///
    gboolean function(NotifyNotification* notification, const char* summary, const char* body_, const char* icon) notify_notification_update;
    ///
    gboolean function(NotifyNotification* notification, GError** error) notify_notification_show;
    ///
    void function(NotifyNotification* notification, gint timeout) notify_notification_set_timeout;
    ///
    void function(NotifyNotification* notification, const char* category) notify_notification_set_category;
    ///
    void function(NotifyNotification* notification, NotifyUrgency urgency) notify_notification_set_urgency;
    ///
    void function(NotifyNotification* notification, GdkPixbuf* pixbuf) notify_notification_set_image_from_pixbuf;

    ///
    void function(NotifyNotification* notification, const char* key, GVariant* value) notify_notification_set_hint;
    ///
    void function(NotifyNotification *notification, const char* app_name) notify_notification_set_app_name;
    ///
    void function(NotifyNotification* notification) notify_notification_clear_hints;
    ///
    void function(NotifyNotification *notification, const char* action, const char* label, NotifyActionCallback callback, gpointer user_data, GFreeFunc free_func) notify_notification_add_action;
    ///
    void function(NotifyNotification* notification) notify_notification_clear_actions;
    ///
    gboolean function(NotifyNotification* notification, GError** error) notify_notification_close;
    ///
    gint function(const NotifyNotification* notification) notify_notification_get_closed_reason;
}

/**
 * NOTIFY_EXPIRES_DEFAULT:
 *
 * The default expiration time on a notification.
 */
enum NOTIFY_EXPIRES_DEFAULT = -1;

/**
 * NOTIFY_EXPIRES_NEVER:
 *
 * The notification never expires. It stays open until closed by the calling API
 * or the user.
 */
enum NOTIFY_EXPIRES_NEVER = 0;

///
alias NotifyNotification = _NotifyNotification;
///
alias NotifyNotificationClass = _NotifyNotificationClass;
///
struct NotifyNotificationPrivate;

///
struct _NotifyNotification {
    ///
    private GObject parent_object;

    ///
    NotifyNotificationPrivate* priv;
}

///
struct _NotifyNotificationClass {
    ///
    GObjectClass parent_class;

    /// Signals
    void function(NotifyNotification* notification) closed;
}


/**
 * NotifyUrgency:
 * @NOTIFY_URGENCY_LOW: Low urgency. Used for unimportant notifications.
 * @NOTIFY_URGENCY_NORMAL: Normal urgency. Used for most standard notifications.
 * @NOTIFY_URGENCY_CRITICAL: Critical urgency. Used for very important notifications.
 *
 * The urgency level of the notification.
 */
enum NotifyUrgency {
    ///
    NOTIFY_URGENCY_LOW,
    ///
    NOTIFY_URGENCY_NORMAL,
    ///
    NOTIFY_URGENCY_CRITICAL,
}

/**
 * NotifyActionCallback:
 * @notification:
 * @action:
 * @user_data:
 *
 * An action callback function.
 */
alias NotifyActionCallback = extern(C) void function(NotifyNotification* notification, char* action, gpointer user_data);

/**
 * NOTIFY_ACTION_CALLBACK:
 * @func: The function to cast.
 *
 * A convenience macro for casting a function to a #NotifyActionCallback. This
 * is much like G_CALLBACK().
 */
auto NOTIFY_ACTION_CALLBACK(Func)(Func func) { return cast(NotifyActionCallback)func; }

