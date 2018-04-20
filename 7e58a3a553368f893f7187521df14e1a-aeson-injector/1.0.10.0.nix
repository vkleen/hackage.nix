{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.18";
        identifier = {
          name = "aeson-injector";
          version = "1.0.10.0";
        };
        license = "MIT";
        copyright = "2016 Anton Gushcha";
        maintainer = "ncrashed@gmail.com";
        author = "Anton Gushcha";
        homepage = "";
        url = "";
        synopsis = "Injecting fields into aeson values";
        description = "See README.md";
        buildType = "Simple";
      };
      components = {
        aeson-injector = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.bifunctors
            hsPkgs.deepseq
            hsPkgs.lens
            hsPkgs.swagger2
            hsPkgs.text
            hsPkgs.unordered-containers
            hsPkgs.servant-docs
          ];
        };
        tests = {
          test-aeson-injector = {
            depends  = [
              hsPkgs.base
              hsPkgs.aeson
              hsPkgs.aeson-injector
              hsPkgs.HUnit
              hsPkgs.lens
              hsPkgs.QuickCheck
              hsPkgs.quickcheck-text
              hsPkgs.scientific
              hsPkgs.swagger2
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.tasty-quickcheck
              hsPkgs.text
              hsPkgs.vector
            ];
          };
        };
      };
    }