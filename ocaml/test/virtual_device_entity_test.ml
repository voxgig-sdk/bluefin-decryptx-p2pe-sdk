(* Generated virtual_device entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "virtual_device.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.virtual_device client Noval in
      check_str "name" ent.e_name "virtual_device")

let () =
  test "virtual_device.seeded_ops" (fun () ->
      let record = jo [("id", Str "virtual_device01")] in
      let seed = jo [("virtual_device",
                      jo [("virtual_device01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.virtual_device client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "virtual_device01")]) Noval in
      let loaded_data = loaded.e_data_get () in
      check "load data is a map" (ismap loaded_data);
      check_vstr "load id" (getp loaded_data "id") "virtual_device01";
      ())

let () =
  test "virtual_device.validate" (fun () ->
      if Harness.has_feature "validate" then begin
        let client = Sdk_client.test_with Noval
            (jo [("feature", jo [("validate", jo [("active", Bool true)])])]) in
        let ent = Sdk_client.virtual_device client Noval in
        let err = (try ignore (ent.e_load (jo [("id", Num 1.)]) Noval); None with e -> Some e) in
        check_str "validate refuses an invalid request"
          (match err with Some (Sdk_error_exc er) -> er.err_code | _ -> "<no SDK error>") "validate_failed"
      end)
