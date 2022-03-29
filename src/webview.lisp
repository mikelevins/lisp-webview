(in-package :webview)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defparameter $webview-pathname (asdf:system-relative-pathname :lisp-webview "platform/macos/webview.dylib")))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi::register-foreign-library 'webview `((:darwin ,$webview-pathname))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys::%load-foreign-library 'webview $webview-pathname))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (sb-int:set-floating-point-modes :traps nil))

(cffi::defcfun (major-version "major_version" :library webview) :int)
(cffi::defcfun (minor-version "minor_version" :library webview) :int)
(cffi::defcfun (patch-version "patch_version" :library webview) :int)
(cffi::defcfun (testwin "testwin" :library webview) (:pointer :void))
