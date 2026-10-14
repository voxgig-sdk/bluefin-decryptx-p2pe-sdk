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
  test "device_custody_detail.validate" (fun () ->
      if Harness.has_feature "validate" then begin
        let client = Sdk_client.test_with Noval
            (jo [("feature", jo [("validate", jo [("active", Bool true)])])]) in
        let ent = Sdk_client.device_custody_detail client Noval in
        let err = (try ignore (ent.e_load (jo [("device_type", Num 1.); ("id", Str "x"); ("serial_number", Str "x")]) Noval); None with e -> Some e) in
        check_str "validate refuses an invalid request"
          (match err with Some (Sdk_error_exc er) -> er.err_code | _ -> "<no SDK error>") "validate_failed"
      end)
