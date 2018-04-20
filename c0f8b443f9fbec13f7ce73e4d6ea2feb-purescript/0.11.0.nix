{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      release = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "purescript";
          version = "0.11.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2013-16 Phil Freeman, (c) 2014-16 Gary Burgess";
        maintainer = "Phil Freeman <paf31@cantab.net>";
        author = "Phil Freeman <paf31@cantab.net>,\nGary Burgess <gary.burgess@gmail.com>,\nHardy Jones <jones3.hardy@gmail.com>,\nHarry Garrood <harry@garrood.me>,\nChristoph Hegemann <christoph.hegemann1337@gmail.com>";
        homepage = "http://www.purescript.org/";
        url = "";
        synopsis = "PureScript Programming Language Compiler";
        description = "A small strongly, statically typed programming language with expressive types, inspired by Haskell and compiling to JavaScript.";
        buildType = "Simple";
      };
      components = {
        purescript = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.aeson-better-errors
            hsPkgs.ansi-terminal
            hsPkgs.base-compat
            hsPkgs.blaze-html
            hsPkgs.bower-json
            hsPkgs.boxes
            hsPkgs.bytestring
            hsPkgs.cheapskate
            hsPkgs.containers
            hsPkgs.clock
            hsPkgs.data-ordlist
            hsPkgs.deepseq
            hsPkgs.directory
            hsPkgs.dlist
            hsPkgs.edit-distance
            hsPkgs.filepath
            hsPkgs.fsnotify
            hsPkgs.Glob
            hsPkgs.haskeline
            hsPkgs.http-client
            hsPkgs.http-types
            hsPkgs.language-javascript
            hsPkgs.lens
            hsPkgs.lifted-base
            hsPkgs.monad-control
            hsPkgs.monad-logger
            hsPkgs.mtl
            hsPkgs.parallel
            hsPkgs.parsec
            hsPkgs.pattern-arrows
            hsPkgs.pipes
            hsPkgs.pipes-http
            hsPkgs.process
            hsPkgs.protolude
            hsPkgs.regex-tdfa
            hsPkgs.safe
            hsPkgs.scientific
            hsPkgs.semigroups
            hsPkgs.sourcemap
            hsPkgs.spdx
            hsPkgs.split
            hsPkgs.stm
            hsPkgs.syb
            hsPkgs.text
            hsPkgs.time
            hsPkgs.transformers
            hsPkgs.transformers-base
            hsPkgs.transformers-compat
            hsPkgs.unordered-containers
            hsPkgs.utf8-string
            hsPkgs.vector
          ];
        };
        exes = {
          purs = {
            depends  = [
              hsPkgs.base
              hsPkgs.aeson
              hsPkgs.ansi-terminal
              hsPkgs.ansi-wl-pprint
              hsPkgs.base-compat
              hsPkgs.blaze-html
              hsPkgs.boxes
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.file-embed
              hsPkgs.filepath
              hsPkgs.Glob
              hsPkgs.haskeline
              hsPkgs.http-types
              hsPkgs.monad-logger
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-applicative
              hsPkgs.parsec
              hsPkgs.process
              hsPkgs.protolude
              hsPkgs.purescript
              hsPkgs.sourcemap
              hsPkgs.split
              hsPkgs.stm
              hsPkgs.text
              hsPkgs.time
              hsPkgs.transformers
              hsPkgs.transformers-compat
              hsPkgs.utf8-string
              hsPkgs.wai
              hsPkgs.wai-websockets
              hsPkgs.warp
              hsPkgs.websockets
            ] ++ pkgs.lib.optional (!_flags.release) hsPkgs.gitrev;
          };
        };
        tests = {
          tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.purescript
              hsPkgs.aeson
              hsPkgs.aeson-better-errors
              hsPkgs.base-compat
              hsPkgs.bower-json
              hsPkgs.boxes
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.Glob
              hsPkgs.haskeline
              hsPkgs.hspec
              hsPkgs.hspec-discover
              hsPkgs.HUnit
              hsPkgs.lens
              hsPkgs.monad-logger
              hsPkgs.mtl
              hsPkgs.optparse-applicative
              hsPkgs.parsec
              hsPkgs.process
              hsPkgs.protolude
              hsPkgs.silently
              hsPkgs.stm
              hsPkgs.text
              hsPkgs.time
              hsPkgs.transformers
              hsPkgs.transformers-compat
              hsPkgs.utf8-string
              hsPkgs.vector
            ];
          };
        };
      };
    }