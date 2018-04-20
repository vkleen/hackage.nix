{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "mysql-effect";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "tob@butter.sh";
        author = "Tobias Florek";
        homepage = "https://github.com/ibotty/mysql-effect";
        url = "";
        synopsis = "An extensible mysql effect using extensible-effects and mysql-simple";
        description = "Any help (especially documentation) is very welcome,";
        buildType = "Simple";
      };
      components = {
        mysql-effect = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.extensible-effects
            hsPkgs.mysql-simple
          ];
        };
      };
    }