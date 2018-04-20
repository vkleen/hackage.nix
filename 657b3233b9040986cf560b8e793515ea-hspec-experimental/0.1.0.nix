{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "hspec-experimental";
          version = "0.1.0";
        };
        license = "MIT";
        copyright = "(c) 2012 Simon Hengel";
        maintainer = "Simon Hengel <sol@typeful.net>";
        author = "Simon Hengel <sol@typeful.net>";
        homepage = "";
        url = "";
        synopsis = "An experimental DSL for testing on top of Hspec";
        description = "/Note:/ This is experimental!  If you are looking for a\nstable solution for testing Haskell code, try Hspec:\n<http://hspec.github.com/>";
        buildType = "Simple";
      };
      components = {
        hspec-experimental = {
          depends  = [
            hsPkgs.base
            hsPkgs.hspec
            hsPkgs.QuickCheck
            hsPkgs.HUnit
          ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec-experimental
              hsPkgs.hspec-meta
            ];
          };
        };
      };
    }