/**
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

*/
module devisualization.bindings.x11.extensions.XKB;

/**
 * XKB request codes, used in:
 *  -  xkbReqType field of all requests
 *  -  requestMinor field of some events
 */
enum {
    ///
    X_kbUseExtension = 0,
    ///
    X_kbSelectEvents = 1,
    ///
    X_kbBell = 3,
    ///
    X_kbGetState = 4,
    ///
    X_kbLatchLockState = 5,
    ///
    X_kbGetControls = 6,
    ///
    X_kbSetControls = 7,
    ///
    X_kbGetMap = 8,
    ///
    X_kbSetMap = 9,
    ///
    X_kbGetCompatMap = 10,
    ///
    X_kbSetCompatMap = 11,
    ///
    X_kbGetIndicatorState = 12,
    ///
    X_kbGetIndicatorMap = 13,
    ///
    X_kbSetIndicatorMap = 14,
    ///
    X_kbGetNamedIndicator = 15,
    ///
    X_kbSetNamedIndicator = 16,
    ///
    X_kbGetNames = 17,
    ///
    X_kbSetNames = 18,
    ///
    X_kbGetGeometry = 19,
    ///
    X_kbSetGeometry = 20,
    ///
    X_kbPerClientFlags = 21,
    ///
    X_kbListComponents = 22,
    ///
    X_kbGetKbdByName = 23,
    ///
    X_kbGetDeviceInfo = 24,
    ///
    X_kbSetDeviceInfo = 25,
    ///
    X_kbSetDebuggingFlags = 101
}

/**
 * In the X sense, XKB reports only one event.
 * The type field of all XKB events is XkbEventCode
 */
enum {
    ///
    XkbEventCode = 0,
    ///
    XkbNumberEvents = XkbEventCode+1
}

/**
 * XKB has a minor event code so it can use one X event code for
 * multiple purposes.
 *  - reported in the xkbType field of all XKB events.
 *  - XkbSelectEventDetails: Indicates the event for which event details
 *    are being changed
 */
enum {
    ///
    XkbNewKeyboardNotify = 0,
    ///
    XkbMapNotify = 1,
    ///
    XkbStateNotify = 2,
    ///
    XkbControlsNotify = 3,
    ///
    XkbIndicatorStateNotify = 4,
    ///
    XkbIndicatorMapNotify = 5,
    ///
    XkbNamesNotify = 6,
    ///
    XkbCompatMapNotify = 7,
    ///
    XkbBellNotify = 8,
    ///
    XkbActionMessage = 9,
    ///
    XkbAccessXNotify = 10,
    ///
    XkbExtensionDeviceNotify = 11
}

/**
 * Event Mask:
 *  - XkbSelectEvents:  Specifies event interest.
 */
enum {
    ///
    XkbNewKeyboardNotifyMask = 1L << 0,
    ///
    XkbMapNotifyMask = 1L << 1,
    ///
    XkbStateNotifyMask = 1L << 2,
    ///
    XkbControlsNotifyMask = 1L << 3,
    ///
    XkbIndicatorStateNotifyMask = 1L << 4,
    ///
    XkbIndicatorMapNotifyMask = 1L << 5,
    ///
    XkbNamesNotifyMask = 1L << 6,
    ///
    XkbCompatMapNotifyMask = 1L << 7,
    ///
    XkbBellNotifyMask = 1L << 8,
    ///
    XkbActionMessageMask = 1L << 9,
    ///
    XkbAccessXNotifyMask = 1L << 10,
    ///
    XkbExtensionDeviceNotifyMask = 1L << 11,
    ///
    XkbAllEventsMask = 0xFFF
}

/**
 * NewKeyboardNotify event details:
 */
enum {
    ///
    XkbNKN_KeycodesMask = 1L << 0,
    ///
    XkbNKN_GeometryMask = 1L << 1,
    ///
    XkbNKN_DeviceIDMask = 1L << 2,
    ///
    XkbAllNewKeyboardEventsMask = 0x7
}

/**
 * AccessXNotify event types:
 *  - The 'what' field of AccessXNotify events reports the
 *    reason that the event was generated.
 */
enum {
    ///
    XkbAXN_SKPress = 0,
    ///
    XkbAXN_SKAccept = 1,
    ///
    XkbAXN_SKReject = 2,
    ///
    XkbAXN_SKRelease = 3,
    ///
    XkbAXN_BKAccept = 4,
    ///
    XkbAXN_BKReject = 5,
    ///
    XkbAXN_AXKWarning = 6
}

/**
 * AccessXNotify details:
 * - Used as an event detail mask to limit the conditions under which
 *   AccessXNotify events are reported
 */
