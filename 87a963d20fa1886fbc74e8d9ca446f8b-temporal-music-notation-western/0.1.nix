{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "temporal-music-notation-western";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Anton Kholomiov";
        author = "Anton Kholomiov";
        homepage = "";
        url = "";
        synopsis = "music notation";
        description = "Localization of 'temporal-music-notation' library for\nWestern music tradition.";
        buildType = "Simple";
      };
      components = {
        temporal-music-notation-western = {
          depends  = [
            hsPkgs.base
            hsPkgs.base
            hsPkgs.temporal-music-notation
          ];
        };
      };
    }