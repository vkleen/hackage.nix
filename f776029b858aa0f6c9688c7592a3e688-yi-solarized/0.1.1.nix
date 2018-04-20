{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yi-solarized";
          version = "0.1.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "syd.kerckhove@gmail.com";
        author = "Tom Sydney Kerckhove";
        homepage = "https://github.com/NorfairKing/yi-solarized";
        url = "";
        synopsis = "Solarized colour theme for the Yi text editor";
        description = "Solarized colour theme for Yi. Check source for yi.hs usage.";
        buildType = "Simple";
      };
      components = {
        yi-solarized = {
          depends  = [
            hsPkgs.base
            hsPkgs.yi
          ];
        };
      };
    }