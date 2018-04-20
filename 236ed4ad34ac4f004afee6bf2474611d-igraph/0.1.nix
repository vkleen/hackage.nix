{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "igraph";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Giorgidze@Gmail.com";
        author = "Nils Schweinsberg, George Giorgidze";
        homepage = "";
        url = "";
        synopsis = "Bindings to the igraph C library.";
        description = "Complete bindings to all functions about graph properties\nof the igraph C library. Requires igraph 0.6.";
        buildType = "Simple";
      };
      components = {
        igraph = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.unordered-containers
            hsPkgs.hashable
          ];
          libs = [ pkgs.igraph ];
        };
      };
    }