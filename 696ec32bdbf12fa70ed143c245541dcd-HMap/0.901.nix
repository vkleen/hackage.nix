{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "HMap";
          version = "0.901";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "atzeus@gmail.com";
        author = "Atze van der Ploeg";
        homepage = "https://github.com/atzeus/HMap";
        url = "";
        synopsis = "Fast heterogeneous maps.";
        description = "Fast heterogeneous maps based on Data.Map.";
        buildType = "Simple";
      };
      components = {
        HMap = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
          ];
        };
      };
    }