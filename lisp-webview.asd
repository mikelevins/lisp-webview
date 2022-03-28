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
                :components ((:file "package")))))


