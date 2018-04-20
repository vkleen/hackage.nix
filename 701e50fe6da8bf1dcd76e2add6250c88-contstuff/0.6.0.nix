{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "contstuff";
          version = "0.6.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2010 Ertugrul Söylemez";
        maintainer = "Ertugrul Söylemez <es@ertes.de>";
        author = "Ertugrul Söylemez <es@ertes.de>";
        homepage = "http://haskell.org/haskellwiki/Contstuff";
        url = "";
        synopsis = "Fast, easy to use CPS-based monads";
        description = "This library implements fast and easy to use CPS-based monad\ntransformers.  Most of the usual monads are implemented.";
        buildType = "Simple";
      };
      components = {
        contstuff = {
          depends  = [ hsPkgs.base ];
        };
      };
    }