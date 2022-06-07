#include "webview.h"
#include "version.h"

#ifdef __cplusplus
extern "C" {
#endif

  int major_version() { return 0; }
  int minor_version() { return 0; }
  int patch_version() { return 2; }

  static webview_t the_webview = NULL;

  webview_t testwin(){
    //webview_t w = webview_create(1, NULL); // nonzero first argument means enable development tools in the webview
    the_webview = webview_create(1, NULL); // nonzero first argument means enable development tools in the webview
    webview_t w = the_webview;
    webview_set_title(w, "Webview Test");
    webview_set_size(w, 480, 320, WEBVIEW_HINT_NONE);
    webview_navigate(w, "https://en.m.wikipedia.org/wiki/Main_Page");
    webview_run(w);
    return 0;
  }

  void closetestwin(){
    webview_destroy(the_webview);
    the_webview = NULL;
  }
  
#ifdef __cplusplus
}
#endif
