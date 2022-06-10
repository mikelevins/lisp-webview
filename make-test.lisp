;;;; lisp-webview.asd

(in-package :cl-user)

(defparameter +swank-port+ 10101)

;;; ---------------------------------------------------------------------
;;; toplevel test-window reference
;;; ---------------------------------------------------------------------

(defparameter *testwin* nil)

;;; ---------------------------------------------------------------------
;;; basic test function
;;; ---------------------------------------------------------------------

(defun test-webview ()
  (format t "~% lisp-webview v~A.~A.~A"
          (webview::major-version)
          (webview::minor-version)
          (webview::patch-version))
  (let* ((w (webview::wv-create 1 (cffi:null-pointer))))
    (setf *testwin* w)
    (webview::wv-set-title w "Webview Test")
    (webview::wv-set-size w 1280 1020 0)
    (webview::wv-navigate w "https://www.google.com")
    (webview::wv-run w)
    ;;(webview::wv-destroy w)
    ))

#+nil (webview::wv-set-title *testwin* "Some random title")
#+nil (webview::wv-destroy *testwin*)

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
                                 (declare (ignore ignore))
                                 (format t "~%test started")
                                 (test-webview)
                                 (format t "~%test ended~%"))
                     :executable t
                     :application-type :console))

;;; with swank server
;;; ---------------------------------------------------------------------

#+win32
(defun make-test ()
  (ql:quickload :swank)
  (asdf:load-system :lisp-webview)
  (save-lisp-and-die "test-lisp-webview.exe"
                     :toplevel (lambda (&rest ignore)
                                 (declare (ignore ignore))
                                 (funcall (intern "CREATE-SERVER" (find-package :swank))
                                          :port +swank-port+ :dont-close nil)
                                 (format t "~%test started~%")
                                 (test-webview)
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
                                 (declare (ignore ignore))
                                 (format t "~%test started~%")
                                 (test-webview)
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
                                 (declare (ignore ignore))
                                 (funcall (intern "CREATE-SERVER" (find-package :swank))
                                          :port +swank-port+ :dont-close t :style :spawn)
                                 (format t "~%test started~%")
                                 (test-webview)
                                 (format t "~%test ended~%"))
                     :executable t ))
