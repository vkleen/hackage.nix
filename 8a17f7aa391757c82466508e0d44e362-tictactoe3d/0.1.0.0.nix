{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "tictactoe3d";
          version = "0.1.0.0";
        };
        license = "GPL-3.0-only";
        copyright = "";
        maintainer = "ryoka0418@gmail.com";
        author = "ryo0ka";
        homepage = "https://github.com/ryo0ka/tictactoe3d";
        url = "";
        synopsis = "3D Tic-Tac-Toe logic";
        description = "Defines 3D Tic-Tac-Toe game logic and state machines.";
        buildType = "Simple";
      };
      components = {
        tictactoe3d = {
          depends  = [
            hsPkgs.base
            hsPkgs.vector
            hsPkgs.hArduino
            hsPkgs.tuples-homogenous-h98
          ];
        };
      };
    }