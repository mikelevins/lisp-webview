#ifdef __cplusplus
extern "C" {
#endif

  int major_version();
  int minor_version();
  int patch_version();
  webview_t testwin();

  webview_t wv_create(int debug, void *window);
  void wv_destroy(webview_t window);
  void wv_run(webview_t window);
  void wv_terminate(webview_t window);
  void *wv_get_window(webview_t window);
  void wv_set_title(webview_t window, const char *title);
  void wv_set_size(webview_t window, int width, int height, int hints);
  void wv_navigate(webview_t window, const char *url);
  void wv_set_html(webview_t window, const char *html);
  void wv_init(webview_t window, const char *js);
  void wv_eval(webview_t window, const char *js);

#ifdef __cplusplus
}
#endif
