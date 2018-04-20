{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "jpeg";
          version = "0.0.1.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "J.D.Fokker@uu.nl";
        author = "Jeroen Fokker";
        homepage = "";
        url = "";
        synopsis = "A library for decoding JPEG files written in pure Haskell";
        description = "JPEG Decompression library";
        buildType = "Simple";
      };
      components = {
        jpeg = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
          ];
        };
      };
    }