# dune-variant issue

Reproduction requires a few packages:
- ocaml (4.14.2 - it's not working with 5 right now)
- dune (3.15.2 - should not matter)
- ocaml-solo5 (0.8.4 - but should not matter)

So, opam sw create 4.14.2 dune-variant-repro ; eval `opam env` ; opam install ocaml-solo5 dune

I suspect the ocaml-solo5 is needed for the findlib.conf.

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

## Remove default_implementation from duniverse/mirage-time/src/dune

There's a different error:

```
Error: No implementation found for virtual library "mirage-time" in
_build/solo5/duniverse/mirage-time/src.
-> required by library "mirage-solo5" in
   _build/solo5/duniverse/mirage-solo5/lib
-> required by library "mirage-bootvar.solo5" in
   _build/solo5/duniverse/mirage-bootvar/solo5
-> required by executable main in dune.build:11
-> required by _build/solo5/main.exe
-> required by _build/solo5/hello.hvt
-> required by _build/solo5/dist/hello.hvt
-> required by alias dist/all (context solo5)
-> required by alias dist/default (context solo5)
```

## Dirty fix

Change in `duniverse/mirage-time/src/dune` the
`(default_implementation mirage-time.unix)` to
`(default_implementation mirage-time.solo5)`.

## Dependencies

In dune.build, the dependencies include: mirage-bootvar.solo5, mirage-time.solo5

Both are implementations of the virtual_modules (mirage-bootvar, mirage-time).

The package mirage-solo5 depends on mirage-time; the package mirage-bootvar
depends on mirage-solo5.

It looks like during building mirage-bootvar.solo5 the specification of the
implementation of mirage-time is not taken into consideration.