enum {
    ///
    XkbAXN_SKPressMask = 1L << 0,
    ///
    XkbAXN_SKAcceptMask = 1L << 1,
    ///
    XkbAXN_SKRejectMask = 1L << 2,
    ///
    XkbAXN_SKReleaseMask = 1L << 3,
    ///
    XkbAXN_BKAcceptMask = 1L << 4,
    ///
    XkbAXN_BKRejectMask = 1L << 5,
    ///
    XkbAXN_AXKWarningMask = 1L << 6,
    ///
    XkbAllAccessXEventsMask = 0x7f
}

/**
 * Miscellaneous event details:
 * - event detail masks for assorted events that don't reall
 *   have any details.
 */
enum {
    ///
    XkbAllStateEventsMask = XkbAllStateComponentsMask,
    ///
    XkbAllMapEventsMask = XkbAllMapComponentsMask,
    ///
    XkbAllControlEventsMask = XkbAllControlsMask,
    ///
    XkbAllIndicatorEventsMask = XkbAllIndicatorsMask,
    ///
    XkbAllNameEventsMask = XkbAllNamesMask,
    ///
    XkbAllCompatMapEventsMask = XkbAllCompatMask,
    ///
    XkbAllBellEventsMask = 1L << 0,
    ///
    XkbAllActionMessagesMask = 1L << 0
}

/**
 * XKB reports one error:  BadKeyboard
 * A further reason for the error is encoded into to most significant
 * byte of the resourceID for the error:
 *    XkbErr_BadDevice - the device in question was not found
 *    XkbErr_BadClass  - the device was found but it doesn't belong to
 *                       the appropriate class.
 *    XkbErr_BadId     - the device was found and belongs to the right
 *                       class, but not feedback with a matching id was
 *                       found.
 * The low byte of the resourceID for this error contains the device
 * id, class specifier or feedback id that failed.
 */
enum {
    ///
    XkbKeyboard = 0,
    ///
    XkbNumberErrors = 1,

    ///
    XkbErr_BadDevice = 0xff,
    ///
    XkbErr_BadClass = 0xfe,
    ///
    XkbErr_BadId = 0xfd
}

/**
 * Keyboard Components Mask:
 * - Specifies the components that follow a GetKeyboardByNameReply
 */
enum {
    ///
    XkbClientMapMask = 1L << 0,
    ///
    XkbServerMapMask = 1L << 1,
    ///
    XkbCompatMapMask = 1L << 2,
    ///
    XkbIndicatorMapMask = 1L << 3,
    ///
    XkbNamesMask = 1L << 4,
    ///
    XkbGeometryMask = 1L << 5,
    ///
    XkbControlsMask = 1L << 6,
    ///
    XkbAllComponentsMask = 0x7f,
}

/**
 * State detail mask:
 *  - The 'changed' field of StateNotify events reports which of
 *    the keyboard state components have changed.
 *  - Used as an event detail mask to limit the conditions under
 *    which StateNotify events are reported.
 */
enum {
    ///
    XkbModifierStateMask = 1L << 0,
    ///
    XkbModifierBaseMask = 1L << 1,
    ///
    XkbModifierLatchMask = 1L << 2,
    ///
    XkbModifierLockMask = 1L << 3,
    ///
    XkbGroupStateMask = 1L << 4,
    ///
    XkbGroupBaseMask = 1L << 5,
    ///
    XkbGroupLatchMask = 1L << 6,
    ///
    XkbGroupLockMask = 1L << 7,
    ///
    XkbCompatStateMask = 1L << 8,
    ///
    XkbGrabModsMask = 1L << 9,
    ///
    XkbCompatGrabModsMask = 1L << 10,
    ///
    XkbLookupModsMask = 1L << 11,
    ///
    XkbCompatLookupModsMask = 1L << 12,
    ///
    XkbPointerButtonMask = 1L << 13,
    ///
    XkbAllStateComponentsMask = 0x3fff
}

/**
 * Controls detail masks:
 *  The controls specified in XkbAllControlsMask:
 *  - The 'changed' field of ControlsNotify events reports which of
 *    the keyboard controls have changed.
 *  - The 'changeControls' field of the SetControls request specifies
 *    the controls for which values are to be changed.
 *  - Used as an event detail mask to limit the conditions under
 *    which ControlsNotify events are reported.
 *
 *  The controls specified in the XkbAllBooleanCtrlsMask:
 *  - The 'enabledControls' field of ControlsNotify events reports the
 *    current status of the boolean controls.
 *  - The 'enabledControlsChanges' field of ControlsNotify events reports
 *    any boolean controls that have been turned on or off.
 *  - The 'affectEnabledControls' and 'enabledControls' fields of the
 *    kbSetControls request change the set of enabled controls.
 *  - The 'accessXTimeoutMask' and 'accessXTimeoutValues' fields of
 *    an XkbControlsRec specify the controls to be changed if the keyboard
 *    times out and the values to which they should be changed.
 *  - The 'autoCtrls' and 'autoCtrlsValues' fields of the PerClientFlags
 *    request specifies the specify the controls to be reset when the
 *    client exits and the values to which they should be reset.
 *  - The 'ctrls' field of an indicator map specifies the controls
 *    that drive the indicator.
 *  - Specifies the boolean controls affected by the SetControls and
 *    LockControls key actions.
 */
