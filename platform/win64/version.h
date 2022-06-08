#ifdef __cplusplus
extern "C" {
#endif
  
  __declspec(dllexport)  int major_version();
  __declspec(dllexport)  int minor_version();
  __declspec(dllexport)  int patch_version();

  __declspec(dllexport) webview_t wvcreate(int debug, void *window);

#ifdef __cplusplus
}
#endif
