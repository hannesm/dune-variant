open Lwt.Infix
type 'a io = 'a Lwt.t
let return = Lwt.return
let run t = Solo5_os.Main.run t ; exit
0

let mirage_runtime_delay__key = Mirage_runtime.register @@
# 33 "lib/devices/runtime_arg.ml"
  Mirage_runtime.delay
;;

let mirage_runtime_backtrace__key = Mirage_runtime.register @@
# 34 "lib/devices/runtime_arg.ml"
  Mirage_runtime.backtrace
;;

let mirage_runtime_randomize_hashtables__key = Mirage_runtime.register @@
# 35 "lib/devices/runtime_arg.ml"
  Mirage_runtime.randomize_hashtables
;;

let mirage_runtime_allocation_policy__key = Mirage_runtime.register @@
# 36 "lib/devices/runtime_arg.ml"
  Mirage_runtime.allocation_policy
;;

let mirage_runtime_minor_heap_size__key = Mirage_runtime.register @@
# 37 "lib/devices/runtime_arg.ml"
  Mirage_runtime.minor_heap_size
;;

let mirage_runtime_major_heap_increment__key = Mirage_runtime.register @@
# 38 "lib/devices/runtime_arg.ml"
  Mirage_runtime.major_heap_increment
;;

let mirage_runtime_space_overhead__key = Mirage_runtime.register @@
# 39 "lib/devices/runtime_arg.ml"
  Mirage_runtime.space_overhead
;;

let mirage_runtime_max_space_overhead__key = Mirage_runtime.register @@
# 40 "lib/devices/runtime_arg.ml"
  Mirage_runtime.max_space_overhead
;;

let mirage_runtime_gc_verbosity__key = Mirage_runtime.register @@
# 41 "lib/devices/runtime_arg.ml"
  Mirage_runtime.gc_verbosity
;;

let mirage_runtime_gc_window_size__key = Mirage_runtime.register @@
# 42 "lib/devices/runtime_arg.ml"
  Mirage_runtime.gc_window_size
;;

let mirage_runtime_custom_major_ratio__key = Mirage_runtime.register @@
# 43 "lib/devices/runtime_arg.ml"
  Mirage_runtime.custom_major_ratio
;;

let mirage_runtime_custom_minor_ratio__key = Mirage_runtime.register @@
# 44 "lib/devices/runtime_arg.ml"
  Mirage_runtime.custom_minor_ratio
;;

let mirage_runtime_custom_minor_max_size__key = Mirage_runtime.register @@
# 45 "lib/devices/runtime_arg.ml"
  Mirage_runtime.custom_minor_max_size
;;

let mirage_bootvar__1 = lazy (
# 15 "lib/devices/argv.ml"
  return (Mirage_bootvar.argv ())
);;
# 77 "mirage/main.ml"

let struct_end__2 = lazy (
  let __mirage_bootvar__1 = Lazy.force mirage_bootvar__1 in
  __mirage_bootvar__1 >>= fun _mirage_bootvar__1 ->
# 47 "lib/functoria/job.ml"
  return Mirage_runtime.(with_argv (runtime_args ()) "hello" _mirage_bootvar__1)
);;
# 85 "mirage/main.ml"

let printexc__3 = lazy (
  let _mirage_runtime_backtrace = (mirage_runtime_backtrace__key ()) in
# 390 "lib/mirage.ml"
  return (Printexc.record_backtrace _mirage_runtime_backtrace)
);;
# 92 "mirage/main.ml"

let hashtbl__4 = lazy (
  let _mirage_runtime_randomize_hashtables = (mirage_runtime_randomize_hashtables__key ()) in
# 399 "lib/mirage.ml"
  return (if _mirage_runtime_randomize_hashtables then Hashtbl.randomize ())
);;
# 99 "mirage/main.ml"