enum {
    ///
    XkbRepeatKeysMask = 1L << 0,
    ///
    XkbSlowKeysMask = 1L << 1,
    ///
    XkbBounceKeysMask = 1L << 2,
    ///
    XkbStickyKeysMask = 1L << 3,
    ///
    XkbMouseKeysMask = 1L << 4,
    ///
    XkbMouseKeysAccelMask = 1L << 5,
    ///
    XkbAccessXKeysMask = 1L << 6,
    ///
    XkbAccessXTimeoutMask = 1L << 7,
    ///
    XkbAccessXFeedbackMask = 1L << 8,
    ///
    XkbAudibleBellMask = 1L << 9,
    ///
    XkbOverlay1Mask = 1L << 10,
    ///
    XkbOverlay2Mask = 1L << 11,
    ///
    XkbIgnoreGroupLockMask = 1L << 12,
    ///
    XkbGroupsWrapMask = 1L << 27,
    ///
    XkbInternalModsMask = 1L << 28,
    ///
    XkbIgnoreLockModsMask = 1L << 29,
    ///
    XkbPerKeyRepeatMask = 1L << 30,
    ///
    XkbControlsEnabledMask = 1L << 31,

    ///
    XkbAccessXOptionsMask = XkbStickyKeysMask|XkbAccessXFeedbackMask,

    ///
    XkbAllBooleanCtrlsMask = 0x00001FFF,
    ///
    XkbAllControlsMask = 0xF8001FFF,
    ///
    //XkbAllControlEventsMask = XkbAllControlsMask
}

/**
 * AccessX Options Mask
 *  - The 'accessXOptions' field of an XkbControlsRec specifies the
 *    AccessX options that are currently in effect.
 *  - The 'accessXTimeoutOptionsMask' and 'accessXTimeoutOptionsValues'
 *    fields of an XkbControlsRec specify the Access X options to be
 *    changed if the keyboard times out and the values to which they
 *    should be changed.
 */
enum {
    ///
    XkbAX_SKPressFBMask = 1L << 0,
    ///
    XkbAX_SKAcceptFBMask = 1L << 1,
    ///
    XkbAX_FeatureFBMask = 1L << 2,
    ///
    XkbAX_SlowWarnFBMask = 1L << 3,
    ///
    XkbAX_IndicatorFBMask = 1L << 4,
    ///
    XkbAX_StickyKeysFBMask = 1L << 5,
    ///
    XkbAX_TwoKeysMask = 1L << 6,
    ///
    XkbAX_LatchToLockMask = 1L << 7,
    ///
    XkbAX_SKReleaseFBMask = 1L << 8,
    ///
    XkbAX_SKRejectFBMask = 1L << 9,
    ///
    XkbAX_BKRejectFBMask = 1L << 10,
    ///
    XkbAX_DumbBellFBMask = 1L << 11,
    ///
    XkbAX_FBOptionsMask = 0xF3F,
    ///
    XkbAX_SKOptionsMask = 0x0C0,
    ///
    XkbAX_AllOptionsMask = 0xFFF
}

/**
 * XkbUseCoreKbd is used to specify the core keyboard without having
 * 			to look up its X input extension identifier.
 * XkbUseCorePtr is used to specify the core pointer without having
 *			to look up its X input extension identifier.
 * XkbDfltXIClass is used to specify "don't care" any place that the
 *			XKB protocol is looking for an X Input Extension
 *			device class.
 * XkbDfltXIId is used to specify "don't care" any place that the
 *			XKB protocol is looking for an X Input Extension
 *			feedback identifier.
 * XkbAllXIClasses is used to get information about all device indicators,
 *			whether they're part of the indicator feedback class
 *			or the keyboard feedback class.
 * XkbAllXIIds is used to get information about all device indicator
 *			feedbacks without having to list them.
 * XkbXINone is used to indicate that no class or id has been specified.
 * XkbLegalXILedClass(c)  True if 'c' specifies a legal class with LEDs
 * XkbLegalXIBellClass(c) True if 'c' specifies a legal class with bells
 * XkbExplicitXIDevice(d) True if 'd' explicitly specifies a device
 * XkbExplicitXIClass(c)  True if 'c' explicitly specifies a device class
 * XkbExplicitXIId(c)     True if 'i' explicitly specifies a device id
 * XkbSingleXIClass(c)    True if 'c' specifies exactly one device class,
 *                        including the default.
 * XkbSingleXIId(i)       True if 'i' specifies exactly one device
 *	                      identifier, including the default.
 */
