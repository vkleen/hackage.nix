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
      identifier = { name = "keenser"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2016";
      maintainer = "jamesdabbs@gmail.com";
      author = "James Dabbs";
      homepage = "https://github.com/jamesdabbs/keenser#readme";
      url = "";
      synopsis = "Initial project template from stack";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hedis" or (buildDepError "hedis"))
          (hsPkgs."hostname" or (buildDepError "hostname"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."thyme" or (buildDepError "thyme"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          ];
        buildable = true;
        };
      exes = {
        "keenser-exe" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."keenser" or (buildDepError "keenser"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
            (hsPkgs."hedis" or (buildDepError "hedis"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ];
          buildable = true;
          };
        };
      tests = {
        "keenser-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."keenser" or (buildDepError "keenser"))
            ];
          buildable = true;
          };
        };
      };
    }