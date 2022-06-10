#include "webview.h"
#include "version.h"

#ifdef __cplusplus
extern "C" {
#endif

  int major_version() { return 0; }
  int minor_version() { return 0; }
  int patch_version() { return 2; }


  WEBVIEW_API webview_t wv_create(int debug, void *window){
    webview_t w;
    w = webview_create(debug, window);
    return w;
  }

  WEBVIEW_API void wv_destroy(webview_t w){ webview_destroy(w); }
  WEBVIEW_API void wv_run(webview_t w){ webview_run(w); }
  WEBVIEW_API void wv_terminate(webview_t w) { webview_terminate(w); }

  WEBVIEW_API void *wv_get_window(webview_t w){
    void *win=webview_get_window(w);
    return win;
  }

  WEBVIEW_API void wv_set_title(webview_t w, const char *title){ webview_set_title(w, title); }
  WEBVIEW_API void wv_set_size(webview_t w, int width, int height, int hints){ webview_set_size(w,width,height,hints); }
  WEBVIEW_API void wv_navigate(webview_t w, const char *url){ webview_navigate(w,url); }
  WEBVIEW_API void wv_set_html(webview_t w, const char *html){ webview_set_html(w,html); }
  WEBVIEW_API void wv_init(webview_t w, const char *js){ webview_init(w,js); }
  WEBVIEW_API void wv_eval(webview_t w, const char *js){ webview_eval(w,js); }

  
#ifdef __cplusplus
}
#endif
