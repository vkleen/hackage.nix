{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "dotgen";
          version = "0.4";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Andy Gill <andygill@ku.edu>";
        author = "Andy Gill";
        homepage = "";
        url = "";
        synopsis = "A simple interface for building .dot graph files.";
        description = "This package provides a simple interface for building .dot graph files,\nfor input into the dot and graphviz tools.\nIt includes a monadic interface for building graphs.";
        buildType = "Simple";
      };
      components = {
        dotgen = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
          ];
        };
        exes = {
          dotgen-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.containers
            ];
          };
        };
      };
    }