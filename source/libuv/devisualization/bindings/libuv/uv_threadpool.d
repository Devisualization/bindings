module devisualization.bindings.libuv.uv_threadpool;
import devisualization.bindings.libuv.uv;

__gshared extern(C):

struct uv__work {
	extern(C) void function(uv__work* w) work;
	extern(C) void function(uv__work* w, int status) done;
	UV.uv_loop_s* loop;
	void*[2] wq;
}
