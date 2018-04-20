{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "setlocale";
          version = "0.0.3";
        };
        license = "LicenseRef-PublicDomain";
        copyright = "";
        maintainer = "l.mai @web.de";
        author = "Lukas Mai";
        homepage = "";
        url = "";
        synopsis = "A Haskell interface to setlocale()";
        description = "A Haskell interface to @setlocale()@.";
        buildType = "Simple";
      };
      components = {
        setlocale = {
          depends  = [ hsPkgs.base ];
        };
      };
    }