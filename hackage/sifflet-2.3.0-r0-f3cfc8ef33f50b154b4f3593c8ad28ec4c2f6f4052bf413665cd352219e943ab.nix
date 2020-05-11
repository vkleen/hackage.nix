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
      specVersion = "1.22";
      identifier = { name = "sifflet"; version = "2.3.0"; };
      license = "BSD-3-Clause";
      copyright = "(C) 2009-2016 Gregory D. Weber";
      maintainer = "\"gdweber\" ++ drop 3 \"abc@\" ++ \"iue.edu\"";
      author = "Gregory D. Weber";
      homepage = "http://pages.iu.edu/~gdweber/software/sifflet/";
      url = "";
      synopsis = "Simple, visual, functional language for learning about recursion.";
      description = "Sifflet is a visual, functional programming language.\nIt is intended as an aid for learning about recursion.\nSifflet users can make programs by drawing diagrams\nto connect functions and other units.\nSifflet shows the intermediate steps of the computation\non the diagram, and can expand function calls to show further details.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cairo" or (buildDepError "cairo"))
          (hsPkgs."glib" or (buildDepError "glib"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."fgl" or (buildDepError "fgl"))
          (hsPkgs."hxt" or (buildDepError "hxt"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."text" or (buildDepError "text"))
          ] ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"));
        buildable = true;
        };
      exes = {
        "sifflet" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."sifflet" or (buildDepError "sifflet"))
            ] ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"));
          buildable = true;
          };
        };
      tests = {
        "unit-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."cairo" or (buildDepError "cairo"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."sifflet" or (buildDepError "sifflet"))
            ];
          buildable = true;
          };
        };
      };
    }