{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "definitive-base";
          version = "1.0";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "";
        maintainer = "marc.coiffier@gmail.com";
        author = "Marc Coiffier";
        homepage = "";
        url = "";
        synopsis = "The base modules of the Definitive framework.";
        description = "The Definitive framework is an attempt at harnessing the declarative\nnature of Haskell to provide a solid and simple base for writing\nreal-world programs, as well as complex algorithms.\nThis package contains the base modules of the framework, and provides\nonly the most basic functionality, ranging from basic algebraic\nstructures, such as monoids and rings, to functors, applicative functors,\nmonads and transformers.\nLenses are used heavily in all the framework's abstractions, replacing\nmore traditional functions ('WriterT' and 'runWriterT' are implemented\nin the same isomorphism 'writerT', for example). When used wisely,\nlenses can greatly improve clarity in both code and thought, so I\ntried to provide for them in the most ubiquitous way possible,\ndefining them as soon as possible. Isomorphisms in particular are\nsurprisingly useful in many instances, from converting between types\nto acting on a value's representation as if it were the value itself.\nPackages using the Definitive framework should be compiled with the\nRebindableSyntax flag and include the Algebra module, which exports\nthe same interface as the Prelude, except for some extras.\nHere is a list of design differences between the standard Prelude\nand the Definitive framework :\n- The '+', '-', 'negate', and '*' are now part of the Semigroup,\nDisjonctive, Negative, Semiring classes instead of Num (default\ninstances are defined to reimplement the Prelude, making it easy\nto adjust your code for compatibility)\n- The mapM, traverseM, liftM, and such functions have been hidden,\nsince they only reimplement the traverse, map, and other simpler\nfunctions.\n- Lenses are used whenever possible instead of more usual functions.\nYou are encouraged to read the interface for the Algebra.Lens\nmodule, which contains everything you will need to be able to use\nlenses to their full potential (except maybe a good explanation).";
        buildType = "Simple";
      };
      components = {
        definitive-base = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.deepseq
            hsPkgs.array
            hsPkgs.bytestring
            hsPkgs.clock
            hsPkgs.vector
            hsPkgs.primitive
          ];
        };
      };
    }