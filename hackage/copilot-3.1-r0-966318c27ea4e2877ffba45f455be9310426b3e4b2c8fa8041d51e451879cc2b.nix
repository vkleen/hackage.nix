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
      identifier = { name = "copilot"; version = "3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Frank Dedden <dev@dedden.net>";
      author = "Frank Dedden, Nis Nordby Wegmann, Lee Pike, Robin Morisset, Sebastian Niller, Alwyn Goodloe";
      homepage = "https://copilot-language.github.io";
      url = "";
      synopsis = "A stream DSL for writing embedded C programs.";
      description = "This package is the main entry-point for using Copilot.\n\nCopilot is a stream (i.e., infinite lists) domain-specific language (DSL) in\nHaskell that compiles into embedded C.  Copilot contains an interpreter,\nmultiple back-end compilers, and other verification tools.  A tutorial, bug\nreports, and todos are available at\n<https://github.com/Copilot-Language/copilot-discussion>.\n\nExamples are available at <https://github.com/Copilot-Language/Copilot/tree/master/Examples>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."copilot-core" or (buildDepError "copilot-core"))
          (hsPkgs."copilot-theorem" or (buildDepError "copilot-theorem"))
          (hsPkgs."copilot-language" or (buildDepError "copilot-language"))
          (hsPkgs."copilot-libraries" or (buildDepError "copilot-libraries"))
          (hsPkgs."copilot-c99" or (buildDepError "copilot-c99"))
          ];
        buildable = true;
        };
      exes = {
        "addmult" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            ];
          buildable = true;
          };
        "array" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            ];
          buildable = true;
          };
        "cast" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            ];
          buildable = true;
          };
        "clock" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            (hsPkgs."copilot-libraries" or (buildDepError "copilot-libraries"))
            ];
          buildable = true;
          };
        "counter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            ];
          buildable = true;
          };
        "engine" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            ];
          buildable = true;
          };
        "heater" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            (hsPkgs."copilot-c99" or (buildDepError "copilot-c99"))
            ];
          buildable = true;
          };
        "voting" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."copilot" or (buildDepError "copilot"))
            ];
          buildable = true;
          };
        };
      };
    }