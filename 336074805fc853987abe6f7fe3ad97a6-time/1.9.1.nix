{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "time";
          version = "1.9.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "<ashley@semantic.org>";
        author = "Ashley Yakeley";
        homepage = "https://github.com/haskell/time";
        url = "";
        synopsis = "A time library";
        description = "Time, clocks and calendars";
        buildType = "Configure";
      };
      components = {
        time = {
          depends  = [
            hsPkgs.base
            hsPkgs.deepseq
          ] ++ pkgs.lib.optional system.isWindows hsPkgs.Win32;
        };
        tests = {
          ShowDefaultTZAbbreviations = {
            depends  = [
              hsPkgs.base
              hsPkgs.time
            ];
          };
          test-main = {
            depends  = [
              hsPkgs.base
              hsPkgs.deepseq
              hsPkgs.time
              hsPkgs.QuickCheck
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.tasty-quickcheck
            ];
          };
          test-unix = {
            depends  = [
              hsPkgs.base
              hsPkgs.deepseq
              hsPkgs.time
              hsPkgs.random
              hsPkgs.QuickCheck
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.tasty-quickcheck
            ] ++ pkgs.lib.optional (!system.isWindows) hsPkgs.unix;
          };
        };
      };
    }