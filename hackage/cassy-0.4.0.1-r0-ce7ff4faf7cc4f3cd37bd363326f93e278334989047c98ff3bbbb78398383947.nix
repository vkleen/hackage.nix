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
      identifier = { name = "cassy"; version = "0.4.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ozataman@gmail.com";
      author = "Ozgun Ataman";
      homepage = "http://github.com/ozataman/cassy";
      url = "";
      synopsis = "A high level driver for the Cassandra datastore";
      description = "The objective is to completely isolate away the thrift layer, providing\na more idiomatic Haskell experience working with Cassandra.\n\nCertain parts of the API was inspired by pycassa (Python client) and\nhscassandra (on Hackage).\n\nPlease see the Github repository for more detailed documentation,\nrelease notes and examples.\n\nA brief explanation of modules:\n\n* /Database.Cassandra.Basic/: Contains a low level, simple\nimplementation of Cassandra interaction using the thrift API\nunderneath.\n\n* /Database.Cassandra.JSON/: A higher level API that operates on\nvalues with ToJSON and FromJSON isntances from the /aeson/\nlibrary. This module has in part been inspired by Bryan\nO\\'Sullivan\\'s /riak/ client for Haskell.\n\n* /Database.Cassandra.Pool/: Handles a /pool/ of connections to\nmultiple servers in a cluster, splitting the load among them.\n\n* /Database.Cassandra.Pack/: Handles column types that Cassandra\nrecognizes and adds support for Composite Columns.\n\n* /Database.Cassandra.Types/: A common set of types used everywhere.\n\nPotential TODOs include:\n\n* Support for counters and batch mutators\n\n* Support for database admin operations";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."Thrift" or (buildDepError "Thrift"))
          (hsPkgs."cassandra-thrift" or (buildDepError "cassandra-thrift"))
          (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
          (hsPkgs."errors" or (buildDepError "errors"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."Thrift" or (buildDepError "Thrift"))
            (hsPkgs."cassandra-thrift" or (buildDepError "cassandra-thrift"))
            (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
            (hsPkgs."errors" or (buildDepError "errors"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."derive" or (buildDepError "derive"))
            ];
          buildable = true;
          };
        };
      };
    }