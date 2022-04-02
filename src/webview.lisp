(in-package :webview)

(eval-when (:compile-toplevel :load-toplevel :execute)
  #+darwin
  (defparameter $webview-pathname (asdf:system-relative-pathname :lisp-webview "platform/macos/webview.dylib"))
  #+windows
  (defparameter $webview-pathname (asdf:system-relative-pathname :lisp-webview "platform/win64/lisp_webview.dll")))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (progn
    ;; we need the Lisp's working directory to be the win64 directory in order to find the
    ;; DLL dependencies
    #+windows (sb-posix:chdir (asdf:system-relative-pathname :lisp-webview "platform/win64/"))
    (cffi::register-foreign-library 'webview `((:darwin ,$webview-pathname)
                                             (:windows ,$webview-pathname)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys::%load-foreign-library 'webview $webview-pathname))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (sb-int:set-floating-point-modes :traps nil))

(cffi::defcfun (major-version "major_version" :library webview) :int)
(cffi::defcfun (minor-version "minor_version" :library webview) :int)
(cffi::defcfun (patch-version "patch_version" :library webview) :int)
(cffi::defcfun (testwin "testwin" :library webview) (:pointer :void))

#+nil (webview::testwin)