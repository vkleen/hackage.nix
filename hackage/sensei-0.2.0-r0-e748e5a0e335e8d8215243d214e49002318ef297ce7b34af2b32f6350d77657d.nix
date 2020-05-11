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
      identifier = { name = "sensei"; version = "0.2.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Simon Hengel <sol@typeful.net>";
      author = "";
      homepage = "https://github.com/hspec/sensei#readme";
      url = "";
      synopsis = "Automatically run Hspec tests on file modifications";
      description = "";
      buildType = "Simple";
      };
    components = {
      exes = {
        "seito" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ];
          buildable = true;
          };
        "sensei" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ];
          buildable = true;
          };
        "sensei-web" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-meta" or (buildDepError "hspec-meta"))
            (hsPkgs."hspec-wai" or (buildDepError "hspec-wai"))
            (hsPkgs."mockery" or (buildDepError "mockery"))
            (hsPkgs."silently" or (buildDepError "silently"))
            (hsPkgs."interpolate" or (buildDepError "interpolate"))
            ];
          buildable = true;
          };
        };
      };
    }