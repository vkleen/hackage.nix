{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      unsafe-tricks = true;
      bounds-checking = false;
      debug = false;
      sse42 = false;
      portable = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "impure-containers";
          version = "0.4.0";
        };
        license = "BSD-3-Clause";
        copyright = "2016 Andrew Martin";
        maintainer = "andrew.thaddeus@gmail.com";
        author = "Andrew Martin";
        homepage = "https://github.com/andrewthad/impure-containers#readme";
        url = "";
        synopsis = "Mutable containers in haskell";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        impure-containers = {
          depends  = [
            hsPkgs.base
            hsPkgs.hashable
            hsPkgs.primitive
            hsPkgs.vector
            hsPkgs.containers
            hsPkgs.ghc-prim
          ] ++ pkgs.lib.optional (!_flags.portable && _flags.unsafe-tricks && compiler.isGhc) hsPkgs.ghc-prim;
        };
        tests = {
          impure-containers-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.impure-containers
              hsPkgs.containers
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck2
              hsPkgs.QuickCheck
              hsPkgs.HUnit
              hsPkgs.test-framework-hunit
              hsPkgs.vector
              hsPkgs.transformers
            ];
          };
        };
      };
    }