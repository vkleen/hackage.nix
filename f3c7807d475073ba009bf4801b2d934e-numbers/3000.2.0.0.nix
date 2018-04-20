{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "numbers";
          version = "3000.2.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "danburton.email@gmail.com";
        author = "Lennart Augustsson";
        homepage = "https://github.com/DanBurton/numbers#readme";
        url = "";
        synopsis = "Various number types";
        description = "Instances of the numerical classes for a variety of\ndifferent numbers: (computable) real numbers,\narbitrary precision fixed numbers,\narbitrary precision floating point numbers,\ndifferentiable numbers, symbolic numbers,\nnatural numbers, interval arithmetic.";
        buildType = "Simple";
      };
      components = {
        numbers = {
          depends  = [ hsPkgs.base ];
        };
        tests = {
          testsuite = {
            depends  = [
              hsPkgs.base
              hsPkgs.QuickCheck
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck2
            ];
          };
        };
      };
    }