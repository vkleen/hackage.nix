{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.22";
        identifier = {
          name = "ether";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Index Int <vlad.z.4096@gmail.com>";
        author = "Index Int";
        homepage = "https://int-index.github.io/ether/";
        url = "";
        synopsis = "Monad transformers and classes";
        description = "Ether is a Haskell library that extends @mtl@ and @transformers@ with\ntagged monad transformers and classes in a compatible way.";
        buildType = "Simple";
      };
      components = {
        ether = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.mtl
            hsPkgs.template-haskell
            hsPkgs.newtype-generics
          ];
        };
        tests = {
          regression = {
            depends  = [
              hsPkgs.base
              hsPkgs.transformers
              hsPkgs.mtl
              hsPkgs.tasty
              hsPkgs.tasty-quickcheck
              hsPkgs.QuickCheck
              hsPkgs.ether
            ];
          };
        };
      };
    }