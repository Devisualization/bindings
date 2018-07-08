/**
 * This file is part of systemd.
 *
 * Copyright 2011 Lennart Poettering
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
module devisualization.bindings.systemd.sd_id128;

mixin template SystemDId128_Functions() {
    import devisualization.bindings.systemd.sd_id128;
    extern(C):

    ///
    char* function(sd_id128_t id, char[SD_ID128_STRING_MAX] s) sd_id128_to_string;
    ///
    int function(const char* s, sd_id128_t* ret) sd_id128_from_string;
    ///
    int function(sd_id128_t* ret) sd_id128_randomize;

    ///
    int function(sd_id128_t* ret) sd_id128_get_machine;
    ///
    int function(sd_id128_t* ret) sd_id128_get_boot;
    ///
    int function(sd_id128_t* ret) sd_id128_get_invocation;
}

///
alias sd_id128_t = sd_id128;

///
union sd_id128 {
    ///
    ubyte[16] bytes;
    ///
    ulong[2] qwords;
}

///
enum SD_ID128_STRING_MAX = 33;
