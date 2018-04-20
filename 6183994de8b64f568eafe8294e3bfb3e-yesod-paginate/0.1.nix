{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      ghc7 = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "yesod-paginate";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2010 Alexander Dunlap";
        maintainer = "alexander.dunlap@gmail.com";
        author = "Alexander Dunlap";
        homepage = "";
        url = "";
        synopsis = "Pagination for Yesod sites.";
        description = "";
        buildType = "Simple";
      };
      components = {
        yesod-paginate = {
          depends  = [
            hsPkgs.yesod
            hsPkgs.template-haskell
          ] ++ [ hsPkgs.base ];
        };
      };
    }