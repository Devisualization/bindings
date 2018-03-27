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
module devisualization.bindings.x11.extensions.XKBstr;
import devisualization.bindings.x11.extensions.XKB;
import devisualization.bindings.x11.extensions.XKBgeom;
import devisualization.bindings.x11.Xlib;
import devisualization.bindings.x11.X;
import core.stdc.config : c_long, c_ulong;

///
int XkbCharToInt(V)(V v) { return cast(int)((v & 0x80) ? (v | ~0xff) : (v & 0x7f)); }

///
void XkbIntTo2Chars(I, H, L)(I i, ref H h, ref L l) {
    h = (i >> 8) & 0xff;
    l = i & 0xff;
}

///
short Xkb2CharsToInt(H, L)(H h, L l) { return cast(short)((h << 8) | l); }

/*
 * Common data structures and access macros
 */

///
struct _XkbStateRec {
    ///
    ubyte group;
    ///
    ubyte locked_group;
    ///
    ushort base_group;
    ///
    ushort latched_group;
    ///
    ubyte mods;
    ///
    ubyte base_mods;
    ///
    ubyte latched_mods;
    ///
    ubyte locked_mods;
    ///
    ubyte compat_state;
    ///
    ubyte grab_mods;
    ///
    ubyte compat_grab_mods;
    ///
    ubyte lookup_mods;
    ///
    ubyte compat_lookup_mods;
    ///
    ushort ptr_buttons;
}

///
alias XkbStateRec = _XkbStateRec;
///
alias XkbStatePtr = XkbStateRec*;

///
auto XkbModLocks(S)(S s) { return s.locked_mods; }
///
auto XkbStateMods(S)(S s) { return s.base_mods | s.latched_mods | XkbModLocks(x); }
///
auto XkbGroupLock(S)(S s) { return s.locked_group; }
///
auto XkbStateGroup(S)(S s) { return s.base_group + s.latched_group + XkbGroupLock(s); }
///
auto XkbStateFieldFromRec(S)(S s) { return XkbBuildCoreState(s.lookup_mods, s.group); }
///
auto XkbGrabStateFromRec(S)(S s) { return XkbBuildCoreState(s.grab_mods, s.group); }

///
struct _XkbMods {
    /// effective mods
    ubyte mask;
    ///
    ubyte real_mods;
    ///
    ushort vmods;
}

///
alias XkbModsRec = _XkbMods;
///
alias XkbModsPtr = _XkbMods*;

///
struct _XkbKTMapEntry {
    ///
    Bool active;
    ///
    ubyte level;
    ///
    XkbModsRec mods;
}

///
alias XkbKTMapEntryRec = _XkbKTMapEntry;
///
alias XkbKTMapEntryPtr = XkbKTMapEntryRec*;

///
struct _XkbKeyType {
    ///
    XkbModsRec mods;
    ///
    ubyte num_levels;
    ///
    ubyte map_count;
    /// map is an array of map_count XkbKTMapEntryRec structs
    XkbKTMapEntryPtr map;
    /// preserve is an array of map_count XkbModsRec structs
    XkbModsPtr preserve;
    ///
    Atom name;
    /// level_names is an array of num_levels Atoms
    Atom* level_names;
}

///
alias XkbKeyTypeRec = _XkbKeyType;
///
alias XkbKeyTypePtr = _XkbKeyType*;

///
auto XkbNumGroups(G)(G g) { return g & 0x0f; }
///
auto XkbOutOfRangeGroupInfo(G)(G g) { return g &0xf0; }
///
auto XkbOutOfRangeGroupAction(G)(G g) { return g & 0xc0; }
///
auto XkbOutOfRangeGroupNumber(G)(G g) { return (g & 0x30) >> 4; }
///
auto XkbSetGroupInfo(G, W, N)(G g,W w,N n) { return (w & 0xc0) | ((n & 3) << 4) | (g & 0x0f); }
///
auto XkbSetNumGroups(G, N)(G g,N n) { return (g & 0xf0) |n & 0x0f; }

/*
 * Structures and access macros used primarily by the server
 */

///
struct _XkbBehavior {
    ///
    ubyte type;
    ///
    ubyte data;
}

///
alias XkbBehavior = _XkbBehavior;

///
enum XkbAnyActionDataSize = 7;

