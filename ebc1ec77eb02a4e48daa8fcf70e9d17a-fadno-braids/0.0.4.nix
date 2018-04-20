{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "fadno-braids";
          version = "0.0.4";
        };
        license = "BSD-2-Clause";
        copyright = "";
        maintainer = "spopejoy@panix.com";
        author = "Stuart Popejoy";
        homepage = "http://github.com/slpopejoy/";
        url = "";
        synopsis = "Braid representations in Haskell";
        description = "Braids represented as Haskell types with support for generation and transformations.";
        buildType = "Simple";
      };
      components = {
        fadno-braids = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.data-default
            hsPkgs.diagrams
            hsPkgs.diagrams-lib
            hsPkgs.diagrams-rasterific
            hsPkgs.lens
            hsPkgs.random
            hsPkgs.transformers-compat
          ];
        };
      };
    }