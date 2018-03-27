/************************************************************
Copyright (c) 1993 by Silicon Graphics Computer Systems, Inc.

Permission to use, copy, modify, and distribute this
software and its documentation for any purpose and without
fee is hereby granted, provided that the above copyright
notice appear in all copies and that both that copyright
notice and this permission notice appear in supporting
documentation, and that the name of Silicon Graphics not be
used in advertising or publicity pertaining to distribution
of the software without specific prior written permission.
Silicon Graphics makes no representation about the suitability
of this software for any purpose. It is provided "as is"
without any express or implied warranty.

SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
THE USE OR PERFORMANCE OF THIS SOFTWARE.

********************************************************/
module devisualization.bindings.x11.XKBlib;
import devisualization.bindings.x11.extensions.XKB;
import devisualization.bindings.x11.extensions.XKBstr;
import devisualization.bindings.x11.X;
import devisualization.bindings.x11.Xlib;
import core.stdc.config : c_long, c_ulong;

///
mixin template XKBFunctions() {
    import devisualization.bindings.x11.XKBlib;
    import devisualization.bindings.x11.extensions.XKB;
    import devisualization.bindings.x11.extensions.XKBstr;
    import devisualization.bindings.x11.X;
    import devisualization.bindings.x11.Xlib;
    import core.stdc.config : c_long, c_ulong;
extern(C):

    ///
    Bool function(Bool ignore) XkbIgnoreExtension;
    ///
    Display* function(char* name, int* ev_rtrn, int* err_rtrn, int* major_rtrn, int* minor_rtrn, int* reason) XkbOpenDisplay;
    ///
    Bool function(Display* dpy, int* opcodeReturn, int* eventBaseReturn, int* errorBaseReturn, int* majorRtrn, int* minorRtrn) XkbQueryExtension;
    ///
    Bool function(Display* dpy, int* major_rtrn, int* minor_rtrn) XkbUseExtension;
    ///
    Bool function(int* libMajorRtrn, int* libMinorRtrn) XkbLibraryVersion;
    ///
    uint function(Display* dpy, uint affect, uint values) XkbSetXlibControls;
    ///
    uint function(Display* dpy) XkbGetXlibControls;
    ///
    uint function() XkbXlibControlsImplemented;

    ///
    void function(XkbInternAtomFunc getAtom, XkbGetAtomNameFunc getName) XkbSetAtomFuncs;

    ///
    version(NeedWidePrototypes) {
        ///
        KeySym function(Display* dpy, uint kc, int group, int level) XkbKeycodeToKeysym;
    } else {
        ///
        KeySym function(Display* dpy, KeyCode kc, int group, int level) XkbKeycodeToKeysym;
    }

    ///
    uint function(Display* dpy, KeySym ks) XkbKeysymToModifiers;
    ///
    Bool function(Display* dpy, KeyCode keycode, uint modifiers, uint* modifiers_return, KeySym* keysym_return) XkbLookupKeySym;
    ///
    int function(Display* dpy, KeySym sym_rtrn, uint mods, ubyte* buffer, int nbytes, int* extra_rtrn) XkbLookupKeyBinding;
    ///
    Bool function(XkbDescPtr xkb, KeyCode keycode, uint modifiers, uint* modifiers_return, KeySym* keysym_return) XkbTranslateKeyCode;
    ///
    int function(Display* dpy, KeySym* sym_return, uint modifiers, ubyte* buffer, int nbytes, int* extra_rtrn) XkbTranslateKeySym;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint delay, uint interval) XkbSetAutoRepeatRate;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint* delayRtrn, uint* intervalRtrn) XkbGetAutoRepeatRate;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint affect, uint values) XkbChangeEnabledControls;
    ///
    Bool function(Display* dpy, Window win, int deviceSpec, int bellClass, int bellID, int percent, Atom name) XkbDeviceBell;
    ///
    Bool function(Display* dpy, int deviceSpec, int bellClass, int bellID, int percent) XkbForceDeviceBell;
    ///
    Bool function(Display* dpy, Window win, int deviceSpec, int bellClass, int bellID, int percent, Atom name) XkbDeviceBellEvent;
    ///
    Bool function(Display* dpy, Window win, int percent, Atom name) XkbBell;
    ///
    Bool function(Display* dpy, int percent) XkbForceBell;
    ///
    Bool function(Display* dpy, Window win, int percent, Atom name) XkbBellEvent;
    ///
    Bool function(Display* dpy, uint deviceID, uint affect, uint values) XkbSelectEvents;
    ///
    Bool function(Display* dpy, uint deviceID, uint eventType, c_ulong affect, c_ulong details) XkbSelectEventDetails;
    ///
    void function(XkbMapChangesPtr old, XkbMapNotifyEvent* new_, uint wanted) XkbNoteMapChanges;
    ///
    void function(XkbNameChangesPtr old, XkbNamesNotifyEvent* new_, uint wanted) XkbNoteNameChanges;
    ///
    Status function(Display* dpy, uint deviceSpec, uint* pStateRtrn) XkbGetIndicatorState;
    ///
    Status function(Display* dpy, uint deviceSpec, uint ledClass, uint ledID, uint* pStateRtrn) XkbGetDeviceIndicatorState;
    ///
    Status function(Display* dpy, c_ulong which, XkbDescPtr desc) XkbGetIndicatorMap;
    ///
    Bool function(Display* dpy, c_ulong which, XkbDescPtr desc) XkbSetIndicatorMap;

    ///
    Bool function(Display* dpy, Atom name, int* pNdxRtrn, Bool* pStateRtrn, XkbIndicatorMapPtr pMapRtrn, Bool* pRealRtrn) XkbGetNamedIndicator;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint ledClass, uint ledID, Atom name, int* pNdxRtrn, Bool* pStateRtrn, XkbIndicatorMapPtr pMapRtrn, Bool* pRealRtrn) XkbGetNamedDeviceIndicator;
    ///
    Bool function(Display* dpy, Atom name, Bool changeState, Bool state, Bool createNewMap, XkbIndicatorMapPtr pMap) XkbSetNamedIndicator;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint ledClass, uint ledID, Atom name, Bool changeState, Bool state, Bool createNewMap, XkbIndicatorMapPtr pMap) XkbSetNamedDeviceIndicator;

    ///
    Bool function(Display* dpy, uint deviceSpec, uint affect, uint values) XkbLockModifiers;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint affect, uint values) XkbLatchModifiers;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint group) XkbLockGroup;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint group) XkbLatchGroup;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint affectReal, uint realValues, uint affectVirtual, uint virtualValues) XkbSetServerInternalMods;
    ///
    Bool function(Display* dpy, uint deviceSpec, uint affectReal, uint realValues, uint affectVirtual, uint virtualValues) XkbSetIgnoreLockMods;

    ///
    Bool function(XkbDescPtr xkb, uint virtual_mask, uint* mask_rtrn) XkbVirtualModsToReal;
    ///
    Bool function(XkbDescPtr xkb, XkbKeyTypePtr type, ubyte* map_rtrn) XkbComputeEffectiveMap;
    ///
    Status function(XkbDescPtr xkb, uint which, int keypadVMod) XkbInitCanonicalKeyTypes;
    ///
    XkbDescPtr function() XkbAllocKeyboard;
    ///
    void function(XkbDescPtr xkb, uint which, Bool freeDesc) XkbFreeKeyboard;
    ///
    Status function(XkbDescPtr xkb, uint which, uint nTypes) XkbAllocClientMap;
    ///
    Status function(XkbDescPtr xkb, uint which, uint nActions) XkbAllocServerMap;
    ///
    void function(XkbDescPtr xkb, uint what, Bool freeMap) XkbFreeClientMap;
    ///
    void function(XkbDescPtr xkb, uint what, Bool freeMap) XkbFreeServerMap;
    ///
    XkbKeyTypePtr function(XkbDescPtr xkb, Atom name, int map_count, Bool want_preserve, int num_lvls) XkbAddKeyType;
    ///
    Status function(XkbDescPtr xkb) XkbAllocIndicatorMaps;
    ///
    void function(XkbDescPtr xkb) XkbFreeIndicatorMaps;
    ///
    XkbDescPtr function(Display* dpy, uint which, uint deviceSpec) XkbGetMap;
    ///
    Status function(Display* dpy, uint which, XkbDescPtr desc) XkbGetUpdatedMap;
    ///
    Status function(Display* dpy, XkbDescPtr xkb, XkbMapChangesPtr changes) XkbGetMapChanges;
    ///
    Status function(XkbMapNotifyEvent* event) XkbRefreshKeyboardMapping;
    ///
    Status function(Display* dpy, uint first, uint num, XkbDescPtr xkb) XkbGetKeyTypes;
    ///
    Status function(Display* dpy, uint first, uint num, XkbDescPtr xkb) XkbGetKeySyms;
    ///
    Status function(Display* dpy, uint first, uint num, XkbDescPtr xkb) XkbGetKeyActions;
    ///
    Status function(Display* dpy, uint firstKey, uint nKeys, XkbDescPtr desc) XkbGetKeyBehaviors;
    ///
    Status function(Display* dpy, uint which, XkbDescPtr desc) XkbGetVirtualMods;
    ///
    Status function(Display* dpy, uint firstKey, uint nKeys, XkbDescPtr desc) XkbGetKeyExplicitComponents;
    ///
    Status function(Display* dpy, uint firstKey, uint nKeys, XkbDescPtr desc) XkbGetKeyModifierMap;
    ///
    Status function(Display* dpy, uint first, uint num, XkbDescPtr xkb) XkbGetKeyVirtualModMap;
    ///
    Status function(XkbDescPtr xkb, uint which) XkbAllocControls;
    ///
    void function(XkbDescPtr xkb, uint which, Bool freeMap) XkbFreeControls;
    ///
    Status function(Display* dpy, c_ulong which, XkbDescPtr desc) XkbGetControls;
    ///
    Bool function(Display* dpy, c_ulong which, XkbDescPtr desc) XkbSetControls;
    ///
    void function( XkbControlsChangesPtr old, XkbControlsNotifyEvent* new_, uint wanted) XkbNoteControlsChanges;

    ///
    Status function(XkbDescPtr xkb, uint which, uint nInterpret) XkbAllocCompatMap;
    ///
    void function(XkbDescPtr xkb, uint which, Bool freeMap) XkbFreeCompatMap;
    ///
    Status function(Display* dpy, uint which, XkbDescPtr xkb) XkbGetCompatMap;
    ///
    Bool function(Display* dpy, uint which, XkbDescPtr xkb, Bool updateActions) XkbSetCompatMap;
    ///
    XkbSymInterpretPtr function(XkbDescPtr xkb, XkbSymInterpretPtr si, Bool updateMap, XkbChangesPtr changes) XkbAddSymInterpret;
    ///
    Status function(XkbDescPtr xkb, uint which, int nTotalRG, int nTotalAliases) XkbAllocNames;
    ///
    Status function(Display* dpy, uint which, XkbDescPtr desc) XkbGetNames;
    ///
    Bool function(Display* dpy, uint which, uint firstType, uint nTypes, XkbDescPtr desc) XkbSetNames;
    ///
    Bool function(Display* dpy, XkbDescPtr xkb, XkbNameChangesPtr changes) XkbChangeNames;
    ///
    void function(XkbDescPtr xkb, uint which, Bool freeMap) XkbFreeNames;

    ///
    Status function(Display* dpy, uint deviceSpec, XkbStatePtr rtrnState) XkbGetState;
    ///
    Bool function(Display* dpy, uint which, XkbDescPtr desc) XkbSetMap;
    ///
    Bool function(Display* dpy, XkbDescPtr desc, XkbMapChangesPtr changes) XkbChangeMap;
    ///
    Bool function(Display* dpy, Bool detectable, Bool* supported) XkbSetDetectableAutoRepeat;
    ///
    Bool function(Display* dpy, Bool* supported) XkbGetDetectableAutoRepeat;
    ///
    Bool function(Display* dpy, uint changes, uint* auto_ctrls, uint* auto_values) XkbSetAutoResetControls;
    ///
    Bool function(Display* dpy, uint* auto_ctrls, uint* auto_ctrl_values) XkbGetAutoResetControls;
    ///
    Bool function(Display* dpy, uint change, uint* values) XkbSetPerClientControls;
    ///
    Bool function(Display* dpy, uint* ctrls) XkbGetPerClientControls;
    ///
    Status function(XkbKeyTypePtr from, XkbKeyTypePtr into) XkbCopyKeyType;
    ///
    Status function(XkbKeyTypePtr from, XkbKeyTypePtr into, int num_types) XkbCopyKeyTypes;
    ///
    Status function(XkbDescPtr xkb, int type_ndx, int map_count, Bool want_preserve, int new_num_lvls) XkbResizeKeyType;
    ///
    KeySym* function(XkbDescPtr desc, int forKey, int symsNeeded) XkbResizeKeySyms;
    ///
    XkbAction* function(XkbDescPtr desc, int forKey, int actsNeeded) XkbResizeKeyActions;
    ///
    Status function(XkbDescPtr xkb, int key, int num_groups, uint groups, int* newTypes, XkbMapChangesPtr pChanges) XkbChangeTypesOfKey;
    ///
    Status function(XkbDescPtr xkb, int minKC, int maxKC, XkbChangesPtr changes) XkbChangeKeycodeRange;

    /***====================================================================***/

    ///
    XkbComponentListPtr function(Display* dpy, uint deviceSpec, XkbComponentNamesPtr ptrns, int* max_inout) XkbListComponents;
    ///
    void function(XkbComponentListPtr list) XkbFreeComponentList;
    ///
    XkbDescPtr function(Display* dpy, uint which, uint deviceSpec) XkbGetKeyboard;
    ///
    XkbDescPtr function(Display* dpy, uint deviceSpec, XkbComponentNamesPtr names, uint want, uint need, Bool load) XkbGetKeyboardByName;

    /***====================================================================***/

    /**
     * Params:
     *    xkb = keyboard device
     *    map_width = width of core KeySym array
     *    core_syms = always mapWidth symbols
     *    protected = explicit key types
     *    types_inout = always four type indices
     *    xkb_syms_rtrn = must have enough space
     *
     * Returns:
     *    returns # of groups
     */
    int function(XkbDescPtr xkb, int map_width, KeySym* core_syms, uint protected_, int* types_inout, KeySym* xkb_syms_rtrn) XkbKeyTypesForCoreSymbols;

    /**
     * Params:
     *    xkb = keymap to be edited
     *    key = key to be updated
     *    changes = resulting changes to map
     *
     * Returns:
     *    False only on error
     */
    Bool function(XkbDescPtr xkb, KeyCode key, XkbChangesPtr changes) XkbApplyCompatMapToKey;

    /**
     * Params:
     *    xkb = XKB keyboard to be edited
     *    first_key = first changed key
     *    num_keys = number of changed keys
     *    map_width = width of core keymap
     *    core_keysyms = symbols from core keymap
     *    changes = resulting changes
     *
     * Returns:
     *    False only on error
     */
    Bool function(XkbDescPtr xkb, KeyCode first_key, int num_keys, int map_width, KeySym* core_keysyms, XkbChangesPtr changes) XkbUpdateMapFromCore;

    /***====================================================================***/

    ///
    XkbDeviceLedInfoPtr function(XkbDeviceInfoPtr devi, uint ledClass, uint ledId) XkbAddDeviceLedInfo;
    ///
    Status function(XkbDeviceInfoPtr devi, uint newTotal) XkbResizeDeviceButtonActions;
    ///
    XkbDeviceInfoPtr function(uint deviceSpec, uint nButtons, uint szLeds) XkbAllocDeviceInfo;
    ///
    void function(XkbDeviceInfoPtr devi, uint which, Bool freeDevI) XkbFreeDeviceInfo;
    ///
    void function(XkbDeviceChangesPtr old, XkbExtensionDeviceNotifyEvent* new_, uint wanted) XkbNoteDeviceChanges;
    ///
    XkbDeviceInfoPtr function(Display* dpy, uint which, uint deviceSpec, uint ledClass, uint ledID) XkbGetDeviceInfo;
    ///
    Status function(Display* dpy, XkbDeviceInfoPtr devi, XkbDeviceChangesPtr changes) XkbGetDeviceInfoChanges;
    ///
    Status function(Display* dpy, XkbDeviceInfoPtr devi, Bool all, uint first, uint nBtns) XkbGetDeviceButtonActions;

    /**
     * Params:
     *    dpy =
     *    devi =
     *    ledClass = class, XIDflt, XIAll
     *    ledId = id, XIDflt, XIAll
     *    which = XkbXI_Indicator{Names,Map}Mask
     */
    Status function(Display* dpy, XkbDeviceInfoPtr devi, uint ledClass, uint ledId, uint which) XkbGetDeviceLedInfo;

    ///
    Bool function(Display* dpy, uint which, XkbDeviceInfoPtr devi) XkbSetDeviceInfo;

    ///
    Bool function(Display* dpy, XkbDeviceInfoPtr desc, XkbDeviceChangesPtr changes) XkbChangeDeviceInfo;

    ///
    Bool function(Display* dpy, XkbDeviceInfoPtr devi, uint ledClass, uint ledID, uint which) XkbSetDeviceLedInfo;

    ///
    Bool function(Display* dpy, XkbDeviceInfoPtr devi, uint first, uint nBtns) XkbSetDeviceButtonActions;

    /***====================================================================***/

    ///
    char function(char c) XkbToControl;

    /***====================================================================***/

    ///
    Bool function(Display* dpy, uint mask, uint flags, char* msg, uint ctrls_mask, uint ctrls, uint* rtrn_flags, uint* rtrn_ctrls) XkbSetDebuggingFlags;

    ///
    Bool function(XkbDescPtr xkb, uint changed, XkbChangesPtr changes) XkbApplyVirtualModChanges;

    ///
    Bool function(XkbDescPtr xkb, XkbAction* act, uint changed) XkbUpdateActionVirtualMods;

    ///
    void function(XkbDescPtr xkb, XkbKeyTypePtr type, uint changed, XkbChangesPtr changes) XkbUpdateKeyTypeVirtualMods;
}

