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
      identifier = { name = "time-exts"; version = "3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2013-2016 Enzo Haussecker";
      maintainer = "enzo@sovereign.io";
      author = "Enzo Haussecker";
      homepage = "";
      url = "";
      synopsis = "Yet another time library";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."lens-simple" or (buildDepError "lens-simple"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."tz" or (buildDepError "tz"))
          ];
        buildable = true;
        };
      tests = {
        "time-exts-unit-tests" = {
          depends = [
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."ieee754" or (buildDepError "ieee754"))
            (hsPkgs."lens-simple" or (buildDepError "lens-simple"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."tz" or (buildDepError "tz"))
            ];
          buildable = true;
          };
        };
      };
    }