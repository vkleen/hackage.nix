{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "random-extras";
          version = "0.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "aristidb@googlemail.com";
        author = "Aristid Breitkreuz";
        homepage = "http://github.com/aristidb/random-extras";
        url = "";
        synopsis = "Additional functions for random values.";
        description = "Additional functions for random values, based on MonadRandom. Inspired by random-shuffle.";
        buildType = "Simple";
      };
      components = {
        random-extras = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.array
            hsPkgs.random
            hsPkgs.MonadRandom
          ];
        };
      };
    }