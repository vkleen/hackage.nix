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
      identifier = { name = "users-postgresql-simple"; version = "0.3.0.0"; };
      license = "MIT";
      copyright = "(c) 2015 Alexander Thiemann";
      maintainer = "Alexander Thiemann <mail@athiemann.net>";
      author = "Alexander Thiemann <mail@athiemann.net>";
      homepage = "https://github.com/agrafix/users";
      url = "";
      synopsis = "A PostgreSQL backend for the users package";
      description = "This library is a backend driver using <http://hackage.haskell.org/package/postgresql-simple postgresql-simple> for\n<http://hackage.haskell.org/package/users the \"users\" library>.\n\nIt supports all postgres versions starting from 8.3 and requires the included extensions pgcrypto, uuid-ossp.\n\nThe package itself does not expose any bindings but provides an instance for 'UserStorageBackend'.\n\nUsage:\n\n> module Foo where\n> import Web.Users.Types\n> import Web.Users.Postgresql ()\n> -- code goes here";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."users" or (buildDepError "users"))
          (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      tests = {
        "users-postgresql-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
            (hsPkgs."users-postgresql-simple" or (buildDepError "users-postgresql-simple"))
            (hsPkgs."users-test" or (buildDepError "users-test"))
            ];
          buildable = true;
          };
        };
      };
    }