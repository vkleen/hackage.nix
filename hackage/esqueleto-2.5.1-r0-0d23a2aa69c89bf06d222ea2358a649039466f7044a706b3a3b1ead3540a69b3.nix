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
    flags = { postgresql = false; mysql = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "esqueleto"; version = "2.5.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2012-2016 Felipe Almeida Lessa";
      maintainer = "cma@bitemyapp.com";
      author = "Felipe Lessa";
      homepage = "https://github.com/bitemyapp/esqueleto";
      url = "";
      synopsis = "Type-safe EDSL for SQL queries on persistent backends.";
      description = "@esqueleto@ is a bare bones, type-safe EDSL for SQL queries\nthat works with unmodified @persistent@ SQL backends.  Its\nlanguage closely resembles SQL, so you don't have to learn\nnew concepts, just new syntax, and it's fairly easy to\npredict the generated SQL and optimize it for your backend.\nMost kinds of errors committed when writing SQL are caught as\ncompile-time errors---although it is possible to write\ntype-checked @esqueleto@ queries that fail at runtime.\n\n@persistent@ is a library for type-safe data serialization.  It\nhas many kinds of backends, such as SQL backends\n(@persistent-mysql@, @persistent-postgresql@,\n@persistent-sqlite@) and NoSQL backends (@persistent-mongoDB@).\nWhile @persistent@ is a nice library for storing and retrieving\nrecords, including with filters, it does not try to support\nsome of the features that are specific to SQL backends.  In\nparticular, @esqueleto@ is the recommended library for\ntype-safe @JOIN@s on @persistent@ SQL backends.  (The\nalternative is using raw SQL, but that's error prone and does\nnot offer any composability.)\n\nCurrently, @SELECT@s, @UPDATE@s, @INSERT@s and @DELETE@s are supported.\nNot all SQL features are available, but most of them can be easily added\n(especially functions), so please open an issue or send a pull request if\nyou need anything that is not covered by @esqueleto@ on\n<https://github.com/bitemyapp/esqueleto>.\n\nThe name of this library means \\\"skeleton\\\" in Portuguese and\ncontains all three SQL letters in the correct order =).  It was\ninspired by Scala's Squeryl but created from scratch.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."persistent-sqlite" or (buildDepError "persistent-sqlite"))
            (hsPkgs."persistent-template" or (buildDepError "persistent-template"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."esqueleto" or (buildDepError "esqueleto"))
            ] ++ (pkgs.lib).optionals (flags.postgresql) [
            (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
            (hsPkgs."postgresql-libpq" or (buildDepError "postgresql-libpq"))
            (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
            ]) ++ (pkgs.lib).optionals (flags.mysql) [
            (hsPkgs."mysql-simple" or (buildDepError "mysql-simple"))
            (hsPkgs."mysql" or (buildDepError "mysql"))
            (hsPkgs."persistent-mysql" or (buildDepError "persistent-mysql"))
            ];
          buildable = true;
          };
        };
      };
    }