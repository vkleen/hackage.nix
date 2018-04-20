{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "hstzaar";
          version = "0.9.4";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Pedro Vasconcelos <pbv@dcc.fc.up.pt>";
        author = "Pedro Vasconcelos <pbv@dcc.fc.up.pt>";
        homepage = "http://www.dcc.fc.up.pt/~pbv/stuff/hstzaar";
        url = "";
        synopsis = "A two player abstract strategy game.";
        description = "HsTZAAR is an implementation of TZAAR ((c) 2007 Kris Brum),\na two player abstract strategy game played on a hexagonal board.\nTZAAR is the the last game in the GIPF game series.\nThis program is based on the (retired) htzaar implementation\nby Tom Hawkins <tomahawkins@gmail.com>.";
        buildType = "Simple";
      };
      components = {
        exes = {
          hstzaar = {
            depends  = [
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.directory
              hsPkgs.array
              hsPkgs.containers
              hsPkgs.unordered-containers
              hsPkgs.hashable
              hsPkgs.mtl
              hsPkgs.vector
              hsPkgs.parallel
              hsPkgs.gtk
              hsPkgs.cairo
              hsPkgs.glade
              hsPkgs.random
              hsPkgs.QuickCheck
              hsPkgs.xml
            ];
          };
        };
      };
    }