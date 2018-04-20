{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "Tensor";
          version = "1.0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Sven Panne <sven.panne@aedion.de>";
        author = "";
        homepage = "http://www.haskell.org/HOpenGL/";
        url = "";
        synopsis = "Tensor data types";
        description = "This package contains tensor data types and their instances for some basic\ntype classes.";
        buildType = "Simple";
      };
      components = {
        Tensor = {
          depends  = [ hsPkgs.base ];
        };
      };
    }