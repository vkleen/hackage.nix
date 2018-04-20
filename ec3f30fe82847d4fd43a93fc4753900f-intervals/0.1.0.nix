{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "intervals";
          version = "0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "ekmett@gmail.com";
        author = "Edward Kmett";
        homepage = "http://patch-tag.com/r/ekmett/intervals";
        url = "";
        synopsis = "Interval Arithmetic";
        description = "";
        buildType = "Simple";
      };
      components = {
        intervals = {
          depends  = [
            hsPkgs.base
            hsPkgs.array
            hsPkgs.numeric-extras
            hsPkgs.rounding
          ];
        };
      };
    }