// main
#include <stdio.h>
#include "webview.h"
#include "version.h"

int main() {
  int major = major_version();
  int minor = minor_version();
  int patch = patch_version();
  printf("lisp-webview v%d.%d.%d\n", major, minor, patch);

  webview_t w = webview_create(0, NULL);
  webview_set_title(w, "Webview Test");
  webview_set_size(w, 480, 320, WEBVIEW_HINT_NONE);
  webview_navigate(w, "https://en.m.wikipedia.org/wiki/Main_Page");
  webview_run(w);
  
  return 0;
}
