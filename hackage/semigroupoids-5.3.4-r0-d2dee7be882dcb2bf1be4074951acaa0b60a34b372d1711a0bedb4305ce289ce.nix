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
    flags = {
      containers = true;
      contravariant = true;
      distributive = true;
      doctests = true;
      comonad = true;
      tagged = true;
      unordered-containers = true;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "semigroupoids"; version = "5.3.4"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2011-2015 Edward A. Kmett";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett";
      homepage = "http://github.com/ekmett/semigroupoids";
      url = "";
      synopsis = "Semigroupoids: Category sans id";
      description = "Provides a wide array of (semi)groupoids and operations for working with them.\n\nA 'Semigroupoid' is a 'Category' without the requirement of identity arrows for every object in the category.\n\nA 'Category' is any 'Semigroupoid' for which the Yoneda lemma holds.\n\nWhen working with comonads you often have the @\\<*\\>@ portion of an @Applicative@, but\nnot the @pure@. This was captured in Uustalu and Vene's \\\"Essence of Dataflow Programming\\\"\nin the form of the @ComonadZip@ class in the days before @Applicative@. Apply provides a weaker invariant, but for the comonads used for data flow programming (found in the streams package), this invariant is preserved. Applicative function composition forms a semigroupoid.\n\nSimilarly many structures are nearly a comonad, but not quite, for instance lists provide a reasonable 'extend' operation in the form of 'tails', but do not always contain a value.\n\nIdeally the following relationships would hold:\n\n> Foldable ----> Traversable <--- Functor ------> Alt ---------> Plus           Semigroupoid\n>      |               |            |                              |                  |\n>      v               v            v                              v                  v\n> Foldable1 ---> Traversable1     Apply --------> Applicative -> Alternative      Category\n>                                   |               |              |                  |\n>                                   v               v              v                  v\n>                                 Bind ---------> Monad -------> MonadPlus          Arrow\n>\n\nApply, Bind, and Extend (not shown) give rise the Static, Kleisli and Cokleisli semigroupoids respectively.\n\nThis lets us remove many of the restrictions from various monad transformers\nas in many cases the binding operation or @\\<*\\>@ operation does not require them.\n\nFinally, to work with these weaker structures it is beneficial to have containers\nthat can provide stronger guarantees about their contents, so versions of 'Traversable'\nand 'Foldable' that can be folded with just a 'Semigroup' are added.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (buildToolDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (buildToolDepError "Cabal")))
        (hsPkgs.buildPackages.cabal-doctest or (pkgs.buildPackages.cabal-doctest or (buildToolDepError "cabal-doctest")))
        ];
      };
    components = {
      "library" = {
        depends = (((((((([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-orphans" or (buildDepError "base-orphans"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && ((compiler.version).ge "7.0" && (compiler.version).lt "7.2")) (hsPkgs."generic-deriving" or (buildDepError "generic-deriving"))) ++ (pkgs.lib).optional (compiler.isGhc && ((compiler.version).ge "7.2" && (compiler.version).lt "7.6")) (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))) ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (buildDepError "semigroups"))) ++ (pkgs.lib).optional (flags.containers) (hsPkgs."containers" or (buildDepError "containers"))) ++ (pkgs.lib).optional (flags.contravariant) (hsPkgs."contravariant" or (buildDepError "contravariant"))) ++ (pkgs.lib).optional (flags.distributive) (hsPkgs."distributive" or (buildDepError "distributive"))) ++ (pkgs.lib).optional (flags.comonad) (hsPkgs."comonad" or (buildDepError "comonad"))) ++ (pkgs.lib).optional (flags.tagged) (hsPkgs."tagged" or (buildDepError "tagged"))) ++ (pkgs.lib).optionals (flags.unordered-containers) [
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "doctests" = {
          depends = (pkgs.lib).optionals (!(!flags.doctests)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
            ];
          buildable = if !flags.doctests then false else true;
          };
        };
      };
    }