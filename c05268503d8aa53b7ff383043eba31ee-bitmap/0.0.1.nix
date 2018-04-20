{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      base4 = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "bitmap";
          version = "0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2009 Balazs Komuves";
        maintainer = "bkomuves (plus) hackage (at) gmail (dot) com";
        author = "Balazs Komuves";
        homepage = "http://code.haskell.org/~bkomuves/";
        url = "";
        synopsis = "A library for handling and manipulating bitmaps.";
        description = "A library for handling and manipulating bitmaps (that is,\nrectangular pixel arrays).";
        buildType = "Simple";
      };
      components = {
        bitmap = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
          ];
        };
      };
    }