#ifdef __cplusplus
extern "C" {
#endif

__declspec(dllimport)  int major_version();
__declspec(dllimport)  int minor_version();
__declspec(dllimport)  int patch_version();
__declspec(dllimport)  webview_t testwin();
__declspec(dllimport)  void closetestwin();

#ifdef __cplusplus
}
#endif
