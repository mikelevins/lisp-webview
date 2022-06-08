;;;; lisp-webview.asd

(asdf:defsystem #:lisp-webview
  :description "A Common Lisp wrapper for the webview.h platform browser library"
  :author "mikel evins <mikel@evins.net>"
  :license  "Apache 2.0"
  :version "0.0.2"
  :serial t
  :depends-on (:cffi)
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "webview")))
               (:file "make-test")))


#+nil (asdf:load-system :lisp-webview)
#+nil (webview::major-version)
#+nil (webview::minor-version)
#+nil (webview::patch-version)
#+nil (webview::wvcreate 1 (cffi:null-pointer))
