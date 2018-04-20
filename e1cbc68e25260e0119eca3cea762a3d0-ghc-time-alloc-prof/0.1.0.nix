{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      dump = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "ghc-time-alloc-prof";
          version = "0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2013-2016 Mitsutoshi Aoe";
        maintainer = "Mitsutoshi Aoe <maoe@foldr.in>";
        author = "Mitsutoshi Aoe";
        homepage = "https://github.com/maoe/ghc-time-alloc-prof";
        url = "";
        synopsis = "Library for parsing GHC time and allocation profiling reports";
        description = "Library for parsing GHC time and allocation profiling reports";
        buildType = "Simple";
      };
      components = {
        ghc-time-alloc-prof = {
          depends  = [
            hsPkgs.base
            hsPkgs.attoparsec
            hsPkgs.containers
            hsPkgs.text
            hsPkgs.time
          ];
        };
        exes = {
          dump = {
            depends  = [
              hsPkgs.base
              hsPkgs.attoparsec
              hsPkgs.containers
              hsPkgs.ghc-time-alloc-prof
              hsPkgs.text
            ];
          };
        };
        tests = {
          regression = {
            depends  = [
              hsPkgs.attoparsec
              hsPkgs.base
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.ghc-time-alloc-prof
              hsPkgs.process
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.temporary
              hsPkgs.text
            ];
          };
        };
      };
    }