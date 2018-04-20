{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "music-util";
          version = "0.5";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Hans Hoglund <hans@hanshoglund.se>";
        author = "Hans Hoglund";
        homepage = "";
        url = "";
        synopsis = "Utility for developing the Music Suite.";
        description = "Utility program for installing and developing the music suite.";
        buildType = "Simple";
      };
      components = {
        exes = {
          music-util = {
            depends  = [
              hsPkgs.base
              hsPkgs.text
              hsPkgs.containers
              hsPkgs.shelly
              hsPkgs.process
              hsPkgs.graphviz
              hsPkgs.fgl
              hsPkgs.Cabal
            ];
          };
        };
      };
    }