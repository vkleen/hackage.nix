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
      identifier = { name = "classy-prelude"; version = "0.9.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "michael@snoyman.com";
      author = "Michael Snoyman";
      homepage = "https://github.com/snoyberg/classy-prelude";
      url = "";
      synopsis = "A typeclass-based Prelude.";
      description = "Focuses on using common typeclasses when possible, and creating new ones to avoid name clashing. Exposes many recommended datastructures (Map, ByteString, etc) directly without requiring long import lists and qualified modules.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."mono-traversable" or (buildDepError "mono-traversable"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."vector-instances" or (buildDepError "vector-instances"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."chunked-data" or (buildDepError "chunked-data"))
          (hsPkgs."enclosed-exceptions" or (buildDepError "enclosed-exceptions"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."stm" or (buildDepError "stm"))
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