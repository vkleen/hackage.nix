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
      specVersion = "1.18";
      identifier = { name = "speculate"; version = "0.3.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Rudy Matela <rudy@matela.com.br>";
      author = "Rudy Matela,  Colin Runciman";
      homepage = "https://github.com/rudymatela/speculate#readme";
      url = "";
      synopsis = "discovery of properties about Haskell functions";
      description = "Speculate automatically discovers laws about Haskell functions.\nGive Speculate a bunch of Haskell functions and it will discover laws like:\n\n* equations, such as @ id x == x @;\n\n* inequalities, such as @ 0 <= x * x @;\n\n* conditional equations, such as @ x \\<= 0  ==\\>  x + abs x == 0 @.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."leancheck" or (buildDepError "leancheck"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      tests = {
        "creason" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "engine" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "eval" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "expr" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "match" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "misc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "order" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "reason" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "utils" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "plus-abs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        "test-stats" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."leancheck" or (buildDepError "leancheck"))
            (hsPkgs."speculate" or (buildDepError "speculate"))
            ];
          buildable = true;
          };
        };
      };
    }