(in-package :webview)

(eval-when (:compile-toplevel :load-toplevel :execute)
  #+darwin
  (defparameter $webview-pathname (asdf:system-relative-pathname :lisp-webview "platform/macos/webview.dylib"))
  #+windows
  (defparameter $webview-pathname (asdf:system-relative-pathname :lisp-webview "platform/win64/lisp_webview.dll"))
  #+linux
  (defparameter $webview-pathname
    (asdf:system-relative-pathname :lisp-webview "platform/linux/ubuntu/libwebview.so")))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (progn
    ;; Windows:
    ;; we need the Lisp's working directory to be the win64 directory in order to find the
    ;; DLL dependencies
    #+(and windows sbcl) (sb-posix:chdir (asdf:system-relative-pathname :lisp-webview "platform/win64/"))
    #+(and windows allegro) (excl:chdir (asdf:system-relative-pathname :lisp-webview "platform/win64/"))
    ;; import the foreign library into Lisp
    (cffi::register-foreign-library 'webview `((:darwin ,$webview-pathname)
                                               (:windows ,$webview-pathname)
                                               (:linux ,$webview-pathname)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys::%load-foreign-library 'webview $webview-pathname))

#+sbcl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (sb-int:set-floating-point-modes :traps nil))

(cffi::defcfun (major-version "major_version" :library webview) :int)
(cffi::defcfun (minor-version "minor_version" :library webview) :int)
(cffi::defcfun (patch-version "patch_version" :library webview) :int)
(cffi::defcfun (testwin "testwin" :library webview) :void)

(cffi::defcfun (wvcreate "wvcreate" :library webview) (:pointer :void)(debug :int)(window (:pointer :null)))


#+nil (webview::major-version)
#+nil (webview::minor-version)
#+nil (webview::patch-version)
#+nil (webview::testwin)
