{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "possible";
          version = "0.1.0.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "tolysz@gmail.com";
        author = "Marcin Tolysz";
        homepage = "https://github.com/tolysz/possible";
        url = "";
        synopsis = "Three valued Data.Maybe";
        description = "Maybe lacks the information if Nothing represents missing or empty value.\nThe idea is to have http://en.wikipedia.org/wiki/Three-valued_logic for values.\nDepends on Aeson having missing value.";
        buildType = "Simple";
      };
      components = {
        possible = {
          depends  = [
            hsPkgs.base
          ] ++ pkgs.lib.optional compiler.isGhc hsPkgs.ghc-prim;
        };
      };
    }