enum {
    ///
    XkbUseCoreKbd = 0x0100,
    ///
    XkbUseCorePtr = 0x0200,
    ///
    XkbDfltXIClass = 0x0300,
    ///
    XkbDfltXIId = 0x0400,
    ///
    XkbAllXIClasses = 0x0500,
    ///
    XkbAllXIIds = 0x0600,
    ///
    XkbXINone = 0xff00
}

///
bool XkbLegalXILedClass(T)(T c) {
    return c == KbdFeedbackClass ||
    c == LedFeedbackClass ||
    c == XkbDfltXIClass ||
    c == XkbAllXIClasses;
}

///
bool XkbLegalXIBellClass(T)(T c) {
    return c == KbdFeedbackClass ||
    c == BellFeedbackClass ||
    c == XkbDfltXIClass ||
    c == XkbAllXIClasses;
}

///
bool XkbExplicitXIDevice(T)(T c) { return (c & ~0xff) == 0; }
///
bool XkbExplicitXIClass(T)(T c) { return (c & ~0xff) == 0; }
///
bool XkbExplicitXIId(T)(T c) { return (c & ~0xff) == 0; }
///
bool XkbSingleXIClass(T)(T c) { return (c & ~0xff) == 0 || c == XkbDfltXIClass; }
///
bool XkbSingleXIId(T)(T c) { return (c & ~0xff) == 0 || c == XkbDfltXIId; }

///
enum {
    ///
    XkbNoModifier = 0xff,
    ///
    XkbNoShiftLevel = 0xff,
    ///
    XkbNoShape = 0xff,
    ///
    XkbNoIndicator = 0xff,

    ///
    XkbNoModifierMask = 0,
    ///
    XkbAllModifiersMask = 0xff,
    ///
    XkbAllVirtualModsMask = 0xffff,

    ///
    XkbNumKbdGroups = 4,
    ///
    XkbMaxKbdGroup = XkbNumKbdGroups-1,

    ///
    XkbMaxMouseKeysBtn = 4
}

/**
 * Group Index and Mask:
 *  - Indices into the kt_index array of a key type.
 *  - Mask specifies types to be changed for XkbChangeTypesOfKey
 */
enum {
    ///
    XkbGroup1Index = 0,
    ///
    XkbGroup2Index = 1,
    ///
    XkbGroup3Index = 2,
    ///
    XkbGroup4Index = 3,
    ///
    XkbAnyGroup = 254,
    ///
    XkbAllGroups = 255,

    ///
    XkbGroup1Mask = 1<<0,
    ///
    XkbGroup2Mask = 1<<1,
    ///
    XkbGroup3Mask = 1<<2,
    ///
    XkbGroup4Mask = 1<<3,
    ///
    XkbAnyGroupMask = 1<<7,
    ///
    XkbAllGroupsMask = 0xf
}

/// Given a keyboard group and a modifier state, construct the value to be reported an event.
bool XkbBuildCoreState(T, U)(T m, U g) { return ((g & 0x3) << 13) | (m & 0xff); }
/// Given the state reported in an event, determine the keyboard group.
bool XkbGroupForCoreState(S)(S s) { return (s >> 13) & 0x3; }
/// Returns TRUE if 'g' is a valid group index.
bool XkbIsLegalGroup(G)(G g) { return g >= 0 &&g < XkbNumKbdGroups; }

/**
 * GroupsWrap values:
 *  - The 'groupsWrap' field of an XkbControlsRec specifies the
 *    treatment of out of range groups.
 *  - Bits 6 and 7 of the group info field of a key symbol map
 *    specify the interpretation of out of range groups for the
 *    corresponding key.
 */
enum {
    ///
    XkbWrapIntoRange = 0x00,
    ///
    XkbClampIntoRange = 0x40,
    ///
    XkbRedirectIntoRange = 0x80
}