///
struct _XkbAnyAction {
    ///
    ubyte type;
    ///
    ubyte[XkbAnyActionDataSize] data;
}

///
alias XkbAnyAction = _XkbAnyAction;

///
struct _XkbModAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte mask;
    ///
    ubyte real_mods;
    ///
    ubyte vmods1;
    ///
    ubyte vmods2;
}

///
alias XkbModAction = _XkbModAction;

///
short XkbModActionVMods(A)(A a) { return cast(short)((a.vmods1 << 8) | a.vmods2); }

///
void XkbSetModActionVMods(A, V)(ref A a, V v) {
    a.vmods1 = (v >> 8) & 0xff;
    a.vmods2 = v & 0xff;
}

///
struct _XkbGroupAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    byte group_XXX;
}

///
alias XkbGroupAction = _XkbGroupAction;

///
int XkbSAGroup(A)(A a) { return XkbCharToInt(a.group_XXX); }
///
void XkbSASetGroup(A, G)(ref A a,G g) { a.group_XXX = g; }

///
struct _XkbISOAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte mask;
    ///
    ubyte real_mods;
    ///
    byte group_XXX;
    ///
    ubyte affect;
    ///
    ubyte vmods1;
    ///
    ubyte vmods2;
}

///
alias XkbISOAction = _XkbISOAction;

///
struct _XkbPtrAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte high_XXX;
    ///
    ubyte low_XXX;
    ///
    ubyte high_YYY;
    ///
    ubyte low_YYY;
}

///
alias XkbPtrAction = _XkbPtrAction;

///
auto XkbPtrActionX(A)(A a) { return Xkb2CharsToInt(a.high_XXX, a.low_XXX); }
///
auto XkbPtrActionY(A)(A a) { return Xkb2CharsToInt(a.high_YYY, a.low_YYY); }
///
auto XkbSetPtrActionX(A, X)(A a,Y x) { return XkbIntTo2Chars(x, a.high_XXX, a.low_XXX); }
///
auto XkbSetPtrActionY(A, Y)(A a,Y y) { return XkbIntTo2Chars(y, a.high_YYY, a.low_YYY); }

///
struct _XkbPtrBtnAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte count;
    ///
    ubyte button;
}

///
alias XkbPtrBtnAction = _XkbPtrBtnAction;

///
struct _XkbPtrDfltAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte affect;
    ///
    byte valueXXX;
}

///
alias XkbPtrDfltAction = _XkbPtrDfltAction;

///
auto XkbSAPtrDfltValue(A)(A a) { return XkbCharToInt(a.valueXXXX); }
///
void XkbSASetPtrDfltValue(A, C)(ref A a,C c) {
    a.valueXXX = c & 0xff;
}

///
struct _XkbSwitchScreenAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    byte screenXXX;
}

///
alias XkbSwitchScreenAction = _XkbSwitchScreenAction;

///
auto XkbSAScreen(A)(A a) { return XkbCharToInt(a.screenXXX); }
///
auto XkbSASetScreen(A, S)(ref A a, S s) {
    a.screenXXX = s &0xff;
}

///
struct _XkbCtrlsAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte ctrls3;
    ///
    ubyte ctrls2;
    ///
    ubyte ctrls1;
    ///
    ubyte ctrls0;
}

///
alias XkbCtrlsAction = _XkbCtrlsAction;

///
void XkbActionSetCtrls(A, C)(ref A a, C c) {
    a.crtls3 = (c >> 24) & 0xff;
    a.ctrls2 = (c >> 16) & 0xff;
    a.ctrls1 = (c >> 8) &0xff;
    a.ctrls0 = c & 0xff;
}

///
auto XkbActionCtrls(A)(A a) {
    return (a.ctrls3 << 24) |
        (a.ctrls2 << 16) |
        (a.ctrls1 << 8) |
        a.ctrls0;
}

///
struct _XkbMessageAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte[6] message;
}

///
alias XkbMessageAction = _XkbMessageAction;

///
struct _XkbRedirectKeyAction {
    ///
    ubyte type;
    ///
    ubyte new_key;
    ///
    ubyte mods_mask;
    ///
    ubyte mods;
    ///
    ubyte vmods_mask0;
    ///
    ubyte vmods_mask1;
    ///
    ubyte vmods0;
    ///
    ubyte vmods1;
}

