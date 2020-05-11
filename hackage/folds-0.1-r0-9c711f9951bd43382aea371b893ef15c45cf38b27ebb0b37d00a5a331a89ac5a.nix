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
    flags = { test-doctests = true; test-hlint = true; optimize = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "folds"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2009-2013 Edward A. Kmett";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett";
      homepage = "http://github.com/ekmett/folds";
      url = "";
      synopsis = "Beautiful Folding";
      description = "This package is a playground full of comonadic folds.\n\nThis style of fold is documented in <https://www.fpcomplete.com/user/edwardk/cellular-automata/part-2 \"Cellular Automata, Part II: PNGs and Moore\">\n\nThis package can be seen as what happens if you chase Max Rabkin's <http://squing.blogspot.com/2008/11/beautiful-folding.html \"Beautiful Folding\"> to its logical conclusion.\n\nMore information on this approach can be found in the <http://conal.net/blog/posts/another-lovely-example-of-type-class-morphisms \"Another lovely example of type class morphisms\"> and <http://conal.net/blog/posts/more-beautiful-fold-zipping \"More beautiful fold zipping\"> posts by Conal Elliott, as well as in Gabriel Gonzales' <http://www.haskellforall.com/2013/08/composable-streaming-folds.html \"Composable Streaming Folds\">";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."reflection" or (buildDepError "reflection"))
          (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "hlint" = {
          depends = (pkgs.lib).optionals (!(!flags.test-hlint)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hlint" or (buildDepError "hlint"))
            ];
          buildable = if !flags.test-hlint then false else true;
          };
        "doctests" = {
          depends = (pkgs.lib).optionals (!(!flags.test-doctests)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            ];
          buildable = if !flags.test-doctests then false else true;
          };
        };
      };
    }