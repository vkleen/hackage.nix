{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "nanospec";
          version = "0.2.1";
        };
        license = "MIT";
        copyright = "(c) 2012-2015 Simon Hengel";
        maintainer = "Simon Hengel <sol@typeful.net>";
        author = "Simon Hengel <sol@typeful.net>";
        homepage = "";
        url = "";
        synopsis = "A lightweight implementation of a subset of Hspec's API";
        description = "A lightweight implementation of a subset of Hspec's API with\nminimal dependencies.";
        buildType = "Simple";
      };
      components = {
        nanospec = {
          depends  = [ hsPkgs.base ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.silently
            ];
          };
        };
      };
    }