///
struct _XkbAnyEvent {
    /// XkbAnyEvent
    int type;
    /// # of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XKB event minor code
    int xkb_type;
    /// device ID
    uint device;
}

///
alias XkbAnyEvent = _XkbAnyEvent;

///
struct _XkbNewKeyboardNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbNewKeyboardNotify
    int xkb_type;
    /// device ID
    int device;
    /// device ID of previous keyboard
    int old_device;
    /// minimum key code
    int min_key_code;
    /// maximum key code
    int max_key_code;
    /// min key code of previous kbd
    int old_min_key_code;
    /// max key code of previous kbd
    int old_max_key_code;
    /// changed aspects of the keyboard
    uint changed;
    /// major and minor opcode of req
    ubyte req_major;
    /// that caused change, if applicable
    ubyte req_minor;
}

///
alias XkbNewKeyboardNotifyEvent = _XkbNewKeyboardNotify;

///
struct _XkbMapNotifyEvent {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbMapNotify
    int xkb_type;
    /// device ID
    int device;
    /// fields which have been changed
    uint changed;
    /// reserved
    uint flags;
    /// first changed key type
    int first_type;
    /// number of changed key types
    int num_types;
    ///
    KeyCode min_key_code;
    ///
    KeyCode max_key_code;
    ///
    KeyCode first_key_sym;
    ///
    KeyCode first_key_act;
    ///
    KeyCode first_key_behavior;
    ///
    KeyCode first_key_explicit;
    ///
    KeyCode first_modmap_key;
    ///
    KeyCode first_vmodmap_key;
    ///
    int num_key_syms;
    ///
    int num_key_acts;
    ///
    int num_key_behaviors;
    ///
    int num_key_explicit;
    ///
    int num_modmap_keys;
    ///
    int num_vmodmap_keys;
    /// mask of changed virtual mods
    uint vmods;
}

