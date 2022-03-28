# lisp-webview (Win64)

This directory contains the source code and tools to build the Win64 version of the lisp-webview DLL. To build it, you need a recent version of Microsoft Visual Studio. Once Visual Studio is installed and you've cloned the project to your system, you can build it by following these steps:

1. Open an x64 Native Tools Command Prompt for Visual Studio
2. cd into the lisp-webview\platform\win64 directory
3. run .\make.bat

The build process creates 

several object and library files. The ones of interest are "lisp_webview.dll", "lisp_webview.lib", and "test_webview.exe".

Running test_webview.exe creates a working browser window that loads the front page of Wikipedia.

In the near future, the project's Lisp code will be updated to supported loading the DLL into an SBCL session and creating a browser window in the Lisp process, a feature that is already supported on macOS.

Support for Linux is also forthcoming.