///
alias XkbRedirectKeyAction = _XkbRedirectKeyAction;

///
uint XkbSARedirectVMods(A)(A a) { return cast(uint)((a.vmods1 << 8)|a.vmods0); }
///
void XkbSARedirectSetVMods(A, M)(ref A a, M m) {
    a.vmods1 = (m >> 8) & 0xff;
    a.vmods0 = m & 0xff;
}
///
uint XkbSARedirectVModsMask(A)(A a) { return cast(uint)((a.vmods_mask1 << 8) | a.vmods_mask0); }
///
void XkbSARedirectSetVModsMask(A, M)(ref A a, M m) {
    a.vmods_mask1 = (m >> 8) & 0xff;
    a.vmods_mask0 = m & 0xff;
}

///
struct _XkbDeviceBtnAction {
    ///
    ubyte type;
    ///
    ubyte flags;
    ///
    ubyte count;
    ///
    ubyte button;
    ///
    ubyte device;
}

///
alias XkbDeviceBtnAction = _XkbDeviceBtnAction;

///
struct _XkbDeviceValuatorAction {
    ///
    ubyte type;
    ///
    ubyte device;
    ///
    ubyte v1_what;
    ///
    ubyte v1_ndx;
    ///
    ubyte v1_value;
    ///
    ubyte v2_what;
    ///
    ubyte v2_ndx;
    ///
    ubyte v2_value;
}

///
alias XkbDeviceValuatorAction = _XkbDeviceValuatorAction;

///
union _XkbAction {
    ///
    XkbAnyAction any;
    ///
    XkbModAction mods;
    ///
    XkbGroupAction group;
    ///
    XkbISOAction iso;
    ///
    XkbPtrAction ptr;
    ///
    XkbPtrBtnAction btn;
    ///
    XkbPtrDfltAction dflt;
    ///
    XkbSwitchScreenAction screen;
    ///
    XkbCtrlsAction ctrls;
    ///
    XkbMessageAction msg;
    ///
    XkbRedirectKeyAction redirect;
    ///
    XkbDeviceBtnAction devbtn;
    ///
    XkbDeviceValuatorAction devval;
    ///
    ubyte type;
}

///
alias XkbAction = _XkbAction;

///
struct _XkbControls {
    ///
    ubyte mk_dflt_btn;
    ///
    ubyte num_groups;
    ///
    ubyte groups_wrap;
    ///
    XkbModsRec internal;
    ///
    XkbModsRec ignore_lock;
    ///
    uint enabled_ctrls;
    ///
    ushort repeat_delay;
    ///
    ushort repeat_interval;
    ///
    ushort slow_keys_delay;
    ///
    ushort debounce_delay;
    ///
    ushort mk_delay;
    ///
    ushort mk_interval;
    ///
    ushort mk_time_to_max;
    ///
    ushort mk_max_speed;
    ///
    short mk_curve;
    ///
    ushort ax_options;
    ///
    ushort ax_timeout;
    ///
    ushort axt_opts_mask;
    ///
    ushort axt_opts_values;
    ///
    uint axt_ctrls_mask;
    ///
    uint axt_ctrls_values;
    ///
    ubyte[XkbPerKeyBitArraySize] per_key_repeat;
}

///
alias XkbControlsRec = _XkbControls;
///
alias XkbControlsPtr = _XkbControls*;

///
auto XkbAX_AnyFeedback(C)(C c) { return c.enabled_ctrls & XkbAccessXFeedbackMask; }
///
auto XkbAX_NeedOption(C, W)(C c, W w) { return c.ax_options&w; }
///
bool XkbAX_NeedFeedback(C, W)(C c, W w) { return XkbAX_AnyFeedback(c) && XkbAX_NeedOption(c, w); }

struct _XkbServerMapRec {
    /**
     * acts is an array of XkbActions structs, with size_acts entries
     *  allocated, and num_acts entries used.
     */
    ushort num_acts;
    /// Ditto
    ushort size_acts;
    ///
    XkbAction* acts;

    /**
     * behaviors, key_acts, explicit, & vmodmap are all arrays with
     * (xkb->max_key_code + 1) entries allocated for each.
     */
    XkbBehavior* behaviors;
    ///
    ushort* key_acts;
    ///
    ubyte* explicit;
    ///
    ubyte[XkbNumVirtualMods] vmods;
    ///
    ushort* vmodmap;
}