/**
 * Action flags:  Reported in the 'flags' field of most key actions.
 * Interpretation depends on the type of the action; not all actions
 * accept all flags.
 *
 * Option			Used for Actions
 * ------			----------------
 * ClearLocks		SetMods, LatchMods, SetGroup, LatchGroup
 * LatchToLock		SetMods, LatchMods, SetGroup, LatchGroup
 * LockNoLock		LockMods, ISOLock, LockPtrBtn, LockDeviceBtn
 * LockNoUnlock		LockMods, ISOLock, LockPtrBtn, LockDeviceBtn
 * UseModMapMods		SetMods, LatchMods, LockMods, ISOLock
 * GroupAbsolute		SetGroup, LatchGroup, LockGroup, ISOLock
 * UseDfltButton		PtrBtn, LockPtrBtn
 * NoAcceleration		MovePtr
 * MoveAbsoluteX		MovePtr
 * MoveAbsoluteY		MovePtr
 * ISODfltIsGroup		ISOLock
 * ISONoAffectMods		ISOLock
 * ISONoAffectGroup		ISOLock
 * ISONoAffectPtr		ISOLock
 * ISONoAffectCtrls		ISOLock
 * MessageOnPress		ActionMessage
 * MessageOnRelease		ActionMessage
 * MessageGenKeyEvent	ActionMessage
 * AffectDfltBtn		SetPtrDflt
 * DfltBtnAbsolute		SetPtrDflt
 * SwitchApplication	SwitchScreen
 * SwitchAbsolute		SwitchScreen
 */
enum {
    ///
    XkbSA_ClearLocks = 1L << 0,
    ///
    XkbSA_LatchToLock = 1L << 1,

    ///
    XkbSA_LockNoLock = 1L << 0,
    ///
    XkbSA_LockNoUnlock = 1L << 1,

    ///
    XkbSA_UseModMapMods = 1L << 2,

    ///
    XkbSA_GroupAbsolute = 1L << 2,
    ///
    XkbSA_UseDfltButton = 0,

    ///
    XkbSA_NoAcceleration = 1L << 0,
    ///
    XkbSA_MoveAbsoluteX = 1L << 1,
    ///
    XkbSA_MoveAbsoluteY = 1L << 2,

    ///
    XkbSA_ISODfltIsGroup = 1L << 7,
    ///
    XkbSA_ISONoAffectMods = 1L << 6,
    ///
    XkbSA_ISONoAffectGroup = 1L << 5,
    ///
    XkbSA_ISONoAffectPtr = 1L << 4,
    ///
    XkbSA_ISONoAffectCtrls = 1L << 3,
    ///
    XkbSA_ISOAffectMask = 0x78,

    ///
    XkbSA_MessageOnPress = 1L << 0,
    ///
    XkbSA_MessageOnRelease = 1L << 1,
    ///
    XkbSA_MessageGenKeyEvent = 1L << 2,

    ///
    XkbSA_AffectDfltBtn = 1,
    ///
    XkbSA_DfltBtnAbsolute = 1L << 2,

    ///
    XkbSA_SwitchApplication = 1L << 0,
    ///
    XkbSA_SwitchAbsolute = 1L << 2
}

/**
 * The following values apply to the SA_DeviceValuator
 * action only.  Valuator operations specify the action
 * to be taken.   Values specified in the action are
 * multiplied by 2^scale before they are applied.
 */
enum {
    ///
    XkbSA_IgnoreVal = 0x00,
    ///
    XkbSA_SetValMin = 0x10,
    ///
    XkbSA_SetValCenter = 0x20,
    ///
    XkbSA_SetValMax = 0x30,
    ///
    XkbSA_SetValRelative = 0x40,
    ///
    XkbSA_SetValAbsolute = 0x50,
    ///
    XkbSA_ValOpMask = 0x70,
    ///
    XkbSA_ValScaleMask = 0x07
}

///
auto XkbSA_ValOp(T)(T a) { return a & XkbSA_ValOpMask; }
///
auto XkbSA_ValScale(T)(T a) { return a & XkbSA_ValScaleMask; }

/**
 * Action types: specifies the type of a key action.  Reported in the
 * type field of all key actions.
 */
enum {
    ///
    XkbSA_NoAction = 0x00,
    ///
    XkbSA_SetMods = 0x01,
    ///
    XkbSA_LatchMods = 0x02,
    ///
    XkbSA_LockMods = 0x03,
    ///
    XkbSA_SetGroup = 0x04,
    ///
    XkbSA_LatchGroup = 0x05,
    ///
    XkbSA_LockGroup = 0x06,
    ///
    XkbSA_MovePtr = 0x07,
    ///
    XkbSA_PtrBtn = 0x08,
    ///
    XkbSA_LockPtrBtn = 0x09,
    ///
    XkbSA_SetPtrDflt = 0x0a,
    ///
    XkbSA_ISOLock = 0x0b,
    ///
    XkbSA_Terminate = 0x0c,
    ///
    XkbSA_SwitchScreen = 0x0d,
    ///
    XkbSA_SetControls = 0x0e,
    ///
    XkbSA_LockControls = 0x0f,
    ///
    XkbSA_ActionMessage = 0x10,
    ///
    XkbSA_RedirectKey = 0x11,
    ///
    XkbSA_DeviceBtn = 0x12,
    ///
    XkbSA_LockDeviceBtn = 0x13,
    ///
    XkbSA_DeviceValuator = 0x14,
    ///
    XkbSA_LastAction = XkbSA_DeviceValuator,
    ///
    XkbSA_NumActions = XkbSA_LastAction+1,

