(ql:quickload :swank)
(swank:create-server :port 10101  :dont-close t :coding-system "utf-8-unix")
(format t "~%swank loaded")
