# Semantic UI for Reflex-DOM [![Build Status](https://travis-ci.com/tomsmalley/semantic-reflex.svg?branch=master)](https://travis-ci.com/tomsmalley/semantic-reflex)

This library aims to provide a type safe Haskell reimplementation of Semantic UI components, to allow easy construction of nice looking web applications in GHCJS. It started as a fork of the reflex-dom-semui library.

There are no dependencies on upstream JavaScript (either Semantic-UI or jQuery).

Currently only version 2.2 of the Semantic-UI CSS is supported.

## Building

The library uses the `project` implementation of `reflex-platform`.

    $ nix-shell -A shells.ghc
    [nix-shell]$ cabal new-configure --ghc
    [nix-shell]$ cabal new-build

TH splices must be dumped into the source directory for CPP `include` (so
that this library can be used on Android). This is handled by cabal as such:

    [nix-shell]$ cabal new-build semantic-reflex --flags=DumpSplices

You should also run without the `DumpSplices` flag afterwards to ensure the
splices that are dumped are valid haskell:

    [nix-shell]$ cabal new-build semantic-reflex

---

## Examples

A compiled version of the code in the `example` folder is available in `docs/index.html` or online at https://tomsmalley.github.io/semantic-reflex/.

The example app can be run by GHC or GHCJS. For GHC it uses jsaddle-warp to run
a warp server, this is useful for development:

    $ ./repl

Provided everything compiles, you should be able to point your browser at `localhost:3911` and see the examples.

For compiling for GHCJS just run `make`, and the result will be copied into the
`docs` folder.

---

If you have changed the example and are submitting a pull request you should
update the `docs` folder with the updated javascript. Run `make` before
committing!

---
