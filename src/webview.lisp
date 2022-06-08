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


;;; Window size hints
(defparameter +WEBVIEW-HINT-NONE+ 0)  ;; Width and height are default size
(defparameter +WEBVIEW-HINT-MIN+ 1)   ;; Width and height are minimum bounds
(defparameter +WEBVIEW-HINT-MAX+ 2)   ;; Width and height are maximum bounds
(defparameter +WEBVIEW-HINT-FIXED+ 3) ;; Window size can not be changed by a user


(cffi::defcfun (major-version "major_version" :library webview) :int)
(cffi::defcfun (minor-version "minor_version" :library webview) :int)
(cffi::defcfun (patch-version "patch_version" :library webview) :int)
(cffi::defcfun (testwin "testwin" :library webview) :void)

(cffi::defcfun (wv-create "wv_create" :library webview) (:pointer :void)(debug :int)(window (:pointer :void)))
(cffi::defcfun (wv-destroy "wv_destroy" :library webview) :void (window (:pointer :void)))
(cffi::defcfun (wv-run "wv_run" :library webview) :void (window (:pointer :void)))
(cffi::defcfun (wv-terminate "wv_terminate" :library webview) :void (window (:pointer :void)))
(cffi::defcfun (wv-get-window "wv_get_window" :library webview) (:pointer :void) (window (:pointer :void)))
(cffi::defcfun (wv-set-title "wv_set_title" :library webview) :void (window (:pointer :void)) (title :string))
(cffi::defcfun (wv-set-size "wv_set_size" :library webview) :void
  (window (:pointer :void))(width :int)(height :int)(hints :int))
(cffi::defcfun (wv-navigate "wv_navigate" :library webview) :void (window (:pointer :void)) (url :string))
(cffi::defcfun (wv-set-html "wv_set_html" :library webview) :void (window (:pointer :void)) (html :string))
(cffi::defcfun (wv-init "wv_init" :library webview) :void (window (:pointer :void)) (js :string))
(cffi::defcfun (wv-eval "wv_eval" :library webview) :void (window (:pointer :void)) (js :string))


