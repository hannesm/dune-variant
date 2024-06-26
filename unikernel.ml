open Lwt.Infix

let start _time =
  let rec loop = function
    | 0 -> Lwt.return_unit
    | n ->
      print_endline "hello";
      Mirage_time.sleep_ns (Duration.of_sec 1) >>= fun () -> loop (n - 1)
  in
  loop 4
