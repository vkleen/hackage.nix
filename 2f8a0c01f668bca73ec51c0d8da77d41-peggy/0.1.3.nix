{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "peggy";
          version = "0.1.3";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c)2011, Hideyuki Tanaka";
        maintainer = "Hideyuki Tanaka <tanaka.hideyuki@gmail.com>";
        author = "Hideyuki Tanaka";
        homepage = "http://github.com/tanakh/peggy";
        url = "";
        synopsis = "The Parser Generator for Haskell";
        description = "The Parser Generator for Haskell";
        buildType = "Simple";
      };
      components = {
        peggy = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.ListLike
            hsPkgs.hashtables
            hsPkgs.monad-control
            hsPkgs.parsec
            hsPkgs.template-haskell
            hsPkgs.haskell-src-meta
          ];
        };
        exes = {
          peggy = {
            depends  = [
              hsPkgs.base
              hsPkgs.mtl
              hsPkgs.ListLike
              hsPkgs.hashtables
              hsPkgs.monad-control
              hsPkgs.parsec
              hsPkgs.template-haskell
              hsPkgs.haskell-src-meta
            ];
          };
        };
      };
    }