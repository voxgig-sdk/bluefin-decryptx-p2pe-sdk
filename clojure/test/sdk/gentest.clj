;; BluefinDecryptxP2pe SDK generated API tests.
(ns sdk.gentest
  (:require [sdk.api :as api]
            [sdk.config :as config]
            [sdk.testutil :as t]
            [clojure.string]
            [voxgig.struct :as vs]
            [sdk.entity.attestation :as e-attestation]
            [sdk.entity.client :as e-client]
            [sdk.entity.create_result :as e-create_result]
            [sdk.entity.decryption :as e-decryption]
            [sdk.entity.device :as e-device]
            [sdk.entity.device_build :as e-device_build]
            [sdk.entity.device_custody_detail :as e-device_custody_detail]
            [sdk.entity.device_custody_list_item :as e-device_custody_list_item]
            [sdk.entity.device_receive_result :as e-device_receive_result]
            [sdk.entity.device_rki_activate_result :as e-device_rki_activate_result]
            [sdk.entity.device_state :as e-device_state]
            [sdk.entity.device_type :as e-device_type]
            [sdk.entity.inject_key :as e-inject_key]
            [sdk.entity.kif :as e-kif]
            [sdk.entity.location :as e-location]
            [sdk.entity.partner :as e-partner]
            [sdk.entity.shipment :as e-shipment]
            [sdk.entity.success :as e-success]
            [sdk.entity.transaction :as e-transaction]
            [sdk.entity.update_result :as e-update_result]
            [sdk.entity.user :as e-user]
            [sdk.entity.virtual_device :as e-virtual_device]))

