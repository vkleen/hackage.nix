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
      identifier = { name = "angel"; version = "0.6.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Michael Xavier <michael@michaelxavier.net>";
      author = "Jamie Turner";
      homepage = "http://github.com/MichaelXavier/Angel";
      url = "";
      synopsis = "Process management and supervision daemon";
      description = "@angel@ is a daemon that runs and monitors other processes.  It\nis similar to djb's `daemontools` or the Ruby project `god`.\n\nIt's goals are to keep a set of services running, and to facilitate\nthe easy configuration and restart of those services.\nSee the homepage for documentation.";
      buildType = "Custom";
      };
    components = {
      exes = {
        "angel" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."configurator" or (buildDepError "configurator"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."configurator" or (buildDepError "configurator"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }