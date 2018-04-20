{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "string-convert";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "tdammers@gmail.com";
        author = "Tobias Dammers";
        homepage = "https://bitbucket.org/tdammers/string-convert";
        url = "";
        synopsis = "Provide universal string conversions between any two string-like types";
        description = "";
        buildType = "Simple";
      };
      components = {
        string-convert = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.utf8-string
          ];
        };
      };
    }