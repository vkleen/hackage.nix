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
      specVersion = "2.0";
      identifier = { name = "vabal"; version = "1.0.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "franciman12@gmail.com";
      author = "Francesco Magliocca";
      homepage = "https://github.com/Franciman/vabal";
      url = "";
      synopsis = "the cabal companion";
      description = "`vabal` finds a version of `GHC` that is compatible with\nthe constraints imposed on base package found\nin the cabal file analyzed. It then uses `ghcup`\nto obtain the correct version of the compiler (potentially downloading it).\nIt supports two modes:\n\n* @vabal configure@ (it configures your project to use the obtained `ghc`),\n* @vabal@ (it prints to stdout options to give to cabal to use the obtained `ghc`.\nOptions are escaped so that they can sent to the `xargs` POSIX utility).\n\nSee the README for more detailed informations.";
      buildType = "Simple";
      };
    components = {
      sublibs = {
        "vabal-internal" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cassava" or (buildDepError "cassava"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      exes = {
        "vabal" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."cassava" or (buildDepError "cassava"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."vabal-internal" or (buildDepError "vabal-internal"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-on-hackage" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."vabal-internal" or (buildDepError "vabal-internal"))
            ];
          buildable = true;
          };
        "xargs-escape-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."vabal-internal" or (buildDepError "vabal-internal"))
            ];
          buildable = true;
          };
        };
      };
    }