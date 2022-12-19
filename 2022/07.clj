(require '[clojure.string :as s])

(defn merge-add
  [size dirs prefix]
  (assoc dirs prefix (+ size (get dirs prefix 0))))

(defn parse-line
  [[cwd dirs] line]
  (let [size (re-find #"^\d+" line)]
    (cond
           (= line "$ cd ..") [(butlast cwd) dirs]
           (s/starts-with? line "$ cd") [(concat cwd [(subs line 5)]) dirs]
           size (let [size-int (Integer/parseInt size)
                      prefixes (->> cwd (reductions #(conj %1 %2) []) rest)
                      new-dirs (reduce (partial merge-add size-int) dirs prefixes)]
                  [cwd new-dirs])
           :else [cwd dirs])))

(defn sizes
  [file]
  (with-open [rdr (clojure.java.io/reader file)]
    (last (reduce parse-line [[] {}] (line-seq rdr)))))

(let [input (sizes "07.dat")]
  (->> input
       vals
       (filter #(<= %1 100000))
       (reduce +)
       println)
  (let [needed (- 30000000 (- 70000000 (get input ["/"])))]
    (->> input
         vals
         (filter #(>= %1 needed))
         (apply min)
         println)))