(defn run [rec]
  (t/run-check rec "gen-exists-attestation"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/attestation sdk nil)) "attestation accessor present"))))
  (t/run-check rec "gen-smoke-attestation"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/attestation sdk nil)]
             (let [res (e-attestation/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-attestation/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-attestation"
    (fn [] (let [seed (vs/jm "attestation" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-attestation/list (api/attestation (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-attestation"
    (fn [] (let [seed (vs/jm "attestation" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-attestation/stream (api/attestation sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-attestation/stream (api/attestation sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-attestation/stream (api/attestation ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-attestation/stream (api/attestation csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-attestation"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-attestation/stream (api/attestation (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-attestation/stream (api/attestation (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-attestation/stream (api/attestation denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-attestation"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-attestation/stream (api/attestation (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-attestation"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "attestation hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/attestation (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-attestation/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-attestation/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-attestation"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-attestation/list (api/attestation client nil) (vs/jm "client" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-client"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/client sdk nil)) "client accessor present"))))
  (t/run-check rec "gen-smoke-client"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/client sdk nil)]
             (let [res (e-client/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-client/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-client"
    (fn [] (let [seed (vs/jm "client" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-client/list (api/client (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-client"
    (fn [] (let [seed (vs/jm "client" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-client/stream (api/client sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-client/stream (api/client sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-client/stream (api/client ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-client/stream (api/client csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-client"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-client/stream (api/client (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-client/stream (api/client (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-client/stream (api/client denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-client"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-client/stream (api/client (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-client"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "client hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/client (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-client/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-client/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-client"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-client/list (api/client client nil) (vs/jm "partner" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-create_result"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/create_result sdk nil)) "create_result accessor present"))))
  (t/run-check rec "gen-validate-create_result"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-create_result/create (api/create_result client nil) (vs/jm "device_type" 1 "serial_number" "x" "custodian" "x" "location" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-decryption"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/decryption sdk nil)) "decryption accessor present"))))
  (t/run-check rec "gen-smoke-decryption"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/decryption sdk nil)]
             (let [res (e-decryption/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-decryption"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-decryption/create (api/decryption client nil) (vs/jm "cbcVector" 1 "deviceType" "x" "encrypted" "x" "serialNumber" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device sdk nil)) "device accessor present"))))
  (t/run-check rec "gen-smoke-device"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/device sdk nil)]
             (let [res (e-device/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-device/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-device"
    (fn [] (let [seed (vs/jm "device" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-device/list (api/device (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-device"
    (fn [] (let [seed (vs/jm "device" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-device/stream (api/device sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-device/stream (api/device sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-device/stream (api/device ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-device/stream (api/device csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-device"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-device/stream (api/device (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-device/stream (api/device (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-device/stream (api/device denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-device"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-device/stream (api/device (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-device"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "device hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/device (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-device/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-device/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-device"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device/list (api/device client nil) (vs/jm "client" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device_build"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device_build sdk nil)) "device_build accessor present"))))
  (t/run-check rec "gen-smoke-device_build"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/device_build sdk nil)]
             (let [items (e-device_build/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-device_build"
    (fn [] (let [seed (vs/jm "device_build" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-device_build/list (api/device_build (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-device_build"
    (fn [] (let [seed (vs/jm "device_build" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-device_build/stream (api/device_build sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-device_build/stream (api/device_build sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-device_build/stream (api/device_build ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-device_build/stream (api/device_build csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-device_build"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-device_build/stream (api/device_build (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-device_build/stream (api/device_build (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-device_build/stream (api/device_build denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-device_build"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-device_build/stream (api/device_build (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-device_build"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "device_build hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/device_build (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-device_build/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-device_build/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-device_build"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device_build/list (api/device_build client nil) (vs/jm "device_type" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device_custody_detail"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device_custody_detail sdk nil)) "device_custody_detail accessor present"))))
  (t/run-check rec "gen-validate-device_custody_detail"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device_custody_detail/load (api/device_custody_detail client nil) (vs/jm "device_type" 1 "id" "x" "serial_number" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device_custody_list_item"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device_custody_list_item sdk nil)) "device_custody_list_item accessor present"))))
  (t/run-check rec "gen-validate-device_custody_list_item"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device_custody_list_item/list (api/device_custody_list_item client nil) (vs/jm "device_type" 1 "serial_number" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device_receive_result"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device_receive_result sdk nil)) "device_receive_result accessor present"))))
  (t/run-check rec "gen-smoke-device_receive_result"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/device_receive_result sdk nil)]
             (let [res (e-device_receive_result/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-device_receive_result"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device_receive_result/create (api/device_receive_result client nil) (vs/jm "serialNumber" 1 "success" true "tamperLabel" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device_rki_activate_result"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device_rki_activate_result sdk nil)) "device_rki_activate_result accessor present"))))
  (t/run-check rec "gen-smoke-device_rki_activate_result"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/device_rki_activate_result sdk nil)]
             (let [res (e-device_rki_activate_result/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-device_rki_activate_result"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device_rki_activate_result/create (api/device_rki_activate_result client nil) (vs/jm "appVersion" 1 "serialNumber" "x" "success" true) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device_state"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device_state sdk nil)) "device_state accessor present"))))
  (t/run-check rec "gen-smoke-device_state"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/device_state sdk nil)]
             (let [items (e-device_state/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-device_state"
    (fn [] (let [seed (vs/jm "device_state" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-device_state/list (api/device_state (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-device_state"
    (fn [] (let [seed (vs/jm "device_state" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-device_state/stream (api/device_state sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-device_state/stream (api/device_state sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-device_state/stream (api/device_state ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-device_state/stream (api/device_state csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-device_state"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-device_state/stream (api/device_state (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-device_state/stream (api/device_state (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-device_state/stream (api/device_state denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-device_state"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-device_state/stream (api/device_state (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-device_state"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "device_state hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/device_state (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-device_state/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-device_state/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-device_state"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device_state/list (api/device_state client nil) (vs/jm "id" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-device_type"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/device_type sdk nil)) "device_type accessor present"))))
  (t/run-check rec "gen-smoke-device_type"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/device_type sdk nil)]
             (let [items (e-device_type/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-device_type"
    (fn [] (let [seed (vs/jm "device_type" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-device_type/list (api/device_type (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-device_type"
    (fn [] (let [seed (vs/jm "device_type" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-device_type/stream (api/device_type sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-device_type/stream (api/device_type sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-device_type/stream (api/device_type ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-device_type/stream (api/device_type csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-device_type"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-device_type/stream (api/device_type (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-device_type/stream (api/device_type (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-device_type/stream (api/device_type denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-device_type"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-device_type/stream (api/device_type (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-device_type"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "device_type hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/device_type (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-device_type/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-device_type/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-device_type"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-device_type/list (api/device_type client nil) (vs/jm "created" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-inject_key"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/inject_key sdk nil)) "inject_key accessor present"))))
  (t/run-check rec "gen-smoke-inject_key"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/inject_key sdk nil)]
             (let [items (e-inject_key/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-inject_key"
    (fn [] (let [seed (vs/jm "inject_key" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-inject_key/list (api/inject_key (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-inject_key"
    (fn [] (let [seed (vs/jm "inject_key" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-inject_key/stream (api/inject_key sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-inject_key/stream (api/inject_key sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-inject_key/stream (api/inject_key ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-inject_key/stream (api/inject_key csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-inject_key"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-inject_key/stream (api/inject_key (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-inject_key/stream (api/inject_key (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-inject_key/stream (api/inject_key denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-inject_key"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-inject_key/stream (api/inject_key (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-inject_key"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "inject_key hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/inject_key (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-inject_key/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-inject_key/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-inject_key"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-inject_key/list (api/inject_key client nil) (vs/jm "created" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-kif"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/kif sdk nil)) "kif accessor present"))))
  (t/run-check rec "gen-smoke-kif"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/kif sdk nil)]
             (let [items (e-kif/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-kif"
    (fn [] (let [seed (vs/jm "kif" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-kif/list (api/kif (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-kif"
    (fn [] (let [seed (vs/jm "kif" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-kif/stream (api/kif sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-kif/stream (api/kif sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-kif/stream (api/kif ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-kif/stream (api/kif csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-kif"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-kif/stream (api/kif (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-kif/stream (api/kif (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-kif/stream (api/kif denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-kif"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-kif/stream (api/kif (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-kif"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "kif hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/kif (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-kif/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-kif/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-kif"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-kif/list (api/kif client nil) (vs/jm "id" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-location"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/location sdk nil)) "location accessor present"))))
  (t/run-check rec "gen-smoke-location"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/location sdk nil)]
             (let [res (e-location/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-location/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-location"
    (fn [] (let [seed (vs/jm "location" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-location/list (api/location (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-location"
    (fn [] (let [seed (vs/jm "location" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-location/stream (api/location sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-location/stream (api/location sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-location/stream (api/location ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-location/stream (api/location csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-location"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-location/stream (api/location (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-location/stream (api/location (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-location/stream (api/location denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-location"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-location/stream (api/location (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-location"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "location hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/location (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-location/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-location/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-location"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-location/list (api/location client nil) (vs/jm "client" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-partner"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/partner sdk nil)) "partner accessor present"))))
  (t/run-check rec "gen-smoke-partner"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/partner sdk nil)]
             (let [res (e-partner/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-partner/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-partner"
    (fn [] (let [seed (vs/jm "partner" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-partner/list (api/partner (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-partner"
    (fn [] (let [seed (vs/jm "partner" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-partner/stream (api/partner sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-partner/stream (api/partner sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-partner/stream (api/partner ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-partner/stream (api/partner csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-partner"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-partner/stream (api/partner (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-partner/stream (api/partner (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-partner/stream (api/partner denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-partner"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-partner/stream (api/partner (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-partner"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "partner hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/partner (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-partner/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-partner/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-partner"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-partner/list (api/partner client nil) (vs/jm "partner" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-shipment"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/shipment sdk nil)) "shipment accessor present"))))
  (t/run-check rec "gen-smoke-shipment"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/shipment sdk nil)]
             (let [res (e-shipment/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-shipment/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-shipment"
    (fn [] (let [seed (vs/jm "shipment" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-shipment/list (api/shipment (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-shipment"
    (fn [] (let [seed (vs/jm "shipment" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-shipment/stream (api/shipment sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-shipment/stream (api/shipment sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-shipment/stream (api/shipment ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-shipment/stream (api/shipment csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-shipment"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-shipment/stream (api/shipment (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-shipment/stream (api/shipment (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-shipment/stream (api/shipment denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-shipment"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-shipment/stream (api/shipment (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-shipment"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "shipment hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/shipment (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-shipment/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-shipment/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-shipment"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-shipment/list (api/shipment client nil) (vs/jm "kif" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-success"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/success sdk nil)) "success accessor present"))))
  (t/run-check rec "gen-validate-success"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-success/create (api/success client nil) (vs/jm "share_partner_to" 1 "devices" "x" "sharePartnerFrom" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-transaction"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/transaction sdk nil)) "transaction accessor present"))))
  (t/run-check rec "gen-smoke-transaction"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/transaction sdk nil)]
             (let [res (e-transaction/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-transaction/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-transaction"
    (fn [] (let [seed (vs/jm "transaction" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-transaction/list (api/transaction (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-transaction"
    (fn [] (let [seed (vs/jm "transaction" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-transaction/stream (api/transaction sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-transaction/stream (api/transaction sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-transaction/stream (api/transaction ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-transaction/stream (api/transaction csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-transaction"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-transaction/stream (api/transaction (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-transaction/stream (api/transaction (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-transaction/stream (api/transaction denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-transaction"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-transaction/stream (api/transaction (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-transaction"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "transaction hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/transaction (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-transaction/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-transaction/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-transaction"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-transaction/list (api/transaction client nil) (vs/jm "client" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-update_result"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/update_result sdk nil)) "update_result accessor present"))))
  (t/run-check rec "gen-smoke-update_result"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/update_result sdk nil)]
             (let [res (e-update_result/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             (let [items (e-update_result/list ent (vs/jm) nil)]
               ;; list resolves to one entity per record.
               (t/is-true (sequential? items) "list returns a sequential collection"))
             )))
  (t/run-check rec "gen-list-update_result"
    (fn [] (let [seed (vs/jm "update_result" (vs/jm "L1" (vs/jm "id" "L1" "name" "a")
                                                "L2" (vs/jm "id" "L2" "name" "b")))
                 items (e-update_result/list (api/update_result (api/test-sdk (vs/jm "entity" seed) nil) nil)
                                         (vs/jm) nil)]
             ;; list resolves to one entity per record; data-get reads the record.
             (t/is-eq (count items) 2 "list answers each seeded record")
             (t/is-true (every? (fn [item] (and (map? item) (vs/ismap ((:data-get item))))) items)
                        "each listed item is an entity carrying its record"))))
  (t/run-check rec "gen-stream-update_result"
    (fn [] (let [seed (vs/jm "update_result" (vs/jm "S1" (vs/jm "id" "S1" "name" "a")
                                                "S2" (vs/jm "id" "S2" "name" "b")
                                                "S3" (vs/jm "id" "S3" "name" "c")))]
             ;; Fallback (no streaming feature): materialised items.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   items (vec (e-update_result/stream (api/update_result sdk nil) "list" (vs/jm) nil))]
               (t/is-eq (count items) 3 "stream fallback yields materialised items")
               (t/is-true (vs/ismap (first items)) "stream yields bare record maps"))
             ;; signal cancels iteration between yields.
             (let [sdk (api/test-sdk (vs/jm "entity" seed) nil)
                   n (atom 0) sig (fn [] (>= (swap! n inc) 2))
                   items (vec (e-update_result/stream (api/update_result sdk nil) "list" (vs/jm) (vs/jm "signal" sig)))]
               (t/is-eq (count items) 1 "stream signal stops after first yield"))
             ;; Streaming feature active: yields from the streaming iterator.
             (when (vs/getpath (config/make-config) "feature.streaming")
               (let [ssdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true))))]
                 (t/is-eq (count (vec (e-update_result/stream (api/update_result ssdk nil) "list" (vs/jm) nil))) 3
                          "stream (streaming active) yields all items"))
               (let [csdk (api/test-sdk (vs/jm "entity" seed) (vs/jm "feature" (vs/jm "streaming" (vs/jm "active" true "chunkSize" 2))))
                     batches (vec (e-update_result/stream (api/update_result csdk nil) "list" (vs/jm) nil))]
                 (t/is-eq (count batches) 2 "stream chunkSize groups items into 2 batches"))))))
  (t/run-check rec "gen-stream-error-update_result"
    (fn [] (let [offline (vs/jm "net" (vs/jm "offline" true))
                 err (try (vec (e-update_result/stream (api/update_result (api/test-sdk offline nil) nil) "list" (vs/jm) nil)) nil
                          (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "offline"))
                        "the transport failure raises from the stream")
             (t/is-eq (count (vec (e-update_result/stream (api/update_result (api/test-sdk offline nil) nil) "list" (vs/jm)
                                                 (vs/jm "ctrl" (vs/jm "throw" false)))))
                      0 "throw false ends the stream quietly")
             (when (vs/getpath (config/make-config) "feature.rbac")
               (let [denied (api/test-sdk nil (vs/jm "feature" (vs/jm "rbac" (vs/jm "active" true "deny" true))))]
                 (t/is-throws (fn [] (vec (e-update_result/stream (api/update_result denied nil) "list" (vs/jm) nil)))
                              "rbac_denied" "the rbac denial raises from the stream"))))))
  (t/run-check rec "gen-stream-ctrl-update_result"
    (fn [] (let [explain (vs/jm)
                 ctrl (vs/jm "explain" explain)]
             (vec (e-update_result/stream (api/update_result (api/test-sdk nil nil) nil) "list" (vs/jm) (vs/jm "ctrl" ctrl)))
             (t/is-eq (vec (vs/keysof ctrl)) ["explain"] "the stream changed the caller's ctrl")
             (t/is-true (identical? explain (vs/getprop ctrl "explain")) "the caller's explain record is not its own")
             (t/is-true (pos? (count (vs/keysof explain))) "the caller's explain record was not filled"))))
  (t/run-check rec "gen-unexpected-update_result"
    (fn [] (let [seen (atom 0)
                 hook (atom {:name "failhook" :active true :version "0.0.1" :_options nil
                             "init" (fn [_ctx _opts] nil)
                             "PreSpec" (fn [_ctx] (throw (RuntimeException. "update_result hook failed")))
                             "PreUnexpected" (fn [_ctx] (swap! seen inc))})
                 ent (api/update_result (api/make-sdk (vs/jm "feature" (vs/jm "test" (vs/jm "active" true)) "extend" [hook])) nil)
                 err (try (e-update_result/list ent (vs/jm) nil) nil (catch Throwable e e))]
             (t/is-true (and (some? err) (.contains (str (.getMessage ^Throwable err)) "hook failed"))
                        "the hook's failure is raised")
             (t/is-true (pos? @seen) "PreUnexpected did not fire")
             (let [fired @seen]
               (t/is-nil (e-update_result/list ent (vs/jm) (vs/jm "throw" false)) "throw false should resolve to nothing")
               (t/is-true (> @seen fired) "PreUnexpected did not fire under throw false")))))
  (t/run-check rec "gen-validate-update_result"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-update_result/list (api/update_result client nil) (vs/jm "client" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-user"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/user sdk nil)) "user accessor present"))))
  (t/run-check rec "gen-validate-user"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-user/load (api/user client nil) (vs/jm "id" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-virtual_device"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/virtual_device sdk nil)) "virtual_device accessor present"))))
  (t/run-check rec "gen-validate-virtual_device"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-virtual_device/load (api/virtual_device client nil) (vs/jm "id" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-prepare-attestation"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/attestation" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-attestation"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/attestation" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-client"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/client" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-client"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/client" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-device"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/device" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-device"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/device" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-device_build"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/device_build" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-device_build"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/device_build" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-device_custody_detail"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/device_custody_detail" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-device_custody_detail"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/device_custody_detail" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-device_custody_list_item"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/device_custody_list_item" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-device_custody_list_item"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/device_custody_list_item" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-device_state"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/device_state" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-device_state"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/device_state" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-device_type"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/device_type" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-device_type"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/device_type" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-inject_key"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/inject_key" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-inject_key"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/inject_key" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-kif"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/kif" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-kif"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/kif" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-location"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/location" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-location"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/location" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-partner"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/partner" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-partner"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/partner" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-shipment"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/shipment" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-shipment"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/shipment" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-transaction"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/transaction" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-transaction"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/transaction" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-update_result"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/update_result" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-update_result"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/update_result" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-user"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/user" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-user"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/user" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-virtual_device"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/virtual_device" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-virtual_device"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test" "apikey" "test-key"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/virtual_device" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (letfn [(fence-pat [] (re-pattern (apply str (repeat 3 (char 96)))))
          (fence-count [text] (count (re-seq (fence-pat) text)))
          (clj-blocks [text]
            (let [parts (clojure.string/split text (fence-pat))]
              (->> parts
                   (map-indexed vector)
                   (filter (fn [[i _]] (odd? i)))
                   (map (fn [[_ seg]] seg))
                   (filter (fn [seg]
                             (= "clojure"
                                (clojure.string/trim (first (clojure.string/split-lines seg))))))
                   (map (fn [seg]
                          (clojure.string/join "\n"
                            (rest (clojure.string/split-lines seg))))))))]
    (doseq [[label path] [["root-README" "../README.md"]
                          ["README" "README.md"]
                          ["REFERENCE" "REFERENCE.md"]]]
      (t/run-check rec (str "gen-readme-examples-" label)
        (fn []
          (if-not (.exists (java.io.File. ^String path))
            (t/is-true true (str label " absent (skipped)"))
            (let [text (slurp path)]
              ;; A code fence opened but never closed leaves an ODD number of
              ;; fence markers; the split-on-fence then captures the trailing
              ;; prose (everything after the last opener) as if it were a
              ;; clojure block, which can parse cleanly and pass silently. Fail
              ;; on the malformed doc instead. (Count markers directly rather
              ;; than split parts: split drops trailing empty segments, so a
              ;; closing fence at EOF would be miscounted.)
              (t/is-true (even? (fence-count text))
                         (str label " code fences balanced (no unclosed fence)"))
              (let [blocks (clj-blocks text)]
                (doseq [b blocks]
                  (binding [*read-eval* false]
                    (read-string (str "[\n" b "\n]"))))
                (t/is-true true (str label " clojure blocks parse cleanly")))))))))
  nil)
