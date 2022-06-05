;;;; lisp-webview.asd

(defparameter +swank-port+ 10101)

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
                             (:file "webview")))))


#+nil (asdf:load-system :lisp-webview)
#+nil (webview::patch-version)
#+nil (webview::minor-version)


#+os-windows
(defun make-test ()
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview.exe"
                     :toplevel (lambda (&rest ignore)
                                 (format t "~%test started~%")
                                 (funcall (intern "TESTWIN" (find-package "WEBVIEW")))
                                 (format t "~%test ended~%"))
                     :executable t
                     :application-type :gui))

#+(or linux darwin)
(defun make-test ()
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview"
                     :toplevel (lambda (&rest ignore)
                                 (format t "~%test started~%")
                                 (funcall (intern "TESTWIN" (find-package "WEBVIEW")))
                                 (format t "~%test ended~%"))
                     :executable t ))

#+nil (make-test)
