(* Generated device_list entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "device_list.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.device_list client Noval in
      check_str "name" ent.e_name "device_list")

let () =
  test "device_list.seeded_ops" (fun () ->
      let record = jo [("id", Str "device_list01")] in
      let seed = jo [("device_list",
                      jo [("device_list01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.device_list client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "device_list01")]) Noval in
      let loaded_data = loaded.e_data_get () in
      check "load data is a map" (ismap loaded_data);
      ())
