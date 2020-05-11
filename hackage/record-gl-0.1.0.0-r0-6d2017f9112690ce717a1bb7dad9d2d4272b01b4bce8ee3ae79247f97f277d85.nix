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
      identifier = { name = "record-gl"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Original work copyright (C) 2013 Anthony Cowley, modifications copyright (C) 2015 Sebastián Méndez";
      maintainer = "sebas.chinoir@gmail.com";
      author = "Sebastián Méndez";
      homepage = "";
      url = "";
      synopsis = "Utilities for working with OpenGL's GLSL shading language and Nikita Volkov's \"Record\"s.";
      description = "Using Nikita Volkov's \"Record\" records\nto carry GLSL uniform parameters and vertex data enables\nlibrary code to reflect over the types of the data to\nfacilitate interaction between Haskell and GLSL.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."GLUtil" or (buildDepError "GLUtil"))
          (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."linear" or (buildDepError "linear"))
          (hsPkgs."record" or (buildDepError "record"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."record" or (buildDepError "record"))
            (hsPkgs."record-gl" or (buildDepError "record-gl"))
            (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            ];
          buildable = true;
          };
        };
      };
    }