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
      specVersion = "1.10";
      identifier = { name = "th-instance-reification"; version = "0.1.0"; };
      license = "MIT";
      copyright = "(c) 2014, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/th-instance-reification ";
      url = "";
      synopsis = "Fixed versions of instances reification functions";
      description = "Provides fixed versions of 'reifyInstances' and 'isInstance' as per\nthe following ghc issue:\n<https://ghc.haskell.org/trac/ghc/ticket/7066>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."loch-th" or (buildDepError "loch-th"))
          (hsPkgs."placeholders" or (buildDepError "placeholders"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        buildable = true;
        };
      tests = {
        "th-instance-reification-htf-test-suite" = {
          depends = [
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."QuickCheck-GenT" or (buildDepError "QuickCheck-GenT"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."loch-th" or (buildDepError "loch-th"))
            (hsPkgs."placeholders" or (buildDepError "placeholders"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = true;
          };
        };
      };
    }