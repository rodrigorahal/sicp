;; Assuming constant time O(1) for table lookups, hash table, for instance
;; every call inner call to (memo-fib) will be O(1), since the values will
;; be already computed and saved in the table, so the overall complexity will
;; be O(n).
