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
      identifier = { name = "egison"; version = "3.3.13"; };
      license = "MIT";
      copyright = "";
      maintainer = "Satoshi Egi <egi@egison.org>";
      author = "Satoshi Egi, Ryo Tanaka, Takahisa Watanabe, Kentaro Honda";
      homepage = "http://www.egison.org";
      url = "";
      synopsis = "Programming language with non-linear pattern-matching against unfree data";
      description = "An interpreter for Egison, the programming langugage that realized non-linear pattern-matching against unfree data types.\nWith Egison, we can directly represent pattern-matching against a wide range of data types such as lists, multisets, sets, trees and graphs.\nWe can find Egison programs in @lib@ and @sample@ directories.\nThis package also include Emacs Lisp file @elisp/egison-mode.el@.\n\nThe following code is the program that determines poker-hands written in Egison.\nAll hands are expressed in a single pattern.\nIsn't it exciting?\nWe can run this code online at <http://www.egison.org/demonstrations/poker-hands.html>.\n\n<<http://www.egison.org/images/poker-hands.png>>\n\nThe pattern-matching of Egison is very powerful.\nPlease view and try more demonstrations.\n\n<http://www.egison.org/demonstrations/>\n\nEgison makes programming dramatically simple.\nPlease help us to make Egison popular.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."haskeline" or (buildDepError "haskeline"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          (hsPkgs."strict-io" or (buildDepError "strict-io"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
          (hsPkgs."direct-sqlite" or (buildDepError "direct-sqlite"))
          ];
        buildable = true;
        };
      exes = {
        "egison" = {
          depends = [
            (hsPkgs."egison" or (buildDepError "egison"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."strict-io" or (buildDepError "strict-io"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."egison" or (buildDepError "egison"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."Glob" or (buildDepError "Glob"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "benchmark" = {
          depends = [
            (hsPkgs."egison" or (buildDepError "egison"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        };
      };
    }