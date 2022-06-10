# lisp-webview
### _mikel evins <mikel@evins.net>_

A Lisp wrapper for webview.h (see https://github.com/webview/webview).

Tested with:

- SBCL 2.2.5 on macos Monterey (Intel)
- SBCL 2.2.5 on Windows 10 64bit
- SBCL 2.1.11 on Ubuntu 22.04 (x86_64)

The code in the platform subdirectory builds shared libraries that can be loaded into Lisp using CFFI.

A toplevel Lisp program can load the DLL and invoke the webview APIs to create and interact with Web Browser windows using WebKit on macOS and Linux, or WebView2 on Windows.

Note that you cannot reliably load the code into a swank session and then run a browser window from your editor (and macOS forbids you even to attempt it); the Lisp process must be the toplevel foreground process when the browser window is created, in order to avoid thread safety issues with event queues and presentation processes.

## To build the platform-specific libraries

### Macos
### Windows
### Ubuntu

## License

Apache 2.0
