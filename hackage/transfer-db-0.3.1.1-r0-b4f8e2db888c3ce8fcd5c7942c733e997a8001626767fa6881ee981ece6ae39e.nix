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
      identifier = { name = "transfer-db"; version = "0.3.1.1"; };
      license = "BSD-3-Clause";
      copyright = "2017 Mihai Giurgeanu";
      maintainer = "mihai.giurgeanu@gmail.com";
      author = "Mihai Giurgeanu";
      homepage = "http://hub.darcs.net/mihaigiurgeanu/transfer-db";
      url = "";
      synopsis = "";
      description = "Simple SQL/CLI application that transfers data between 2 databases.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."sqlcli" or (buildDepError "sqlcli"))
          (hsPkgs."sqlcli-odbc" or (buildDepError "sqlcli-odbc"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."logging" or (buildDepError "logging"))
          (hsPkgs."store" or (buildDepError "store"))
          (hsPkgs."store-core" or (buildDepError "store-core"))
          (hsPkgs."th-utilities" or (buildDepError "th-utilities"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."clock" or (buildDepError "clock"))
          ];
        buildable = true;
        };
      exes = {
        "transfer-db" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."console-program" or (buildDepError "console-program"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."logging" or (buildDepError "logging"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."clock" or (buildDepError "clock"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."cassava" or (buildDepError "cassava"))
            (hsPkgs."sqlcli" or (buildDepError "sqlcli"))
            (hsPkgs."sqlcli-odbc" or (buildDepError "sqlcli-odbc"))
            (hsPkgs."transfer-db" or (buildDepError "transfer-db"))
            ];
          buildable = true;
          };
        };
      tests = {
        "hspec-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."store" or (buildDepError "store"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."cpu" or (buildDepError "cpu"))
            (hsPkgs."transfer-db" or (buildDepError "transfer-db"))
            (hsPkgs."sqlcli" or (buildDepError "sqlcli"))
            ];
          buildable = true;
          };
        };
      };
    }