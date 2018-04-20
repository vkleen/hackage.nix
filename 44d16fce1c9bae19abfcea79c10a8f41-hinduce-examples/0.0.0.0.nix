{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "hinduce-examples";
          version = "0.0.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "hackage@roberthensing.nl";
        author = "Robert Hensing";
        homepage = "";
        url = "";
        synopsis = "Example data for hInduce";
        description = "Example data for use with hInduce";
        buildType = "Simple";
      };
      components = {
        hinduce-examples = {
          depends  = [
            hsPkgs.haskell98
            hsPkgs.base
            hsPkgs.layout
            hsPkgs.hinduce-missingh
            hsPkgs.csv
            hsPkgs.hinduce-classifier
            hsPkgs.hinduce-classifier-decisiontree
            hsPkgs.convertible
          ];
        };
      };
    }