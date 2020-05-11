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
      identifier = { name = "raw-feldspar"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2016 Anders Persson, Anton Ekblad, Emil Axelsson,\nKoen Claessen, Markus Aronsson, Máté Karácsony\nCopyright (c) 2015 Emil Axelsson";
      maintainer = "78emil@gmail.com";
      author = "Emil Axelsson";
      homepage = "https://github.com/Feldspar/raw-feldspar";
      url = "";
      synopsis = "Resource-Aware Feldspar";
      description = "An implementation of the Feldspar EDSL with focus on\nresource-awareness.\n\nExamples can be found in the @examples/@ directory. The\nfiles named \"TutN_...\" can be studied as a tutorial (to be\nread in ascending order).\n\nFor more information, see the README:\n<https://github.com/Feldspar/raw-feldspar/blob/master/README.md>\n\nTo see which GHC versions RAW-Feldspar can be built with,\nconsult the Travis status page:\n<https://travis-ci.org/Feldspar/raw-feldspar>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."constraints" or (buildDepError "constraints"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."data-hash" or (buildDepError "data-hash"))
          (hsPkgs."imperative-edsl" or (buildDepError "imperative-edsl"))
          (hsPkgs."language-c-quote" or (buildDepError "language-c-quote"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."operational-alacarte" or (buildDepError "operational-alacarte"))
          (hsPkgs."prelude-edsl" or (buildDepError "prelude-edsl"))
          (hsPkgs."syntactic" or (buildDepError "syntactic"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      tests = {
        "NumSimpl" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."raw-feldspar" or (buildDepError "raw-feldspar"))
            (hsPkgs."syntactic" or (buildDepError "syntactic"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            ];
          buildable = true;
          };
        "Compilation" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."raw-feldspar" or (buildDepError "raw-feldspar"))
            ];
          buildable = true;
          };
        "Semantics" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."raw-feldspar" or (buildDepError "raw-feldspar"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            ];
          buildable = true;
          };
        "Examples" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."raw-feldspar" or (buildDepError "raw-feldspar"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        };
      };
    }