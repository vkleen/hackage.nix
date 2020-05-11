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
    flags = { old-locale = false; https = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "cabal-rpm"; version = "1.0.2"; };
      license = "GPL-3.0-only";
      copyright = "2007-2008 Bryan O'Sullivan <bos@serpentine.com>,\n2012-2019 Jens Petersen <juhpetersen@gmail.com>";
      maintainer = "Jens Petersen <petersen@fedoraproject.org>";
      author = "Jens Petersen <juhpetersen@gmail.com>, Bryan O'Sullivan <bos@serpentine.com>";
      homepage = "https://github.com/juhp/cabal-rpm";
      url = "";
      synopsis = "RPM packaging tool for Haskell Cabal-based packages";
      description = "This package provides a RPM packaging tool for Haskell Cabal-based packages.\n\ncabal-rpm has commands to generate a RPM spec file and srpm for a package.\nIt can rpmbuild packages, yum/dnf install their dependencies, prep packages,\nand install them. There are commands to list package dependencies and\nmissing dependencies. The diff command compares the current spec file with\na freshly generated one, the update command updates the spec file to latest\nversion from Stackage or Hackage, and the refresh command updates the spec\nfile to the current cabal-rpm packaging. It also handles Hackage revisions of\npackages. Standalone packages can also be packaged built with cabal-install.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "cabal-rpm" = {
          depends = (([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."simple-cabal" or (buildDepError "simple-cabal"))
            (hsPkgs."simple-cmd" or (buildDepError "simple-cmd"))
            (hsPkgs."simple-cmd-args" or (buildDepError "simple-cmd-args"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ] ++ (if flags.old-locale
            then [
              (hsPkgs."old-locale" or (buildDepError "old-locale"))
              (hsPkgs."time" or (buildDepError "time"))
              ]
            else [
              (hsPkgs."time" or (buildDepError "time"))
              ])) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.0") (hsPkgs."semigroups" or (buildDepError "semigroups"))) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "8.0" && flags.https) [
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            ];
          buildable = true;
          };
        };
      };
    }