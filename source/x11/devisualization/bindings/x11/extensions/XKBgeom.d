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
module devisualization.bindings.x11.extensions.XKBgeom;
import devisualization.bindings.x11.extensions.XKBstr;
import devisualization.bindings.x11.X;
import devisualization.bindings.x11.Xlib;

///
mixin template XKBGeomFunctions() {
    import devisualization.bindings.x11.extensions.XKBgeom;
    import devisualization.bindings.x11.extensions.XKBstr;
    import devisualization.bindings.x11.X;
    import devisualization.bindings.x11.Xlib;
extern(C):

    ///
    XkbPropertyPtr function(XkbGeometryPtr geom, char* name, char* value) XkbAddGeomProperty;
    ///
    XkbKeyAliasPtr function(XkbGeometryPtr geom, char* alias_, char* real_) XkbAddGeomKeyAlias;
    ///
    XkbColorPtr function(XkbGeometryPtr geom, char* spec, uint pixel) XkbAddGeomColor;
    ///
    XkbOutlinePtr function(XkbShapePtr shape, int sz_points) XkbAddGeomOutline;
    ///
    XkbShapePtr function(XkbGeometryPtr geom, Atom name, int sz_outlines) XkbAddGeomShape;
    ///
    XkbKeyPtr function(XkbRowPtr row) XkbAddGeomKey;
    ///
    XkbRowPtr function(XkbSectionPtr section, int sz_keys) XkbAddGeomRow;
    ///
    XkbSectionPtr function(XkbGeometryPtr geom, Atom name, int sz_rows, int sz_doodads, int sz_overlays) XkbAddGeomSection;
    ///
    XkbOverlayPtr function(XkbSectionPtr section, Atom name, int sz_rows) XkbAddGeomOverlay;
    ///
    XkbOverlayRowPtr function(XkbOverlayPtr	overlay, int row_under, int sz_keys) XkbAddGeomOverlayRow;
    ///
    XkbOverlayKeyPtr function(XkbOverlayPtr	overlay, XkbOverlayRowPtr row, char* over, char* under) XkbAddGeomOverlayKey;
    ///
    XkbDoodadPtr function(XkbGeometryPtr geom, XkbSectionPtr section, Atom name) XkbAddGeomDoodad;
    ///
    void function(XkbGeometryPtr geom, int first, int count, Bool freeAll) XkbFreeGeomKeyAliases;
    ///
    void function(XkbGeometryPtr geom, int first, int count, Bool freeAll) XkbFreeGeomColors;
    ///
    void function(XkbDoodadPtr doodads, int nDoodads, Bool freeAll) XkbFreeGeomDoodads;
    ///
    void function(XkbGeometryPtr geom, int first, int count, Bool freeAll) XkbFreeGeomProperties;
    ///
    void function(XkbOverlayRowPtr row, int first, int count, Bool freeAll) XkbFreeGeomOverlayKeys;
    ///
    void function(XkbOverlayPtr overlay, int first, int count, Bool freeAll) XkbFreeGeomOverlayRows;
    ///
    void function(XkbSectionPtr section, int first, int count, Bool freeAll) XkbFreeGeomOverlays;
    ///
    void function(XkbRowPtr row, int first, int count, Bool freeAll) XkbFreeGeomKeys;
    ///
    void function(XkbSectionPtr section, int first, int count, Bool freeAll) XkbFreeGeomRows;
    ///
    void function(XkbGeometryPtr geom, int first, int count, Bool freeAll) XkbFreeGeomSections;
    ///
    void function(XkbOutlinePtr outline, int first, int count, Bool freeAll) XkbFreeGeomPoints;
    ///
    void function(XkbShapePtr shape, int first, int count, Bool freeAll) XkbFreeGeomOutlines;
    ///
    void function(XkbGeometryPtr geom, int first, int count, Bool freeAll) XkbFreeGeomShapes;
    ///
    void function(XkbGeometryPtr geom, uint which, Bool freeMap) XkbFreeGeometry;
    ///
    Status function(XkbGeometryPtr geom, int nProps) XkbAllocGeomProps;
    ///
    Status function(XkbGeometryPtr geom, int nAliases) XkbAllocGeomKeyAliases;
    ///
    Status function(XkbGeometryPtr geom, int nColors) XkbAllocGeomColors;
    ///
    Status function(XkbGeometryPtr geom, int nShapes) XkbAllocGeomShapes;
    ///
    Status function(XkbGeometryPtr geom, int nSections) XkbAllocGeomSections;
    ///
    Status function(XkbSectionPtr section, int num_needed) XkbAllocGeomOverlays;
    ///
    Status function(XkbOverlayPtr overlay, int num_needed) XkbAllocGeomOverlayRows;
    ///
    Status function(XkbOverlayRowPtr row, int num_needed) XkbAllocGeomOverlayKeys;
    ///
    Status function(XkbGeometryPtr geom, int nDoodads) XkbAllocGeomDoodads;
    ///
    Status function(XkbSectionPtr section, int nDoodads) XkbAllocGeomSectionDoodads;
    ///
    Status function(XkbShapePtr shape, int nOL) XkbAllocGeomOutlines;
    ///
    Status function(XkbSectionPtr section, int nRows) XkbAllocGeomRows;
    ///
    Status function(XkbOutlinePtr ol, int nPts) XkbAllocGeomPoints;
    ///
    Status function(XkbRowPtr row, int nKeys) XkbAllocGeomKeys;
    ///
    Status function(XkbDescPtr xkb, XkbGeometrySizesPtr sizes) XkbAllocGeometry;
    ///
    Status function(Display* dpy, uint deviceSpec, XkbGeometryPtr geom) XkbSetGeometry;
    ///
    Bool function(XkbShapePtr shape, XkbBoundsPtr bounds) XkbComputeShapeTop;
    ///
    Bool function(XkbShapePtr shape) XkbComputeShapeBounds;
    ///
    Bool function(XkbGeometryPtr geom, XkbSectionPtr section, XkbRowPtr row) XkbComputeRowBounds;
    ///
    Bool function(XkbGeometryPtr geom, XkbSectionPtr section) XkbComputeSectionBounds;
    ///
    char* function(XkbGeometryPtr geom, XkbSectionPtr wanted, char* under) XkbFindOverlayForKey;
    ///
    Status function(Display* dpy, XkbDescPtr xkb) XkbGetGeometry;
    ///
    Status function(Display* dpy, XkbDescPtr xkb, Atom name) XkbGetNamedGeometry;
}

