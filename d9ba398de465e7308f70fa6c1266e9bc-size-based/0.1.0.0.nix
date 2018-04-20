{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "size-based";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "jonas.duregard@chalmers.se";
        author = "Jonas Duregård";
        homepage = "";
        url = "";
        synopsis = "Sized functors, for size-based enumerations";
        description = "";
        buildType = "Simple";
      };
      components = {
        size-based = {
          depends  = [
            hsPkgs.base
            hsPkgs.dictionary-sharing
            hsPkgs.testing-type-modifiers
            hsPkgs.template-haskell
          ];
        };
      };
    }