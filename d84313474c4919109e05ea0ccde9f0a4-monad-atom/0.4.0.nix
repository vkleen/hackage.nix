{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "monad-atom";
          version = "0.4.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "gchrupala@lsv.uni-saarland.de";
        author = "Grzegorz Chrupała";
        homepage = "https://bitbucket.org/gchrupala/lingo";
        url = "";
        synopsis = "Monadically convert object to unique integers and back.";
        description = "";
        buildType = "Simple";
      };
      components = {
        monad-atom = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.containers
            hsPkgs.ghc-prim
          ];
        };
      };
    }