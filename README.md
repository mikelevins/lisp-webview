# lisp-webview
### _mikel evins <mikel@evins.net>_

A Lisp wrapper for webview.h (see https://github.com/webview/webview).

Tested with:

- SBCL 2.2.5 on macos Monterey (Intel)
- SBCL 2.2.5 on Windows 10 64bit
- SBCL 2.1.11 on Ubuntu 22.04 (x86_64)

The code in the platform subdirectory builds shared libraries that can be loaded into Lisp using CFFI.

A toplevel Lisp program can load the DLL and invoke the webview APIs to create and interact with Web Browser windows using WebKit on macOS and Linux, or WebView2 on Windows.

You can run make in a platform-specific subdirectory and then run make in the root of the project to obtain an executable that starts a webview browser in a process that also starts a swank listener on localhost:10101. There are some limitations on what you can do with this configuration; see "Issues" below.

Note that you cannot reliably load the code into a swank session and then run a browser window from your editor (and macOS forbids you even to attempt it); the Lisp process must be the toplevel foreground process when the browser window is created, in order to avoid thread safety issues with event queues and presentation processes.

## Issues

Although the executable built by make runs a swank listener, and you can use SLIME in Emacs to connect to it and interact with the Lisp inside the webview application, there are some inconvenient limitations.

- On macOS, any attempt to call any function that affects the state of the webview or its window crashes you into SBCL's low-level debugger. This is because the platform's GUI framework is not thread safe, and macOS prevents you from even trying to talk to it from a thread other than the prcess main thread (from the swank thread, for example). Windows and GTK don't prevent you from calling such functions, but that doesn't mean they're thread-safe; it just means they don't try so aggressively prevent you from doing this possibly-unsafe thing.
- On Windows and Linux, webview_destroy does not destroy the webview window as it's supposed to. This issue has been reported to the webview.h project, but is so far unsolved.

This code loads the webview shared library into the same process as the Lisp. It may be safer and more reliable to run the Lisp and the webview in separate processes. If so, then it may be more productive to use a solution such as neutralino.js (https://neutralino.js.org/) to build the presentation process, and use that project's support for processes and IPC to run the Lisp and establish communications between processes.

## To build the platform-specific libraries

### Macos

Ensure that the Xcode command-line tools are installed:

    xcode-select --install
    
Ensure that sbcl is installed; for example:

    brew install sbcl
    
cd into the platform/macos directory and run make.

cd back to the root directory and run make.

The result is the executable test-lisp-webview. Run it from the terminal and you should see a window appear and display a web page. You can connect to the Lisp in the running webview from Emacs using M-x slime connect. When prompted for the host, give 'localhost', and when prompted for the port give '10101'.

### Windows

Ensure that the Visual Studio (2019 or better) tools are installed. Open an x64 Native Tools Command Prompt.

Ensure that sbcl is installed: http://www.sbcl.org/platform-table.html

cd into the platform/win64 directory and run make.bat.

cd into the root of the project and run make.bat.

The result is the executable platform\win64\test-lisp-webview.exe. Run it from the CMD prompt and you should see a window appear and display a web page. You can connect to the Lisp in the running webview from Emacs using M-x slime connect. When prompted for the host, give 'localhost', and when prompted for the port give '10101'.

For the program to work, you may have to modify your Windows configuration to permit client connections to local HTTP servers. Googling for any error messages displayed is how I've solved this problem in the past.

### Ubuntu

Ensure that libwebkit2gtk and libwebkit2gtk-dev are installed.

Ensure that sbcl is installed. apt-get install sbcl, or see http://www.sbcl.org/platform-table.html

cd into the platform/linux/ubuntu directory and run make.

cd into the root of the project and run make.

The result is the executable test-lisp-webview. Run it from the terminal and you should see a window appear and display a web page. You can connect to the Lisp in the running webview from Emacs using M-x slime connect. When prompted for the host, give 'localhost', and when prompted for the port give '10101'.


## License

Apache 2.0
