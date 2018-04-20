{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      buildexamples = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "dsp";
          version = "0.2.4";
        };
        license = "LicenseRef-GPL";
        copyright = "Matt Donadio, 2003";
        maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
        author = "Matt Donadio <m.p.donadio@ieee.org>";
        homepage = "http://www.haskell.org/haskellwiki/DSP";
        url = "";
        synopsis = "Haskell Digital Signal Processing";
        description = "Digital Signal Processing, Fourier Transform, Linear Algebra, Interpolation";
        buildType = "Simple";
      };
      components = {
        dsp = {
          depends  = [
            hsPkgs.containers
            hsPkgs.array
            hsPkgs.random
            hsPkgs.base
          ];
        };
        exes = {
          dsp-demo-article = {
            depends  = pkgs.lib.optionals _flags.buildexamples [
              hsPkgs.dsp
              hsPkgs.array
              hsPkgs.base
            ];
          };
          dsp-demo-fft-bench = {
            depends  = pkgs.lib.optionals _flags.buildexamples [
              hsPkgs.dsp
              hsPkgs.array
              hsPkgs.base
            ];
          };
          dsp-demo-fft-test = {
            depends  = pkgs.lib.optionals _flags.buildexamples [
              hsPkgs.dsp
              hsPkgs.array
              hsPkgs.base
            ];
          };
          dsp-demo-freq = {
            depends  = pkgs.lib.optionals _flags.buildexamples [
              hsPkgs.dsp
              hsPkgs.array
              hsPkgs.base
            ];
          };
          dsp-demo-iir = {
            depends  = pkgs.lib.optionals _flags.buildexamples [
              hsPkgs.dsp
              hsPkgs.array
              hsPkgs.base
            ];
          };
          dsp-demo-noise = {
            depends  = pkgs.lib.optionals _flags.buildexamples [
              hsPkgs.dsp
              hsPkgs.array
              hsPkgs.base
            ];
          };
        };
        tests = {
          dsp-test = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.dsp
              hsPkgs.containers
              hsPkgs.array
              hsPkgs.base
            ];
          };
        };
      };
    }