    ///
    XkbSA_XFree86Private = 0x86
}

/**
 * Specifies the key actions that clear latched groups or modifiers.
 */
enum XkbSA_BreakLatch =
    ((1<<XkbSA_NoAction)|(1<<XkbSA_PtrBtn)|(1<<XkbSA_LockPtrBtn)|
    (1<<XkbSA_Terminate)|(1<<XkbSA_SwitchScreen)|(1<<XkbSA_SetControls)|
    (1<<XkbSA_LockControls)|(1<<XkbSA_ActionMessage)|
    (1<<XkbSA_RedirectKey)|(1<<XkbSA_DeviceBtn)|(1<<XkbSA_LockDeviceBtn));

/**
 * Macros to classify key actions
 */
bool XkbIsModAction(T)(T a) { return a.type >= Xkb_SASetMods && a.type <= XkbSA_LockMods; }
///
bool XkbIsGroupAction(T)(T a){ return a.type >= XkbSA_SetGroup && a.type <= XkbSA_LockGroup; }
///
bool XkbIsPtrAction(T)(T a) { return a.type >= XkbSA_MovePtr && a.type <= XkbSA_SetPtrDflt; }

/**
 * Key Behavior Qualifier:
 *    KB_Permanent indicates that the behavior describes an unalterable
 *    characteristic of the keyboard, not an XKB software-simulation of
 *    the listed behavior.
 * Key Behavior Types:
 *    Specifies the behavior of the underlying key.
 */
enum {
    ///
    XkbKB_Permanent = 0x80,
    ///
    XkbKB_OpMask = 0x7f,

    ///
    XkbKB_Default = 0x00,
    ///
    XkbKB_Lock = 0x01,
    ///
    XkbKB_RadioGroup = 0x02,
    ///
    XkbKB_Overlay1 = 0x03,
    ///
    XkbKB_Overlay2 = 0x04,

    ///
    XkbKB_RGAllowNone = 0x80
}

/**
 * Various macros which describe the range of legal keycodes.
 */
enum {
    ///
    XkbMinLegalKeyCode = 8,
    ///
    XkbMaxLegalKeyCode = 255,
    ///
    XkbMaxKeyCount = XkbMaxLegalKeyCode-XkbMinLegalKeyCode+1,
    ///
    XkbPerKeyBitArraySize = (XkbMaxLegalKeyCode+1)/8
}
/** Seems kinda silly to check that an unsigned char is <= 255... */
auto XkbIsLegalKeycode(K)(K k) { return k >= XkbMinLegalKeyCode; }

/**
 * Assorted constants and limits.
 */
enum {
    ///
    XkbNumModifiers = 8,
    ///
    XkbNumVirtualMods = 16,
    ///
    XkbNumIndicators = 32,
    ///
    XkbAllIndicatorsMask = 0xffffffff,
    ///
    XkbMaxRadioGroups = 32,
    ///
    XkbAllRadioGroupsMask = 0xffffffff,
    ///
    XkbMaxShiftLevel = 63,
    ///
    XkbMaxSymsPerKey = XkbMaxShiftLevel*XkbNumKbdGroups,
    ///
    XkbRGMaxMembers = 12,
    ///
    XkbActionMessageLength = 6,
    ///
    XkbKeyNameLength = 4,
    ///
    XkbMaxRedirectCount = 8,

    ///
    XkbGeomPtsPerMM = 10,
    ///
    XkbGeomMaxColors = 32,
    ///
    XkbGeomMaxLabelColors = 3,
    ///
    XkbGeomMaxPriority = 255
}

/**
 * Key Type index and mask for the four standard key types.
 */
enum {
    ///
    XkbOneLevelIndex = 0,
    ///
    XkbTwoLevelIndex = 1,
    ///
    XkbAlphabeticIndex = 2,
    ///
    XkbKeypadIndex = 3,
    ///
    XkbLastRequiredType = XkbKeypadIndex,
    ///
    XkbNumRequiredTypes = XkbLastRequiredType+1,
    ///
    XkbMaxKeyTypes = 255,

    ///
    XkbOneLevelMask = 1<<0,
    ///
    XkbTwoLevelMask = 1<<1,
    ///
    XkbAlphabeticMask = 1<<2,
    ///
    XkbKeypadMask = 1<<3,
    ///
    XkbAllRequiredTypes = 0xf
}

///
auto XkbShiftLevel(T)(T n) { return n - 1; }
///
auto XkbShiftLevelMask(T)(T n) { return 1 << (n - 1); }

