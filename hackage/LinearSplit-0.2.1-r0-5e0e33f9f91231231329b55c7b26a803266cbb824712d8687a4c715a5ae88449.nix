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
      specVersion = "1.2";
      identifier = { name = "LinearSplit"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "virukav@gmail.com";
      author = "Vitaliy Rukavishnikov";
      homepage = "http://github.com/rukav/LinearSplit";
      url = "";
      synopsis = "Partition the sequence of items to the subsequences in the order given";
      description = "The LinearSplit module implements partitioning the sequence of items to the\nsubsequences in the order given. The items can be splitted using greedy\nheuristic or using the linear partition algorithm to minimize the maximum cost\nover all ranges (see the 'The Algorithm Design Manual' by Steven S. Skiena..).\n\nThe library can be used to balance the work across processors to minimize the run time.\nFor the library usage take a look in examples/Splitter.hs.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          ];
        buildable = true;
        };
      };
    }