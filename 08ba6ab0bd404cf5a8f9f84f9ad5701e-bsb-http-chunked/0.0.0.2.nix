{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "bsb-http-chunked";
          version = "0.0.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2010-2014 Simon Meier\n(c) 2010 Jasper Van der Jeugt\n(c) 2013-2015 Leon P Smith";
        maintainer = "Simon Jakobi <simon.jakobi@gmail.com>";
        author = "Jasper Van der Jeugt, Simon Meier, Leon P Smith";
        homepage = "http://github.com/sjakobi/bsb-http-chunked";
        url = "";
        synopsis = "Chunked HTTP transfer encoding for bytestring builders";
        description = "This library contains functions for encoding [bytestring\nbuilders](http://hackage.haskell.org/package/bytestring/docs/Data-ByteString-Builder.html#t:Builder)\nfor [chunked HTTP\\/1.1 transfer](https://en.wikipedia.org/wiki/Chunked_transfer_encoding).\n\nThis functionality was extracted from\nthe [blaze-builder](http://hackage.haskell.org/package/blaze-builder)\npackage.";
        buildType = "Simple";
      };
      components = {
        bsb-http-chunked = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.bytestring-builder
          ];
        };
      };
    }