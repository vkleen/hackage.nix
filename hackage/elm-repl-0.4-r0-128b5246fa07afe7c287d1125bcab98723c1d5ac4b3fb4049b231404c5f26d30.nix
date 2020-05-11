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
      specVersion = "1.8";
      identifier = { name = "elm-repl"; version = "0.4"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2011-2014 Evan Czaplicki";
      maintainer = "info@elm-lang.org";
      author = "Evan Czaplicki";
      homepage = "https://github.com/elm-lang/elm-repl";
      url = "";
      synopsis = "a REPL for Elm";
      description = "A read-eval-print-loop (REPL) for evaluating Elm expressions,\ndefinitions, ADTs, and module imports. This tool is meant to\nhelp you play with small expressions and interact with\nfunctions deep inside of larger projects.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "elm-repl" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."bytestring-trie" or (buildDepError "bytestring-trie"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."elm-compiler" or (buildDepError "elm-compiler"))
            (hsPkgs."elm-package" or (buildDepError "elm-package"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."bytestring-trie" or (buildDepError "bytestring-trie"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."elm-compiler" or (buildDepError "elm-compiler"))
            (hsPkgs."elm-package" or (buildDepError "elm-package"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      };
    }