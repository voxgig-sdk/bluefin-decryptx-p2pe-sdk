(* Generated user entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "user.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.user client Noval in
      check_str "name" ent.e_name "user")

let () =
  test "user.seeded_ops" (fun () ->
      let record = jo [("id", Str "user01")] in
      let seed = jo [("user",
                      jo [("user01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.user client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "user01")]) Noval in
      check "load is a map" (ismap loaded);
      check_vstr "load id" (getp loaded "id") "user01";
      ())
