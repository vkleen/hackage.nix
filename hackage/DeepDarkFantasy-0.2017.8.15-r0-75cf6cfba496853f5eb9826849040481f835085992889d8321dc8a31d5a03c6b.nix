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
    flags = { werror = false; };
    package = {
      specVersion = "1.12";
      identifier = { name = "DeepDarkFantasy"; version = "0.2017.8.15"; };
      license = "LicenseRef-Apache";
      copyright = "";
      maintainer = "lolisa@marisa.moe";
      author = "";
      homepage = "";
      url = "";
      synopsis = "A DSL for creating neural network.";
      description = "Deep Dark Fantasy(DDF) is a domain specific language that allow one to automatically derive derivative of program in DDF. Hence, one can write neural network in DDF and use the derivative program for gradient descend. ";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."constraints" or (buildDepError "constraints"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."bimap" or (buildDepError "bimap"))
          (hsPkgs."recursion-schemes" or (buildDepError "recursion-schemes"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      tests = {
        "TestPoly" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."constraints" or (buildDepError "constraints"))
            (hsPkgs."DeepDarkFantasy" or (buildDepError "DeepDarkFantasy"))
            ];
          buildable = true;
          };
        "TestXor" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."constraints" or (buildDepError "constraints"))
            (hsPkgs."DeepDarkFantasy" or (buildDepError "DeepDarkFantasy"))
            ];
          buildable = true;
          };
        "TestPE" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."constraints" or (buildDepError "constraints"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."DeepDarkFantasy" or (buildDepError "DeepDarkFantasy"))
            ];
          buildable = true;
          };
        };
      };
    }