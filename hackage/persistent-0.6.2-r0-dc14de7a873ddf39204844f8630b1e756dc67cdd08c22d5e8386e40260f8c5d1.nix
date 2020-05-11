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
      identifier = { name = "persistent"; version = "0.6.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Michael Snoyman <michael@snoyman.com>";
      author = "Michael Snoyman <michael@snoyman.com>";
      homepage = "http://www.yesodweb.com/book/persistent";
      url = "";
      synopsis = "Type-safe, non-relational, multi-backend persistence.";
      description = "This library provides just the general interface and helper functions. You must use a specific backend in order to make this useful.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."enumerator" or (buildDepError "enumerator"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."pool" or (buildDepError "pool"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."path-pieces" or (buildDepError "path-pieces"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."file-location" or (buildDepError "file-location"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."HDBC-postgresql" or (buildDepError "HDBC-postgresql"))
            (hsPkgs."HDBC" or (buildDepError "HDBC"))
            (hsPkgs."mongoDB" or (buildDepError "mongoDB"))
            (hsPkgs."bson" or (buildDepError "bson"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."compact-string-fix" or (buildDepError "compact-string-fix"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."path-pieces" or (buildDepError "path-pieces"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."enumerator" or (buildDepError "enumerator"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          libs = [ (pkgs."sqlite3" or (sysDepError "sqlite3")) ];
          buildable = true;
          };
        };
      };
    }