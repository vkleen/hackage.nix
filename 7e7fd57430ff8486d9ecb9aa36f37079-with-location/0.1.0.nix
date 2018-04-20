{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "with-location";
          version = "0.1.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Simon Hengel <sol@typeful.net>";
        author = "";
        homepage = "https://github.com/sol/with-location#readme";
        url = "";
        synopsis = "Use ImplicitParams-based source locations in a backward compatible way";
        description = "";
        buildType = "Simple";
      };
      components = {
        with-location = {
          depends  = [ hsPkgs.base ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.with-location
            ];
          };
        };
      };
    }