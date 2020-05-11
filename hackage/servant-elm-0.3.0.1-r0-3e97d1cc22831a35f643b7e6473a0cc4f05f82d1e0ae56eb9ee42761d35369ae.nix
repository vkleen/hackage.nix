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
    flags = { examples = false; integration = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "servant-elm"; version = "0.3.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2015-2016 Matt Bray";
      maintainer = "mattjbray@gmail.com";
      author = "Matt Bray";
      homepage = "http://github.com/mattjbray/servant-elm#readme";
      url = "";
      synopsis = "Automatically derive Elm functions to query servant webservices.";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."elm-export" or (buildDepError "elm-export"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."servant-foreign" or (buildDepError "servant-foreign"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."wl-pprint-text" or (buildDepError "wl-pprint-text"))
          ];
        buildable = true;
        };
      exes = {
        "books-example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."elm-export" or (buildDepError "elm-export"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-elm" or (buildDepError "servant-elm"))
            ];
          buildable = if !flags.examples then false else true;
          };
        "e2e-tests-example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."elm-export" or (buildDepError "elm-export"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-elm" or (buildDepError "servant-elm"))
            ];
          buildable = if !flags.examples then false else true;
          };
        "giphy-example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."elm-export" or (buildDepError "elm-export"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-elm" or (buildDepError "servant-elm"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if !flags.examples then false else true;
          };
        "readme-example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."elm-export" or (buildDepError "elm-export"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-elm" or (buildDepError "servant-elm"))
            ];
          buildable = if !flags.examples then false else true;
          };
        };
      tests = {
        "servant-elm-test" = {
          depends = [
            (hsPkgs."Diff" or (buildDepError "Diff"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."elm-export" or (buildDepError "elm-export"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-elm" or (buildDepError "servant-elm"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "servant-elm-test-integration" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."elm-export" or (buildDepError "elm-export"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."interpolate" or (buildDepError "interpolate"))
            (hsPkgs."mockery" or (buildDepError "mockery"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-elm" or (buildDepError "servant-elm"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if !flags.integration then false else true;
          };
        };
      };
    }