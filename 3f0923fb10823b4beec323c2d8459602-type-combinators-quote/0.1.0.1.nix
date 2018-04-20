{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "type-combinators-quote";
          version = "0.1.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2015 Kyle Carter, all rights reserved";
        maintainer = "kylcarte@gmail.com";
        author = "Kyle Carter";
        homepage = "https://github.com/kylcarte/type-combinators-quote";
        url = "";
        synopsis = "Quasiquoters for the 'type-combinators' package.";
        description = "";
        buildType = "Simple";
      };
      components = {
        type-combinators-quote = {
          depends  = [
            hsPkgs.base
            hsPkgs.type-combinators
            hsPkgs.template-haskell
            hsPkgs.haskell-src-meta
          ];
        };
      };
    }