{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "collada-output";
          version = "0.6";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "tillk.vogt@googlemail.com";
        author = "Tillmann Vogt";
        homepage = "";
        url = "";
        synopsis = "Generate animated 3d objects in COLLADA";
        description = "Generate a COLLADA file with textures, materials, animations, ... It can be used to visualize algorithms that produce a stream of positions, see <http://www.youtube.com/watch?v=ZpJzG28Yv8Y>";
        buildType = "Simple";
      };
      components = {
        collada-output = {
          depends  = [
            hsPkgs.base
            hsPkgs.xml
            hsPkgs.containers
            hsPkgs.time
            hsPkgs.SVGPath
            hsPkgs.collada-types
            hsPkgs.vector
          ];
        };
        exes = { Examples = {}; };
      };
    }