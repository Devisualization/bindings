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
module devisualization.bindings.systemd.sd_bus;
version(linux):
import core.sys.posix.sys.uio;
import core.sys.posix.sys.types;

///
mixin template SystemDBus_Functions() {
    import devisualization.bindings.systemd.sd_event;
    import devisualization.bindings.systemd.sd_bus;
    import devisualization.bindings.systemd.sd_bus_vtable;
    import core.sys.posix.sys.uio;
    import core.sys.posix.sys.types;
    import core.stdc.stdarg;
    extern(C):

    ///
    int function(sd_bus** ret) sd_bus_default;
    ///
    int function(sd_bus** ret) sd_bus_default_user;
    ///
    int function(sd_bus** ret) sd_bus_default_system;

    ///
    int function(sd_bus** ret) sd_bus_open;
    ///
    int function(sd_bus** ret) sd_bus_open_user;
    ///
    int function(sd_bus** ret) sd_bus_open_system;
    ///
    int function(sd_bus** ret, const char* host) sd_bus_open_system_remote;
    ///
    int function(sd_bus** ret, const char* machine) sd_bus_open_system_machine;

    ///
    int function(sd_bus** ret) sd_bus_new;

    ///
    int function(sd_bus* bus, const char* address) sd_bus_set_address;
    ///
    int function(sd_bus* bus, int input_fd, int output_fd) sd_bus_set_fd;
    ///
    int function(sd_bus* bus, const char* path, const char** argv) sd_bus_set_exec;
    ///
    int function(sd_bus* bus, const char** address) sd_bus_get_address;
    ///
    int function(sd_bus* bus, int b) sd_bus_set_bus_client;
    ///
    int function(sd_bus* bus) sd_bus_is_bus_client;
    ///
    int function(sd_bus* bus, int b, sd_id128_t bus_id) sd_bus_set_server;
    ///
    int function(sd_bus* bus) sd_bus_is_server;
    ///
    int function(sd_bus* bus, int b) sd_bus_set_anonymous;
    ///
    int function(sd_bus* bus) sd_bus_is_anonymous;
    ///
    int function(sd_bus* bus, int b) sd_bus_set_trusted;
    ///
    int function(sd_bus* bus) sd_bus_is_trusted;
    ///
    int function(sd_bus* bus, int b) sd_bus_set_monitor;
    ///
    int function(sd_bus* bus) sd_bus_is_monitor;
    ///
    int function(sd_bus* bus, const char* description) sd_bus_set_description;
    ///
    int function(sd_bus* bus, const char** description) sd_bus_get_description;
    ///
    int function(sd_bus* bus, int b, ulong creds_mask) sd_bus_negotiate_creds;
    ///
    int function(sd_bus* bus, int b) sd_bus_negotiate_timestamp;
    ///
    int function(sd_bus* bus, int b) sd_bus_negotiate_fds;
    ///
    int function(sd_bus* bus, char type) sd_bus_can_send;
    ///
    int function(sd_bus* bus, ulong* creds_mask) sd_bus_get_creds_mask;
    ///
    int function(sd_bus* bus, int b) sd_bus_set_allow_interactive_authorization;
    ///
    int function(sd_bus* bus) sd_bus_get_allow_interactive_authorization;
    ///
    int function(sd_bus* bus, int b) sd_bus_set_exit_on_disconnect;
    ///
    int function(sd_bus* bus) sd_bus_get_exit_on_disconnect;

    ///
    int function(sd_bus* ret) sd_bus_start;

    ///
    int function(sd_bus* bus) sd_bus_try_close;
    ///
    void function(sd_bus* bus) sd_bus_close;

    ///
    sd_bus* function(sd_bus* bus) sd_bus_ref;
    ///
    sd_bus* function(sd_bus* bus) sd_bus_unref;
    ///
    sd_bus* function(sd_bus* bus) sd_bus_flush_close_unref;

    ///
    void function() sd_bus_default_flush_close;

    ///
    int function(sd_bus* bus) sd_bus_is_open;

    ///
    int function(sd_bus* bus, sd_id128_t* id) sd_bus_get_bus_id;
    ///
    int function(sd_bus* bus, const char** scope_) sd_bus_get_scope;
    ///
    int function(sd_bus* bus, pid_t* tid) sd_bus_get_tid;
    ///
    int function(sd_bus* bus, ulong creds_mask, sd_bus_creds** ret) sd_bus_get_owner_creds;

    ///
    int function(sd_bus* bus, sd_bus_message* m, ulong* cookie) sd_bus_send;
    ///
    int function(sd_bus* bus, sd_bus_message* m, const char* destination, ulong* cookie) sd_bus_send_to;
    ///
    int function(sd_bus* bus, sd_bus_message* m, ulong usec, sd_bus_error* ret_error, sd_bus_message** reply) sd_bus_call;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, sd_bus_message* m, sd_bus_message_handler_t callback, void* userdata, ulong usec) sd_bus_call_async;

    ///
    int function(sd_bus* bus) sd_bus_get_fd;
    ///
    int function(sd_bus* bus) sd_bus_get_events;
    ///
    int function(sd_bus* bus, ulong* timeout_usec) sd_bus_get_timeout;
    ///
    int function(sd_bus* bus, sd_bus_message** r) sd_bus_process;
    ///
    int function(sd_bus* bus, long max_priority, sd_bus_message** r) sd_bus_process_priority;
    ///
    int function(sd_bus* bus, ulong timeout_usec) sd_bus_wait;
    ///
    int function(sd_bus* bus) sd_bus_flush;

    ///
    sd_bus_slot* function(sd_bus* bus) sd_bus_get_current_slot;
    ///
    sd_bus_message* function(sd_bus* bus) sd_bus_get_current_message;
    ///
    sd_bus_message_handler_t function(sd_bus* bus) sd_bus_get_current_handler;
    ///
    void* function(sd_bus* bus) sd_bus_get_current_userdata;

    ///
    int function(sd_bus* bus, sd_event* e, int priority) sd_bus_attach_event;
    ///
    int function(sd_bus* bus) sd_bus_detach_event;
    ///
    sd_event* function(sd_bus* bus) sd_bus_get_event;

    ///
    int function(sd_bus* bus, sd_bus_slot** slot, sd_bus_message_handler_t callback, void* userdata) sd_bus_add_filter;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* match, sd_bus_message_handler_t callback, void* userdata) sd_bus_add_match;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* path, sd_bus_message_handler_t callback, void* userdata) sd_bus_add_object;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* prefix, sd_bus_message_handler_t callback, void* userdata) sd_bus_add_fallback;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* path, const char* interface_, const sd_bus_vtable* vtable, void* userdata) sd_bus_add_object_vtable;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* prefix, const char* interface_, const sd_bus_vtable* vtable, sd_bus_object_find_t find, void* userdata) sd_bus_add_fallback_vtable;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* path, sd_bus_node_enumerator_t callback, void* userdata) sd_bus_add_node_enumerator;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* path) sd_bus_add_object_manager;

    ///
    sd_bus_slot* function(sd_bus_slot* slot) sd_bus_slot_ref;
    ///
    sd_bus_slot* function(sd_bus_slot* slot) sd_bus_slot_unref;

    sd_bus* function(sd_bus_slot* slot) sd_bus_slot_get_bus;
    ///
    void* function(sd_bus_slot* slot) sd_bus_slot_get_userdata;
    ///
    void* function(sd_bus_slot* slot, void* userdata) sd_bus_slot_set_userdata;
    ///
    int function(sd_bus_slot* slot, const char* description) sd_bus_slot_set_description;
    ///
    int function(sd_bus_slot* slot, const char** description) sd_bus_slot_get_description;

    ///
    sd_bus_message* function(sd_bus_slot* slot) sd_bus_slot_get_current_message;
    ///
    sd_bus_message_handler_t function(sd_bus_slot* bus) sd_bus_slot_get_current_handler;
    ///
    void* function(sd_bus_slot* slot) sd_bus_slot_get_current_userdata;

    ///
    int function(sd_bus* bus, sd_bus_message** m, const char* path, const char* interface_, const char* member) sd_bus_message_new_signal;
    ///
    int function(sd_bus* bus, sd_bus_message** m, const char* destination, const char* path, const char* interface_, const char* member) sd_bus_message_new_method_call;
    ///
    int function(sd_bus_message* call, sd_bus_message** m) sd_bus_message_new_method_return;
    ///
    int function(sd_bus_message* call, sd_bus_message** m, const sd_bus_error* e) sd_bus_message_new_method_error;
    ///
    int function(sd_bus_message* call, sd_bus_message** m, const char* name, const char* format, ...) sd_bus_message_new_method_errorf;
    ///
    int function(sd_bus_message* call, sd_bus_message** m, int error, const sd_bus_error* e) sd_bus_message_new_method_errno;
    ///
    int function(sd_bus_message* call, sd_bus_message** m, int error, const char* format, ...) sd_bus_message_new_method_errnof;

    ///
    sd_bus_message* function(sd_bus_message* m) sd_bus_message_ref;
    ///
    sd_bus_message* function(sd_bus_message* m) sd_bus_message_unref;

    ///
    int function(sd_bus_message* m, ubyte* type) sd_bus_message_get_type;
    ///
    int function(sd_bus_message* m, ulong* cookie) sd_bus_message_get_cookie;
    ///
    int function(sd_bus_message* m, ulong* cookie) sd_bus_message_get_reply_cookie;
    ///
    int function(sd_bus_message* m, long* priority) sd_bus_message_get_priority;

    ///
    int function(sd_bus_message* m) sd_bus_message_get_expect_reply;
    ///
    int function(sd_bus_message* m) sd_bus_message_get_auto_start;
    ///
    int function(sd_bus_message* m) sd_bus_message_get_allow_interactive_authorization;

    ///
    const char* function(sd_bus_message* m, int complete) sd_bus_message_get_signature;
    ///
    const char* function(sd_bus_message* m) sd_bus_message_get_path;
    ///
    const char* function(sd_bus_message* m) sd_bus_message_get_interface;
    ///
    const char* function(sd_bus_message* m) sd_bus_message_get_member;
    ///
    const char* function(sd_bus_message* m) sd_bus_message_get_destination;
    ///
    const char* function(sd_bus_message* m) sd_bus_message_get_sender;
    ///
    const sd_bus_error* function(sd_bus_message* m) sd_bus_message_get_error;
    ///
    int function(sd_bus_message* m) sd_bus_message_get_errno;

    ///
    int function(sd_bus_message* m, ulong* usec) sd_bus_message_get_monotonic_usec;
    ///
    int function(sd_bus_message* m, ulong* usec) sd_bus_message_get_realtime_usec;
    ///
    int function(sd_bus_message* m, ulong* seqnum) sd_bus_message_get_seqnum;

    ///
    sd_bus* function(sd_bus_message* m) sd_bus_message_get_bus;
    /// do not unref the result
    sd_bus_creds* function(sd_bus_message* m) sd_bus_message_get_creds;

    ///
    int function(sd_bus_message* m, const char* interface_, const char* member) sd_bus_message_is_signal;
    ///
    int function(sd_bus_message* m, const char* interface_, const char* member) sd_bus_message_is_method_call;
    ///
    int function(sd_bus_message* m, const char* name) sd_bus_message_is_method_error;
    ///
    int function(sd_bus_message* m) sd_bus_message_is_empty;
    ///
    int function(sd_bus_message* m, const char* signature) sd_bus_message_has_signature;

    ///
    int function(sd_bus_message* m, int b) sd_bus_message_set_expect_reply;
    ///
    int function(sd_bus_message* m, int b) sd_bus_message_set_auto_start;
    ///
    int function(sd_bus_message* m, int b) sd_bus_message_set_allow_interactive_authorization;

    ///
    int function(sd_bus_message* m, const char* destination) sd_bus_message_set_destination;
    ///
    int function(sd_bus_message* m, long priority) sd_bus_message_set_priority;

    ///
    int function(sd_bus_message* m, const char* types, ...) sd_bus_message_append;
    ///
    int function(sd_bus_message* m, char type, const void* p) sd_bus_message_append_basic;
    ///
    int function(sd_bus_message* m, char type, const void* ptr, size_t size) sd_bus_message_append_array;
    ///
    int function(sd_bus_message* m, char type, size_t size, void** ptr) sd_bus_message_append_array_space;
    ///
    int function(sd_bus_message* m, char type, const iovec* iov, uint n) sd_bus_message_append_array_iovec;
    ///
    int function(sd_bus_message* m, char type, int memfd, ulong offset, ulong size) sd_bus_message_append_array_memfd;
    ///
    int function(sd_bus_message* m, size_t size, char** s) sd_bus_message_append_string_space;
    ///
    int function(sd_bus_message* m, const iovec* iov, uint n) sd_bus_message_append_string_iovec;
    ///
    int function(sd_bus_message* m, int memfd, ulong offset, ulong size) sd_bus_message_append_string_memfd;
    ///
    int function(sd_bus_message* m, char** l) sd_bus_message_append_strv;
    ///
    int function(sd_bus_message* m, char type, const char* contents) sd_bus_message_open_container;
    ///
    int function(sd_bus_message* m) sd_bus_message_close_container;
    ///
    int function(sd_bus_message* m, sd_bus_message* source, int all) sd_bus_message_copy;

    ///
    int function(sd_bus_message* m, const char* types, ...) sd_bus_message_read;
    ///
    int function(sd_bus_message* m, char type, void* p) sd_bus_message_read_basic;
    ///
    int function(sd_bus_message* m, char type, const void** ptr, size_t* size) sd_bus_message_read_array;
    /// free the result!
    int function(sd_bus_message* m, char*** l) sd_bus_message_read_strv;
    ///
    int function(sd_bus_message* m, const char* types) sd_bus_message_skip;
    ///
    int function(sd_bus_message* m, char type, const char* contents) sd_bus_message_enter_container;
    ///
    int function(sd_bus_message* m) sd_bus_message_exit_container;
    ///
    int function(sd_bus_message* m, char* type, const char** contents) sd_bus_message_peek_type;
    ///
    int function(sd_bus_message* m, char type, const char* contents) sd_bus_message_verify_type;
    ///
    int function(sd_bus_message* m, int complete) sd_bus_message_at_end;
    ///
    int function(sd_bus_message* m, int complete) sd_bus_message_rewind;

    ///
    int function(sd_bus* bus, const char** unique) sd_bus_get_unique_name;
    ///
    int function(sd_bus* bus, const char* name, ulong flags) sd_bus_request_name;
    ///
    int function(sd_bus* bus, const char* name) sd_bus_release_name;
    /// free the results
    int function(sd_bus* bus, char*** acquired, char*** activatable) sd_bus_list_names;
    /// unref the result!
    int function(sd_bus* bus, const char* name, ulong mask, sd_bus_creds** creds) sd_bus_get_name_creds;
    ///
    int function(sd_bus* bus, const char* name, sd_id128_t* machine) sd_bus_get_name_machine_id;

    ///
    int function(sd_bus* bus, const char* destination, const char* path, const char* interface_, const char* member, sd_bus_error* ret_error, sd_bus_message** reply, const char* types, ...) sd_bus_call_method;
    ///
    int function(sd_bus* bus, sd_bus_slot** slot, const char* destination, const char* path, const char* interface_, const char* member, sd_bus_message_handler_t callback, void* userdata, const char* types, ...) sd_bus_call_method_async;
    ///
    int function(sd_bus* bus, const char* destination, const char* path, const char* interface_, const char* member, sd_bus_error* ret_error, sd_bus_message** reply, const char* type) sd_bus_get_property;
    ///
    int function(sd_bus* bus, const char* destination, const char* path, const char* interface_, const char* member, sd_bus_error* ret_error, char type, void* ret_ptr) sd_bus_get_property_trivial;
    /// free the result!
    int function(sd_bus* bus, const char* destination, const char* path, const char* interface_, const char* member, sd_bus_error* ret_error, char** ret) sd_bus_get_property_string;
    /// free the result!
    int function(sd_bus* bus, const char* destination, const char* path, const char* interface_, const char* member, sd_bus_error* ret_error, char*** ret) sd_bus_get_property_strv;
    ///
    int function(sd_bus* bus, const char* destination, const char* path, const char* interface_, const char* member, sd_bus_error* ret_error, const char* type, ...) sd_bus_set_property;

    ///
    int function(sd_bus_message* call, const char* types, ...) sd_bus_reply_method_return;
    ///
    int function(sd_bus_message* call, const sd_bus_error* e) sd_bus_reply_method_error;
    ///
    int function(sd_bus_message* call, const char* name, const char* format, ...) sd_bus_reply_method_errorf;
    ///
    int function(sd_bus_message* call, int error, const sd_bus_error* e) sd_bus_reply_method_errno;
    ///
    int function(sd_bus_message* call, int error, const char* format, ...) sd_bus_reply_method_errnof;

    ///
    int function(sd_bus* bus, const char* path, const char* interface_, const char* member, const char* types, ...) sd_bus_emit_signal;

    ///
    int function(sd_bus* bus, const char* path, const char* interface_, char** names) sd_bus_emit_properties_changed_strv;
    ///
    int function(sd_bus* bus, const char* path, const char* interface_, const char* name, ...) sd_bus_emit_properties_changed;

    ///
    int function(sd_bus* bus, const char* path) sd_bus_emit_object_added;
    ///
    int function(sd_bus* bus, const char* path) sd_bus_emit_object_removed;
    ///
    int function(sd_bus* bus, const char* path, char** interfaces) sd_bus_emit_interfaces_added_strv;
    ///
    int function(sd_bus* bus, const char* path, const char* interface_, ...) sd_bus_emit_interfaces_added;
    ///
    int function(sd_bus* bus, const char* path, char** interfaces) sd_bus_emit_interfaces_removed_strv;
    ///
    int function(sd_bus* bus, const char* path, const char* interface_, ...) sd_bus_emit_interfaces_removed;

    ///
    int function(sd_bus_message* call, ulong mask, sd_bus_creds** creds) sd_bus_query_sender_creds;
    ///
    int function(sd_bus_message* call, int capability) sd_bus_query_sender_privilege;

    ///
    int function(sd_bus_creds** ret, pid_t pid, ulong creds_mask) sd_bus_creds_new_from_pid;
    ///
    sd_bus_creds* function(sd_bus_creds* c) sd_bus_creds_ref;
    ///
    sd_bus_creds* function(sd_bus_creds* c) sd_bus_creds_unref;
    ///
    ulong function(const sd_bus_creds* c) sd_bus_creds_get_mask;
    ///
    ulong function(const sd_bus_creds* c) sd_bus_creds_get_augmented_mask;

    ///
    int function(sd_bus_creds* c, pid_t* pid) sd_bus_creds_get_pid;
    ///
    int function(sd_bus_creds* c, pid_t* ppid) sd_bus_creds_get_ppid;
    ///
    int function(sd_bus_creds* c, pid_t* tid) sd_bus_creds_get_tid;
    ///
    int function(sd_bus_creds* c, uid_t* uid) sd_bus_creds_get_uid;
    ///
    int function(sd_bus_creds* c, uid_t* euid) sd_bus_creds_get_euid;
    ///
    int function(sd_bus_creds* c, uid_t* suid) sd_bus_creds_get_suid;
    ///
    int function(sd_bus_creds* c, uid_t* fsuid) sd_bus_creds_get_fsuid;
    ///
    int function(sd_bus_creds* c, gid_t* gid) sd_bus_creds_get_gid;
    ///
    int function(sd_bus_creds* c, gid_t* egid) sd_bus_creds_get_egid;
    ///
    int function(sd_bus_creds* c, gid_t* sgid) sd_bus_creds_get_sgid;
    ///
    int function(sd_bus_creds* c, gid_t* fsgid) sd_bus_creds_get_fsgid;
    ///
    int function(sd_bus_creds* c, const gid_t** gids) sd_bus_creds_get_supplementary_gids;
    ///
    int function(sd_bus_creds* c, const char** comm) sd_bus_creds_get_comm;
    ///
    int function(sd_bus_creds* c, const char** comm) sd_bus_creds_get_tid_comm;
    ///
    int function(sd_bus_creds* c, const char** exe) sd_bus_creds_get_exe;
    ///
    int function(sd_bus_creds* c, char*** cmdline) sd_bus_creds_get_cmdline;
    ///
    int function(sd_bus_creds* c, const char** cgroup) sd_bus_creds_get_cgroup;
    ///
    int function(sd_bus_creds* c, const char** unit) sd_bus_creds_get_unit;
    ///
    int function(sd_bus_creds* c, const char** slice) sd_bus_creds_get_slice;
    ///
    int function(sd_bus_creds* c, const char** unit) sd_bus_creds_get_user_unit;
    ///
    int function(sd_bus_creds* c, const char** slice) sd_bus_creds_get_user_slice;
    ///
    int function(sd_bus_creds* c, const char** session) sd_bus_creds_get_session;
    ///
    int function(sd_bus_creds* c, uid_t* uid) sd_bus_creds_get_owner_uid;
    ///
    int function(sd_bus_creds* c, int capability) sd_bus_creds_has_effective_cap;
    ///
    int function(sd_bus_creds* c, int capability) sd_bus_creds_has_permitted_cap;
    ///
    int function(sd_bus_creds* c, int capability) sd_bus_creds_has_inheritable_cap;
    ///
    int function(sd_bus_creds* c, int capability) sd_bus_creds_has_bounding_cap;
    ///
    int function(sd_bus_creds* c, const char** context) sd_bus_creds_get_selinux_context;
    ///
    int function(sd_bus_creds* c, uint* sessionid) sd_bus_creds_get_audit_session_id;
    ///
    int function(sd_bus_creds* c, uid_t* loginuid) sd_bus_creds_get_audit_login_uid;
    ///
    int function(sd_bus_creds* c, const char** tty) sd_bus_creds_get_tty;
    ///
    int function(sd_bus_creds* c, const char** name) sd_bus_creds_get_unique_name;
    ///
    int function(sd_bus_creds* c, char*** names) sd_bus_creds_get_well_known_names;
    ///
    int function(sd_bus_creds* c, const char** name) sd_bus_creds_get_description;

    void function(sd_bus_error* e) sd_bus_error_free;
    int function(sd_bus_error* e, const char* name, const char* message) sd_bus_error_set;
    int function(sd_bus_error* e, const char* name, const char* format, ...) sd_bus_error_setf;
    int function(sd_bus_error* e, const char* name, const char* message) sd_bus_error_set_const;
    int function(sd_bus_error* e, int error) sd_bus_error_set_errno;
    int function(sd_bus_error* e, int error, const char* format, ...) sd_bus_error_set_errnof;
    int function(sd_bus_error* e, int error, const char* format, va_list ap) sd_bus_error_set_errnofv;
    int function(const sd_bus_error* e) sd_bus_error_get_errno;
    int function(sd_bus_error* dest, const sd_bus_error* e) sd_bus_error_copy;
    int function(const sd_bus_error* e) sd_bus_error_is_set;
    int function(const sd_bus_error* e, const char* name) sd_bus_error_has_name;

    int function(const sd_bus_error_map* map) sd_bus_error_add_map;

    int function(const char* prefix, const char* external_id, char** ret_path) sd_bus_path_encode;
    int function(char** out_, const char* path_template, ...) sd_bus_path_encode_many;
    int function(const char* path, const char* prefix, char** ret_external_id) sd_bus_path_decode;
    int function(const char* path, const char* path_template, ...) sd_bus_path_decode_many;

    int function(sd_bus* bus, sd_bus_track** track, sd_bus_track_handler_t handler, void* userdata) sd_bus_track_new;
    sd_bus_track* function(sd_bus_track* track) sd_bus_track_ref;
    sd_bus_track* function(sd_bus_track* track) sd_bus_track_unref;

    sd_bus* function(sd_bus_track* track) sd_bus_track_get_bus;
    void* function(sd_bus_track* track) sd_bus_track_get_userdata;
    void* function(sd_bus_track* track, void* userdata) sd_bus_track_set_userdata;

    int function(sd_bus_track* track, sd_bus_message* m) sd_bus_track_add_sender;
    int function(sd_bus_track* track, sd_bus_message* m) sd_bus_track_remove_sender;
    int function(sd_bus_track* track, const char* name) sd_bus_track_add_name;
    int function(sd_bus_track* track, const char* name) sd_bus_track_remove_name;

    int function(sd_bus_track* track, int b) sd_bus_track_set_recursive;
    int function(sd_bus_track* track) sd_bus_track_get_recursive;

    uint function(sd_bus_track* track) sd_bus_track_count;
    int function(sd_bus_track* track, sd_bus_message* m) sd_bus_track_count_sender;
    int function(sd_bus_track* track, const char* name) sd_bus_track_count_name;

    const char* function(sd_bus_track* track, const char* name) sd_bus_track_contains;
    const char* function(sd_bus_track* track) sd_bus_track_first;
    const char* function(sd_bus_track* track) sd_bus_track_next;
}

///
struct sd_bus;
///
struct sd_bus_message;
///
struct sd_bus_slot;
///
struct sd_bus_creds;
///
struct sd_bus_track;

///
struct sd_bus_error {
    ///
    const char* name;
    ///
    const char* message;
    int _need_free;
}

///
struct sd_bus_error_map {
    ///
    const char* name;
    ///
    int code;
}

///
enum : ulong {
    ///
    SD_BUS_CREDS_PID = 1 << 0,
    ///
    SD_BUS_CREDS_TID = 1 << 1,
    ///
    SD_BUS_CREDS_PPID = 1 << 2,
    ///
    SD_BUS_CREDS_UID = 1 << 3,
    ///
    SD_BUS_CREDS_EUID = 1 << 4,
    ///
    SD_BUS_CREDS_SUID = 1 << 5,
    ///
    SD_BUS_CREDS_FSUID = 1 << 6,
    ///
    SD_BUS_CREDS_GID = 1 << 7,
    ///
    SD_BUS_CREDS_EGID = 1 << 8,
    ///
    SD_BUS_CREDS_SGID = 1 << 9,
    ///
    SD_BUS_CREDS_FSGID = 1 << 10,
    ///
    SD_BUS_CREDS_SUPPLEMENTARY_GIDS = 1 << 11,
    ///
    SD_BUS_CREDS_COMM = 1 << 12,
    ///
    SD_BUS_CREDS_TID_COMM = 1 << 13,
    ///
    SD_BUS_CREDS_EXE = 1 << 14,
    ///
    SD_BUS_CREDS_CMDLINE = 1 << 15,
    ///
    SD_BUS_CREDS_CGROUP = 1 << 16,
    ///
    SD_BUS_CREDS_UNIT = 1 << 17,
    ///
    SD_BUS_CREDS_SLICE = 1 << 18,
    ///
    SD_BUS_CREDS_USER_UNIT = 1 << 19,
    ///
    SD_BUS_CREDS_USER_SLICE = 1 << 20,
    ///
    SD_BUS_CREDS_SESSION = 1 << 21,
    ///
    SD_BUS_CREDS_OWNER_UID = 1 << 22,
    ///
    SD_BUS_CREDS_EFFECTIVE_CAPS = 1 << 23,
    ///
    SD_BUS_CREDS_PERMITTED_CAPS = 1 << 24,
    ///
    SD_BUS_CREDS_INHERITABLE_CAPS = 1 << 25,
    ///
    SD_BUS_CREDS_BOUNDING_CAPS = 1 << 26,
    ///
    SD_BUS_CREDS_SELINUX_CONTEXT = 1 << 27,
    ///
    SD_BUS_CREDS_AUDIT_SESSION_ID = 1 << 28,
    ///
    SD_BUS_CREDS_AUDIT_LOGIN_UID = 1 << 29,
    ///
    SD_BUS_CREDS_TTY = 1 << 30,
    ///
    SD_BUS_CREDS_UNIQUE_NAME = 1 << 31,
    ///
    SD_BUS_CREDS_WELL_KNOWN_NAMES = 1L << 32,
    ///
    SD_BUS_CREDS_DESCRIPTION = 1L << 33,
    /// special flag, if on sd-bus will augment creds struct, in a potentially race-f way.
    SD_BUS_CREDS_AUGMENT = 1L << 63,
    ///
    _SD_BUS_CREDS_ALL = (1L << 34) -1
}

///
enum {
    ///
    SD_BUS_NAME_REPLACE_EXISTING = 1 << 0,
    ///
    SD_BUS_NAME_ALLOW_REPLACEMENT = 1 << 1,
    ///
    SD_BUS_NAME_QUEUE = 1 << 2
}

///
alias sd_bus_message_handler_t = extern(C) int function(sd_bus_message* m, void* userdata, sd_bus_error* ret_error);
///
alias sd_bus_property_get_t = extern(C) int function(sd_bus* bus, const char* path, const char* interface_, const char* property, sd_bus_message* reply, void* userdata, sd_bus_error* ret_error);
///
alias sd_bus_property_set_t = extern(C) int function(sd_bus* bus, const char* path, const char* interface_, const char* property, sd_bus_message* value, void* userdata, sd_bus_error* ret_error);
///
alias sd_bus_object_find_t = extern(C)int function(sd_bus* bus, const char* path, const char* interface_, void* userdata, void** ret_found, sd_bus_error* ret_error);
///
alias sd_bus_node_enumerator_t = extern(C) int function(sd_bus* bus, const char* prefix, void* userdata, char*** ret_nodes, sd_bus_error* ret_error);
///
alias sd_bus_track_handler_t = extern(C) int function(sd_bus_track* track, void* userdata);

