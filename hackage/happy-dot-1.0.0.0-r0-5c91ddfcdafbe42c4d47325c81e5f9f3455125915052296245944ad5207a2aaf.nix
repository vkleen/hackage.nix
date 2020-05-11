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
      identifier = { name = "happy-dot"; version = "1.0.0.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "marcelogmillani@gmail.com";
      author = "Marcelo Garlet Millani";
      homepage = "";
      url = "";
      synopsis = "Parser for dot made with happy.";
      description = "A parser for the [DOT language](https://www.graphviz.org/doc/info/lang.html).\nThe parser is quite fast as it uses happy.\n\nThis library also includes some convenience functions for\noutputing DOT files and for converting DOT files into\ngraphs.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.happy or (pkgs.buildPackages.happy or (buildToolDepError "happy")))
          ];
        buildable = true;
        };
      tests = {
        "test-ast" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = true;
          };
        "test-pretty" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            ];
          buildable = true;
          };
        "test-utils" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench-happy-dot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."clock" or (buildDepError "clock"))
            ];
          buildable = true;
          };
        "bench-language-dot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."clock" or (buildDepError "clock"))
            (hsPkgs."language-dot" or (buildDepError "language-dot"))
            ];
          buildable = true;
          };
        };
      };
    }