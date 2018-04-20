{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yesod-table";
          version = "1.0.4";
        };
        license = "MIT";
        copyright = "";
        maintainer = "andrew.thaddeus@gmail.com";
        author = "Andrew Martin";
        homepage = "https://github.com/andrewthad/yesod-table";
        url = "";
        synopsis = "HTML tables for Yesod";
        description = "HTML tables for Yesod";
        buildType = "Simple";
      };
      components = {
        yesod-table = {
          depends  = [
            hsPkgs.base
            hsPkgs.yesod-core
            hsPkgs.containers
            hsPkgs.contravariant
            hsPkgs.text
            hsPkgs.bytestring
          ];
        };
      };
    }