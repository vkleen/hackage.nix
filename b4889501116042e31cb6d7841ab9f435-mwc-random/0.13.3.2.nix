{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "mwc-random";
          version = "0.13.3.2";
        };
        license = "BSD-3-Clause";
        copyright = "2009, 2010, 2011 Bryan O'Sullivan";
        maintainer = "Bryan O'Sullivan <bos@serpentine.com>";
        author = "Bryan O'Sullivan <bos@serpentine.com>";
        homepage = "https://github.com/bos/mwc-random";
        url = "";
        synopsis = "Fast, high quality pseudo random number generation";
        description = "This package contains code for generating high quality random\nnumbers that follow either a uniform or normal distribution.  The\ngenerated numbers are suitable for use in statistical applications.\n\nThe uniform PRNG uses Marsaglia's MWC256 (also known as MWC8222)\nmultiply-with-carry generator, which has a period of 2^8222 and\nfares well in tests of randomness.  It is also extremely fast,\nbetween 2 and 3 times faster than the Mersenne Twister.\n\nCompared to the mersenne-random package, this package has a more\nconvenient API, is faster, and supports more statistical\ndistributions.";
        buildType = "Simple";
      };
      components = {
        mwc-random = {
          depends  = [
            hsPkgs.base
            hsPkgs.primitive
            hsPkgs.time
            hsPkgs.vector
          ] ++ pkgs.lib.optional compiler.isGhc hsPkgs.base;
        };
        tests = {
          tests = {
            depends  = [
              hsPkgs.vector
              hsPkgs.HUnit
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.mwc-random
              hsPkgs.statistics
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework-quickcheck2
            ];
          };
        };
      };
    }