/**
 * Explicit map components:
 *  - Used in the 'explicit' field of an XkbServerMap.  Specifies
 *    the keyboard components that should _not_ be updated automatically
 *    in response to core protocol keyboard mapping requests.
 */
enum {
    ///
    XkbExplicitKeyTypesMask = 0x0f,
    ///
    XkbExplicitKeyType1Mask = 1<<0,
    ///
    XkbExplicitKeyType2Mask = 1<<1,
    ///
    XkbExplicitKeyType3Mask = 1<<2,
    ///
    XkbExplicitKeyType4Mask = 1<<3,
    ///
    XkbExplicitInterpretMask = 1<<4,
    ///
    XkbExplicitAutoRepeatMask = 1<<5,
    ///
    XkbExplicitBehaviorMask = 1<<6,
    ///
    XkbExplicitVModMapMask = 1<<7,
    ///
    XkbAllExplicitMask = 0xff
}

/**
 * Map components masks:
 * Those in AllMapComponentsMask:
 *  - Specifies the individual fields to be loaded or changed for the
 *    GetMap and SetMap requests.
 * Those in ClientInfoMask:
 *  - Specifies the components to be allocated by XkbAllocClientMap.
 * Those in ServerInfoMask:
 *  - Specifies the components to be allocated by XkbAllocServerMap.
 */
enum {
    ///
    XkbKeyTypesMask = 1<<0,
    ///
    XkbKeySymsMask = 1<<1,
    ///
    XkbModifierMapMask = 1<<2,
    ///
    XkbExplicitComponentsMask = 1<<3,
    ///
    XkbKeyActionsMask = 1<<4,
    ///
    XkbKeyBehaviorsMask = 1<<5,
    ///
    XkbVirtualModsMask = 1<<6,
    ///
    XkbVirtualModMapMask = 1<<7,

    ///
    XkbAllClientInfoMask = XkbKeyTypesMask|XkbKeySymsMask|XkbModifierMapMask,
    ///
    XkbAllServerInfoMask = XkbExplicitComponentsMask|XkbKeyActionsMask|XkbKeyBehaviorsMask|XkbVirtualModsMask|XkbVirtualModMapMask,
    ///
    XkbAllMapComponentsMask = XkbAllClientInfoMask|XkbAllServerInfoMask
}

/**
 * Symbol interpretations flags:
 *  - Used in the flags field of a symbol interpretation
 */
enum {
    ///
    XkbSI_AutoRepeat = 1<<0,
    ///
    XkbSI_LockingKey = 1<<1
}

/**
 * Symbol interpretations match specification:
 *  - Used in the match field of a symbol interpretation to specify
 *    the conditions under which an interpretation is used.
 */
enum {
    ///
    XkbSI_LevelOneOnly = 0x80,
    ///
    XkbSI_OpMask = 0x7f,
    ///
    XkbSI_NoneOf = 0,
    ///
    XkbSI_AnyOfOrNone = 1,
    ///
    XkbSI_AnyOf = 2,
    ///
    XkbSI_AllOf = 3,
    ///
    XkbSI_Exactly = 4
}

/**
 * Indicator map flags:
 *  - Used in the flags field of an indicator map to indicate the
 *    conditions under which and indicator can be changed and the
 *    effects of changing the indicator.
 */
enum {
    ///
    XkbIM_NoExplicit = 1L << 7,
    ///
    XkbIM_NoAutomatic = 1L << 6,
    ///
    XkbIM_LEDDrivesKB = 1L << 5
}

/**
 * Indicator map component specifications:
 *  - Used by the 'which_groups' and 'which_mods' fields of an indicator
 *    map to specify which keyboard components should be used to drive
 *    the indicator.
 */
enum {
    ///
    XkbIM_UseBase = 1L << 0,
    ///
    XkbIM_UseLatched = 1L << 1,
    ///
    XkbIM_UseLocked = 1L << 2,
    ///
    XkbIM_UseEffective = 1L << 3,
    ///
    XkbIM_UseCompat = 1L << 4
}

///
enum {
    ///
    XkbIM_UseNone = 0,
    ///
    XkbIM_UseAnyGroup = XkbIM_UseBase|XkbIM_UseLatched|XkbIM_UseLocked|XkbIM_UseEffective,
    ///
    XkbIM_UseAnyMods = XkbIM_UseAnyGroup|XkbIM_UseCompat
}

/**
 * Compatibility Map Compontents:
 *  - Specifies the components to be allocated in XkbAllocCompatMap.
 */
enum {
    ///
    XkbSymInterpMask = 1<<0,
    ///
    XkbGroupCompatMask = 1<<1,
    ///
    XkbAllCompatMask = 0x3
}

