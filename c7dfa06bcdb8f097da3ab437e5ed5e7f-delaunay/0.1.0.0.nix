{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "delaunay";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "m [dot] ruegenberg [at] picodesign [dot] de";
        author = "Marcel Ruegenberg";
        homepage = "http://github.com/mruegenberg/Delaunay";
        url = "";
        synopsis = "Build a Delaunay triangulation of a set of points";
        description = "";
        buildType = "Simple";
      };
      components = {
        delaunay = {
          depends  = [
            hsPkgs.base
            hsPkgs.AC-Vector
            hsPkgs.unordered-containers
            hsPkgs.hashable
          ];
        };
      };
    }