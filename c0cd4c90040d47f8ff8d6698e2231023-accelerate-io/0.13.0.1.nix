{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      bounds-checks = true;
      unsafe-checks = false;
      internal-checks = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "accelerate-io";
          version = "0.13.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Manuel M T Chakravarty <chak@cse.unsw.edu.au>";
        author = "Manuel M T Chakravarty,\nGabriele Keller,\nSean Lee,\nTrevor L. McDonell";
        homepage = "https://github.com/AccelerateHS/accelerate-io";
        url = "";
        synopsis = "Read and write Accelerate arrays in various formats";
        description = "This package provides efficient conversion routines between a range of array\ntypes and Accelerate arrays.\n\nRefer to the main /Accelerate/ package for more information:\n<http://hackage.haskell.org/package/accelerate>";
        buildType = "Custom";
      };
      components = {
        accelerate-io = {
          depends  = [
            hsPkgs.accelerate
            hsPkgs.base
            hsPkgs.array
            hsPkgs.bmp
            hsPkgs.bytestring
            hsPkgs.repa
            hsPkgs.vector
          ];
        };
      };
    }