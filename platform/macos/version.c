#include "webview.h"
#include "version.h"

#ifdef __cplusplus
extern "C" {
#endif

  int major_version() { return 0; }
  int minor_version() { return 0; }
  int patch_version() { return 2; }

  webview_t testwin(){
    webview_t w = webview_create(0, NULL);
    webview_set_title(w, "Webview Test");
    webview_set_size(w, 480, 320, WEBVIEW_HINT_NONE);
    webview_navigate(w, "https://en.m.wikipedia.org/wiki/Main_Page");
    webview_run(w);
    return 0;
  }
  
#ifdef __cplusplus
}
#endif
