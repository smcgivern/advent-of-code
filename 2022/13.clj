(defn packets
  [file]
  (with-open [rdr (clojure.java.io/reader file)]
    (doall
     (remove nil? (map clojure.edn/read-string (line-seq rdr))))))

(defn deep-empty?
  [x]
  (if (coll? x) (or (empty? x) (deep-empty? (first x))) false))

(defn cmp
  [[left right]]
  (cond
    (and (number? left) (number? right)) (when-not (= left right) (< left right))
    (number? left) (cmp [[left] right])
    (number? right) (cmp [left [right]])
    :else (let [result (reduce
                        #(if-not (nil? %1) (reduced %1) (cmp %2))
                        nil
                        (map vector left right))]
            (if-not (nil? result)
              result
              (when-not (and (deep-empty? left) (deep-empty? right)) (apply < (map count [left right])))))))

(let [input (packets "13.dat")
      dividers [[[2]] [[6]]]]
  (->> input
       (partition 2)
       (map-indexed #(vector (inc %1) (cmp %2)))
       (filter last)
       (map first)
       (reduce +)
       println)
  (->> input
       (concat dividers)
       (sort #(if (cmp [%1 %2]) -1 1))
       (map-indexed #(vector (inc %1) ((set dividers) %2)))
       (filter last)
       (map first)
       (reduce *)
       println))
