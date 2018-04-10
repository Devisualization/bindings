/**
 * License:
 *              Copyright Devisualization (Richard Andrew Cattermole) 2014 - 2017.
 *     Distributed under the Boost Software License, Version 1.0.
 *        (See accompanying file LICENSE_1_0.txt or copy at
 *              http://www.boost.org/LICENSE_1_0.txt)
 */
module devisualization.bindings.gdk.gdk_pixbuf;
import devisualization.bindings.gdk.glib;

///
mixin template GDK_Pixbuf_Functions() {
    import devisualization.bindings.gdk.gdk_pixbuf;
    import devisualization.bindings.gdk.glib;
extern(C):

    ///
    GdkPixbuf* function(GdkColorspace colorspace, gboolean has_alpha, int bits_per_sample, int width, int height) gdk_pixbuf_new;

    ///
    GdkColorspace function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_colorspace;
    ///
    int function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_n_channels;
    ///
    gboolean function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_has_alpha;
    ///
    int function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_bits_per_sample;
    ///
    guchar* function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_pixels;
    ///
    int function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_width;
    ///
    int function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_height;
    ///
    int function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_rowstride;
    ///
    gsize function(const GdkPixbuf* pixbuf) gdk_pixbuf_get_byte_length;
    ///
    const ubyte* function(const GdkPixbuf* pixbuf) gdk_pixbuf_read_pixels;

    ///
    GdkPixbuf* function(const guchar* data, GdkColorspace colorspace, gboolean has_alpha, int bits_per_sample, int width, int height, int rowstride, GdkPixbufDestroyNotify destroy_fn, gpointer destroy_fn_data) gdk_pixbuf_new_from_data;

    ///
    void function(GdkPixbuf* pixbuf) gdk_pixbuf_ref;
    ///
    void function(GdkPixbuf* pixbuf) gdk_pixbuf_unref;

    ///
    GdkPixbuf* function(const GdkPixbuf *pixbuf) gdk_pixbuf_copy;
    ///
    GdkPixbuf* function(const GdkPixbuf* src, int dest_width, int dest_height, GdkInterpType interp_type) gdk_pixbuf_scale_simple;
}

/**
 * GdkPixbuf:
 *
 * This is the main structure in the gdk-pixbuf library.  It is
 * used to represent images.  It contains information about the
 * image's pixel data, its color space, bits per sample, width and
 * height, and the rowstride (the number of bytes between the start of
 * one row and the start of the next).
 */
struct GdkPixbuf;

/**
 * GdkPixbufDestroyNotify:
 * @pixels: (array) (element-type guint8): The pixel array of the pixbuf
 *   that is being finalized.
 * @data: (closure): User closure data.
 *
 * A function of this type is responsible for freeing the pixel array
 * of a pixbuf.  The gdk_pixbuf_new_from_data() function lets you
 * pass in a pre-allocated pixel array so that a pixbuf can be
 * created from it; in this case you will need to pass in a function
 * of #GdkPixbufDestroyNotify so that the pixel data can be freed
 * when the pixbuf is finalized.
 */
alias GdkPixbufDestroyNotify = extern(C) void function(guchar* pixels, gpointer data);

/**
 * GdkColorspace:
 * @GDK_COLORSPACE_RGB: Indicates a red/green/blue additive color space.
 *
 * This enumeration defines the color spaces that are supported by
 * the gdk-pixbuf library.  Currently only RGB is supported.
 *
 * Note that these values are encoded in inline pixbufs
 * as ints, so don't reorder them
 */
enum GdkColorspace {
    ///
    GDK_COLORSPACE_RGB
}

/**
 * GdkInterpType:
 * @GDK_INTERP_NEAREST: Nearest neighbor sampling; this is the fastest
 *  and lowest quality mode. Quality is normally unacceptable when scaling
 *  down, but may be OK when scaling up.
 * @GDK_INTERP_TILES: This is an accurate simulation of the PostScript
 *  image operator without any interpolation enabled.  Each pixel is
 *  rendered as a tiny parallelogram of solid color, the edges of which
 *  are implemented with antialiasing.  It resembles nearest neighbor for
 *  enlargement, and bilinear for reduction.
 * @GDK_INTERP_BILINEAR: Best quality/speed balance; use this mode by
 *  default. Bilinear interpolation.  For enlargement, it is
 *  equivalent to point-sampling the ideal bilinear-interpolated image.
 *  For reduction, it is equivalent to laying down small tiles and
 *  integrating over the coverage area.
 * @GDK_INTERP_HYPER: This is the slowest and highest quality
 *  reconstruction function. It is derived from the hyperbolic filters in
 *  Wolberg's "Digital Image Warping", and is formally defined as the
 *  hyperbolic-filter sampling the ideal hyperbolic-filter interpolated
 *  image (the filter is designed to be idempotent for 1:1 pixel mapping).
 *
 *  This enumeration describes the different interpolation modes that
 *  can be used with the scaling functions. @GDK_INTERP_NEAREST is
 *  the fastest scaling method, but has horrible quality when
 *  scaling down. @GDK_INTERP_BILINEAR is the best choice if you
 *  aren't sure what to choose, it has a good speed/quality balance.
 *
 *  <note>
 * 	Cubic filtering is missing from the list; hyperbolic
 * 	interpolation is just as fast and results in higher quality.
 *  </note>
 */
enum GdkInterpType {
    ///
    GDK_INTERP_NEAREST,
    ///
    GDK_INTERP_TILES,
    ///
    GDK_INTERP_BILINEAR,
    ///
    GDK_INTERP_HYPER
}
