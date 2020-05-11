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
      identifier = { name = "Learning"; version = "0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Bogdan Penkovsky";
      maintainer = "dev at penkovsky [dot] com";
      author = "Bogdan Penkovsky";
      homepage = "https://github.com/masterdezign/Learning#readme";
      url = "";
      synopsis = "The most frequently used machine learning tools";
      description = "Please see the README on Github at <https://github.com/masterdezign/Learning#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "learning-pca" = {
          depends = [
            (hsPkgs."Learning" or (buildDepError "Learning"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        "learning-pca-advanced" = {
          depends = [
            (hsPkgs."Learning" or (buildDepError "Learning"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      tests = {
        "Learning-test" = {
          depends = [
            (hsPkgs."Learning" or (buildDepError "Learning"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }