{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "pure-fft";
          version = "0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "Matt Morrow";
        maintainer = "Matt Morrow <mjm2002@gmail.com>";
        author = "Matt Morrow";
        homepage = "";
        url = "";
        synopsis = "Fast Fourier Transform";
        description = "A pure-haskell implementation\nof the radix-2 DIT version of\nthe Cooley-Tukey FFT algorithm.";
        buildType = "Simple";
      };
      components = {
        pure-fft = {
          depends  = [ hsPkgs.base ];
        };
      };
    }