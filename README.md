# lisp-webview
### _mikel evins <mikel@evins.net>_

A Lisp wrapper for webview.h (see https://github.com/webview/webview).

Currently testing on Windows 10.

The code in the platform subdirectory builds shared libraries that can be loaded into Lisp using CFFI.

A toplevel Lisp program can load the DLL and invoke the webview APIs to create and interact with Web Browser windows using WebKit on macOS and Linux, or WebView2 on Windows.

Note that you cannot reliably load the code into a swank session and then run a browser window from your editor (and macOS forbids you even to attempt it); the Lisp process must be the toplevel foreground process when the browser window is created, in order to avoid thread safety issues with event queues and presentation processes.

You can, however, start sbcl in a terminal, then load this code, then call (webview::testwin) to create a working browser window. You can also the makefile at the root of the project to build a Lisp program that creates a working browser window.

I plan to add code to load swank and start a swank listener process so that Emacs and SLIME can connect to the running application.

## License

Apache 2.0