///
alias XkbServerMapRec = _XkbServerMapRec;
///
alias XkbServerMapPtr = _XkbServerMapRec*;

///
auto XkbSMKeyActionsPtr(M, K)(M m, K k) { return &m.acts[m.key_acts[k]]; }

/**
 * Structures and access macros used primarily by clients
 */

///
struct _XkbSymMapRec {
    ///
    ubyte[XkbNumKbdGroups] kt_index;
    ///
    ubyte group_info;
    ///
    ubyte width;
    ///
    ushort offset;
}

///
alias XkbSymMapRec = _XkbSymMapRec;
///
alias XkbSymMapPtr = _XkbSymMapRec*;

///
struct _XkbClientMapRec {
    /**
     * types is an array of XkbKeyTypeRec structs, with size_types entries
     * allocated, and num_types entries used.
     */
    ubyte size_types;
    ///
    ubyte num_types;
    ///
    XkbKeyTypePtr types;

    /// syms is an array of size_syms KeySyms, in which num_syms are used
    ushort size_syms;
    /// Ditto
    ushort num_syms;
    /// Ditto
    KeySym* syms;
    /// key_sym_map is an array of (max_key_code + 1) XkbSymMapRec structs
    XkbSymMapPtr key_sym_map;

    /// modmap is an array of (max_key_code + 1) unsigned chars
    ubyte* modmap;
}

///
alias XkbClientMapRec = _XkbClientMapRec;
///
alias XkbClientMapPtr = _XkbClientMapRec*;

///
auto XkbCMKeyGroupInfo(M, K)(M m, K k) { return m.key_sym_map[k].group_info; }
///
auto XkbCMKeyNumGroups(M, K)(M m, K k) { return XkbNumGroups(m.key_sym_map[k].group_info); }
///
auto XkbCMKeyGroupWidth(M, K, G)(M m, K k, G g) {return XkbCMKeyType(m, k, g).num_levels; }
///
auto XkbCMKeyGroupsWidth(M, K)(M m, K k) { return m.key_sym_map[k].width; }
///
auto XkbCMKeyTypeIndex(M, K, G)(M m, K k, G g) { return m.key_sym_map[k].kt_index[g&0x3]; }
///
auto XkbCMKeyType(M, K, G)(M m, K k, G g) { return &m.types[XkbCMKeyTypeIndex(m, k, g)]; }
///
auto XkbCMKeyNumSyms(M, K)(M m, K k) { return XkbCMKeyGroupsWidth(m, k) * XkbMCMKeyNumGroups(m, k); }
///
auto XkbCMKeySymsOffset(M, K)(M m, K k) { return m.key_sym_map[k].offset; }
///
auto XkbCMKeySymsPtr(M, K)(M m, K k) { return &m.syms[XkbCMKeySymsOffset(m, k)]; }

/*
 * Compatibility structures and access macros
 */

///
struct _XkbSymInterpretRec {
    ///
    KeySym sym;
    ///
    ubyte flags;
    ///
    ubyte match;
    ///
    ubyte mods;
    ///
    ubyte virtual_mod;
    ///
    XkbAnyAction act;
}

///
alias XkbSymInterpretRec = _XkbSymInterpretRec;
///
alias XkbSymInterpretPtr = _XkbSymInterpretRec*;

///
struct _XkbCompatMapRec {
    /**
     * sym_interpret is an array of XkbSymInterpretRec structs,
     *  in which size_si are allocated & num_si are used.
     */
    XkbSymInterpretPtr sym_interpret;
    ///
    XkbModsRec[XkbNumKbdGroups] groups;
    ///
    ushort num_si;
    ///
    ushort size_si;
}

///
alias XkbCompatMapRec = _XkbCompatMapRec;
///
alias XkbCompatMapPtr = _XkbCompatMapRec*;

///
struct _XkbIndicatorMapRec {
    ///
    ubyte flags;
    ///
    ubyte which_groups;
    ///
    ubyte groups;
    ///
    ubyte which_mods;
    ///
    XkbModsRec mods;
    ///
    uint ctrls;
}

///
alias XkbIndicatorMapRec = _XkbIndicatorMapRec;
///
alias XkbIndicatorMapPtr = _XkbIndicatorMapRec*;