///
alias XkbMapNotifyEvent = _XkbMapNotifyEvent;

///
struct _XkbStateNotifyEvent {
    /// XkbAnyEvent
    int type;
    /// # of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbStateNotify
    int xkb_type;
    /// device ID
    int device;
    /// mask of changed state components
    uint changed;
    /// keyboard group
    int group;
    /// base keyboard group
    int base_group;
    /// latched keyboard group
    int latched_group;
    /// locked keyboard group
    int locked_group;
    /// modifier state
    uint mods;
    /// base modifier state
    uint base_mods;
    /// latched modifiers
    uint latched_mods;
    /// locked modifiers
    uint locked_mods;
    /// compatibility state
    int compat_state;
    /// mods used for grabs
    ubyte grab_mods;
    /// grab mods for non-XKB clients
    ubyte compat_grab_mods;
    /// mods sent to clients
    ubyte lookup_mods;
    /// mods sent to non-XKB clients
    ubyte compat_lookup_mods;
    /// pointer button state
    int ptr_buttons;
    /// keycode that caused the change
    KeyCode keycode;
    /// KeyPress or KeyRelease
    ubyte event_type;
    /// Major opcode of request
    ubyte req_major;
    /// Minor opcode of request
    ubyte req_minor;
}

///
alias XkbStateNotifyEvent = _XkbStateNotifyEvent;