let gc__5 = lazy (
  let _mirage_runtime_allocation_policy = (mirage_runtime_allocation_policy__key ()) in
  let _mirage_runtime_minor_heap_size = (mirage_runtime_minor_heap_size__key ()) in
  let _mirage_runtime_major_heap_increment = (mirage_runtime_major_heap_increment__key ()) in
  let _mirage_runtime_space_overhead = (mirage_runtime_space_overhead__key ()) in
  let _mirage_runtime_max_space_overhead = (mirage_runtime_max_space_overhead__key ()) in
  let _mirage_runtime_gc_verbosity = (mirage_runtime_gc_verbosity__key ()) in
  let _mirage_runtime_gc_window_size = (mirage_runtime_gc_window_size__key ()) in
  let _mirage_runtime_custom_major_ratio = (mirage_runtime_custom_major_ratio__key ()) in
  let _mirage_runtime_custom_minor_ratio = (mirage_runtime_custom_minor_ratio__key ()) in
  let _mirage_runtime_custom_minor_max_size = (mirage_runtime_custom_minor_max_size__key ()) in
# 451 "lib/mirage.ml"
  return (
let open Gc in
  let ctrl = get () in
  set ({ ctrl with allocation_policy = (match _mirage_runtime_allocation_policy with `Next_fit -> 0 | `First_fit -> 1 | `Best_fit -> 2);
  minor_heap_size = (match _mirage_runtime_minor_heap_size with None -> ctrl.minor_heap_size | Some x -> x);
  major_heap_increment = (match _mirage_runtime_major_heap_increment with None -> ctrl.major_heap_increment | Some x -> x);
  space_overhead = (match _mirage_runtime_space_overhead with None -> ctrl.space_overhead | Some x -> x);
  max_overhead = (match _mirage_runtime_max_space_overhead with None -> ctrl.max_overhead | Some x -> x);
  verbose = (match _mirage_runtime_gc_verbosity with None -> ctrl.verbose | Some x -> x);
  window_size = (match _mirage_runtime_gc_window_size with None -> ctrl.window_size | Some x -> x);
  custom_major_ratio = (match _mirage_runtime_custom_major_ratio with None -> ctrl.custom_major_ratio | Some x -> x);
  custom_minor_ratio = (match _mirage_runtime_custom_minor_ratio with None -> ctrl.custom_minor_ratio | Some x -> x);
  custom_minor_max_size = (match _mirage_runtime_custom_minor_max_size with None -> ctrl.custom_minor_max_size | Some x -> x) })
)
);;
# 128 "mirage/main.ml"

let mirage_time__6 = lazy (
  return ()
);;
# 133 "mirage/main.ml"

let mirage_runtime__7 = lazy (
  let __mirage_time__6 = Lazy.force mirage_time__6 in
  __mirage_time__6 >>= fun _mirage_time__6 ->
  let _mirage_runtime_delay = (mirage_runtime_delay__key ()) in
# 294 "lib/mirage.ml"
  Mirage_time.sleep_ns (Duration.of_sec _mirage_runtime_delay)
);;
# 142 "mirage/main.ml"

let unikernel__8 = lazy (
  let __mirage_time__6 = Lazy.force mirage_time__6 in
  __mirage_time__6 >>= fun _mirage_time__6 ->
  (Unikernel.start _mirage_time__6 : unit io)
);;
# 149 "mirage/main.ml"

let mirage_runtime__9 = lazy (
  let __struct_end__2 = Lazy.force struct_end__2 in
  let __printexc__3 = Lazy.force printexc__3 in
  let __hashtbl__4 = Lazy.force hashtbl__4 in
  let __gc__5 = Lazy.force gc__5 in
  let __mirage_runtime__7 = Lazy.force mirage_runtime__7 in
  let __unikernel__8 = Lazy.force unikernel__8 in
  __struct_end__2 >>= fun _struct_end__2 ->
  __printexc__3 >>= fun _printexc__3 ->
  __hashtbl__4 >>= fun _hashtbl__4 ->
  __gc__5 >>= fun _gc__5 ->
  __mirage_runtime__7 >>= fun _mirage_runtime__7 ->
  __unikernel__8 >>= fun _unikernel__8 ->
# 378 "lib/mirage.ml"
  return ()
);;
# 167 "mirage/main.ml"

let () =
  let t = Lazy.force struct_end__2 >>= fun _ ->
  Lazy.force printexc__3 >>= fun _ ->
  Lazy.force hashtbl__4 >>= fun _ ->
  Lazy.force gc__5 >>= fun _ ->
  Lazy.force mirage_runtime__7 >>= fun _ ->
  Lazy.force mirage_runtime__9 in
  run t
;;