///
bool XkbIM_IsAuto(I)(I i) {
    return (i.flags&XkbIM_NoAutomatic) == 0 &&
        (i.which_groups && i.groups) ||
        (i.which_mods && i.mods.mask) ||
        i.ctrls;
}

///
bool XkbIM_InUse(I)(I i) {
    return i.flags || i.which_groups || i.which_mods || i.ctrls;
}

///
struct _XkbIndicatorRec {
    ///
    c_ulong phys_indicators;
    ///
    XkbIndicatorMapRec[XkbNumIndicators] maps;
}

///
alias XkbIndicatorRec = _XkbIndicatorRec;
///
alias XkbIndicatorPtr = _XkbIndicatorRec*;

///
struct _XkbKeyNameRec {
    ///
    char[XkbKeyNameLength] name;
}

///
alias XkbKeyNameRec = _XkbKeyNameRec;
///
alias XkbKeyNamePtr = _XkbKeyNameRec*;

///
struct _XkbKeyAliasRec {
    ///
    char[XkbKeyNameLength] real_;
    ///
    char[XkbKeyNameLength] alias_;
}

///
alias XkbKeyAliasRec = _XkbKeyAliasRec;
///
alias XkbKeyAliasPtr = _XkbKeyAliasRec*;

/**
 * Names for everything
 */
struct _XkbNamesRec {
    ///
    Atom keycodes;
    ///
    Atom geometry;
    ///
    Atom symbols;
    ///
    Atom types;
    ///
    Atom compat;
    ///
    Atom[XkbNumVirtualMods] vmods;
    ///
    Atom[XkbNumIndicators] indicators;
    ///
    Atom[XkbNumKbdGroups] groups;
    /// keys is an array of (xkb->max_key_code + 1) XkbKeyNameRec entries
    XkbKeyNamePtr keys;
    /// key_aliases is an array of num_key_aliases XkbKeyAliasRec entries
    XkbKeyAliasPtr key_aliases;
    /// radio_groups is an array of num_rg Atoms
    Atom* radio_groups;
    ///
    Atom phys_symbols;

    /// num_keys seems to be unused in libX11
    ubyte num_keys;
    ///
    ubyte num_key_aliases;
    ///
    ushort num_rg;
}

///
alias XkbNamesRec = _XkbNamesRec;
///
alias XkbNamesPtr = _XkbNamesRec*;

///
alias XkbGeometryPtr = _XkbGeometry*;

/**
 * Tie it all together into one big keyboard description
 */
struct _XkbDesc {
    ///
    _XDisplay* dpy;
    ///
    ushort flags;
    ///
    ushort device_spec;
    ///
    KeyCode min_key_code;
    ///
    KeyCode max_key_code;

    XkbControlsPtr ctrls;
    ///
    XkbServerMapPtr server;
    ///
    XkbClientMapPtr map;
    ///
    XkbIndicatorPtr indicators;
    ///
    XkbNamesPtr names;
    ///
    XkbCompatMapPtr compat;
    ///
    XkbGeometryPtr geom;
}

///
alias XkbDescRec = _XkbDesc;
///
alias XkbDescPtr = _XkbDesc*;

