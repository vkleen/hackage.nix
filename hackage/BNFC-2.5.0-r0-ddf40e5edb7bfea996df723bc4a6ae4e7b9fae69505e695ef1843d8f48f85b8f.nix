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
    flags = {
      haskell-tests = true;
      java-tests = true;
      c-tests = true;
      cpp-tests = true;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "BNFC"; version = "2.5.0"; };
      license = "LicenseRef-GPL";
      copyright = "(c) Krasimir Angelov, Jean-Philippe Bernardy, Bjorn Bringert, Johan Broberg, Paul Callaghan, Markus Forsberg, Ola Frid, Peter Gammie, Patrik Jansson, Kristofer Johannisson, Antti-Juhani Kaijanaho, Ulf Norell, Michael Pellauer and Aarne Ranta 2002 - 2012. Free software under GNU General Public License (GPL).";
      maintainer = "bnfc-dev@googlegroups.com";
      author = "";
      homepage = "http://bnfc.digitalgrammars.com/";
      url = "";
      synopsis = "A compiler front-end generator.";
      description = "The BNF Converter is a compiler construction tool generating a compiler front-end\nfrom a Labelled BNF grammar. It was originally written to generate Haskell,\nbut starting from Version 2.0, it can also be used for generating Java, C++, and C.\n\nGiven a Labelled BNF grammar the tool produces:\nan abstract syntax as a Haskell/C++/C module or Java directory,\na case skeleton for the abstract syntax in the same language,\nan Alex, JLex, or Flex lexer generator file,\na Happy, CUP, or Bison parser generator file,\na pretty-printer as a Haskell/Java/C++/C module,\na Latex file containing a readable specification of the language.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          ];
        buildable = true;
        };
      exes = {
        "bnfc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = true;
          };
        };
      tests = {
        "system-tests-haskell" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if flags.haskell-tests then true else false;
          };
        "system-tests-java" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if flags.java-tests then true else false;
          };
        "system-tests-c" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if flags.c-tests then true else false;
          };
        "system-tests-cpp" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if flags.cpp-tests then true else false;
          };
        "system-tests-cpp-no-stl" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if flags.cpp-tests then true else false;
          };
        "unit-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            ];
          buildable = true;
          };
        };
      };
    }