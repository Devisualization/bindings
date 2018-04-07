module devisualization.bindings.libnotify.notify_enum_types;

mixin template LibNotifyEnumTypesFunctions() {
    import devisualization.bindings.gdk.gobject.gtype;
extern(C):

    ///
    GType function() notify_urgency_get_type;

    ///
    auto NOTIFY_TYPE_URGENCY() { return notify_urgency_get_type(); }
}