/**
 * Names component mask:
 *  - Specifies the names to be loaded or changed for the GetNames and
 *    SetNames requests.
 *  - Specifies the names that have changed in a NamesNotify event.
 *  - Specifies the names components to be allocated by XkbAllocNames.
 */
enum {
    ///
    XkbKeycodesNameMask = 1<<0,
    ///
    XkbGeometryNameMask = 1<<1,
    ///
    XkbSymbolsNameMask = 1<<2,
    ///
    XkbPhysSymbolsNameMask = 1<<3,
    ///
    XkbTypesNameMask = 1<<4,
    ///
    XkbCompatNameMask = 1<<5,
    ///
    XkbKeyTypeNamesMask = 1<<6,
    ///
    XkbKTLevelNamesMask = 1<<7,
    ///
    XkbIndicatorNamesMask = 1<<8,
    ///
    XkbKeyNamesMask = 1<<9,
    ///
    XkbKeyAliasesMask = 1<<10,
    ///
    XkbVirtualModNamesMask = 1<<11,
    ///
    XkbGroupNamesMask = 1<<12,
    ///
    XkbRGNamesMask = 1<<13,
    ///
    XkbComponentNamesMask = 0x3f,
    ///
    XkbAllNamesMask = 0x3fff
}

/**
 * GetByName components:
 *  - Specifies desired or necessary components to GetKbdByName request.
 *  - Reports the components that were found in a GetKbdByNameReply
 */
enum {
    ///
    XkbGBN_TypesMask = 1L << 0,
    ///
    XkbGBN_CompatMapMask = 1L << 1,
    ///
    XkbGBN_ClientSymbolsMask = 1L << 2,
    ///
    XkbGBN_ServerSymbolsMask = 1L << 3,
    ///
    XkbGBN_SymbolsMask = XkbGBN_ClientSymbolsMask|XkbGBN_ServerSymbolsMask,
    ///
    XkbGBN_IndicatorMapMask = 1L << 4,
    ///
    XkbGBN_KeyNamesMask = 1L << 5,
    ///
    XkbGBN_GeometryMask = 1L << 6,
    ///
    XkbGBN_OtherNamesMask = 1L << 7,
    ///
    XkbGBN_AllComponentsMask = 0xff
}

/**
 * ListComponents flags
 */
enum {
    ///
    XkbLC_Hidden = 1L << 0,
    ///
    XkbLC_Default = 1L << 1,
    ///
    XkbLC_Partial = 1L << 2,

    ///
    XkbLC_AlphanumericKeys = 1L << 8,
    ///
    XkbLC_ModifierKeys = 1L << 9,
    ///
    XkbLC_KeypadKeys = 1L << 10,
    ///
    XkbLC_FunctionKeys = 1L << 11,
    ///
    XkbLC_AlternateGroup = 1L << 12,
}


/**
 * X Input Extension Interactions
 * - Specifies the possible interactions between XKB and the X input
 *   extension
 * - Used to request (XkbGetDeviceInfo) or change (XKbSetDeviceInfo)
 *   XKB information about an extension device.
 * - Reports the list of supported optional features in the reply to
 *   XkbGetDeviceInfo or in an XkbExtensionDeviceNotify event.
 * XkbXI_UnsupportedFeature is reported in XkbExtensionDeviceNotify
 * events to indicate an attempt to use an unsupported feature.
 */
enum {
    ///
    XkbXI_KeyboardsMask = 1L << 0,
    ///
    XkbXI_ButtonActionsMask = 1L << 1,
    ///
    XkbXI_IndicatorNamesMask = 1L << 2,
    ///
    XkbXI_IndicatorMapsMask = 1L << 3,
    ///
    XkbXI_IndicatorStateMask = 1L << 4,
    ///
    XkbXI_UnsupportedFeatureMask = 1L << 15,
    ///
    XkbXI_AllFeaturesMask = 0x001f,
    ///
    XkbXI_AllDeviceFeaturesMask = 0x001e,

    ///
    XkbXI_IndicatorsMask = 0x001c,
    ///
    XkbAllExtensionDeviceEventsMask = 0x801f
}

/**
 * Per-Client Flags:
 *  - Specifies flags to be changed by the PerClientFlags request.
 */
enum {
    ///
    XkbPCF_DetectableAutoRepeatMask = 1L << 0,
    ///
    XkbPCF_GrabsUseXKBStateMask = 1L << 1,
    ///
    XkbPCF_AutoResetControlsMask = 1L << 2,
    ///
    XkbPCF_LookupStateWhenGrabbed = 1L << 3,
    ///
    XkbPCF_SendEventUsesXKBState = 1L << 4,
    ///
    XkbPCF_AllFlagsMask = 0x1F
}

/**
 * Debugging flags and controls
 */
enum XkbDF_DisableLocks = 1<<0;
