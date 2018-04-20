{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "pandoc-lens";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2014 Ben Gamari";
        maintainer = "bgamari.foss@gmail.com";
        author = "Ben Gamari";
        homepage = "http://github.com/bgamari/pandoc-lens";
        url = "";
        synopsis = "Lenses for Pandoc documents";
        description = "Lenses for Pandoc documents";
        buildType = "Simple";
      };
      components = {
        pandoc-lens = {
          depends  = [
            hsPkgs.base
            hsPkgs.pandoc-types
            hsPkgs.lens
            hsPkgs.containers
          ];
        };
      };
    }