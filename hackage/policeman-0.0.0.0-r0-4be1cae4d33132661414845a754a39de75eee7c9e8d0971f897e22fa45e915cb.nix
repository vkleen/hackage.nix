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
      specVersion = "2.4";
      identifier = { name = "policeman"; version = "0.0.0.0"; };
      license = "MPL-2.0";
      copyright = "2020 Kowainik";
      maintainer = "Kowainik <xrom.xkov@gmail.com>";
      author = "Kowainik";
      homepage = "https://github.com/kowainik/policeman";
      url = "";
      synopsis = "Haskell PVP version adviser";
      description = "Policeman assists to properly choose the next version number\naccording to PVP (Packaging Version Policy) for the Haskell packages based on\nthe semantical changes to the interface.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."relude" or (buildDepError "relude"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."dir-traverse" or (buildDepError "dir-traverse"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."gitrev" or (buildDepError "gitrev"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."shellmet" or (buildDepError "shellmet"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      exes = {
        "policeman" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."policeman" or (buildDepError "policeman"))
            ];
          buildable = true;
          };
        };
      tests = {
        "policeman-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."policeman" or (buildDepError "policeman"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }