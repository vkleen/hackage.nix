{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "gitlib-libgit2";
          version = "1.0.2";
        };
        license = "MIT";
        copyright = "";
        maintainer = "johnw@fpcomplete.com";
        author = "John Wiegley";
        homepage = "";
        url = "";
        synopsis = "Libgit2 backend for gitlib";
        description = "Libgit2  (<http://libgit2.github.com>) backend for @gitlib@.";
        buildType = "Simple";
      };
      components = {
        gitlib-libgit2 = {
          depends  = [
            hsPkgs.base
            hsPkgs.gitlib
            hsPkgs.gitlib-utils
            hsPkgs.hlibgit2
            hsPkgs.attempt
            hsPkgs.bytestring
            hsPkgs.conduit
            hsPkgs.containers
            hsPkgs.data-default
            hsPkgs.directory
            hsPkgs.failure
            hsPkgs.hex
            hsPkgs.lifted-base
            hsPkgs.missing-foreign
            hsPkgs.monad-control
            hsPkgs.monad-loops
            hsPkgs.parallel-io
            hsPkgs.pointless-fun
            hsPkgs.resourcet
            hsPkgs.system-fileio
            hsPkgs.system-filepath
            hsPkgs.tagged
            hsPkgs.text
            hsPkgs.text-icu
            hsPkgs.temporary
            hsPkgs.time
            hsPkgs.transformers
            hsPkgs.transformers-base
            hsPkgs.unordered-containers
          ];
        };
        tests = {
          smoke = {
            depends  = [
              hsPkgs.base
              hsPkgs.gitlib
              hsPkgs.gitlib-test
              hsPkgs.gitlib-libgit2
              hsPkgs.HUnit
              hsPkgs.hspec
              hsPkgs.hspec-expectations
            ];
          };
        };
      };
    }