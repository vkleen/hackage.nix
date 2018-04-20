{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "wumpus-basic";
          version = "0.1.1";
        };
        license = "BSD-3-Clause";
        copyright = "Stephen Tetley <stephen.tetley@gmail.com>";
        maintainer = "Stephen Tetley <stephen.tetley@gmail.com>";
        author = "";
        homepage = "http://code.google.com/p/copperbox/";
        url = "";
        synopsis = "Common drawing utilities built on wumpus-core.";
        description = "\nVery preliminary release...\n\n";
        buildType = "Simple";
      };
      components = {
        wumpus-basic = {
          depends  = [
            hsPkgs.base
            hsPkgs.vector-space
            hsPkgs.monadLib
            hsPkgs.wumpus-core
          ];
        };
      };
    }