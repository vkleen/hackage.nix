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
      identifier = { name = "trigger"; version = "1.0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 Rhys Keepence";
      maintainer = "rhys@rhyskeepence.com";
      author = "Rhys Keepence";
      homepage = "https://github.com/rhyskeepence/trigger";
      url = "";
      synopsis = "Trigger is a cross platform file system watcher for super fast build-and-restart workflows.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."formatting" or (buildDepError "formatting"))
          (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
          (hsPkgs."Glob" or (buildDepError "Glob"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."protolude" or (buildDepError "protolude"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."twitch" or (buildDepError "twitch"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          ];
        buildable = true;
        };
      exes = {
        "trigger" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."trigger" or (buildDepError "trigger"))
            ];
          buildable = true;
          };
        };
      tests = {
        "trigger-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."trigger" or (buildDepError "trigger"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }