module devisualization.bindings.libuv.uv_threadpool;
import devisualization.bindings.libuv.uv : uv_loop_s;

__gshared extern(C):

struct uv__work {
	extern(C) void function(uv__work* w) work;
	extern(C) void function(uv__work* w, int status) done;
	uv_loop_s* loop;
	void*[2] wq;
}