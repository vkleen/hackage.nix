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
      identifier = { name = "robin"; version = "0.1.0.0"; };
      license = "GPL-3.0-only";
      copyright = "(c) 2013-2015 Karl Voelker";
      maintainer = "robin@karlv.net";
      author = "Karl Voelker";
      homepage = "https://www.github.com/ktvoelker/robin";
      url = "";
      synopsis = "A build daemon for Haskell development";
      description = "Robin is a daemon for Haskell developers. It runs a build whenever a source\nfile changes. Cabal, Stack, and custom builds are all supported.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "robin" = {
          depends = [
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."hdaemonize" or (buildDepError "hdaemonize"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ];
          buildable = true;
          };
        };
      };
    }