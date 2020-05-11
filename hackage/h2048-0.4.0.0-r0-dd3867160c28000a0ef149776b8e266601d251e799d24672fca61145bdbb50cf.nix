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
      identifier = { name = "h2048"; version = "0.4.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Javran.C@gmail.com";
      author = "Javran Cheng";
      homepage = "https://github.com/Javran/h2048#readme";
      url = "";
      synopsis = "An Implementation of Game 2048";
      description = "An Implementation of Game 2048, based on <https://github.com/gabrielecirulli/2048>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."brick" or (buildDepError "brick"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."tf-random" or (buildDepError "tf-random"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
          (hsPkgs."vty" or (buildDepError "vty"))
          ];
        buildable = true;
        };
      exes = {
        "h2048-brick" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."brick" or (buildDepError "brick"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."h2048" or (buildDepError "h2048"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."tf-random" or (buildDepError "tf-random"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
            (hsPkgs."vty" or (buildDepError "vty"))
            ];
          buildable = true;
          };
        "h2048-simple" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."brick" or (buildDepError "brick"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."h2048" or (buildDepError "h2048"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."tf-random" or (buildDepError "tf-random"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
            (hsPkgs."vty" or (buildDepError "vty"))
            ];
          buildable = true;
          };
        };
      tests = {
        "hspec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."brick" or (buildDepError "brick"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."h2048" or (buildDepError "h2048"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."tf-random" or (buildDepError "tf-random"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
            (hsPkgs."vty" or (buildDepError "vty"))
            ];
          buildable = true;
          };
        };
      };
    }