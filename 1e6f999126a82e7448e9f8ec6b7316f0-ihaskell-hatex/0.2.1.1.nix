{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.16";
        identifier = {
          name = "ihaskell-hatex";
          version = "0.2.1.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "andrew.gibiansky@gmail.com";
        author = "Adam Vogt";
        homepage = "http://www.github.com/gibiansky/IHaskell";
        url = "";
        synopsis = "IHaskell display instances for hatex";
        description = "";
        buildType = "Simple";
      };
      components = {
        ihaskell-hatex = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
            hsPkgs.HaTeX
            hsPkgs.ihaskell
          ];
        };
      };
    }