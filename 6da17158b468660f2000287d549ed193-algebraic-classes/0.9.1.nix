{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "algebraic-classes";
          version = "0.9.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "sjoerd@w3future.com";
        author = "Sjoerd Visscher";
        homepage = "https://github.com/sjoerdvisscher/algebraic-classes";
        url = "";
        synopsis = "Conversions between algebraic classes and F-algebras.";
        description = "Algebraic classes are type classes where all the methods return a value of the same type, which is also the class parameter.\nExamples from @base@ are @Num@ and @Monoid@.\n\nF-algebras are functions @f a -> a@, where the functor @f@ is called the signature, and the type @a@ the carrier.\n\nThis package relates these 2 concepts, and can create conversions between the two using Template Haskell.\nMore specifically, it can generate:\n\n* signatures from algebraic classes\n\n* instances of algebraic classes from F-algebras.\n\nThis is useful because type classes are more commonly used in Haskell than F-algebras, but F-algebras are\neasier to work with, because they are just functions.";
        buildType = "Simple";
      };
      components = {
        algebraic-classes = {
          depends  = [
            hsPkgs.base
            hsPkgs.syb
            hsPkgs.template-haskell
          ];
        };
      };
    }