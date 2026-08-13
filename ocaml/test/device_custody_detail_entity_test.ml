(* Generated device_custody_detail entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "device_custody_detail.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.device_custody_detail client Noval in
      check_str "name" ent.e_name "device_custody_detail")

let () =
  test "device_custody_detail.seeded_ops" (fun () ->
      let record = jo [("id", Str "device_custody_detail01")] in
      let seed = jo [("device_custody_detail",
                      jo [("device_custody_detail01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.device_custody_detail client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "device_custody_detail01")]) Noval in
      let loaded_data = loaded.e_data_get () in
      check "load data is a map" (ismap loaded_data);
      check_vstr "load id" (getp loaded_data "id") "device_custody_detail01";
      ())
