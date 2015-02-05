(ns pr.rooms)

(def rooms (ref {}))

(defn load-1 [rooms file]
  (let [room (read-string (slurp (.getAbsolutePath file)))]
    (conj rooms
          {(keyword (.getName file))
           {:name (keyword (.getName file))
            :desc (:desc room)
            :exits (ref (:exits room))
            :items (ref (or (:items room) #{}))
            :inhabitants (ref #{})}})))

(defn load-many
  "Given a dir, return a map with an entry corresponding to each file
  in it. Files should be maps containing room data."
  [rooms dir]
  (dosync
   (reduce load-1 rooms
           (.listFiles (java.io.File. dir)))))

(defn add-from
  "Look through all the files in a dir for files describing rooms and add
  them to the mire.rooms/rooms map."
  [dir]
  (dosync
   (alter rooms load-many dir)))

(defn has?
  [room thing]
  (@(:items room) (keyword thing)))
