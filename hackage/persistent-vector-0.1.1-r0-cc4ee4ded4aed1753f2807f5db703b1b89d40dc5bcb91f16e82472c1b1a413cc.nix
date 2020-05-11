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
      identifier = { name = "persistent-vector"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "tristan@nochair.net";
      author = "Tristan Ravitch";
      homepage = "https://github.com/travitch/persistent-vector";
      url = "";
      synopsis = "A persistent sequence based on array mapped tries";
      description = "This package provides persistent vectors based on array mapped\ntries.  The implementation is based on the persistent vectors used\nin clojure, but in a Haskell-style API.  The API is modeled after\nData.Sequence from the containers library.\n\nTechnically, the element-wise operations are O(log(n)), but the\nunderlying tree cannot be more than 7 or 8 levels deep so this is\neffectively constant time.\n\nOne change from the clojure implementation is that this version supports\nO(1) slicing, though it does cheat a little.  Slices retain references\nto elements that cannot be indexed.  These extra references (and the space\nthey occupy) can be reclaimed by 'shrink'ing the slice.  This seems like\na reasonable tradeoff, and, I believe, mirrors the behavior of the vector\nlibrary.\n\nHighlights:\n\n* O(1) append element, indexing, updates, length, and slicing\n\n* Reasonably compact representation";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          ];
        buildable = true;
        };
      tests = {
        "pvTests" = {
          depends = [
            (hsPkgs."persistent-vector" or (buildDepError "persistent-vector"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "pvBench" = {
          depends = [
            (hsPkgs."persistent-vector" or (buildDepError "persistent-vector"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ];
          buildable = true;
          };
        };
      };
    }