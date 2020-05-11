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
      identifier = { name = "snowball"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2012 Dag Odenhall, (c) 2008 Tupil, (c) 2002 Richard Boulton";
      maintainer = "dag.odenhall@gmail.com";
      author = "";
      homepage = "http://hub.darcs.net/dag/snowball";
      url = "";
      synopsis = "Bindings to the Snowball library.";
      description = "The Snowball library is used to compute the stems of words\nin natural languages.\n\nCompared to the older <stemmer> package, this one:\n\n* Correctly handles unicode without relying on the system\nlocale\n\n* Takes greater care to avoid memory leaks and to be thread\nsafe\n\n* Uses Text rather than String\n\n* Gets rid of the need for @stemWords@ by using rewrite\nrules to make @map stem@ efficient\n\n* Includes a more recent release of Snowball\n\n* Attempts to comply with the Snowball licensing terms\n\n* Supports @SafeHaskell@ when available and is otherwise\n@Haskell2010@\n\n* Comes with a test suite\n\nHowever, although this code is written from scratch, it is\nheavily modeled after the code of the \\\"stemmer\\\" package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."text-icu" or (buildDepError "text-icu"))
          ];
        buildable = true;
        };
      tests = {
        "test-snowball" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."snowball" or (buildDepError "snowball"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-th" or (buildDepError "test-framework-th"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench-snowball" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."language-haskell-extract" or (buildDepError "language-haskell-extract"))
            (hsPkgs."snowball" or (buildDepError "snowball"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }