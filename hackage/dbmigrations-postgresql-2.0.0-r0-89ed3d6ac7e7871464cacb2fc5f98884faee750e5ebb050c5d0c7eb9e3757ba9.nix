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
      identifier = { name = "dbmigrations-postgresql"; version = "2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Jonathan Daugherty <cygnus@foobox.com>";
      author = "Jonathan Daugherty <cygnus@foobox.com>";
      homepage = "";
      url = "";
      synopsis = "The dbmigrations tool built for PostgreSQL databases";
      description = "This package contains the executable to work with\nthe dbmigrations package when the database backend\nis PostgreSQL. See the package dbmigrations for details\nabout the dbmigrations project in general.\nTo get started, see the 'README.md'\n(https://github.com/jtdaugherty/dbmigrations/blob/master/README.md)\nand 'MOO.TXT'\n(https://github.com/jtdaugherty/dbmigrations/blob/master/MOO.TXT)\nfiles included in the dbmigrations package and the\nusage output for the 'moo-postgresql' command.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "moo-postgresql" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."dbmigrations" or (buildDepError "dbmigrations"))
            (hsPkgs."HDBC-postgresql" or (buildDepError "HDBC-postgresql"))
            ];
          buildable = true;
          };
        };
      tests = {
        "dbmigrations-postgresql-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."dbmigrations" or (buildDepError "dbmigrations"))
            (hsPkgs."HDBC" or (buildDepError "HDBC"))
            (hsPkgs."HDBC-postgresql" or (buildDepError "HDBC-postgresql"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      };
    }