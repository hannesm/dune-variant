# dune-variant issue

Reproduction requires a few packages:
- ocaml (4.14.2 - it's not working with 5 right now)
- dune (3.15.2 - should not matter)
- ocaml-solo5 (0.8.4 - but should not matter)

So, opam sw create 4.14.2 dune-variant-repro ; eval `opam env` ; opam install ocaml-solo5 dune

## Run the build

```
$ dune bu dist
File "duniverse/mirage-time/unix/dune", line 5, characters 12-20:
5 |  (libraries lwt.unix duration))
                ^^^^^^^^
Error: Library "lwt.unix" not found.
-> required by library "mirage-time.unix" in
   _build/solo5/duniverse/mirage-time/unix
-> required by library "mirage-bootvar.solo5" in
   _build/solo5/duniverse/mirage-bootvar/solo5
-> required by executable main in dune.build:11
-> required by _build/solo5/main.exe
-> required by _build/solo5/hello.hvt
-> required by _build/solo5/dist/hello.hvt
-> required by alias dist/all (context solo5)
-> required by alias dist/default (context solo5)
```

Change proposed by Rudi in https://github.com/ocaml/dune/issues/10460#issuecomment-2096281994 doesn't result in different behaviour.

## Dirty fix

Change in `duniverse/mirage-time/src/dune` the
`(default_implementation mirage-time.unix)` to
`(default_implementation mirage-time.solo5)`.

