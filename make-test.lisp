;;;; lisp-webview.asd

(defparameter +swank-port+ 10101)

;;; ---------------------------------------------------------------------
;;; Windows
;;; ---------------------------------------------------------------------

;;; without swank server
;;; ---------------------------------------------------------------------

#+nil
(defun make-test ()
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview.exe"
                     :toplevel (lambda (&rest ignore)
                                 (format t "~%test started~%")
                                 (funcall (intern "TESTWIN" (find-package "WEBVIEW")))
                                 (format t "~%test ended~%"))
                     :executable t
                     :application-type :gui))

;;; with swank server
;;; ---------------------------------------------------------------------

#+win32
(defun make-test ()
  (ql:quickload :swank)
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview.exe"
                     :toplevel (lambda (&rest ignore)
                                 (funcall (intern "CREATE-SERVER" (find-package :swank))
                                          :port +swank-port+ :dont-close t)
                                 (format t "~%test started~%")
                                 (funcall (intern "TESTWIN" (find-package "WEBVIEW")))
                                 (format t "~%test ended~%"))
                     :executable t
                     :application-type :gui))

;;; ---------------------------------------------------------------------
;;; macOS and Linux
;;; ---------------------------------------------------------------------

;;; without swank server
;;; ---------------------------------------------------------------------

#+nil
(defun make-test ()
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview"
                     :toplevel (lambda (&rest args)
                                 (format t "~%test started~%")
                                 (funcall (intern "TESTWIN" (find-package "WEBVIEW")))
                                 (format t "~%test ended~%"))
                     :executable t ))

;;; with swank server
;;; ---------------------------------------------------------------------

#+(or linux darwin)
(defun make-test ()
  (ql:quickload :swank)
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview"
                     :toplevel (lambda (&rest args)
                                 (funcall (intern "CREATE-SERVER" (find-package :swank))
                                          :port +swank-port+ :dont-close t)
                                 (format t "~%test started~%")
                                 (funcall (intern "TESTWIN" (find-package "WEBVIEW")))
                                 (format t "~%test ended~%"))
                     :executable t ))
