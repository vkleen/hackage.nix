{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "eventful-postgresql";
          version = "0.2.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "David Reaver";
        author = "";
        homepage = "https://github.com/jdreaver/eventful#readme";
        url = "";
        synopsis = "Postgres implementations for eventful";
        description = "Postgres implementations for eventful";
        buildType = "Simple";
      };
      components = {
        eventful-postgresql = {
          depends  = [
            hsPkgs.base
            hsPkgs.eventful-core
            hsPkgs.eventful-sql-common
            hsPkgs.aeson
            hsPkgs.bytestring
            hsPkgs.mtl
            hsPkgs.persistent
            hsPkgs.text
          ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.eventful-core
              hsPkgs.eventful-sql-common
              hsPkgs.aeson
              hsPkgs.bytestring
              hsPkgs.mtl
              hsPkgs.persistent
              hsPkgs.text
              hsPkgs.hspec
              hsPkgs.HUnit
              hsPkgs.eventful-test-helpers
              hsPkgs.persistent-postgresql
            ];
          };
        };
      };
    }