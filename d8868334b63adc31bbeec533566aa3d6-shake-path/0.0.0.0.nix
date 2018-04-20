{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "shake-path";
          version = "0.0.0.0";
        };
        license = "MIT";
        copyright = "Copyright: (c) 2017 Tom Sydney Kerckhove";
        maintainer = "syd.kerckhove@gmail.com";
        author = "Tom Sydney Kerckhove";
        homepage = "http://cs-syd.eu";
        url = "";
        synopsis = "path alternatives to shake functions";
        description = "path alternatives to shake functions";
        buildType = "Simple";
      };
      components = {
        shake-path = {
          depends  = [
            hsPkgs.base
            hsPkgs.shake
            hsPkgs.path
            hsPkgs.path-io
          ];
        };
      };
    }