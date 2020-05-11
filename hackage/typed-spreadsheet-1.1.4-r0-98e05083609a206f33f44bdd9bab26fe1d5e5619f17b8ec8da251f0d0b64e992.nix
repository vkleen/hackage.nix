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
      specVersion = "1.8.0.2";
      identifier = { name = "typed-spreadsheet"; version = "1.1.4"; };
      license = "BSD-3-Clause";
      copyright = "2015 Gabriel Gonzalez";
      maintainer = "Gabriel439@gmail.com";
      author = "Gabriel Gonzalez";
      homepage = "";
      url = "";
      synopsis = "Typed and composable spreadsheets";
      description = "This library provides a typed and composable API for building spreadsheets.\nThis differs from traditional spreadsheets in a few important ways:\n\n* you specify the relationship between inputs and outputs at compile time,\nnot runtime, so that the relationship can be type-checked\n\n* inputs of different types have different controls; for example, a `Bool`\ninput creates a checkbox and a `Double` input creates a spin button\n\n* you can only output a single value; you simulate multiple outputs by\nemitting a tuple of values\n\nSee the \"Typed.Spreadsheet\" module for full examples with code and pictures";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."diagrams-cairo" or (buildDepError "diagrams-cairo"))
          (hsPkgs."diagrams-gtk" or (buildDepError "diagrams-gtk"))
          (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
          (hsPkgs."foldl" or (buildDepError "foldl"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."microlens" or (buildDepError "microlens"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        frameworks = (pkgs.lib).optional (system.isOsx) (pkgs."Cocoa" or (sysDepError "Cocoa"));
        buildable = true;
        };
      exes = {
        "typed-spreadsheet-example-text" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."typed-spreadsheet" or (buildDepError "typed-spreadsheet"))
            ];
          frameworks = (pkgs.lib).optional (system.isOsx) (pkgs."Cocoa" or (sysDepError "Cocoa"));
          buildable = true;
          };
        "typed-spreadsheet-example-cell" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."typed-spreadsheet" or (buildDepError "typed-spreadsheet"))
            ];
          frameworks = (pkgs.lib).optional (system.isOsx) (pkgs."Cocoa" or (sysDepError "Cocoa"));
          buildable = true;
          };
        "typed-spreadsheet-example-graphics" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
            (hsPkgs."typed-spreadsheet" or (buildDepError "typed-spreadsheet"))
            ];
          frameworks = (pkgs.lib).optional (system.isOsx) (pkgs."Cocoa" or (sysDepError "Cocoa"));
          buildable = true;
          };
        };
      };
    }