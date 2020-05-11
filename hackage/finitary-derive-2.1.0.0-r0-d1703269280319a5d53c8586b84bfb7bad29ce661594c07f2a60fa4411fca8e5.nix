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
      specVersion = "2.2";
      identifier = { name = "finitary-derive"; version = "2.1.0.0"; };
      license = "GPL-3.0-or-later";
      copyright = "(C) Koz Ross 2019";
      maintainer = "koz.ross@retro-freedom.nz";
      author = "Koz Ross";
      homepage = "https://notabug.org/koz.ross/finitary-derive";
      url = "";
      synopsis = "Flexible and easy deriving of type classes for finitary\ntypes.";
      description = "Provides a collection of wrappers, allowing you to easily\ndefine (among others) Unbox, Storable, Hashable and\nBinary instances for finitary types with flexibility in\nterms of representation and efficiency. Never write an\nUnbox instance by hand again!";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."finitary" or (buildDepError "finitary"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."coercible-utils" or (buildDepError "coercible-utils"))
          (hsPkgs."finite-typelits" or (buildDepError "finite-typelits"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."ghc-typelits-extra" or (buildDepError "ghc-typelits-extra"))
          (hsPkgs."ghc-typelits-knownnat" or (buildDepError "ghc-typelits-knownnat"))
          (hsPkgs."vector-instances" or (buildDepError "vector-instances"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."bitvec" or (buildDepError "bitvec"))
          (hsPkgs."vector-binary-instances" or (buildDepError "vector-binary-instances"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hedgehog-classes" or (buildDepError "hedgehog-classes"))
            (hsPkgs."finitary-derive" or (buildDepError "finitary-derive"))
            (hsPkgs."finitary" or (buildDepError "finitary"))
            (hsPkgs."finite-typelits" or (buildDepError "finite-typelits"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ];
          buildable = true;
          };
        };
      };
    }