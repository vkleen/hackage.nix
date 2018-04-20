{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.20";
        identifier = {
          name = "chorale-geo";
          version = "0.1.2";
        };
        license = "MIT";
        copyright = "2014-2016 Franz-Benjamin Mocnik";
        maintainer = "Franz-Benjamin Mocnik <mail@mocnik-science.net>";
        author = "Franz-Benjamin Mocnik <mail@mocnik-science.net>";
        homepage = "https://github.com/mocnik-science/chorale-geo";
        url = "";
        synopsis = "A module containing basic geo functions";
        description = "Chorale-Geo is a Haskell module that contains basic functions for geo\napplications";
        buildType = "Simple";
      };
      components = {
        chorale-geo = {
          depends  = [
            hsPkgs.base
            hsPkgs.binary
            hsPkgs.chorale
          ];
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.chorale
              hsPkgs.chorale-geo
              hsPkgs.HUnit
              hsPkgs.ieee754
              hsPkgs.QuickCheck
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework-quickcheck2
            ];
          };
        };
      };
    }