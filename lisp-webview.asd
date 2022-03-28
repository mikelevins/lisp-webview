;;;; lisp-webview.asd

(asdf:defsystem #:lisp-webview
  :description "Describe lisp-webview here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (:cffi)
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "webview")))))

#+nil (asdf:load-system :lisp-webview)
#+nil (webview::patch-version)


#+sbcl
(defun make-test ()
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview"
                     :toplevel (lambda (&rest ignore)
                                 (format t "~%test started~%")
                                 (funcall (intern "TESTWIN" (find-package "WEBVIEW")))
                                 (format t "~%test ended~%"))
                     :executable t ))
