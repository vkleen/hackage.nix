{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      development = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.18";
        identifier = {
          name = "ats-storable";
          version = "0.2.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright: (c) 2018 Vanessa McHale";
        maintainer = "vamchale@gmail.com";
        author = "Vanessa McHale";
        homepage = "https://github.com//ats-generic#readme";
        url = "";
        synopsis = "Marshal ATS types into Haskell";
        description = "Facilities for sharing types between ATS and Haskell";
        buildType = "Simple";
      };
      components = {
        ats-storable = {
          depends  = [
            hsPkgs.base
            hsPkgs.composition-prelude
            hsPkgs.text
            hsPkgs.bytestring
          ];
        };
      };
    }