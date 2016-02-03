(in-package :cl-fccs)

(ql:quickload '#:clack-handler-mongrel2)
(setf *path-to-charsheet* "/data/Fantasy_Craft_Character_Sheets-v6-Fillable.pdf")
(setf *redis-index* 0)
(setf *prepend-path* "/fccs/")
(setf *clack-args*
      '(
	:server :mongrel2
	:sub-addr "tcp://127.0.0.1:9997"
	:pub-addr "tcp://127.0.0.1:9996"
	:worker-entry db-connect
	:worker-exit redis:disconnect
	:use-thread nil))
