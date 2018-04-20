{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "SDL-mixer";
          version = "0.6.0";
        };
        license = "BSD-3-Clause";
        copyright = "2004-2010, Lemmih";
        maintainer = "Lemmih (lemmih@gmail.com)";
        author = "Lemmih (lemmih@gmail.com)";
        homepage = "";
        url = "";
        synopsis = "Binding to libSDL_mixer";
        description = "";
        buildType = "Custom";
      };
      components = {
        SDL-mixer = {
          depends  = [
            hsPkgs.base
            hsPkgs.SDL
          ];
        };
      };
    }