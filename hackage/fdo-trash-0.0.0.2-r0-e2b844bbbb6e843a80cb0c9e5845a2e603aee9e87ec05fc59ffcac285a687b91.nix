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
      identifier = { name = "fdo-trash"; version = "0.0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2012 Emil Karlson";
      maintainer = "Emil Karlson <jekarlson@gmail.com>";
      author = "Emil Karlson <jekarlson@gmail.com>";
      homepage = "https://github.com/jkarlson/fdo-trash";
      url = "";
      synopsis = "Utilities related to freedesktop Trash standard.";
      description = "Contains utilities to unrm from trash, purge old files from trash and move files to trash.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."Diff" or (buildDepError "Diff"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."url" or (buildDepError "url"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      exes = {
        "fdo-trash" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fdo-trash" or (buildDepError "fdo-trash"))
            (hsPkgs."Diff" or (buildDepError "Diff"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."url" or (buildDepError "url"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ];
          buildable = true;
          };
        };
      };
    }