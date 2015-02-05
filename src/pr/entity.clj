(ns pr.entity)

(def template-entity
  {:attributes {;; the primary attributes.
                :primary
                {:strength     {:base 10 :current 7 :effects [{:type :poison
                                                               :level 3
                                                               :duration-left 15}]}
                 :agility      {:base 10 :current 10 :effects []}
                 :constitution {:base 10 :current 10 :effects []}
                 :dexterity    {:base 10 :current 10 :effects []}
                 :memory       {:base 10 :current 10 :effects []}
                 :wisdom       {:base 10 :current 10 :effects []}}

                ;; The derived attributes
                :secondary
                {:health {:max 30 :current 23}
                 :mana {:max 30 :current 22}}}
   :skills {}})

(def player
  {:attributes {;; the primary attributes.
                :primary
                {:strength     {:base 10 :current 10 :effects []}
                 :agility      {:base 10 :current 10 :effects []}
                 :constitution {:base 10 :current 10 :effects []}
                 :dexterity    {:base 10 :current 10 :effects []}
                 :memory       {:base 10 :current 10 :effects []}
                 :wisdom       {:base 10 :current 10 :effects []}}

                ;; The derived attributes
                :secondary
                {:health {:max 30 :current 30}
                 :mana {:max 30 :current 30}}}
   :skills {}
   :prompt "> "})

(defn get-player
  [name]
  (assoc-in player [:name] name))
