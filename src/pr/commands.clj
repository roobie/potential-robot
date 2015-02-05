(ns pr.commands)

(defn show-stats
  [args]
  (do
    (if (nil? (:var args))
      (:player (:env args))
      ;;:else
      (get-in (:player (:env args))
                   (vec (map keyword (:var args)))))))

(def commands {"stats" show-stats
               ;; "move" move,
               ;; "north" (fn [] (move :north)),
               ;; "south" (fn [] (move :south)),
               ;; "east" (fn [] (move :east)),
               ;; "west" (fn [] (move :west)),
               ;; "grab" grab
               ;; "discard" discard
               ;; "inventory" inventory
               ;; "detect" detect
               ;; "look" look
               ;; "say" say
               ;; "help" help
               })

(defn execute
  "Execute a command that is passed to us."
  [input args1]
  (try (let [[command & args2] (.split input " +")]
         (apply (commands command) [{:env args1 :var args2}]))
       (catch Exception e
         (.printStackTrace e (new java.io.PrintWriter *out*))
         "You can't do that!")))
