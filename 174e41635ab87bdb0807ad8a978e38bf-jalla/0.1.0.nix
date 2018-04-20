{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      build_lapacke = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "jalla";
          version = "0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "2011-2012, Christian Gosch";
        maintainer = "Christian Gosch <github@goschs.de>";
        author = "Christian Gosch";
        homepage = "https://github.com/cgo/jalla";
        url = "";
        synopsis = "Higher level functions for linear algebra. Wraps BLAS and LAPACKE.";
        description = "Jalla aims at providing high level functions for linear algebra computations which\nshould be fast and easy enough to use. Under the hood, BLAS and LAPACKE are used\n(LAPACKE is a standard C interface to LAPACK which is part of LAPACK since version 3.4).\nCurrently, I am adding new functions whenever I find some time. Please help, if you want to!\nThere are not many tests yet, and we need some nicer error reporting (nicer than exceptions).";
        buildType = "Simple";
      };
      components = {
        jalla = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.convertible
            hsPkgs.random
            hsPkgs.QuickCheck
          ];
          libs = [
            pkgs.lapacke
            pkgs.lapack
            pkgs.cblas
            pkgs.f77blas
          ];
        };
        tests = {
          tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.jalla
              hsPkgs.random
              hsPkgs.HUnit
              hsPkgs.QuickCheck
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework-quickcheck2
            ];
          };
        };
      };
    }