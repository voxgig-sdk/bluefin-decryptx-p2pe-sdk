(* Generated device_receive_result entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "device_receive_result.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.device_receive_result client Noval in
      check_str "name" ent.e_name "device_receive_result")