///
struct _XkbProperty {
    ///
    char* name;
    ///
    char* value;
}

///
alias XkbPropertyRec = _XkbProperty;
///
alias XkbPropertyPtr = _XkbProperty*;

///
struct _XkbColor {
    ///
    uint pixel;
    ///
    char* spec;
}

///
alias XkbColorRec = _XkbColor;
///
alias XkbColorPtr = _XkbColor*;

///
struct _XkbPoint {
    ///
    short x;
    ///
    short y;
}

///
alias XkbPointRec = _XkbPoint;
///
alias XkbPointPtr = _XkbPoint*;

///
struct _XkbBounds {
    ///
    short x1,y1;
    ///
    short x2,y2;
}

///
alias XkbBoundsRec = _XkbBounds;
///
alias XkbBoundsPtr = _XkbBounds*;

///
auto XkbBoundsWidth(B)(B b) { return b.x2 - b.x1; }
///
auto XkbBoundsHeight(B)(B b) { return b.y2 - b.y1; }

/*
 * In the following structs, this pattern is used for dynamically sized arrays:
 * foo is an array for which sz_foo entries are allocated & num_foo are used
 */

 ///
struct _XkbOutline {
    ///
    ushort num_points;
    ///
    ushort sz_points;
    ///
    ushort corner_radius;
    ///
    XkbPointPtr	points;
}

///
alias XkbOutlineRec = _XkbOutline;
///
alias XkbOutlinePtr = _XkbOutline*;

///
struct _XkbShape {
    ///
    Atom name;
    ///
    ushort num_outlines;
    ///
    ushort sz_outlines;
    ///
    XkbOutlinePtr outlines;
    ///
    XkbOutlinePtr approx;
    ///
    XkbOutlinePtr primary;
    ///
    XkbBoundsRec bounds;
}

///
alias XkbShapeRec = _XkbShape;
///
alias XkbShapePtr = _XkbShape*;
///
int XkbOutlineIndex(S, O)(S s, O o) { return cast(int)(o - s.outlines[0]); }

///
struct _XkbShapeDoodad {
    ///
    Atom name;
    ///
    ubyte type;
    ///
    ubyte priority;
    ///
    short top;
    ///
    short left;
    ///
    short angle;
    ///
    ushort color_ndx;
    ///
    ushort shape_ndx;
}

///
alias XkbShapeDoodadRec = _XkbShapeDoodad;
///
alias XkbShapeDoodadPtr = _XkbShapeDoodad*;

///
auto XkbShapeDoodadColor(G, D)(G g, D d) { return &g.colors[d.color_ndx]; }
///
auto XkbShapeDoodadShape(G, D)(G g, D d) { return &g.shapes[d.shape_ndx]; }

///
void XkbSetShapeDoodadColor(G, D, C)(G g, ref D d, C c) {
    d.color_ndx = c - &g.colors[0];
}
///
void XkbSetShapeDoodadShape(G, D, S)(G g, ref D d, S s) {
    d.shape_ndx = s - &g.shapes[0];
}