///
struct _XkbControlsNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbControlsNotify
    int xkb_type;
    /// device ID
    int device;
    /// controls with changed sub-values
    uint changed_ctrls;
    /// controls currently enabled
    uint enabled_ctrls;
    /// controls just {en,dis}abled
    uint enabled_ctrl_changes;
    /// total groups on keyboard
    int num_groups;
    /// key that caused change or 0
    KeyCode keycode;
    /// type of event that caused change
    ubyte event_type;
    /// if keycode==0, major and minor
    ubyte req_major;
    /// opcode of req that caused change
    ubyte req_minor;
}

///
alias XkbControlsNotifyEvent = _XkbControlsNotify;

///
struct _XkbIndicatorNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbIndicatorNotify
    int xkb_type;
    /// device ID
    int device;
    /// indicators with new state or map
    uint changed;
    /// current state of all indicators
    uint state;
}

///
alias XkbIndicatorNotifyEvent = _XkbIndicatorNotify;

///
struct _XkbNamesNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbNamesNotify
    int xkb_type;
    /// device ID
    int device;
    /// names that have changed
    uint changed;
    /// first key type with new name
    int first_type;
    /// number of key types with new names
    int num_types;
    /// first key type new new level names
    int first_lvl;
    /// # of key types w/new level names
    int num_lvls;
    /// total number of key aliases
    int num_aliases;
    /// total number of radio groups
    int num_radio_groups;
    /// virtual modifiers with new names
    uint changed_vmods;
    /// groups with new names
    uint changed_groups;
    /// indicators with new names
    uint changed_indicators;
    /// first key with new name
    int first_key;
    /// number of keys with new names
    int num_keys;
}

