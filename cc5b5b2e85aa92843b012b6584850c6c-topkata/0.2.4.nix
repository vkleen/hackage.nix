{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      sound = true;
      pdflaby = false;
      ftgl = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "topkata";
          version = "0.2.4";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "Christoph Bauer <ich@christoph-bauer.net>";
        author = "Christoph Bauer";
        homepage = "http://home.arcor.de/chr_bauer/topkata.html";
        url = "";
        synopsis = "OpenGL Arcade Game";
        description = "Guide a jumping ball through a maze.";
        buildType = "Simple";
      };
      components = {
        exes = {
          topkata = {
            depends  = ([
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.GLFW-b
              hsPkgs.OpenGL
              hsPkgs.array
              hsPkgs.random
              hsPkgs.parseargs
            ] ++ pkgs.lib.optionals _flags.sound [
              hsPkgs.OpenAL
              hsPkgs.ALUT
            ]) ++ pkgs.lib.optional _flags.ftgl hsPkgs.FTGL;
          };
          pdflaby = {
            depends  = pkgs.lib.optionals _flags.pdflaby [
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.array
              hsPkgs.random
              hsPkgs.cairo
            ];
          };
        };
      };
    }