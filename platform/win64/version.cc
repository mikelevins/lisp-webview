
#include "webview.h"
#include "version.h"

#ifdef __cplusplus
extern "C" {
#endif

  int major_version() { return 0; }
  int minor_version() { return 0; }
  int patch_version() { return 3; }

  WEBVIEW_API webview_t wvcreate(int debug, void *window){
    webview_t w;
    w = webview_create(debug, window);
    return w;
  }
  
  
#ifdef __cplusplus
}
#endif