///
struct _XkbTextDoodad {
    ///
    Atom name;
    ///
    ubyte type;
    ///
    ubyte priority;
    ///
    short top;
    ///
    short left;
    ///
    short angle;
    ///
    short width;
    ///
    short height;
    ///
    ushort color_ndx;
    ///
    char* text;
    ///
    char* font;
}

///
alias XkbTextDoodadRec = _XkbTextDoodad;
///
alias XkbTextDoodadPtr = _XkbTextDoodad*;

///
auto XkbTextDoodadColor(G, D)(G g, D d) { return &g.colors[d.color_ndx]; }
///
void XkbSetTextDoodadColor(G, D, C)(G g, ref D d, C c) {
    d.color_ndx = c - &g.colors[0];
}

///
struct _XkbIndicatorDoodad {
    ///
    Atom name;
    ///
    ubyte type;
    ///
    ubyte priority;
    ///
    short top;
    ///
    short left;
    ///
    short angle;
    ///
    ushort shape_ndx;
    ///
    ushort on_color_ndx;
    ///
    ushort off_color_ndx;
}

///
alias XkbIndicatorDoodadRec = _XkbIndicatorDoodad;
///
alias XkbIndicatorDoodadPtr = _XkbIndicatorDoodad*;

///
auto XkbIndicatorDoodadShape(G, D)(G g, D d) { return &g.shapes[d.shape_ndx]; }
///
auto XkbIndicatorDoodadOnColor(G, D)(G g, D d) { return &g.colors[d.on_color_ndx]; }
///
auto XkbIndicatorDoodadOffColor(G, D)(G g, D d) { return &g.colors[d.off_color_ndx]; }

///
void XkbSetIndicatorDoodadOnColor(G, D, C)(G g, ref D d, C c) {
    d.on_color_ndx = c - &g.colors[0];
}

///
void XkbSetIndicatorDoodadOffColor(G, D, C)(G g, ref D d, C c) {
    d.off_color_ndx = c - &g.colors[0];
}
///
void XkbSetIndicatorDoodadShape(G, D, S)(G g, ref D d, S s) {
    d.shape_ndx = s - &g.shapes[0];
}

///
struct _XkbLogoDoodad {
    ///
    Atom name;
    ///
    ubyte type;
    ///
    ubyte priority;
    ///
    short top;
    ///
    short left;
    ///
    short angle;
    ///
    ushort color_ndx;
    ///
    ushort shape_ndx;
    ///
    char* logo_name;
}

///
alias XkbLogoDoodadRec = _XkbLogoDoodad;
///
alias XkbLogoDoodadPtr = _XkbLogoDoodad*;

///
auto XkbLogoDoodadColor(G, D)(G g, D d) { return &g.colors[d.color_ndx]; }
///
auto XkbLogoDoodadShape(G, D)(G g, D d) { return &g.shapes[d.shape_ndx]; }
///
void XkbSetLogoDoodadColor(G, D, C)(G g, ref D d, C c) {
    d.color_ndx = c - &g.colors[0];
}
///
void XkbSetLogoDoodadShape(G, D, S)(G g, ref D d, S s) {
    d.shape_ndx = s - &g.shapes[0];
}

///
struct _XkbAnyDoodad {
    ///
    Atom name;
    ///
    ubyte type;
    ///
    ubyte priority;
    ///
    short top;
    ///
    short left;
    ///
    short angle;
}

///
alias XkbAnyDoodadRec = _XkbAnyDoodad;
///
alias XkbAnyDoodadPtr = _XkbAnyDoodad*;

///
union _XkbDoodad {
    ///
    XkbAnyDoodadRec any;
    ///
    XkbShapeDoodadRec shape;
    ///
    XkbTextDoodadRec text;
    ///
    XkbIndicatorDoodadRec indicator;
    ///
    XkbLogoDoodadRec logo;
}

///
alias XkbDoodadRec = _XkbDoodad;
///
alias XkbDoodadPtr = _XkbDoodad*;

///
enum {
    ///
    XkbUnknownDoodad = 0,
    ///
    XkbOutlineDoodad = 1,
    ///
    XkbSolidDoodad = 2,
    ///
    XkbTextDoodad = 3,
    ///
    XkbIndicatorDoodad = 4,
    ///
    XkbLogoDoodad = 5
}

///
struct _XkbKey {
    ///
    XkbKeyNameRec name;
    ///
    short gap;
    ///
    ubyte shape_ndx;
    ///
    ubyte color_ndx;
}

///
alias XkbKeyRec = _XkbKey;
///
alias XkbKeyPtr = _XkbKey*;

