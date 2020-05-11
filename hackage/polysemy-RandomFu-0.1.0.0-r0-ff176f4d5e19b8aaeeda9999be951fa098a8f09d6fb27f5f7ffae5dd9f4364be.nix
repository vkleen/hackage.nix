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
      specVersion = "1.12";
      identifier = { name = "polysemy-RandomFu"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Adam Conner-Sax";
      maintainer = "adam_conner_sax@yahoo.com";
      author = "Adam Conner-Sax";
      homepage = "https://github.com/adamConnerSax/polysemy-Extra#readme";
      url = "";
      synopsis = "Experimental, RandomFu effect and interpreters for polysemy";
      description = "Please see the README on GitHub at <https://github.com/adamConnerSax/polysemy-Extra/tree/master/polysemy-RandomFu#polysemy-randomfu>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."polysemy" or (buildDepError "polysemy"))
          (hsPkgs."polysemy-plugin" or (buildDepError "polysemy-plugin"))
          (hsPkgs."polysemy-zoo" or (buildDepError "polysemy-zoo"))
          (hsPkgs."random-fu" or (buildDepError "random-fu"))
          (hsPkgs."random-source" or (buildDepError "random-source"))
          ];
        buildable = true;
        };
      tests = {
        "polysemy-RandomFu-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."polysemy" or (buildDepError "polysemy"))
            (hsPkgs."polysemy-RandomFu" or (buildDepError "polysemy-RandomFu"))
            (hsPkgs."polysemy-plugin" or (buildDepError "polysemy-plugin"))
            (hsPkgs."polysemy-zoo" or (buildDepError "polysemy-zoo"))
            (hsPkgs."random-fu" or (buildDepError "random-fu"))
            (hsPkgs."random-source" or (buildDepError "random-source"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }