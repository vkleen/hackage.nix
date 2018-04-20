{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      examples = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "udev";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2013, Sam Truzjan";
        maintainer = "pxqr.sta@gmail.com";
        author = "Sam Truzjan";
        homepage = "https://github.com/pxqr/udev";
        url = "";
        synopsis = "libudev bindings";
        description = "libudev bindings";
        buildType = "Simple";
      };
      components = {
        udev = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.unix
            hsPkgs.posix-paths
          ];
          pkgconfig = [
            pkgconfPkgs.libudev
          ];
        };
        exes = {
          hidraw = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.udev
            ];
          };
          monitor = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.udev
              hsPkgs.select
            ];
          };
        };
      };
    }