/**
 * This file is part of systemd.
 *
 * Copyright 2013 Lennart Poettering
 *
 * systemd is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * systemd is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with systemd; If not, see <http://www.gnu.org/licenses/>.
 */
module devisualization.bindings.systemd.sd_bus_vtable;
version(linux):
import devisualization.bindings.systemd.sd_bus;

///
enum {
    ///
    _SD_BUS_VTABLE_START             = '<',
    ///
    _SD_BUS_VTABLE_END               = '>',
    ///
    _SD_BUS_VTABLE_METHOD            = 'M',
    ///
    _SD_BUS_VTABLE_SIGNAL            = 'S',
    ///
    _SD_BUS_VTABLE_PROPERTY          = 'P',
    ///
    _SD_BUS_VTABLE_WRITABLE_PROPERTY = 'W'
}

///
enum {
    ///
    SD_BUS_VTABLE_DEPRECATED                   = 1 << 0,
    ///
    SD_BUS_VTABLE_HIDDEN                       = 1 << 1,
    ///
    SD_BUS_VTABLE_UNPRIVILEGED                 = 1 << 2,
    ///
    SD_BUS_VTABLE_METHOD_NO_REPLY              = 1 << 3,
    ///
    SD_BUS_VTABLE_PROPERTY_CONST               = 1 << 4,
    ///
    SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE        = 1 << 5,
    ///
    SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION  = 1 << 6,
    ///
    SD_BUS_VTABLE_PROPERTY_EXPLICIT            = 1 << 7,
    ///
    _SD_BUS_VTABLE_CAPABILITY_MASK             = 0xFFFFL << 40
}

/**
 * Please do not initialize this structure directly, use the
 * macros below instead
 */
struct sd_bus_vtable {
    private import std.bitmanip : bitfields;

    ///
    mixin(bitfields!(
        ubyte, "type", 8,
        ulong, "flags", 56
    ));

    ///
    union X {
        ///
        struct Start {
            ///
            size_t element_size;
        }

        ///
        Start start;

        ///
        struct Method {
            ///
            const(char)* member;
            ///
            const(char)* signature;
            ///
            const(char)* result;
            ///
            sd_bus_message_handler_t handler;
            ///
            size_t offset;
        }

        ///
        Method method;

        ///
        struct Signal {
            ///
            const(char)* member;
            ///
            const(char)* signature;
        }

        ///
        Signal signal;

        ///
        struct Property {
            ///
            const(char)* member;
            ///
            const(char)* signature;
            ///
            sd_bus_property_get_t get;
            ///
            sd_bus_property_set_t set;
            ///
            size_t offset;
        }

        ///
        Property property;
    }

    ///
    X x;
}
