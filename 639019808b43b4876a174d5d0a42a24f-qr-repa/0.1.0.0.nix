{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "qr-repa";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright: (c) 2016 Vanessa McHale";
        maintainer = "tmchale@wisc.edu";
        author = "Vanessa McHale";
        homepage = "https://github.com/vmchale/QRRepa#readme";
        url = "";
        synopsis = "Library to generate QR codes from bytestrings and objects and scale image files";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        qr-repa = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.bytestring
            hsPkgs.lens
            hsPkgs.cryptonite
            hsPkgs.jose-jwt
            hsPkgs.directory
            hsPkgs.haskell-qrencode
            hsPkgs.repa
            hsPkgs.vector
            hsPkgs.repa-devil
          ];
        };
        exes = {
          qrpipe = {
            depends  = [
              hsPkgs.base
              hsPkgs.qr-repa
              hsPkgs.bytestring
            ];
          };
        };
      };
    }