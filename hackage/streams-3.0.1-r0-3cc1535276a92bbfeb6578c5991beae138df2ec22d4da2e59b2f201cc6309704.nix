let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.6";
      identifier = { name = "streams"; version = "3.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2011-2013 Edward Kmett\nCopyright 2010 Tony Morris, Oliver Taylor, Eelis van der Weegen\nCopyright 2007-2010 Wouter Swierstra, Bas van Dijk\nCopyright 2008 Iavor S. Diatchki";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett";
      homepage = "http://github.com/ekmett/streams/issues";
      url = "";
      synopsis = "Various Haskell 2010 stream comonads";
      description = "Various Haskell 2010 stream comonads.\n* \"Data.Stream.Future\" provides a coinductive anti-causal stream, or non-empty 'ZipList'. The comonad provides access to only the\ntail of the stream. Like a conventional 'ZipList', this is /not/ a monad.\n\n> data Future a = Last a | a :< Future a\n\n* \"Data.Stream.Future.Skew\" provides a non-empty skew-binary random-access-list with the semantics of @Data.Stream.Future@. As with\n\"Data.Stream.Future\" this stream is not a 'Monad', since the 'Applicative' instance zips streams of potentially differing lengths.\nThe random-access-list structure provides a number of operations logarithmic access time, but makes 'Data.Stream.Future.Skew.cons'\nless productive. Where applicable \"Data.Stream.Infinite.Skew\" may be more efficient, due to a lazier and more efficient 'Applicative'\ninstance.\n\n>\n\n* \"Data.Stream.Infinite\" provides a coinductive infinite anti-causal stream. The 'Comonad' provides access to the tail of the\nstream and the 'Applicative' zips streams together. Unlike 'Future', infinite stream form a 'Monad'. The monad diagonalizes\nthe 'Stream', which is consistent with the behavior of the 'Applicative', and the view of a 'Stream' as a isomorphic to the reader\nmonad from the natural numbers. Being infinite in length, there is no 'Alternative' instance, but instead the 'FunctorAlt'\ninstance provides access to the 'Semigroup' of interleaving streams.\n\n> data Stream a = a :< Stream a\n\n* \"Data.Stream.Infinite.Skew\" provides an infinite skew-binary random-access-list with the semantics of \"Data.Stream.Infinite\"\nSince every stream is infinite, the 'Applicative' instance can be considerably less strict than the corresponding instance for\n\"Data.Stream.Future.Skew\" and performs asymptotically better.\n\n>\n\n* \"Data.Stream.Infinite.Functional.Zipper\" provides a bi-infinite sequence, represented as a pure function with an accumulating\nparameter added to optimize moving the current focus.\n\n> data Zipper a = !Integer :~ (Integer -> a)\n\n* \"Data.Stream.Supply\" provides a comonadic supply of unique values, which are\ngenerated impurely as the tree is explored.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."distributive" or (buildDepError "distributive"))
          (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          ];
        buildable = true;
        };
      };
    }