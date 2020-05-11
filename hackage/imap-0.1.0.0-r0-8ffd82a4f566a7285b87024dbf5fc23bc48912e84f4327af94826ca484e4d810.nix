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
      identifier = { name = "imap"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "michal@monad.cat";
      author = "Michal Kawalec";
      homepage = "";
      url = "";
      synopsis = "An efficient IMAP client library";
      description = "A fairly low-level, efficient, easy to use, streaming IMAP library";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."connection" or (buildDepError "connection"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."word8" or (buildDepError "word8"))
          (hsPkgs."rolling-queue" or (buildDepError "rolling-queue"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."list-t" or (buildDepError "list-t"))
          (hsPkgs."monadIO" or (buildDepError "monadIO"))
          (hsPkgs."derive" or (buildDepError "derive"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."stm-delay" or (buildDepError "stm-delay"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          ];
        buildable = true;
        };
      tests = {
        "imap-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."connection" or (buildDepError "connection"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."word8" or (buildDepError "word8"))
            (hsPkgs."rolling-queue" or (buildDepError "rolling-queue"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."list-t" or (buildDepError "list-t"))
            (hsPkgs."monadIO" or (buildDepError "monadIO"))
            (hsPkgs."derive" or (buildDepError "derive"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."stm-delay" or (buildDepError "stm-delay"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        };
      };
    }