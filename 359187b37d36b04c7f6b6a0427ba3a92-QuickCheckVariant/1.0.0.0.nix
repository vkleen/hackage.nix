{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "QuickCheckVariant";
          version = "1.0.0.0";
        };
        license = "GPL-3.0-only";
        copyright = "(c) Jorge Santiago Alvarez Cuadros";
        maintainer = "sanjorgek@ciencias.unam.mx";
        author = "Jorge Santiago Alvarez Cuadros";
        homepage = "https://github.com/sanjorgek/QuickCheckVariant";
        url = "";
        synopsis = "Generator of \"valid\" and \"invalid\" data in a type class";
        description = "Generator of \"valid\" and \"invalid\" data in a type class";
        buildType = "Simple";
      };
      components = {
        QuickCheckVariant = {
          depends  = [
            hsPkgs.base
            hsPkgs.QuickCheck
          ];
        };
        tests = {
          variant = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.QuickCheck
              hsPkgs.QuickCheckVariant
            ];
          };
        };
      };
    }