{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "extended-reals";
          version = "0.2.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "masahiro.sakai@gmail.com";
        author = "Masahiro Sakai";
        homepage = "https://github.com/msakai/extended-reals/";
        url = "";
        synopsis = "Extension of real numbers with positive/negative infinities";
        description = "Extension of real numbers with positive/negative infinities (±∞).\nIt is useful for describing various limiting behaviors in mathematics.";
        buildType = "Simple";
      };
      components = {
        extended-reals = {
          depends  = [
            hsPkgs.base
            hsPkgs.deepseq
            hsPkgs.hashable
          ];
        };
        tests = {
          TestExtendedReal = {
            depends  = [
              hsPkgs.base
              hsPkgs.HUnit
              hsPkgs.QuickCheck
              hsPkgs.test-framework
              hsPkgs.test-framework-th
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework-quickcheck2
              hsPkgs.extended-reals
            ];
          };
        };
      };
    }