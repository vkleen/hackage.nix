{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "socket";
          version = "0.6.1.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "info@lars-petersen.net";
        author = "Lars Petersen";
        homepage = "https://github.com/lpeterse/haskell-socket";
        url = "";
        synopsis = "An extensible socket library.";
        description = "This library is a minimal cross platform interface for\nBSD style networking.";
        buildType = "Simple";
      };
      components = {
        socket = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
          ];
          libs = pkgs.lib.optional system.isWindows pkgs.ws2_32;
        };
        tests = {
          default = {
            depends  = [
              hsPkgs.base
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.async
              hsPkgs.bytestring
              hsPkgs.socket
            ];
          };
          threaded = {
            depends  = [
              hsPkgs.base
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.async
              hsPkgs.bytestring
              hsPkgs.socket
            ];
          };
        };
      };
    }