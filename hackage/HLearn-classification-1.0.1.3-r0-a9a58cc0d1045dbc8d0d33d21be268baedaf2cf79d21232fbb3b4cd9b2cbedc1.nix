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
      specVersion = "1.8";
      identifier = { name = "HLearn-classification"; version = "1.0.1.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "mike@izbicki.me";
      author = "Mike izbicki";
      homepage = "http://github.com/mikeizbicki/HLearn/";
      url = "";
      synopsis = "";
      description = "This package is deprecated.  The latest version of HLearn is available from the github repo at: <http://github.com/mikeizbicki/hlearn>.  If you want to use HLearn, I strongly recommend you contact me (mike@izbicki.me) first to see if HLearn will really fit your needs.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."HLearn-algebra" or (buildDepError "HLearn-algebra"))
          (hsPkgs."HLearn-distributions" or (buildDepError "HLearn-distributions"))
          (hsPkgs."ConstraintKinds" or (buildDepError "ConstraintKinds"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."list-extras" or (buildDepError "list-extras"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."statistics" or (buildDepError "statistics"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."logfloat" or (buildDepError "logfloat"))
          (hsPkgs."math-functions" or (buildDepError "math-functions"))
          (hsPkgs."normaldistribution" or (buildDepError "normaldistribution"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."binary" or (buildDepError "binary"))
          ];
        buildable = true;
        };
      };
    }