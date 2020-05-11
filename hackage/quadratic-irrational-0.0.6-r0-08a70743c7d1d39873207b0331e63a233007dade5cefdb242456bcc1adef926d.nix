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
      identifier = { name = "quadratic-irrational"; version = "0.0.6"; };
      license = "MIT";
      copyright = "Copyright © 2014 Johan Kiviniemi";
      maintainer = "Andrew Lelechenko andrew dot lelechenko at gmail dot com";
      author = "Johan Kiviniemi <devel@johan.kiviniemi.name>";
      homepage = "https://github.com/ion1/quadratic-irrational";
      url = "";
      synopsis = "An implementation of quadratic irrationals";
      description = "A library for exact computation with\n<http://en.wikipedia.org/wiki/Quadratic_irrational quadratic irrationals>\nwith support for exact conversion from and to\n<http://en.wikipedia.org/wiki/Periodic_continued_fraction (potentially periodic) simple continued fractions>.\n\nA quadratic irrational is a number that can be expressed in the form\n\n> (a + b √c) / d\n\nwhere @a@, @b@ and @d@ are integers and @c@ is a square-free natural number.\n\nSome examples of such numbers are\n\n* @7/2@,\n\n* @√2@,\n\n* @(1 + √5)\\/2@\n(<http://en.wikipedia.org/wiki/Golden_ratio the golden ratio>),\n\n* solutions to quadratic equations with rational constants – the\n<http://en.wikipedia.org/wiki/Quadratic_formula quadratic formula> has a\nfamiliar shape.\n\nA simple continued fraction is a number expressed in the form\n\n> a + 1/(b + 1/(c + 1/(d + 1/(e + …))))\n\nor alternatively written as\n\n> [a; b, c, d, e, …]\n\nwhere @a@ is an integer and @b@, @c@, @d@, @e@, … are positive integers.\n\nEvery finite SCF represents a rational number and every infinite, periodic\nSCF represents a quadratic irrational.\n\n> 3.5      = [3; 2]\n> (1+√5)/2 = [1; 1, 1, 1, …]\n> √2       = [1; 2, 2, 2, …]";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."arithmoi" or (buildDepError "arithmoi"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      tests = {
        "tasty-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quadratic-irrational" or (buildDepError "quadratic-irrational"))
            (hsPkgs."numbers" or (buildDepError "numbers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        "doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."numbers" or (buildDepError "numbers"))
            ];
          buildable = true;
          };
        };
      };
    }