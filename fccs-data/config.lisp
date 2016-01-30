(in-package :cl-fccs)

(ql:quickload '#:clack-handler-mongrel2)
(setf *path-to-charsheet* "/data/Fantasy_Craft_Character_Sheets-v6-Fillable.pdf")
(setf *redis-index* 0)
(setf *prepend-path* "/fccs/")
(setf *clack-args*
      '(
	:server :mongrel2
	:sub-addr "tcp://localhost:9997"
	:pub-addr "tcp://localhost:9996"
	:worker-entry db-connect
	:worker-exit redis:disconnect
	:use-thread nil))
