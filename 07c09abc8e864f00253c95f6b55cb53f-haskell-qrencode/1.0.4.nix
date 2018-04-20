{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "haskell-qrencode";
          version = "1.0.4";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "jimmyjazz14@gmail.com";
        author = "James Sanders, Felipe Lessa";
        homepage = "https://github.com/jamessanders/haskell-qrencode";
        url = "";
        synopsis = "Haskell bindings for libqrencode.";
        description = "Haskell bindings for libqrencode.\nLibqrencode is a C library for encoding data in a QR Code symbol, a kind of 2D symbology\nthat can be scanned by handy terminals such as a mobile phone with CCD. The capacity of\nQR Code is up to 7000 digits or 4000 characters, and is highly robust.";
        buildType = "Simple";
      };
      components = {
        haskell-qrencode = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
          ];
          libs = [ pkgs.qrencode ];
        };
      };
    }