///
auto XkbKeyShape(G, K)(G g, K k) { return &g.shapes[k.shape_ndx]; }
///
auto XkbKeyColor(G, K)(G g,K k) { return &g.colors[k.color_ndx]; }
///
void XkbSetKeyShape(G, K, S)(G g, ref K k, S s) {
    k.shape_ndx = s - &g.shapes[0];
}
///
void XkbSetKeyColor(G, K, C)(G g, ref K k, C c) {
    k.color_ndx = c - &g.colors[0];
}

///
struct _XkbRow {
    ///
    short top;
    ///
    short left;
    ///
    ushort num_keys;
    ///
    ushort sz_keys;
    ///
    int vertical;
    ///
    XkbKeyPtr keys;
    ///
    XkbBoundsRec bounds;
}

///
alias XkbRowRec = _XkbRow;
///
alias XkbRowPtr = _XkbRow*;

///
struct _XkbSection {
    ///
    Atom name;
    ///
    ubyte priority;
    ///
    short top;
    ///
    short left;
    ///
    ushort width;
    ///
    ushort height;
    ///
    short angle;
    ///
    ushort num_rows;
    ///
    ushort num_doodads;
    ///
    ushort num_overlays;
    ///
    ushort sz_rows;
    ///
    ushort sz_doodads;
    ///
    ushort sz_overlays;
    ///
    XkbRowPtr rows;
    ///
    XkbDoodadPtr doodads;
    ///
    XkbBoundsRec bounds;
    ///
    _XkbOverlay* overlays;
}

///
alias XkbSectionRec = _XkbSection;
///
alias XkbSectionPtr = _XkbSection*;

///
struct _XkbOverlayKey {
    ///
    XkbKeyNameRec over;
    ///
    XkbKeyNameRec under;
}

///
alias XkbOverlayKeyRec = _XkbOverlayKey;
///
alias XkbOverlayKeyPtr = _XkbOverlayKey*;

///
struct _XkbOverlayRow {
    ///
    ushort row_under;
    ///
    ushort num_keys;
    ///
    ushort sz_keys;
    ///
    XkbOverlayKeyPtr keys;
}

///
alias XkbOverlayRowRec = _XkbOverlayRow;
///
alias XkbOverlayRowPtr = _XkbOverlayRow*;

///
struct _XkbOverlay {
    ///
    Atom name;
    ///
    XkbSectionPtr section_under;
    ///
    ushort num_rows;
    ///
    ushort sz_rows;
    ///
    XkbOverlayRowPtr rows;
    ///
    XkbBoundsPtr bounds;
}

///
alias XkbOverlayRec = _XkbOverlay;
///
alias XkbOverlayPtr = _XkbOverlay*;

///
struct _XkbGeometry {
    ///
    Atom name;
    ///
    ushort width_mm;
    ///
    ushort height_mm;
    ///
    char* label_font;
    ///
    XkbColorPtr label_color;
    ///
    XkbColorPtr base_color;
    ///
    ushort sz_properties;
    ///
    ushort sz_colors;
    ///
    ushort sz_shapes;
    ///
    ushort sz_sections;
    ///
    ushort sz_doodads;
    ///
    ushort sz_key_aliases;
    ///
    ushort num_properties;
    ///
    ushort num_colors;
    ///
    ushort num_shapes;
    ///
    ushort num_sections;
    ///
    ushort num_doodads;
    ///
    ushort num_key_aliases;
    ///
    XkbPropertyPtr properties;
    ///
    XkbColorPtr colors;
    ///
    XkbShapePtr shapes;
    ///
    XkbSectionPtr sections;
    ///
    XkbDoodadPtr doodads;
    ///
    XkbKeyAliasPtr key_aliases;
}

///
alias XkbGeometryRec = _XkbGeometry;

///
int XkbGeomColorIndex(G, C)(G g, C c) { return cast(int)(c - &g.colors[0]); }

///
enum {
    ///
    XkbGeomPropertiesMask = 1<<0,
    ///
    XkbGeomColorsMask = 1<<1,
    ///
    XkbGeomShapesMask = 1<<2,
    ///
    XkbGeomSectionsMask = 1<<3,
    ///
    XkbGeomDoodadsMask = 1<<4,
    ///
    XkbGeomKeyAliasesMask = 1<<5,
    ///
    XkbGeomAllMask = 0x3f,
}

///
struct _XkbGeometrySizes {
    ///
    uint which;
    ///
    ushort num_properties;
    ///
    ushort num_colors;
    ///
    ushort num_shapes;
    ///
    ushort num_sections;
    ///
    ushort num_doodads;
    ///
    ushort num_key_aliases;
}

///
alias XkbGeometrySizesRec = _XkbGeometrySizes;
///
alias XkbGeometrySizesPtr = _XkbGeometrySizes*;
