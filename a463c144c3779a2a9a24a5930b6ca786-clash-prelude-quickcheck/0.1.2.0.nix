{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "clash-prelude-quickcheck";
          version = "0.1.2.0";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "";
        maintainer = "Ericson2314@Yahoo.com";
        author = "John Ericson";
        homepage = "";
        url = "";
        synopsis = "QuickCheck instances for various types in the CλaSH Prelude";
        description = "";
        buildType = "Simple";
      };
      components = {
        clash-prelude-quickcheck = {
          depends  = [
            hsPkgs.base
            hsPkgs.QuickCheck
            hsPkgs.clash-prelude
            hsPkgs.mtl
            hsPkgs.containers
          ];
        };
      };
    }