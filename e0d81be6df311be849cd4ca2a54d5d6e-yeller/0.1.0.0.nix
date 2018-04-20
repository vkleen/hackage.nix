{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yeller";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "clients@yellerapp.com";
        author = "Tom Crayford";
        homepage = "http://yellerapp.com";
        url = "";
        synopsis = "A Yeller Client For Haskell";
        description = "";
        buildType = "Simple";
      };
      components = {
        yeller = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
            hsPkgs.bytestring
            hsPkgs.stm
            hsPkgs.containers
            hsPkgs.aeson
            hsPkgs.network
            hsPkgs.http-client
            hsPkgs.http-client-tls
            hsPkgs.http-types
          ];
        };
        exes = {
          yeller = {
            depends  = [
              hsPkgs.base
              hsPkgs.text
              hsPkgs.bytestring
              hsPkgs.stm
              hsPkgs.containers
              hsPkgs.aeson
              hsPkgs.network
              hsPkgs.http-client
              hsPkgs.http-client-tls
              hsPkgs.http-types
            ];
          };
        };
        tests = {
          test-yeller = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.text
              hsPkgs.bytestring
              hsPkgs.stm
              hsPkgs.containers
              hsPkgs.aeson
              hsPkgs.network
              hsPkgs.http-client
              hsPkgs.http-client-tls
              hsPkgs.http-types
            ];
          };
        };
      };
    }