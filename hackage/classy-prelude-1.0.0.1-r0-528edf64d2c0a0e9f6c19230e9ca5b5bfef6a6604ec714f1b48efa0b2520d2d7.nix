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
      identifier = { name = "classy-prelude"; version = "1.0.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "michael@snoyman.com";
      author = "Michael Snoyman";
      homepage = "https://github.com/snoyberg/mono-traversable";
      url = "";
      synopsis = "A typeclass-based Prelude.";
      description = "Modern best practices without name collisions. No partial functions are exposed, but modern data structures are, without requiring import lists. Qualified modules also are not needed: instead operations are based on type-classes from the mono-traversable package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."lifted-async" or (buildDepError "lifted-async"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."mono-traversable" or (buildDepError "mono-traversable"))
          (hsPkgs."mono-traversable-instances" or (buildDepError "mono-traversable-instances"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."vector-instances" or (buildDepError "vector-instances"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."time-locale-compat" or (buildDepError "time-locale-compat"))
          (hsPkgs."chunked-data" or (buildDepError "chunked-data"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."mutable-containers" or (buildDepError "mutable-containers"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."monad-unlift" or (buildDepError "monad-unlift"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."classy-prelude" or (buildDepError "classy-prelude"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }