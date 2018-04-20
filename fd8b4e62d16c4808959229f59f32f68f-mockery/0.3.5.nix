{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "mockery";
          version = "0.3.5";
        };
        license = "MIT";
        copyright = "(c) 2015-2016 Simon Hengel";
        maintainer = "Simon Hengel <sol@typeful.net>";
        author = "Simon Hengel <sol@typeful.net>";
        homepage = "";
        url = "";
        synopsis = "Support functions for automated testing";
        description = "Support functions for automated testing";
        buildType = "Simple";
      };
      components = {
        mockery = {
          depends  = [
            hsPkgs.base
            hsPkgs.base-compat
            hsPkgs.bytestring
            hsPkgs.temporary
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.logging-facade
          ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.base-compat
              hsPkgs.bytestring
              hsPkgs.temporary
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.logging-facade
              hsPkgs.mockery
              hsPkgs.hspec
            ];
          };
        };
      };
    }