///
auto XkbKeyKeyTypeIndex(D, K, G)(D d, K k, G g) { return XkbCMKeyTypeIndex(d.map, k, g); }
///
auto XkbKeyKeyType(D, K, G)(D d, K k, G g) { return XkbCMKeyType(d.map, k, g); }
///
auto XkbKeyGroupWidth(D, K, G)(D d, K k, G g) { return XkbCMKeyGroupWith(d.map, k, g); }
///
auto XkbKeyGroupsWidth(D, K)(D d, K k) { return XkbCMKeyGroupsWidth(d.map, k); }
///
auto XkbKeyGroupInfo(D, K)(D d, K k) { return XkbCMKeyGroupInfo(d.map, k); }
///
auto XkbKeyNumGroups(D, K)(D d, K k) { return XkbCMKeyNumGroups(d.map, k); }
///
auto XkbKeyNumSyms(D, K)(D d, K k) { return XkbCMKeyNumSyms(d.map, k); }
///
auto XkbKeySymsPtr(D, K)(D d, K k) { return XkbCMKeySymsPtr(d.map, k); }
///
auto XkbKeySym(D, K, N)(D d, K k, N n) { return XkbKeySymsPtr(d, k)[n]; }
///
auto XkbKeySymEntry(D, K, SL, G)(D d, K k, SL sl, G g) { return XkbKeySym(d, k, (XkbKeyGroupsWidth(d, k) * g) + sl); }
///
auto XkbKeyAction(D, K, N)(D d, K k, N n) { return XkbKeyHasActions(d, k) ? &XkbKeyActionsPtr(d, k)[n] : null; }
///
auto XkbKeyActionEntry(D, K, SL, G)(D d, K k, SL sl, G g) { XkbKeyHasActions(d, k) ? XkbKeyAction(d, k, (XkbKeyGroupsWidth(d, k)*g) + sl) : sl; }
///
bool XkbKeyHasActions(D, K)(D d, K k) { return d.server.key_acts[k] != 0; }
///
auto XkbKeyNumActions(D, K)(D d, K k) { return XkbKeyHasActions(d, k) ? XkbKeyNumSyms(d, k) : 1; }
///
auto XkbKeyActionsPtr(D, K)(D d, K k) { return XkbSMKeyActionsPtr(d.server, k); }
///
bool XkbKeycodeInRange(D, K)(D d, K k) { return k >= d.min_key_code && k <= d.max_key_code; }
///
auto XkbNumKeys(D)(D d) { return d.max_key_code - d.min_key_code+1; }


/**
 * The following structures can be used to track changes
 * to a keyboard device
 */
struct _XkbMapChanges {
    ///
    ushort changed;
    ///
    KeyCode min_key_code;
    ///
    KeyCode max_key_code;
    ///
    ubyte first_type;
    ///
    ubyte num_types;
    ///
    KeyCode first_key_sym;
    ///
    ubyte num_key_syms;
    ///
    KeyCode first_key_act;
    ///
    ubyte num_key_acts;
    ///
    KeyCode first_key_behavior;
    ///
    ubyte num_key_behaviors;
    ///
    KeyCode first_key_explicit;
    ///
    ubyte num_key_explicit;
    ///
    KeyCode first_modmap_key;
    ///
    ubyte num_modmap_keys;
    ///
    KeyCode first_vmodmap_key;
    ///
    ubyte num_vmodmap_keys;
    ///
    ubyte pad;
    ///
    ushort vmods;
}

///
alias XkbMapChangesRec = _XkbMapChanges;
///
alias XkbMapChangesPtr = _XkbMapChanges*;

///
struct _XkbControlsChanges {
    ///
    uint changed_ctrls;
    ///
    uint enabled_ctrls_changes;
    ///
    Bool num_groups_changed;
}

///
alias XkbControlsChangesRec = _XkbControlsChanges;
///
alias XkbControlsChangesPtr = _XkbControlsChanges*;

///
struct _XkbIndicatorChanges {
    ///
    uint state_changes;
    ///
    uint map_changes;
}

///
alias XkbIndicatorChangesRec = _XkbIndicatorChanges;
///
alias XkbIndicatorChangesPtr = _XkbIndicatorChanges*;

///
struct _XkbNameChanges {
    ///
    uint changed;
    ///
    ubyte first_type;
    ///
    ubyte num_types;
    ///
    ubyte first_lvl;
    ///
    ubyte num_lvls;
    ///
    ubyte num_aliases;
    ///
    ubyte num_rg;
    ///
    ubyte first_key;
    ///
    ubyte num_keys;
    ///
    ushort changed_vmods;
    ///
    c_ulong changed_indicators;
    ///
    ubyte changed_groups;
}

///
alias XkbNameChangesRec = _XkbNameChanges;
///
alias XkbNameChangesPtr = _XkbNameChanges*;

///
struct _XkbCompatChanges {
    ///
    ubyte changed_groups;
    ///
    ushort first_si;
    ///
    ushort num_si;
}

///
alias XkbCompatChangesRec = _XkbCompatChanges;
///
alias XkbCompatChangesPtr = _XkbCompatChanges*;

///
struct _XkbChanges {
    ///
    ushort device_spec;
    ///
    ushort state_changes;
    ///
    XkbMapChangesRec map;
    ///
    XkbControlsChangesRec ctrls;
    ///
    XkbIndicatorChangesRec indicators;
    ///
    XkbNameChangesRec names;
    ///
    XkbCompatChangesRec compat;
}