///
alias XkbNamesNotifyEvent = _XkbNamesNotify;

///
struct _XkbCompatMapNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbCompatMapNotify
    int xkb_type;
    /// device ID
    int device;
    /// groups with new compat maps
    uint changed_groups;
    /// first new symbol interp
    int first_si;
    /// number of new symbol interps
    int num_si;
    /// total # of symbol interps
    int num_total_si;
}

///
alias XkbCompatMapNotifyEvent = _XkbCompatMapNotify;

///
struct _XkbBellNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbBellNotify
    int xkb_type;
    /// device ID
    int device;
    /// requested volume as a % of maximum
    int percent;
    /// requested pitch in Hz
    int pitch;
    /// requested duration in useconds
    int duration;
    /// (input extension) feedback class
    int bell_class;
    /// (input extension) ID of feedback
    int bell_id;
    /// "name" of requested bell
    Atom name;
    /// window associated with event
    Window window;
    /// "event only" requested
    Bool event_only;
}

///
alias XkbBellNotifyEvent = _XkbBellNotify;

///
struct _XkbActionMessage {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbActionMessage
    int xkb_type;
    /// device ID
    int device;
    /// key that generated the event
    KeyCode keycode;
    /// true if act caused by key press
    Bool press;
    /// true if key event also generated
    Bool key_event_follows;
    /// effective group
    int group;
    /// effective mods
    uint mods;
    ///
    ubyte[XkbActionMessageLength+1] message;
}

