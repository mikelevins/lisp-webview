cl /std:c++17 /EHsc WebView2Loader.dll.lib version.cc /link /DLL "/OUT:lisp_webview.dll"
cl /std:c++17 /EHsc WebView2Loader.dll.lib lisp_webview.lib  test_webview.cc /link "/OUT:test_webview.exe"