///
alias XkbChangesRec = _XkbChanges;
///
alias XkbChangesPtr = _XkbChanges*;

/*
 * These data structures are used to construct a keymap from
 * a set of components or to list components in the server
 * database.
 */

///
struct _XkbComponentNames {
    char* keymap;
    ///
    char* keycodes;
    ///
    char* types;
    ///
    char* compat;
    ///
    char* symbols;
    ///
    char* geometry;
}

///
alias XkbComponentNamesRec = _XkbComponentNames;
///
alias XkbComponentNamesPtr = _XkbComponentNames*;

///
struct _XkbComponentName {
    ///
    ushort flags;
    ///
    char* name;
}

///
alias XkbComponentNameRec = _XkbComponentName;
///
alias XkbComponentNamePtr = _XkbComponentName*;

///
struct _XkbComponentList {
    ///
    int num_keymaps;
    ///
    int num_keycodes;
    ///
    int num_types;
    ///
    int num_compat;
    ///
    int num_symbols;
    ///
    int num_geometry;
    ///
    XkbComponentNamePtr keymaps;
    ///
    XkbComponentNamePtr keycodes;
    ///
    XkbComponentNamePtr types;
    ///
    XkbComponentNamePtr compat;
    ///
    XkbComponentNamePtr symbols;
    ///
    XkbComponentNamePtr geometry;
}

///
alias XkbComponentListRec = _XkbComponentList;
///
alias XkbComponentListPtr = _XkbComponentList*;

/*
 * The following data structures describe and track changes to a
 * non-keyboard extension device
 */

///
struct _XkbDeviceLedInfo {
    ///
    ushort led_class;
    ///
    ushort led_id;
    ///
    uint phys_indicators;
    ///
    uint maps_present;
    ///
    uint names_present;
    ///
    uint state;
    ///
    Atom[XkbNumIndicators] names;
    ///
    XkbIndicatorMapRec[XkbNumIndicators] maps;
}

///
alias XkbDeviceLedInfoRec = _XkbDeviceLedInfo;
///
alias XkbDeviceLedInfoPtr = _XkbDeviceLedInfo*;

///
struct _XkbDeviceInfo {
    ///
    char* name;
    ///
    Atom type;
    ///
    ushort device_spec;
    ///
    Bool has_own_state;
    ///
    ushort supported;
    ///
    ushort unsupported;

    /// btn_acts is an array of num_btn XkbAction entries
    ushort num_btns;
    ///
    XkbAction* btn_acts;

    ///
    ushort sz_leds;
    ///
    ushort num_leds;
    ///
    ushort dflt_kbd_fb;
    ///
    ushort dflt_led_fb;

    /**
     * leds is an array of XkbDeviceLedInfoRec in which
     *  sz_leds entries are allocated and num_leds entries are used
     */
    XkbDeviceLedInfoPtr	leds;
}

///
alias XkbDeviceInfoRec = _XkbDeviceInfo;
///
alias XkbDeviceInfoPtr = _XkbDeviceInfo*;

///
bool XkbXI_DevHasBtnActs(D)(D d) { return d.num_btns>0 && d.btn_acts !is null; }
///
bool XkbXI_LegalDevBtn(D, B)(D d, B b) { return XkbXI_DevHasBtnActs(d) && b < d.num_btns; }
///
bool XkbXI_DevHasLeds(D)(D d) { return d.num_leds > 0 && d.leds !is null; }

///
struct _XkbDeviceLedChanges {
    ///
    ushort led_class;
    ///
    ushort led_id;
    /// names or maps changed
    uint defined;
    ///
    _XkbDeviceLedChanges* next;
}

///
alias XkbDeviceLedChangesRec = _XkbDeviceLedChanges;
///
alias XkbDeviceLedChangesPtr = _XkbDeviceLedChanges*;

///
struct _XkbDeviceChanges {
    ///
    uint changed;
    ///
    ushort first_btn;
    ///
    ushort num_btns;
    ///
    XkbDeviceLedChangesRec leds;
}

///
alias XkbDeviceChangesRec = _XkbDeviceChanges;
///
alias XkbDeviceChangesPtr = _XkbDeviceChanges*;

