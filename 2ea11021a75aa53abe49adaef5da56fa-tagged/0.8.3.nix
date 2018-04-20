{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      deepseq = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "tagged";
          version = "0.8.3";
        };
        license = "BSD-3-Clause";
        copyright = "2009-2015 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/ekmett/tagged";
        url = "";
        synopsis = "Haskell 98 phantom types to avoid unsafely passing dummy arguments";
        description = "Haskell 98 phantom types to avoid unsafely passing dummy arguments";
        buildType = "Simple";
      };
      components = {
        tagged = {
          depends  = (([
            hsPkgs.base
          ] ++ pkgs.lib.optional compiler.isGhc hsPkgs.ghc-prim) ++ pkgs.lib.optional compiler.isGhc hsPkgs.template-haskell) ++ pkgs.lib.optional _flags.deepseq hsPkgs.deepseq;
        };
      };
    }