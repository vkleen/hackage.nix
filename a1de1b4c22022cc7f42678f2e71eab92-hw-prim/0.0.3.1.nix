{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.22";
        identifier = {
          name = "hw-prim";
          version = "0.0.3.1";
        };
        license = "BSD-3-Clause";
        copyright = "2016 John Ky";
        maintainer = "newhoggy@gmail.com";
        author = "John Ky";
        homepage = "http://github.com/haskell-works/hw-prim#readme";
        url = "";
        synopsis = "Primitive functions and data types";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        hw-prim = {
          depends  = [
            hsPkgs.base
            hsPkgs.vector
            hsPkgs.bytestring
            hsPkgs.random
          ];
        };
        exes = {
          hw-prim-example = {
            depends  = [
              hsPkgs.base
              hsPkgs.hw-prim
            ];
          };
        };
        tests = {
          hw-prim-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.QuickCheck
            ];
          };
        };
        benchmarks = {
          bench = {
            depends  = [
              hsPkgs.base
              hsPkgs.criterion
              hsPkgs.hw-prim
              hsPkgs.vector
            ];
          };
        };
      };
    }