{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "SDL-gfx";
          version = "0.6.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "2004-2005, 2010, Lemmih";
        maintainer = "Francesco Ariis <fa-ml@ariis.it>";
        author = "Lemmih (lemmih@gmail.com)";
        homepage = "";
        url = "";
        synopsis = "Binding to libSDL_gfx";
        description = "";
        buildType = "Custom";
      };
      components = {
        SDL-gfx = {
          depends  = [
            hsPkgs.base
            hsPkgs.SDL
          ];
        };
      };
    }