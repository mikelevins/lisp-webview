#ifdef __cplusplus
extern "C" {
#endif
  
  __declspec(dllexport)  int major_version();
  __declspec(dllexport)  int minor_version();
  __declspec(dllexport)  int patch_version();

  __declspec(dllexport) webview_t wv_create(int debug, void *window);
  __declspec(dllexport) void wv_destroy(webview_t window);
  __declspec(dllexport) void wv_run(webview_t window);
  __declspec(dllexport) void wv_terminate(webview_t window);
  __declspec(dllexport) void *wv_get_window(webview_t window);
  __declspec(dllexport) void wv_set_title(webview_t window, const char *title);
  __declspec(dllexport) void wv_set_size(webview_t window, int width, int height, int hints);
  __declspec(dllexport) void wv_navigate(webview_t window, const char *url);
  __declspec(dllexport) void wv_set_html(webview_t window, const char *html);
  __declspec(dllexport) void wv_init(webview_t window, const char *js);
  __declspec(dllexport) void wv_eval(webview_t window, const char *js);
  
#ifdef __cplusplus
}
#endif
