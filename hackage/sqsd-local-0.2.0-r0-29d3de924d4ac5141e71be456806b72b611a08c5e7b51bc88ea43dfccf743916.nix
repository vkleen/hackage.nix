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
      identifier = { name = "sqsd-local"; version = "0.2.0"; };
      license = "MPL-2.0";
      copyright = "AllRightsReserved";
      maintainer = "oskar.wickstrom@gmail.com";
      author = "Oskar Wickström";
      homepage = "https://github.com/owickstrom/sqsd-local#readme";
      url = "";
      synopsis = "Initial project template from stack";
      description = "A local version of sqsd, the daemon that runs in Elastic Beanstalk's Worker Environments.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "sqsd-local" = {
          depends = [
            (hsPkgs."amazonka" or (buildDepError "amazonka"))
            (hsPkgs."amazonka-sqs" or (buildDepError "amazonka-sqs"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."wreq" or (buildDepError "wreq"))
            ];
          buildable = true;
          };
        };
      tests = {
        "sqsd-local-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."sqsd-local" or (buildDepError "sqsd-local"))
            ];
          buildable = true;
          };
        };
      };
    }