///
alias XkbActionMessageEvent = _XkbActionMessage;

///
struct _XkbAccessXNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbAccessXNotify
    int xkb_type;
    /// device ID
    int device;
    /// XkbAXN_*
    int detail;
    /// key of event
    int keycode;
    /// current slow keys delay
    int sk_delay;
    /// current debounce delay
    int debounce_delay;
}

///
alias XkbAccessXNotifyEvent = _XkbAccessXNotify;

///
struct _XkbExtensionDeviceNotify {
    /// XkbAnyEvent
    int type;
    /// of last req processed by server
    c_ulong serial;
    /// is this from a SendEvent request?
    Bool send_event;
    /// Display the event was read from
    Display* display;
    /// milliseconds
    Time time;
    /// XkbExtensionDeviceNotify
    int xkb_type;
    /// device ID
    int device;
    /// reason for the event
    uint reason;
    /// mask of supported features
    uint supported;
    /// mask of unsupported features that some app tried to use
    uint unsupported;
    /// first button that changed
    int first_btn;
    /// range of buttons changed
    int num_btns;
    /// indicators with names or maps
    uint leds_defined;
    /// current state of the indicators
    uint led_state;
    /// feedback class for led changes
    int led_class;
    /// feedback id for led changes
    int led_id;
}

///
alias XkbExtensionDeviceNotifyEvent = _XkbExtensionDeviceNotify;

