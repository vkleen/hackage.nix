{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "contstuff";
          version = "0.5.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2010 Ertugrul Söylemez";
        maintainer = "Ertugrul Söylemez <es@ertes.de>";
        author = "Ertugrul Söylemez <es@ertes.de>";
        homepage = "http://haskell.org/haskellwiki/Contstuff";
        url = "";
        synopsis = "Easy to use CPS-based monads";
        description = "This library implements easy to use CPS-based monads.";
        buildType = "Simple";
      };
      components = {
        contstuff = {
          depends  = [ hsPkgs.base ];
        };
      };
    }