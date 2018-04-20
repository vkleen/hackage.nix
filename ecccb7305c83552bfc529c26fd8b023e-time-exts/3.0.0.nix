{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "time-exts";
          version = "3.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2013-2016 Enzo Haussecker";
        maintainer = "enzo@sovereign.io";
        author = "Enzo Haussecker";
        homepage = "";
        url = "";
        synopsis = "Yet another time library";
        description = "";
        buildType = "Simple";
      };
      components = {
        time-exts = {
          depends  = [
            hsPkgs.attoparsec
            hsPkgs.base
            hsPkgs.bindings-DSL
            hsPkgs.deepseq
            hsPkgs.lens-simple
            hsPkgs.mtl
            hsPkgs.old-locale
            hsPkgs.random
            hsPkgs.text
            hsPkgs.time
            hsPkgs.tz
          ];
        };
        tests = {
          time-exts-unit-tests = {
            depends  = [
              hsPkgs.attoparsec
              hsPkgs.base
              hsPkgs.bindings-DSL
              hsPkgs.deepseq
              hsPkgs.HUnit
              hsPkgs.ieee754
              hsPkgs.lens-simple
              hsPkgs.mtl
              hsPkgs.old-locale
              hsPkgs.QuickCheck
              hsPkgs.random
              hsPkgs.text
              hsPkgs.time
              hsPkgs.tz
            ];
          };
        };
      };
    }