///
union _XkbEvent {
    ///
    int type;
    ///
    XkbAnyEvent any;
    ///
    XkbNewKeyboardNotifyEvent new_kbd;
    ///
    XkbMapNotifyEvent map;
    ///
    XkbStateNotifyEvent state;
    ///
    XkbControlsNotifyEvent ctrls;
    ///
    XkbIndicatorNotifyEvent indicators;
    ///
    XkbNamesNotifyEvent names;
    ///
    XkbCompatMapNotifyEvent compat;
    ///
    XkbBellNotifyEvent bell;
    ///
    XkbActionMessageEvent message;
    ///
    XkbAccessXNotifyEvent accessx;
    ///
    XkbExtensionDeviceNotifyEvent device;
    ///
    XEvent core;
}

///
alias XkbEvent = _XkbEvent;

///
struct _XkbKbdDpyState;
///
alias XkbKbdDpyStateRec = _XkbKbdDpyState;
///
alias XkbKbdDpyStatePtr = _XkbKbdDpyState*;

/// XkbOpenDisplay error codes
enum {
    ///
    XkbOD_Success = 0,
    ///
    XkbOD_BadLibraryVersion = 1,
    ///
    XkbOD_ConnectionRefused = 2,
    ///
    XkbOD_NonXkbServer = 3,
    ///
    XkbOD_BadServerVersion = 4
}

/// Values for XlibFlags
enum {
    ///
    XkbLC_ForceLatin1Lookup = 1<<0,
    ///
    XkbLC_ConsumeLookupMods = 1<<1,
    ///
    XkbLC_AlwaysConsumeShiftAndLock = 1<<2,
    ///
    XkbLC_IgnoreNewKeyboards = 1<<3,
    ///
    XkbLC_ControlFallback = 1<<4,
    ///
    XkbLC_ConsumeKeysOnComposeFail = 1<<29,
    ///
    XkbLC_ComposeLED = 1<<30,
    ///
    XkbLC_BeepOnComposeFail = 1<<31,

    ///
    XkbLC_AllComposeControls = 0xc0000000,
    ///
    XkbLC_AllControls = 0xc000001f,
}

///
void XkbNoteIndicatorMapChanges(O, N, W)(ref O o, N n, W w) {
    o.map_changes |= n.map_changes & w;
}
///
void XkbNoteIndicatorStateChanges(O, N, W)(ref O o, N n, W w) {
    o.state_changes |= n.state_changes & w;
}
///
auto XkbGetIndicatorMapChanges(D, X, C)(D d, X x, C c) {
    return XkbGetIndicatorMap(d, c.map_changes, x);
}
///
auto XkbChangeIndicatorMaps(D, X, C)(D d, X x, C c) {
    return XkbSetIndicatorMap(d, c.map_changes, x);
}

///
auto XkbGetControlsChanges(D, X, C)(D d, X x, C c) { return XkbGetControls(d, c.changed_ctrls, x); }
///
auto XkbChangeControls(D, X, C)(D d, X x, C c) { return XkbSetControls(d, c.changed_ctrls, x); }

///
alias XkbInternAtomFunc = extern(C) Atom function(Display* dpy, const char* name, Bool only_if_exists);
///
alias XkbGetAtomNameFunc = extern(C) char* function(Display* dpy, Atom atom);
