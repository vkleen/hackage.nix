{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "vector-space-points";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2011 Brent Yorgey";
        maintainer = "byorgey@cis.upenn.edu";
        author = "Brent Yorgey";
        homepage = "";
        url = "";
        synopsis = "A type for points, as distinct from vectors.";
        description = "A type for points, as distinct from vectors, built on top\nof Data.AffineSpace.";
        buildType = "Simple";
      };
      components = {
        vector-space-points = {
          depends  = [
            hsPkgs.base
            hsPkgs.vector-space
            hsPkgs.newtype
          ];
        };
      };
    }