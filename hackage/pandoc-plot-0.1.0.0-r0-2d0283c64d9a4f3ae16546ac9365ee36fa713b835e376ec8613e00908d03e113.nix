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
      identifier = { name = "pandoc-plot"; version = "0.1.0.0"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "Laurent P. René de Cotret";
      author = "Laurent P. René de Cotret";
      homepage = "https://github.com/LaurentRDC/pandoc-plot#readme";
      url = "";
      synopsis = "A Pandoc filter to include figures generated from code blocks using your plotting toolkit of choice.";
      description = "A Pandoc filter to include figures generated from code blocks. Keep the document and code in the same location. Output is captured and included as a figure.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."pandoc" or (buildDepError "pandoc"))
          (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."typed-process" or (buildDepError "typed-process"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        buildable = true;
        };
      exes = {
        "pandoc-plot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."open-browser" or (buildDepError "open-browser"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."pandoc-plot" or (buildDepError "pandoc-plot"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-expectations" or (buildDepError "hspec-expectations"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            (hsPkgs."pandoc-plot" or (buildDepError "pandoc-plot"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-hspec" or (buildDepError "tasty-hspec"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        };
      };
    }