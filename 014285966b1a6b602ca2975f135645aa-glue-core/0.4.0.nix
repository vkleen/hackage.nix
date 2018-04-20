{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "glue-core";
          version = "0.4.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "github@futurenotfound.com";
        author = "Sean Parsons";
        homepage = "";
        url = "";
        synopsis = "Make better services.";
        description = "Combinator library to enhance the general functionality of services.";
        buildType = "Simple";
      };
      components = {
        glue-core = {
          depends  = [
            hsPkgs.base
            hsPkgs.glue-common
            hsPkgs.transformers
            hsPkgs.transformers-base
            hsPkgs.lifted-base
            hsPkgs.time
            hsPkgs.monad-control
            hsPkgs.unordered-containers
            hsPkgs.hashable
            hsPkgs.text
          ];
        };
        tests = {
          glue-core-tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.glue-common
              hsPkgs.QuickCheck
              hsPkgs.quickcheck-instances
              hsPkgs.hspec
              hsPkgs.transformers
              hsPkgs.transformers-base
              hsPkgs.lifted-base
              hsPkgs.time
              hsPkgs.monad-control
              hsPkgs.unordered-containers
              hsPkgs.hashable
              hsPkgs.ekg-core
              hsPkgs.text
              hsPkgs.async
            ];
          };
        };
      };
    }